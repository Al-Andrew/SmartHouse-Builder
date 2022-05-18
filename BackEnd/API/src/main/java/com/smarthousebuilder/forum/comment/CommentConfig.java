//package com.smarthousebuilder.forum.comment;
//
//import org.springframework.boot.CommandLineRunner;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//import java.util.List;
//
//@Configuration
//public class CommentConfig {
//
//    @Bean
//    CommandLineRunner commandLineRunner1(CommentRepository repository){
//        return args -> {
//
//            Comment comment1 =  new Comment(1, 1,1,"05.05.2022", "Ce setup!",3);
//            Comment comment2 =  new Comment(2, 1,1,"05.05.2022", "Chiar da!",0);
//            repository.saveAll(List.of(comment1, comment2));
//
//        };
//    }
//}
