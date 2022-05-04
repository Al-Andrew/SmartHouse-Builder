package Product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProductService {

    private final ProductRepository productRepository;

    @Autowired
    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> getProducts(){
        return productRepository.findAll();
    }

    public void addNewProduct(Product product){
        productRepository.save(product);
    }

    public void deleteProduct(int id) {
        boolean exists = productRepository.existsById(id);
        if(!exists){
            throw new IllegalStateException("product with id " + id + "does not exists!");
        }
        productRepository.deleteById(id);
    }

    public void updateProduct(Product product) {
         productRepository.findById(product.getId()).map(product1 ->
        {
            product1.setId(product.getId());
            product1.setCategory_id(product.getCategory_id());
            product1.setName(product.getName());
            product1.setForumLink(product.getForumLink());
            product1.setRating(product.getRating());
            product1.setPrice(product.getPrice());
            return productRepository.save(product1);
        });
    }

    public Product getProduct(Integer id) {
        boolean exists = productRepository.existsById(id);
        if(!exists){
            throw new IllegalStateException("product with id " + id + "does not exists!");
        }
        return productRepository.getById(id);
    }
}
