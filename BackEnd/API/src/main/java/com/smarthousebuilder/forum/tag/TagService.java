package com.smarthousebuilder.forum.tag;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TagService {
    private final TagRepository tagRepository;
    @Autowired
    public TagService(TagRepository tagRepository){
        this.tagRepository = tagRepository;
    }
    public Tag findTagByPostId(int postId){
        return tagRepository.findTagByPostId(postId);
    }
}
