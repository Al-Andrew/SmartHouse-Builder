package com.smarthousebuilder.marketplace.supplier_item;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/supplier_item")
public class SupplierItemController {

    private final SupplierItemService supplierItemService;

    public SupplierItemController(SupplierItemService supplierItemService) {
        this.supplierItemService = supplierItemService;
    }

    @GetMapping("/all")
    public List<SupplierItem> all(){
        return supplierItemService.getAll();
    }

    @GetMapping("/supplier_id")
    public List<SupplierItem> getAllBySupplier(@RequestParam(value="supplier_id") Integer supplier_id ){
        return supplierItemService.getAllBySupplierId(supplier_id);
    }

    @GetMapping("/product_id")
    public List<SupplierItem> getAllByProduct(@RequestParam(value="product_id") Integer product_id){
        return supplierItemService.getAllByProductId(product_id);
    }

    @PostMapping("/add")
    public void add(@RequestBody SupplierItem supplierItem){
        supplierItemService.addNew(supplierItem);
    }
    @DeleteMapping("/delete")
    public void delete(@RequestParam(value="id") Integer id){
        supplierItemService.delete(id);
    }

    @PutMapping("/update")
    public void update(@RequestBody SupplierItem supplierItem, @RequestParam (value = "id") Integer id){
        supplierItem.setId(id);
        supplierItemService.update(supplierItem);
    }
}
