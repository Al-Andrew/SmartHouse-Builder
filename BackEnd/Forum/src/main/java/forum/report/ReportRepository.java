package forum.report;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ReportRepository extends JpaRepository<Report, Integer>{
    @Query("SELECT p FROM Report p WHERE p.id = ?1")
    Optional<Report> findReportById(int id);
    @Query("SELECT p FROM Report p WHERE p.id_post = ?1")
    Optional<List<Report>> findReportByIdPost(int id);
    @Query("SELECT p FROM Report p WHERE p.id_author = ?1 and p.id_post= ?2")
    Optional<Report> findReportByIdPostAndIdAuthor(int id_author,int id_post);
}

