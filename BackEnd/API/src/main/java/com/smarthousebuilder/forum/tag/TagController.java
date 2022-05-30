package com.smarthousebuilder.forum.tag;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin
@RestController
@RequestMapping("/api/forum/tags")
public class TagController {
    private final TagService tagService;
    @Autowired
    public TagController(TagService tagService){
        this.tagService = tagService;
    }
    @GetMapping("/{postId}")
    public Tag getTagByPostId(@PathVariable Integer postId){
        return tagService.findTagByPostId(postId);
    }
}
