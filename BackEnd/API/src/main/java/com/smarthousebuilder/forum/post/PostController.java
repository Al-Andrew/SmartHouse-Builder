package com.smarthousebuilder.forum.post;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(path = "/api/forum")
public class PostController {
    private final PostService postService;

    @Autowired
    public PostController(PostService postService) {
        this.postService = postService;

    }

    @GetMapping
    public List<Post> getAllPosts(){
        return postService.getAllPosts();

    }

    @GetMapping(path = "/{Id}")
    public List<Post> getPostByUserId(@PathVariable Integer Id){
        return postService.getPostByUserId(Id);
    }

    @PutMapping("/{postId}")
    public void updatePost(@RequestBody Post post, @PathVariable Integer postId){
        if (post.getTitle() == null || post.getContent() == null) return;
        postService.updatePost(post, postId);
    }

    @PostMapping
    public void addNewPost(@RequestBody Post post){
        postService.addNewPost(post);
    }

    @DeleteMapping( path = "/{postId}")
    public void deletePost(@PathVariable("postId") Integer postId){
        postService.deletePost(postId);
    }
}
