package forum.post;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class PostController {
    private final PostService postService;

    @Autowired
    public PostController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping
    public List<Post> getPost(){
        return postService.getPost();
    }
    @PostMapping
    public void registerNewPost(@RequestBody Post post){
        postService.addNewPost(post);
    }
    @DeleteMapping(path = "{postId}")
    public void deletePost(@PathVariable("postId") Integer postId){
        postService.deletePost(postId);
    }
}