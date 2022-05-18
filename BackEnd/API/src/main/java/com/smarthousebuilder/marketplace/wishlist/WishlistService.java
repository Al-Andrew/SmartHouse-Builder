package com.smarthousebuilder.marketplace.wishlist;


import com.smarthousebuilder.marketplace.product.Product;
import com.smarthousebuilder.marketplace.product.ProductService;
import com.smarthousebuilder.wishlistItem.WishlistItemRepository;

import com.smarthousebuilder.wishlistItem.WishlistItems;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Optional;

@Service
public class WishlistService {

    @Autowired
    private final WishlistRepository wishlistRepository;

    @Autowired
    private final WishlistItemRepository wishlistItemRepository;

    @Autowired
    private final ProductService productService;

    public WishlistService(WishlistRepository wishlistRepository, WishlistItemRepository wishlistItemRepository, ProductService productService) {
        this.wishlistRepository = wishlistRepository;
        this.wishlistItemRepository = wishlistItemRepository;
        this.productService = productService;
    }


    public boolean existsByUserId(Integer userId) {
        return wishlistRepository.existsById(userId);
    }

    public void AddFirstTime(Integer userId, Integer productId, String name) {

        Wishlists wishlists = new Wishlists();

        WishlistItems item = new WishlistItems();

        Date date = new Date();
        java.sql.Date sDate = new java.sql.Date(date.getTime());

        wishlists.setName(name);
        wishlists.setUserId(userId);
        wishlists.setCreateDate(sDate);
        wishlistRepository.save(wishlists);


        item.setWishlistId(wishlists.getId());
        item.setProductId(productId);

        wishlistItemRepository.save(item);


    }

    public void AddToExisting(Integer userId, Integer productId, String name) {
        Wishlists wishlists = wishlistRepository.findByUserId(userId);
        Optional<Product> p = productService.getById(productId);

        boolean existsInWishlist = false;

        if( wishlists != null){
            boolean condition = wishlistItemRepository.existsByWishlistIdAndAndProductId(wishlists.getId(),productId);

            if(condition){
                existsInWishlist = true;
            }
        }

        if(wishlists != null && (!existsInWishlist)){
            WishlistItems item1 = new WishlistItems();

            item1.setWishlistId(wishlists.getId());
            item1.setProductId(productId);

            wishlistItemRepository.save(item1);


        }
    }


    public void getByWishlistId(Integer wishlistId) {
        boolean exists = wishlistRepository.existsByUserId(wishlistId);

        if(!exists)
            throw  new IllegalStateException("No wishlist for user with id " + wishlistId);

        wishlistItemRepository.findAllByWishlistId(wishlistId);
    }
}
