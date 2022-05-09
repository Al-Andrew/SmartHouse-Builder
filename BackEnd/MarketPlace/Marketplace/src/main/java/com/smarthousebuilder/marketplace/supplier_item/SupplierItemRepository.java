package com.smarthousebuilder.marketplace.supplier_item;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SupplierItemRepository extends JpaRepository<SupplierItem,Integer> {

    List<SupplierItem> getAllBySupplierId(Integer supplierId);

    List<SupplierItem> getAllByProductId(Integer productId);

    boolean existsById(Integer id);

    @Modifying
    @Query("delete from SupplierItem u where u.id = ?1")
    void delete(Integer productId, Integer supplierId);


}
