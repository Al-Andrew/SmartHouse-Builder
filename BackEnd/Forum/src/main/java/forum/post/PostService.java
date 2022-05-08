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

    public List<Post> getPost(){
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
}