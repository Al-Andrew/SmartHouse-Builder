package com.smarthousebuilder.marketplace.wishlist;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WishlistRepository extends JpaRepository<Wishlists,Integer> {
    Boolean existsByUserId(Integer userId);

    Wishlists findByUserId(Integer userId);
}
