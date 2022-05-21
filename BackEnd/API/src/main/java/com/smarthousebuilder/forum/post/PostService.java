package com.smarthousebuilder.forum.post;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@Service
public class PostService {
    private final PostRepository postRepository;

    @Autowired
    public PostService(PostRepository postRepository) {
        this.postRepository = postRepository;
    }

    public List<Post> getAllPosts(){
        return postRepository.findAll();
    }

    public void addNewPost(Post post) {
        Optional<Post> userOptional= postRepository.findPostById(post.getId());
        if(userOptional.isPresent())
            throw new IllegalStateException("email taken");
        postRepository.save(post);
    }

    public void deletePost(Integer postId) {
        boolean exists = postRepository.existsById(postId);
        System.out.println(exists);
        if(!exists){
            throw new IllegalStateException("post with id " + postId + " does not exist");
        }
        postRepository.deleteById(postId);

    }
    public List<Post> getPostByUserId(int id){
        List<Post> postOptional = postRepository.findPostByUserId(id);
        if (postOptional.isEmpty())
            throw new IllegalStateException("Nu exista acest post cu id-ul" + id);
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
                        return o1.title.compareTo(o2.title);
                    }
                });
            }
            else
                if(parameter==3){
                    Collections.sort(posts, new Comparator<Post>() {
                        @Override
                        public int compare(Post o1, Post o2) {
                            return o1.comments.size()-o2.comments.size();
                        }
                    });
                }
        return posts;
    }
}
