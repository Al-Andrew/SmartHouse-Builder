package com.example.marketplace.Supplier;

import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/suppliers")
public class SupplierController {

    private final SupplierService supplierService;

    public SupplierController(SupplierService supplierService) {
        this.supplierService = supplierService;
    }

    @GetMapping("/all")
    public List<Supplier> all(){
        return supplierService.getAll();
    }

    @GetMapping("/{Id}")
    public Optional<Supplier> get(@PathVariable Integer Id){
        return supplierService.getOne(Id);
    }
    @PostMapping("/add")
    public void add(@RequestBody Supplier supplier){
        supplierService.addNew(supplier);
    }

    @DeleteMapping("/delete/{Id}")
    public void delete(@PathVariable Integer Id){
        supplierService.deleteOne(Id);
    }

    @PutMapping("update/{Id}")
    public void update(@RequestBody Supplier supplier,@PathVariable Integer Id){
        supplier.setId(Id);
        supplierService.update(supplier);
    }
}
