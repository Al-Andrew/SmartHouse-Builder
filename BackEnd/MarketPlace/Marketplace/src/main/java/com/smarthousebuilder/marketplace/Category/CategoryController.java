package com.example.marketplace.Category;

import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(path="/categories")
public class CategoryController {

    private final CategoryService categoryService;


    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping("/all")
    public List<Category> all(){
        return categoryService.getAll();
    }

    @GetMapping("/{Id}")
    public Optional<Category> get(@PathVariable Integer Id){
        return categoryService.get(Id);
    }

    @PostMapping("/add")
    public void add(@RequestBody Category category){
        categoryService.addNew(category);
    }

    @DeleteMapping("/delete/{Id}")
    public void delete(@PathVariable Integer Id){
        categoryService.delete(Id);
    }

    @PutMapping("/update/{Id}")
    public void update(@RequestBody Category category, @PathVariable Integer Id){
        category.setId(Id);
        categoryService.update(category);
    }




}
