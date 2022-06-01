package com.smarthousebuilder.forum.post;

import org.hibernate.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
@CrossOrigin
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
    @PostMapping(path = "/sort/")
    public List<Post> sortPostByParameter(@RequestParam boolean Popular,@RequestParam boolean Date,@RequestParam boolean Comments,@RequestBody List<Post> posts){
        List<Post> sortedPosts=posts;
        if(Comments)
            sortedPosts=postService.sortPostsByParameter(3,sortedPosts);
        if(Date)
            sortedPosts=postService.sortPostsByParameter(1,sortedPosts);
        if(Popular)
            sortedPosts=postService.sortPostsByParameter(2,sortedPosts);
        return sortedPosts;
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
    @PutMapping("/updateLikes")
    public void modifyLikes(@RequestParam Integer nbLikes, @RequestParam Integer idPost){
        postService.modifyLikes(idPost, nbLikes);
    }

    @DeleteMapping( path = "/{postId}")
    public void deletePost(@PathVariable("postId") Integer postId){
        postService.deletePost(postId);
    }
    @GetMapping(path = "/search/{searchText}")
    public List<Post> searchPostByText(@PathVariable String searchText){
        return postService.getUserPostByText(-1,searchText);
    }
    @GetMapping(path = "/search/{idUser}/{searchText}")
    public List<Post> searchUserPostByText(@PathVariable Integer idUser,@PathVariable String searchText){
        return postService.getUserPostByText(idUser,searchText);
    }
}