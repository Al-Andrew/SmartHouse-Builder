package com.smarthousebuilder.forum.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User getUserById(Integer userId) {
        User user = userRepository.findUserById(userId);
        return user;
    }

    public List<User> getAllUsers() {
        List<User> usersList = userRepository.findAll();
        return usersList;
    }

    //FOR REGISTER
    public int addNewUser(User user) {
        Optional<User> userOptional;

        userOptional = userRepository.findUserByName(user.getNameUser());
        if (userOptional.isEmpty()) {
            return -1;
        }
        userOptional = userRepository.findUserByEmail(user.getEmailUser());
        if (userOptional.isEmpty()) {
            return -2;
        }

        userRepository.save(user);
        return user.getId();
    }

    //FOR LOGIN
    public int checkUser(User user) {
        Optional<User> userOptional;
       // if (user.getEmailUser()==null) return -5;
        if (user.getEmailUser() == null) {
            userOptional = userRepository.findUserByName(user.getNameUser());
            if (userOptional.isEmpty()) {
                return -1;
            }
            return userOptional.get().id;
        } else {
            userOptional = userRepository.findUserByEmail(user.getEmailUser());
            if (userOptional.isEmpty()) {
                return -2;
            }
            return userOptional.get().id;
        }

    }

    public void deleteUser(Integer userId) {
        boolean exists = userRepository.existsById(userId);
        if (!exists) {
            throw new IllegalStateException("User with id " + userId + " does not exist");
        }
        userRepository.deleteById(userId);
    }
}