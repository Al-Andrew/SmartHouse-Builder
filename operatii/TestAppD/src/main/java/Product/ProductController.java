package Product;

import org.hibernate.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.relational.core.sql.In;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/product")
public class ProductController {


    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }


    @GetMapping("/all")
    public List<Product> all(){
        return productService.getProducts();
    }

    @GetMapping("/{Id}")
    public Product getProductById(@PathVariable Integer Id){
        return productService.getProduct(Id);
    }

    @PostMapping("/add")
    public void addProduct(@RequestBody Product product){
        productService.addNewProduct(product);
    }

    @DeleteMapping("/delete/{Id}")
    public void deleteProduct(@PathVariable Integer Id){
        productService.deleteProduct(Id);
    }

    @PutMapping("/update/{Id}")
    public void changeProduct(@RequestBody Product product,@PathVariable Integer Id){
        product.setId(Id);
        productService.updateProduct(product);
    }

}
