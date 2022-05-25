package com.smarthousebuilder.marketplace.product;

import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;


@RestController
@RequestMapping("/api/products")
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

    @GetMapping("/category")
    public List<Product> getByCategory(@RequestParam (value = "categoryId") Integer categoryId){
        return productService.getByCategoryId(categoryId);
    }

    @GetMapping("/price-range")
    public List<Product> getByPriceRange(@RequestParam (value = "lower") Double lower,@RequestParam (value = "upper") Double upper){
        return productService.getByPriceRange(lower,upper);
    }
    @GetMapping("/name")
    public List<Product> getByPartOfName(@RequestParam (value = "string")String string){
        return productService.getByString(string);
    }
    @GetMapping("/rating")
    public List<Product> getByRatingRange(@RequestParam (value = "lower") Double lower,
                                          @RequestParam (value = "upper") Double upper){
        return productService.getByRatingRange(lower,upper);
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
