package com.example.marketplace.Wishlist;

import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/wishlist")
public class WishlistController {

    private final WishlistService wishlistService;

    public WishlistController(WishlistService wishlistService) {
        this.wishlistService = wishlistService;
    }

    @GetMapping("/all")
    public List<Wishlist> all(){
        return wishlistService.getAll();
    }
    @GetMapping("/user_id")
    public List<Wishlist> getByUserId(@RequestParam (value="user_id") Integer user_id){
        return wishlistService.getAllByUserId(user_id);
    }

    @GetMapping("/id")
    public Optional<Wishlist> getById(@RequestParam (value="id") Integer id){
        return wishlistService.getById(id);
    }

    /*
    tO DO,
    CHECK FORMAT FOR DATE
     */
    @GetMapping("/date")
    public List<Wishlist> getByDate(@RequestParam (value="createDate") Date createDate){
        return wishlistService.getByDate(createDate);
    }

    @GetMapping("/name")
    public List<Wishlist> getByName(@RequestParam (value="name") String name){
        return wishlistService.getByName(name);
    }

    @PostMapping("/add")
    public void add(@RequestBody Wishlist wishlist){
        wishlistService.addNew(wishlist);
    }

    @DeleteMapping("/delete")
    public void delete(@RequestParam Integer id){
        wishlistService.delete(id);
    }

    @PutMapping("/update")
    public void update(@RequestBody Wishlist wishlist ,@RequestParam (value = "id") Integer id){
        wishlist.setId(id);
        wishlistService.update(wishlist);
    }
}
