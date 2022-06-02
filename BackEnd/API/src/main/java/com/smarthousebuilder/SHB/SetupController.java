package com.smarthousebuilder.SHB;

import com.smarthousebuilder.SHB.SetupService;
import com.smarthousebuilder.forum.post.Post;
import com.smarthousebuilder.forum.post.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
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
    public String getSetup(@RequestParam int id){
        return setupService.getSetupBySetupId(id);
    }
    @GetMapping(path="/{Id}")
    public List<Setup> getAllSetupsByUserId(@PathVariable int Id){
        return setupService.getSetupByUserId(Id);
    }
    @PostMapping("/{id}/name")
    public void updateName(@PathVariable int id, @RequestParam String name) {
        setupService.updateSetupName(id, name);
    }
    @PostMapping("/updateComponents")
    public void updateComponents(@RequestParam (value = "id") Integer id, @RequestBody String components) {
        setupService.updateSetupComponents(id, components);
    }
    @PostMapping
    public Setup createSetup(@RequestParam (value = "userId") Integer userId,
                          @RequestParam (value = "name")String name){
        return setupService.createSetup(userId,name);
    }


}
