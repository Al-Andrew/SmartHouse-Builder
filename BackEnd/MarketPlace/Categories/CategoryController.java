package Categories;

import Product.Product;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(path = "/api/categories")
public class CategoryController {
    private final CategoryService categoryService;

    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping("/all")
    public List<Category> all(){
        return categoryService.getAllCategories();
    }

    @GetMapping("/{Id}")
    public Optional<Category> getCategoryById(@PathVariable Integer Id){
        return categoryService.getCategory(Id);
    }

    @PostMapping("/add")
    public void addCategory(@RequestBody Category category){
        categoryService.addNewCategory(category);
    }

    @PutMapping("/update/{Id}")
    public void changeProduct(@RequestBody Category category, @PathVariable Integer Id){
        category.setId(Id);
        categoryService.updateCategory(category);
    }

    @DeleteMapping("delete/{Id}")
    public void deleteProduct(@PathVariable Integer Id){
        categoryService.deleteProduct(Id);
    }
}
