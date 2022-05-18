package com.smarthousebuilder.forum.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(path = "/api/forum/comment")
public class CommentController {
    private final CommentService commentService;

    @Autowired
    public CommentController(CommentService commentService) {
        this.commentService = commentService;
    }

    @GetMapping(path = "/{idPost}")
    public List<Comment> getComment(@PathVariable("idPost") Integer idPost){
        return commentService.getComment(idPost);
    }
    @PutMapping("/{commentId}")
    public void updateComment(@RequestBody Comment comment, @PathVariable Integer commentId){
        comment.setId(commentId);
        commentService.updateComment(comment);
    }
    @PostMapping
    public void registerNewComment(@RequestBody Comment comment){
        System.out.println(comment);
        commentService.addNewComment(comment);
    }
    @DeleteMapping(path = "/{commentId}")
    public void deleteComment( @PathVariable Integer commentId){
        commentService.deleteComment(commentId);
    }
}
