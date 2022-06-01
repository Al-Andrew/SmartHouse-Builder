package com.smarthousebuilder.SHB.Compatibility;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.smarthousebuilder.marketplace.product.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping(path = "/api/shb")
public class CompatibilityController {
    public CompatibilityService service;
    @Autowired
    public CompatibilityController(CompatibilityService service) {
        this.service = service;
    }

    @GetMapping(path = "/compat")
    public CompatibilityResponse getCompatProducts(@RequestBody List<Integer> idList) throws JsonProcessingException {
        return this.service.getCompatibility(idList);
    }
}
