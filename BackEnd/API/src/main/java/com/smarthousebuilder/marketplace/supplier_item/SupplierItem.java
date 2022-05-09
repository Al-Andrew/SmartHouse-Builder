package com.smarthousebuilder.marketplace.supplier_item;

import javax.persistence.*;

@Entity
@Table(name = "supplier_items")
public class SupplierItem {
    @Basic
    @Column(name = "supplier_id")
    private Integer supplierId;
    @Basic
    @Column(name = "product_id")
    private Integer productId;
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;

    public Integer getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Integer supplierId) {
        this.supplierId = supplierId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SupplierItem that = (SupplierItem) o;

        if (id != that.id) return false;
        if (supplierId != null ? !supplierId.equals(that.supplierId) : that.supplierId != null) return false;
        if (productId != null ? !productId.equals(that.productId) : that.productId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = supplierId != null ? supplierId.hashCode() : 0;
        result = 31 * result + (productId != null ? productId.hashCode() : 0);
        result = 31 * result + id;
        return result;
    }
}
