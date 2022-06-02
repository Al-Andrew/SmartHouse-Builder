package com.smarthousebuilder.forum.post;

import com.smarthousebuilder.forum.comment.Comment;
import com.smarthousebuilder.forum.comment.CommentRepository;
import com.smarthousebuilder.forum.report.Report;
import com.smarthousebuilder.forum.report.ReportRepository;
import com.smarthousebuilder.forum.tag.Tag;
import com.smarthousebuilder.forum.tag.TagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class PostService {
    private final PostRepository postRepository;
    private final ReportRepository reportRepository;
    private final CommentRepository commentRepository;
    private final TagRepository tagRepository;
    @Autowired
    public PostService(PostRepository postRepository, ReportRepository reportRepository,
                       CommentRepository commentRepository, TagRepository tagRepository) {
        this.postRepository = postRepository;
        this.reportRepository = reportRepository;
        this.tagRepository = tagRepository;
        this.commentRepository = commentRepository;
    }

    public List<Post> getAllPosts(){
        List<Post> postsList = postRepository.findAll();
        Tag tagDummy;
        for(Post postIndex : postsList){
            tagDummy = tagRepository.findTagByPostId(postIndex.getId());
            postIndex.setTag(tagDummy);
        }
        return postsList;
    }

    public void addNewPost(Post post) {
//        User userCopy = postRepository.findUserById(post.id_user);
//
//        post.setAuthor(userCopy.getNameUser());
//        System.out.println(post);

        System.out.println(post.getTag());
        post = postRepository.save(post);
        Tag tagCopy = post.getTag();
        tagCopy.setId(post.getId());
        System.out.println(tagCopy);
        tagRepository.save(tagCopy);
    }

    public void deletePost(Integer postId) {
        boolean exists = postRepository.existsById(postId);
        System.out.println(exists);
        if(!exists){
            throw new IllegalStateException("post with id " + postId + " does not exist");
        }
        List<Report> reports = new ArrayList<>(reportRepository.findReportByIdPost(postId).orElse(Collections.emptyList()));
        if (reports.size() > 0) reportRepository.deleteAll(reports);
        Tag tag = tagRepository.findTagByPostId(postId);
        if (tag != null) tagRepository.delete(tag);
        List<Comment> comments = commentRepository.findCommentByIdPost(postId);
        if (comments.size() > 0) commentRepository.deleteAll(comments);
        postRepository.deleteById(postId);
    }
    public List<Post> getPostByUserId(int id){
        List<Post> postOptional = postRepository.findPostByUserId(id);
        if (postOptional.isEmpty())
            throw new IllegalStateException("Nu exista acest post cu id-ul" + id);
        Tag tagDummy;
        for(Post postIndex : postOptional){
            tagDummy = tagRepository.findTagByPostId(postIndex.getId());
            postIndex.setTag(tagDummy);
        }
        return postOptional;
    }

    public void updatePost(Post post, Integer id) {
        postRepository.findPostById(id).map(post1 -> {
            post1.setContent(post.getContent());
            post1.setTitle(post.title);
            return postRepository.save(post1);
        });
    }

    public List<Post> sortPostsByParameter(Integer parameter, List<Post> posts) {
        if(parameter==1) {
            Collections.sort(posts, new Comparator<Post>() {
                @Override
                public int compare(Post o1, Post o2) {
                    return o1.date.compareTo(o2.date);
                }
            });
            Collections.reverse(posts);
        }else
        if(parameter==2){
            Collections.sort(posts, new Comparator<Post>() {
                @Override
                public int compare(Post o1, Post o2) {
                    return Integer.compare(o2.numberLikes, o1.numberLikes);
                }
            });
        }
        else
        if(parameter==3){
            Collections.sort(posts, new Comparator<Post>() {
                @Override
                public int compare(Post o1, Post o2) {
                    return o2.comments.size()-o1.comments.size();
                }
            });
        }
        return posts;
    }
    public List<Post> getUserPostByText(Integer idUser,String searchText)
    {
        List<Post> postsList;
        if(idUser==-1)
            postsList = postRepository.findAll();
        else
            postsList = postRepository.findPostByUserId(idUser);

        Tag tagDummy;
        for(Post postIndex : postsList){
            tagDummy = tagRepository.findTagByPostId(postIndex.getId());
            postIndex.setTag(tagDummy);
        }
        List<Post> response=new ArrayList<>();
        if(searchText.toLowerCase().equals("setup"))
        {
            for(Post currentPost:postsList)
                if(currentPost.getTag()!=null)
                    if(currentPost.getTag().getSetupFlag()==1)
                        response.add(currentPost);
            return response;
        }
        else if(searchText.toLowerCase().equals("hardware"))
        {
            for(Post currentPost:postsList)
                if(currentPost.getTag()!=null)
                    if(currentPost.getTag().getHardwareFlag()==1)
                        response.add(currentPost);
            return response;
        }
        else if(searchText.toLowerCase().equals("software"))
        {
            for(Post currentPost:postsList)
                if(currentPost.getTag()!=null)
                    if(currentPost.getTag().getSoftwareFlag()==1)
                        response.add(currentPost);
            return response;
        }
        else if(searchText.toLowerCase().equals("review"))
        {
            for(Post currentPost:postsList)
                if(currentPost.getTag()!=null)
                    if(currentPost.getTag().getReviewFlag()==1)
                        response.add(currentPost);
            return response;
        }
        else if(searchText.toLowerCase().equals("question"))
        {
            for(Post currentPost:postsList)
                if(currentPost.getTag()!=null)
                    if(currentPost.getTag().getQuestionFlag()==1)
                        response.add(currentPost);
            return response;
        }
        for(Post currentPost:postsList)
            if(currentPost.getTitle().toLowerCase().contains(searchText.toLowerCase()))
                response.add(currentPost);
        return response;
    }

    public void modifyLikes(Integer idPost, Integer nbLikes) {
        Optional<Post> optionalPost = postRepository.findPostById(idPost);
        if (optionalPost.isEmpty()) throw new IllegalStateException("Post does not exist!");
        Post postCopy = optionalPost.get();
        postCopy.setNumberLikes(nbLikes);
        postRepository.save(postCopy);
    }
}