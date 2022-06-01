package com.smarthousebuilder.registration.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping(path="/api/user")
public class UserController {
    protected UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }
    @GetMapping(path = "/{userId}")
    public User getUserById(@PathVariable Integer userId){
        return userService.getUserById(userId);
    }

    @GetMapping()
    public List<User> getAllUsers(){
        return userService.getAllUsers();
    }
    @GetMapping(path = "/nameUser/{userId}")
    public String getNameUserById(@PathVariable Integer userId){
        return userService.getUserById(userId).getNameUser();
    }


    @PostMapping(path = "/register")
    public int registerNewUser(@RequestBody User user){
        return userService.addNewUser(user);
    }
    @PutMapping(path = "/changePass")
    public int changeOldPassword(@RequestParam Integer userId, @RequestParam String oldPass, @RequestParam String newPass){
        return userService.changePassword(userId, oldPass, newPass);
    }
    @PutMapping(path = "/changeEmail")
    public int changeOldEmail(@RequestParam Integer userId, @RequestParam String oldEmail, @RequestParam String newEmail){
        return userService.changeEmail(userId, oldEmail, newEmail);
    }
    @PostMapping(path = "/login")
    public int loginUser(@RequestBody User user){
        return userService.checkUser(user);
    }

    @DeleteMapping(path = "/{userId}")
    public void deleteUser(@PathVariable("userId") Integer userId){
        userService.deleteUser(userId);
    }
}