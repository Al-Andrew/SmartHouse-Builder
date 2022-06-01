package com.smarthousebuilder.marketplace.product;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product,Integer> {

    Boolean existsByName(String name);

    Product getByName(String name);

    Boolean existsByCategory(String category);

    List<Product> getAllByCategory(String category);

    List<Product> findByPriceBetween(Double lower, Double upper);

    List<Product> findAllByNameContaining(@Param("string") String string);

    Boolean existsByNameContaining(@Param("string") String string);

    Boolean existsByRatingBetween(Double lower, Double upper);

    List<Product> findAllByRatingBetween(Double lower, Double upper );

    @Query("SELECT p from Product p")
    List<Product> findAllProducts();
}
