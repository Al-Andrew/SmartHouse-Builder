package com.smarthousebuilder.marketplace.supplier_item;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Service
public class SupplierItemService {

    private final SupplierItemRepository supplierItemRepository;

    @Autowired
    public SupplierItemService(SupplierItemRepository supplierItemRepository) {
        this.supplierItemRepository = supplierItemRepository;
    }

    public List<SupplierItem> getAllBySupplierId(Integer supplier_id) {
        return supplierItemRepository.getAllBySupplierId(supplier_id);
    }


    public List<SupplierItem> getAll() {
        return supplierItemRepository.findAll();
    }

    public void addNew(SupplierItem supplierItem) {
        supplierItemRepository.save(supplierItem);
    }

    public void delete(Integer id) {
        boolean exists = supplierItemRepository.existsById(id);

        if(!exists)
            throw new IllegalStateException("Error");

        supplierItemRepository.deleteById(id);

    }

    public List<SupplierItem> getAllByProductId(Integer product_id) {
        return supplierItemRepository.getAllByProductId(product_id);
    }

    public void update(SupplierItem supplierItem) {
        boolean exists = supplierItemRepository.existsById(supplierItem.getId());

        if(!exists)
            throw new IllegalStateException("Error");

        supplierItemRepository.findById(supplierItem.getId()).map(supplierItem1 ->
                {
                    supplierItem1.setId(supplierItem.getId());
                    supplierItem1.setSupplierId(supplierItem.getSupplierId());
                    supplierItem1.setProductId(supplierItem.getProductId());
                    return supplierItemRepository.save(supplierItem1);
                }
                );
    }
}
