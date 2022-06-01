package com.smarthousebuilder.SHB.Compatibility;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smarthousebuilder.marketplace.product.Product;
import com.smarthousebuilder.marketplace.product.ProductRepository;
import com.smarthousebuilder.marketplace.product.ProductService;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;

import java.util.*;

public class Compatibility {
    private List<Product> productList;
    private List<String> ecosystemList;
    private Map<String, List<Integer>> compatibilityDictionary;

    public Compatibility(List<Product> productList) throws JsonProcessingException {
        this.productList = productList;
        this.ecosystemList = Arrays.asList("Control4", "Yonomi", "Smart Life", "IFTTT", "Alexa", "Logitech", "Apple HomeKit", "Google Asistant", "Google Home", "SmartThings");
        this.compatibilityDictionary = new HashMap<>();
        for (var ecosystem : this.ecosystemList) {
            compatibilityDictionary.put(ecosystem, new ArrayList<>());
        }
        makeDictionary();
    }

    private void makeDictionary() throws JsonProcessingException {
        for (Product product : productList) {
            List<String> ecosystems = product.getEcosystems();
            for (var ecosystem : ecosystems) {
                if (!ecosystem.equals("None"))
                    compatibilityDictionary.get(ecosystem).add(product.getId());
                else {
                    for (var eco : ecosystemList)
                        compatibilityDictionary.get(eco).add(product.getId());
                }
            }
        }
    }

    public Map<String, List<Integer>> getCompatibilityDictionary() {
        return this.compatibilityDictionary;
    }
}

