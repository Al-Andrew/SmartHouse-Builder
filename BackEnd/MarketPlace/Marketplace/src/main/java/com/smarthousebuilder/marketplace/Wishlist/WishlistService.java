package com.example.marketplace.Wishlist;

import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class WishlistService {
    private final WishlistRepository wishlistRepository;

    public WishlistService(WishlistRepository wishlistRepository) {
        this.wishlistRepository = wishlistRepository;
    }

    public List<Wishlist> getAll() {
        return wishlistRepository.findAll();
    }

    public List<Wishlist> getAllByUserId(Integer user_id) {
        boolean exists = wishlistRepository.existsByUserId(user_id);

        if(!exists)
            throw new IllegalStateException("User with id " + user_id + "doesn't exist!");

        return wishlistRepository.findAllByUserId(user_id);
    }

    public Optional<Wishlist> getById(Integer id) {

        boolean exists = wishlistRepository.existsById(id);

        if(!exists)
            throw new IllegalStateException("Wishlist with id " + id + "doesn't exist!");

        return wishlistRepository.findById(id);
    }

    public List<Wishlist> getByDate(Date createDate) {
        boolean exists = wishlistRepository.existsByCreateDate(createDate);

        if(!exists)
            throw new IllegalStateException("No wishlist created on " + createDate);

        return wishlistRepository.findAllByCreateDate(createDate);
    }

    public List<Wishlist> getByName(String name) {
        boolean exists = wishlistRepository.existsByName(name);

        if(!exists)
            throw new IllegalStateException("No wishlist with name " + name);

        return wishlistRepository.findAllByName(name);
    }

    public void addNew(Wishlist wishlist) {
        wishlistRepository.save(wishlist);
    }

    public void delete(Integer id) {
        wishlistRepository.deleteById(id);
    }

    public void update(Wishlist wishlist) {
        boolean exists = wishlistRepository.existsById(wishlist.getId());

        if(!exists)
            throw new IllegalStateException("No wishlist with id " + wishlist.getId());

        wishlistRepository.findById(wishlist.getId()).map(wishlist1 -> {
            wishlist1.setId(wishlist.getId());
            wishlist1.setCreateDate(wishlist.getCreateDate());
            wishlist1.setName(wishlist.getName());
            wishlist1.setUserId(wishlist.getUserId());
            return wishlistRepository.save(wishlist1);
        });
    }
}
