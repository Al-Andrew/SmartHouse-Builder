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
    public User getUserById(Integer userId){
        User user = userRepository.findUserById(userId);
        return user;
    }
    public List<User> getAllUsers(){
        List<User> usersList = userRepository.findAll();
        return usersList;
    }

    public void addNewUser(User user) {
        Optional<User> userOptional= userRepository.findUserByNameAndEmail(user.getNameUser(),user.getEmailUser());
        if(userOptional.isPresent())
            throw new IllegalStateException("User already exists!");
        userRepository.save(user);
    }

    public void deleteUser(Integer userId) {
        boolean exists = userRepository.existsById(userId);
        if(!exists){
            throw new IllegalStateException("User with id " + userId + " does not exist");
        }
        userRepository.deleteById(userId);

    }
}