 package com.smarthousebuilder.registration.user;

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
        if (userOptional.isPresent()) {
            return -1;
        }
        userOptional = userRepository.findUserByEmail(user.getEmailUser());
        if (userOptional.isPresent()) {
            return -2;
        }
        userRepository.save(user);
        return user.getId();
    }

    //FOR LOGIN
    public int checkUser(User user) {
        Optional<User> userOptional;
        //if the email is null, then we need to use the username
        if (user.getEmailUser() == null) {
            userOptional = userRepository.findUserByName(user.getNameUser());
            if (userOptional.isEmpty()) {
                return -1;
            }
            userOptional = userRepository.findUserByPasswordAndAndId(user.getPassUser(), user.getId());
            if (userOptional.isEmpty()){
                return -3;
            }
            return userOptional.get().id;
        } else {
            userOptional = userRepository.findUserByEmail(user.getEmailUser());
            if (userOptional.isEmpty()) {
                return -2;
            }
            userOptional = userRepository.findUserByPasswordAndAndId(user.getPassUser(), user.getId());
            if (userOptional.isEmpty()){
                return -3;
            }
            return userOptional.get().id;
        }
    }
    public int changePassword(int idUser, String oldPassword, String newPassword){
        User userOptional;
        userOptional = userRepository.findUserById(idUser);
        //old Pass does not match
        if (!userOptional.getPassUser().equals(oldPassword)) return  -1;
        //old Pass match
        userOptional.setPassUser(newPassword);
        userRepository.save(userOptional);
        return 1;
    }
    public int changeEmail(int idUser, String oldEmail, String newEmail){
        User userOptional;
        userOptional = userRepository.findUserById(idUser);
        //old Pass does not match
        if (!userOptional.getEmailUser().equals(oldEmail)) return  -1;
        //old Pass match
        userOptional.setEmailUser(newEmail);
        userRepository.save(userOptional);
        return 1;
    }

    public void deleteUser(Integer userId) {
        boolean exists = userRepository.existsById(userId);
        if (!exists) {
            throw new IllegalStateException("User with id " + userId + " does not exist");
        }
        userRepository.deleteById(userId);
    }
}
