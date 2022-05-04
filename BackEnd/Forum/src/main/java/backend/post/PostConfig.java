package backend.post;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Configuration
public class PostConfig {

    @Bean
    CommandLineRunner commandLineRunner(PostRepository repository){
        return args -> {

            Post post1 =  new Post(1, "Acest set-up este minunat",
                    "Primul set-up",
                    "Marcel",
                    "05.05.2022");
            Post post2 =  new Post(2, "Nu te cred!",
                    "Al doilea set-up",
                    "Pavel",
                    "05.05.2022");
            repository.saveAll(List.of(post1, post2));
        };
    }
}
