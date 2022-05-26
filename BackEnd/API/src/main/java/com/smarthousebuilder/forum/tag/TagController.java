package com.smarthousebuilder.forum.tag;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
