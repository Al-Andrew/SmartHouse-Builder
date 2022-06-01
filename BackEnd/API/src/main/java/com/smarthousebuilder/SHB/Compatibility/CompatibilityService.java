package com.smarthousebuilder.SHB.Compatibility;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.smarthousebuilder.marketplace.product.Product;
import com.smarthousebuilder.marketplace.product.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class CompatibilityService {
    private Map<String, List<Integer>> compatibilityDictionary;
    private ProductRepository productRepository;
    private CompatibilityResponse response;

    @Autowired
    public CompatibilityService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    private List<Product> getAllProducts(List<Integer> idList) {
        Optional<Product> productOptional;
        List<Product> allProducts = new ArrayList<>();
        for(Integer id : idList) {
            productOptional = productRepository.findById(id);
            if(productOptional.isPresent())
                allProducts.add(productOptional.get());
        }
        return allProducts;
    }

    private CompatibilityResponse getResponse() {
        List<Integer> compatible = compatibilityDictionary.entrySet().stream()
                        .map((v1) -> v1.getValue()).max((v1, v2) -> Integer.compare(v1.size(), v2.size())).orElse(new ArrayList<>());
        Set<Integer> incompatibleSet = new HashSet<>();
        for(var entry : compatibilityDictionary.entrySet()) {
            for (Integer id : entry.getValue()) {
                incompatibleSet.add(id);
            }
        }
        for (Integer id : compatible){
            incompatibleSet.remove(id);
        }
        List<Integer> incompabile = incompatibleSet.stream().collect(Collectors.toList());
        return new CompatibilityResponse(compatible, incompabile);
    }

    public CompatibilityResponse getCompatibility(List<Integer> idList) throws JsonProcessingException {
        this.compatibilityDictionary = new Compatibility(getAllProducts(idList)).getCompatibilityDictionary();
        this.response = getResponse();
        return this.response;
    }
}
