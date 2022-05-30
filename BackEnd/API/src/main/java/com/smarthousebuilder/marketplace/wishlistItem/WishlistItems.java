package com.smarthousebuilder.marketplace.wishlistItem;

import javax.persistence.*;

@Entity
@Table(name = "wishlist_items")
public class WishlistItems {
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "product_id")
    private Integer productId;
    @Basic
    @Column(name = "wishlist_id")
    private Integer wishlistId;


    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getWishlistId() {
        return wishlistId;
    }

    public void setWishlistId(Integer wishlistId) {
        this.wishlistId = wishlistId;
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

        WishlistItems that = (WishlistItems) o;

        if (id != that.id) return false;
        if (productId != null ? !productId.equals(that.productId) : that.productId != null) return false;
        if (wishlistId != null ? !wishlistId.equals(that.wishlistId) : that.wishlistId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = productId != null ? productId.hashCode() : 0;
        result = 31 * result + (wishlistId != null ? wishlistId.hashCode() : 0);
        result = 31 * result + id;
        return result;
    }
}
