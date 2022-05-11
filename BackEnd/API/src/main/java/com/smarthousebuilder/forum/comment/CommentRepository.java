package com.smarthousebuilder.forum.comment;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Integer>{
    @Query("SELECT c FROM Comment c WHERE c.id = ?1")
    Optional<Comment> findCommentById(int id);
}
