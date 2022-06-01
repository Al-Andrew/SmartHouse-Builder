package com.smarthousebuilder.SHB;

import com.smarthousebuilder.SHB.SetupService;
import com.smarthousebuilder.forum.post.Post;
import com.smarthousebuilder.forum.post.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/api/shb/setup")
public class SetupController {
    private final SetupService setupService;

    @Autowired
    public SetupController(SetupService setupService) {
        this.setupService = setupService;

    }

    @GetMapping
    public List<Setup> getAllSetups(){
        return setupService.getAllSetup();
    }
    @GetMapping(path="/components")
    public String getAllSetups(@RequestParam int id){
        return setupService.getSetupBySetupId(id);
    }
    @GetMapping(path="/{Id}")
    public List<Setup> getAllSetupsByUserId(@PathVariable int Id){
        return setupService.getSetupByUserId(Id);
    }
    @PostMapping
    public void saveSetup(@RequestBody Setup setup){
        System.out.println(setup);
        setupService.saveSetup(setup);
    }


}
