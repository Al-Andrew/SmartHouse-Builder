package com.smarthousebuilder.SHB;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SetupService {
    private final SetupRepository setupRepository;

    @Autowired
    public SetupService(SetupRepository setupRepository) {
        this.setupRepository = setupRepository;
    }

    public List<Setup> getAllSetup(){
        List<Setup> allSetups=setupRepository.findAll();
        return allSetups;
    }

    public String getSetupBySetupId(int id){
        Setup allSetups=setupRepository.findSetupById(id);
        return allSetups.getComponents();
    }

    public List<Setup> getSetupByUserId(int id){
        return setupRepository.findSetupByUserId(id);
    }
    public void saveSetup(Setup setup){
        setupRepository.save(setup);
    }

    public Setup createSetup(Integer userId, String name) {

        Setup setup = new Setup();
        setup.setName(name);
        setup.setUserId(userId);
        setup.setComponents("{\"components\":[]}");
        return setupRepository.save(setup);

    }
}
