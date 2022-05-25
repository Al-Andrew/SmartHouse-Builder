package com.smarthousebuilder.marketplace.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    @Autowired
    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> getAll() {
      return productRepository.findAll();
    }

    public Optional<Product> getById(Integer id) {
        boolean exists = productRepository.existsById(id);

        if(!exists)
            throw new IllegalStateException("Product with id " + id + "doesn't exist!");

        return productRepository.findById(id);
    }

    public Optional<Product> getByName(String name) {
//        boolean exists = productRepository.existsByName(name);
//
//        if(!exists)
//            throw new IllegalStateException("Product with name " + name + "doesn't exist!");

        return Optional.ofNullable(productRepository.getByName(name));

    }

    public void addNew(Product product) {
        productRepository.save(product);
    }

    public void delete(Integer id) {
        boolean exists = productRepository.existsById(id);

        if(!exists)
            throw new IllegalStateException("Product with id " + id + "doesn't exist!");

        productRepository.deleteById(id);
    }

    public void update(Product product) {
        boolean exists = productRepository.existsById(product.getId());

        if(!exists)
            throw new IllegalStateException("Product with id " + product.getId() + " doesn't exist!");

        productRepository.findById(product.getId()).map
                (product1 ->
                        {
                            product1.setId(product.getId());
                            product1.setName(product.getName());
                            product1.setCategoryId(product.getCategoryId());
                            product1.setPrice(product.getPrice());
                            product1.setForumLink(product.getForumLink());
                            product1.setRating(product.getRating());
                            return productRepository.save(product1);
                        }
                );
    }

    public List<Product> getByCategoryId(Integer categoryId) {
        boolean exists = productRepository.existsByCategoryId(categoryId);

        if(!exists)
            throw new IllegalStateException("Product with category id  " + categoryId + " doesn't exist!");

        return productRepository.getAllByCategoryId(categoryId);

    }

    public List<Product> getByPriceRange(Double lower, Double upper) {
        return  productRepository.findByPriceBetween(lower,upper);
    }

    public List<Product> getByString(String string) {

        boolean exists = productRepository.existsByNameContaining(string);

        if(!exists)
            throw new IllegalStateException("No product containing in name "+ string);

        return  productRepository.findAllByNameContaining(string);
    }

    public List<Product> getByRatingRange(Double lower, Double upper) {

        boolean exists = productRepository.existsByRatingBetween(lower,upper);

        if(!exists)
            throw new IllegalStateException("No product with rating be "+ lower + " and " + upper);

        return productRepository.findAllByRatingBetween(lower, upper);
    }
}
