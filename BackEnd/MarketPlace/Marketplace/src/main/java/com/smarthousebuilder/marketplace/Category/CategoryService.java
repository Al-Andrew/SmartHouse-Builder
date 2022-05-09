package com.example.marketplace.Category;

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

    public List<Category> getAll() {
        return categoryRepository.findAll();
    }

    public void addNew(Category category) {
        categoryRepository.save(category);
    }

    public void delete(Integer id) {
        boolean exists = categoryRepository.existsById(id);

        if(!exists)
            throw new IllegalStateException("Category with id " + id + " doesn't exist!");

        categoryRepository.deleteById(id);
    }

    public Optional<Category> get(Integer id) {
        boolean exists = categoryRepository.existsById(id);

        if(!exists)
            throw new IllegalStateException("Category with id " + id + " doesn't exist!");

        return categoryRepository.findById(id);
    }

    public void update(Category category) {
        boolean exists = categoryRepository.existsById(category.getId());

        if(!exists)
            throw new IllegalStateException("Category with id " + category.getId() + " doesn't exist!");

        categoryRepository.findById(category.getId()).map
                (category1 ->
                {
                    category1.setId(category.getId());
                    category1.setName(category.getName());
                    category1.setDescription(category.getDescription());
                    return categoryRepository.save(category1);
                }
                );
    }
}
