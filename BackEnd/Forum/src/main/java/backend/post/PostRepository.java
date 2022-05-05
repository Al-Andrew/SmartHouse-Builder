package backend.post;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PostRepository extends JpaRepository<Post, Integer>{
    @Query("SELECT p FROM Post p WHERE p.id = ?1")
    Optional<Post> findPostById(int id);
}
