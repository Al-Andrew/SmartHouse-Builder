package Categories;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryService {

    private final CategoryRepository categoryRepository;

    @Autowired
    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    public void addNewCategory(Category category) {
        categoryRepository.save(category);
    }

    public void updateCategory(Category category) {
        categoryRepository.findById(category.getId()).map(category1 ->
        {
            category1.setId(category.getId());
            category1.setName(category.getName());
            category1.setDescription(category.getDescription());
            return categoryRepository.save(category1);
        });
    }

    public Optional<Category> getCategory(Integer id) {
        boolean exists = categoryRepository.existsById(id);
        if(!exists){
            throw new IllegalStateException("category with id " + id + "does not exists!");
        }
        return categoryRepository.findById(id);
    }

    public void deleteProduct(Integer id) {
        boolean exists = categoryRepository.existsById(id);
        if(!exists){
            throw new IllegalStateException("category with id " + id + "does not exists!");
        }
        categoryRepository.deleteById(id);
    }
}
