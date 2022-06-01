package com.smarthousebuilder.marketplace.wishlist;


import com.smarthousebuilder.marketplace.product.Product;
import com.smarthousebuilder.marketplace.product.ProductService;
import com.smarthousebuilder.marketplace.wishlistItem.WishlistItems;
import com.smarthousebuilder.marketplace.wishlistItem.WishlistItemRepository;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class WishlistService {


    private final WishlistRepository wishlistRepository;

    private final WishlistItemRepository wishlistItemRepository;


    private final ProductService productService;

    public WishlistService(WishlistRepository wishlistRepository, WishlistItemRepository wishlistItemRepository, ProductService productService) {
        this.wishlistRepository = wishlistRepository;
        this.wishlistItemRepository = wishlistItemRepository;
        this.productService = productService;
    }


    public boolean existsByUserId(Integer userId) {
        return wishlistRepository.existsByUserId(userId);
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

    public Integer AddToExisting(Integer userId, Integer productId, String name) {
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

        if(existsInWishlist)
            return -1;

        return 1;
    }


    public void getByWishlistId(Integer wishlistId) {
        boolean exists = wishlistRepository.existsByUserId(wishlistId);

        if(!exists)
            throw  new IllegalStateException("No wishlist for user with id " + wishlistId);

        wishlistItemRepository.findAllByWishlistId(wishlistId);
    }


    public void deleteOneFromWishlist(Integer wishlistId, Integer productId) {

        boolean existsWishlist = wishlistRepository.existsById(wishlistId);

        if (!existsWishlist)
            throw new IllegalStateException("No wishlist with id " + wishlistId);

        boolean existsProductInWishlist = wishlistItemRepository.existsByProductIdAndWishlistId(productId, wishlistId);

        if (!existsProductInWishlist)
            throw new IllegalStateException("Can't delete product from wishlist that is not in wishlist!");


        int numberOfProductsInWishlist = wishlistItemRepository.countAllByWishlistId(wishlistId);

        if (numberOfProductsInWishlist == 1) {
            wishlistItemRepository.delete(wishlistItemRepository.getByProductIdAndWishlistId(productId, wishlistId));
            wishlistRepository.deleteById(wishlistId);
        } else {
                wishlistItemRepository.delete(wishlistItemRepository.getByProductIdAndWishlistId(productId, wishlistId));
        }
    }

    public void deleteWishlist(Integer wishlistId) {
        boolean existsWishlist = wishlistRepository.existsById(wishlistId);

        if (!existsWishlist)
            throw new IllegalStateException("No wishlist with id " + wishlistId);

        wishlistItemRepository.deleteAllByWishlistId(wishlistId);
        wishlistRepository.deleteById(wishlistId);
        }

    public List<Optional<Product>> getByUserId(Integer userId) {

        Wishlists wishlist = wishlistRepository.findByUserId(userId);

        List<WishlistItems> list =  wishlistItemRepository.findAllByWishlistId(wishlist.getId());

        List<Optional<Product>> productsList = new ArrayList<>();

        for(WishlistItems wishlistItems : list){
            Optional<Product> product = productService.getById(wishlistItems.getProductId());

            productsList.add(product);
        }
        return productsList;

    }
}

