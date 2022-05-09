package com.example.marketplace.Supplier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SupplierService {

    private final SupplierRepository supplierRepository;

    @Autowired
    public SupplierService(SupplierRepository supplierRepository) {
        this.supplierRepository = supplierRepository;
    }

    public List<Supplier> getAll() {
        return supplierRepository.findAll();
    }

    public void addNew(Supplier supplier) {
        supplierRepository.save(supplier);
    }

    public void deleteOne(Integer id) {
        boolean exists = supplierRepository.existsById(id);

        if(!exists)
            throw new IllegalStateException("Supplier with id " + id + " doesn't exist!");

        supplierRepository.deleteById(id);
    }

    public Optional<Supplier> getOne(Integer id) {
        boolean exists = supplierRepository.existsById(id);

        if(!exists)
            throw new IllegalStateException("Supplier with id " + id + " doesn't exist!");

        return supplierRepository.findById(id);
    }

    public void update(Supplier supplier) {
        boolean exists = supplierRepository.existsById(supplier.getId());

        if(!exists)
            throw new IllegalStateException("Supplier with id " + supplier.getId() + " doesn't exist!");

        supplierRepository.findById(supplier.getId()).map
                (supplier1 ->
                        {
                            supplier1.setId(supplier.getId());
                            supplier1.setName(supplier.getName());
                            return supplierRepository.save(supplier1);
                        }
                );
    }
}
