package tutorial.javaspring.user;

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

    public List<User> getUser(){
        return userRepository.findAll();
    }

    public void addNewUser(User user) {
        Optional<User> userOptional= userRepository.findUserByEmail(user.getEmail());
        if(userOptional.isPresent())
            throw new IllegalStateException("email taken");
        userRepository.save(user);
    }

    public void deleteUser(Integer userId) {
        boolean exists = userRepository.existsById(userId);
        if(!exists){
            throw new IllegalStateException("student with id " + userId + " does not exist");
        }
        userRepository.deleteById(userId);

    }
}
