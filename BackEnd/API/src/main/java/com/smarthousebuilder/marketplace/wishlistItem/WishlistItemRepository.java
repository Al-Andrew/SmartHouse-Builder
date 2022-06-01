package com.smarthousebuilder.marketplace.wishlistItem;

import com.smarthousebuilder.marketplace.product.Product;
import com.smarthousebuilder.marketplace.wishlistItem.WishlistItems;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WishlistItemRepository extends JpaRepository<WishlistItems,Integer> {

    Boolean existsByWishlistIdAndAndProductId(Integer wishlistId, Integer productId);

    List<WishlistItems> findAllByWishlistId(Integer wishlistId);

    Boolean existsByProductIdAndWishlistId(Integer productId, Integer wishlistId);

    WishlistItems getByProductIdAndWishlistId(Integer productId, Integer wishlistId);

    Integer countAllByWishlistId(Integer wishlistId);

    void deleteAllByWishlistId(Integer wishlistId);

}
