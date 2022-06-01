package com.smarthousebuilder.forum.post;

import com.smarthousebuilder.forum.user.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PostRepository extends JpaRepository<Post, Integer>{
    @Query("SELECT u from User u where u.id = ?1")
    User findUserById(int id);
    @Query("SELECT p FROM Post p WHERE p.id = ?1")
    Optional<Post> findPostById(int id);
    @Query("SELECT p FROM Post p WHERE p.id_user = ?1")
    List<Post> findPostByUserId(int id);
}
