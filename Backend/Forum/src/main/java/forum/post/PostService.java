package forum.post;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        if(!exists){
            throw new IllegalStateException("student with id " + postId + " does not exist");
        }
        postRepository.deleteById(postId);

    }
    public Optional<Post> getPost(int id){
        Optional<Post> postOptional = postRepository.findPostById(id);
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
}
