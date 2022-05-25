//package com.smarthousebuilder.forum.post;
//
//import org.springframework.boot.CommandLineRunner;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.ComponentScan;
//import org.springframework.context.annotation.Configuration;
//
//import java.util.List;
//
//@Configuration
//public class PostConfig {
//
//    @Bean
//    CommandLineRunner commandLineRunnerPost(PostRepository repository){
//        return args -> {
//
//           Post post1 =  new Post(1, 1, "Ma", "PRimul meu setupt",
//                    "12/05/2022",
//                    "zzzzzzzzzzzzzzzzz");
//            Post post2 =  new Post(2, 1, "Ta", "Al doilea set-up",
//                    "12/05/2022",
//                    "yyyyyyyyyy");
//            repository.saveAll(List.of(post1, post2));
//        };
//    }
//}
