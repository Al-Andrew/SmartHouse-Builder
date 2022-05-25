package com.smarthousebuilder.marketplace.product;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product,Integer> {

    Boolean existsByName(String name);

    Product getByName(String name);

    Boolean existsByCategoryId(Integer categoryId);

    List<Product> getAllByCategoryId(Integer categoryId);

    List<Product> findByPriceBetween(Double lower, Double upper);
}
