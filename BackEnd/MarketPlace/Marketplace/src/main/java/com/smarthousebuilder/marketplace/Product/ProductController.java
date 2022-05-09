package com.example.marketplace.Product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;
import java.util.Optional;


@RestController
@RequestMapping("/products")
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/all")
    public List<Product> all(){
        return productService.getAll();
    }

    @GetMapping("/{Id}")
    public Optional<Product> getById(@PathVariable Integer Id){
        return productService.getById(Id);
    }

    @GetMapping()
    public Optional<Product> getByName(@RequestParam(value="name") String name){
        return productService.getByName(name);
    }

    @PostMapping("/add")
    public void add (@RequestBody Product product){
        productService.addNew(product);
    }

    @DeleteMapping("/delete/{Id}")
    public void delete(@PathVariable Integer Id){
        productService.delete(Id);
    }

    @PutMapping("update/{Id}")
    public void update(@RequestBody Product product, @PathVariable Integer Id){
        product.setId(Id);
        productService.update(product);
    }

}
