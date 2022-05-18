package com.smarthousebuilder.forum.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(path = "/helloworld")
public class DemoController {


    @GetMapping
    public String demo(@RequestParam String name){
        return "Hello" + name;
    }
}
