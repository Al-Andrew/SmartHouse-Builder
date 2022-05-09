package com.example.marketplace.Wishlist;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Date;
import java.util.List;

public interface WishlistRepository extends JpaRepository<Wishlist,Integer> {

    Boolean existsByUserId(Integer userId);

    List<Wishlist> findAllByUserId(Integer userId);

    Boolean existsByCreateDate(Date createDate);

    List<Wishlist> findAllByCreateDate(Date createDate);

    Boolean existsByName(String name);

    List<Wishlist> findAllByName(String name);
}
