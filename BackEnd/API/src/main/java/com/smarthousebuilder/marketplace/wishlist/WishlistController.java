package com.smarthousebuilder.marketplace.wishlist;

import com.smarthousebuilder.marketplace.product.Product;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@CrossOrigin
@RestController
@RequestMapping("/api/wishlist")
public class WishlistController {

    private final WishlistService wishlistService;

    public WishlistController(WishlistService wishlistService) {
        this.wishlistService = wishlistService;
    }


    @PostMapping
    public void add(@RequestParam (value = "userId") Integer userId,@RequestParam(value = "productId")Integer productId){
        boolean conditionIfUserHasWishlist = wishlistService.existsByUserId(userId);

        if(!conditionIfUserHasWishlist){
            wishlistService.AddFirstTime(userId,productId);
        }
        else
        {
            wishlistService.AddToExisting(userId,productId);
        }
    }

    @GetMapping
    public void all(@RequestParam (value = "wishlistId") Integer wishlistId){
        wishlistService.getByWishlistId(wishlistId);
    }

    @GetMapping("/userId")
    public List<Optional<Product>> getAllProductsFromUserId(@RequestParam (value = "userId")Integer userId){
        return wishlistService.getByUserId(userId);
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
