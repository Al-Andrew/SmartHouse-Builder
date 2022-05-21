package com.smarthousebuilder.forum.tag;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface TagRepository extends JpaRepository<Tag, Integer> {
    @Query("select t from Tag t where t.id = ?1")
    Tag findTagByPostId(int postId);
}
