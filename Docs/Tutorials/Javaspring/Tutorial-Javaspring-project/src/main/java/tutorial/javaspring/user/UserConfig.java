package tutorial.javaspring.user;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Configuration
public class UserConfig {

    @Bean
    CommandLineRunner commandLineRunner(UserRepository repository){
        return args -> {
            User user1 =  new User(1,
                    "Mike",
                    "test@gmail.com",
                    "FakePass");
            User user2 = new User(2,
                    "Oxlong",
                    "best@gmail.com",
                    "ReallPass");
            repository.saveAll(List.of(user1, user2));
        };
    }
}
