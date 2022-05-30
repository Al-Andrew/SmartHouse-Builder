package com.smarthousebuilder.SHB.Compatibility;

import java.util.List;

public class CompatibilityResponse {
    public List<Integer> compatProducts;
    public List<Integer> inCompatProducts;

    CompatibilityResponse(List<Integer> compatProducts, List<Integer> inCompatProducts){
        this.compatProducts = compatProducts;
        this.inCompatProducts = inCompatProducts;
    }
}
