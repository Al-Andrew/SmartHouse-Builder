package com.smarthousebuilder.marketplace.wishlist;

import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;

@CrossOrigin
@RestController
@RequestMapping("/api/wishlist")
public class WishlistController {

    private final WishlistService wishlistService;

    public WishlistController(WishlistService wishlistService) {
        this.wishlistService = wishlistService;
    }


    @PostMapping
    public void add(@RequestParam (value = "userId") Integer userId,@RequestParam(value = "productId")Integer productId,
                    @RequestParam (value = "wishlistName")String name){
        boolean conditionIfUserHasWishlist = wishlistService.existsByUserId(userId);

        System.out.println(conditionIfUserHasWishlist);
        if(!conditionIfUserHasWishlist){
            wishlistService.AddFirstTime(userId,productId,name);
        }
        else
        {
            wishlistService.AddToExisting(userId,productId,name);
        }
    }

    @GetMapping
    public void all(@RequestParam (value = "wishlistId") Integer wishlistId){
        wishlistService.getByWishlistId(wishlistId);
    }

    @DeleteMapping
    public void deleteOneItem(@RequestParam (value = "wishlistId") Integer wishlistId,
                              @RequestParam (value = "productId") Integer productId){
        wishlistService.deleteOneFromWishlist(wishlistId,productId);
    }

    @Transactional
    @DeleteMapping("/entire")
    public void deleteWishlist(@RequestParam (value = "wishlistId") Integer wishlistId){
        wishlistService.deleteWishlist(wishlistId);
    }
}
