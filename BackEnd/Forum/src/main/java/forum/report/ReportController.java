package forum.report;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(path="/api/forum/report")
public class ReportController {
    protected ReportService reportService;

    @Autowired
    public ReportController(ReportService reportService) {
        this.reportService = reportService;
    }

    @GetMapping(path = "/{postId}")
    public Optional<List<Report>> getAllReport(@PathVariable("postId") Integer postID){
        return reportService.getAllReport(postID);
    }
    @PostMapping
    public void registerNewReport(@RequestBody Report report){
        reportService.addNewReport(report);
    }
    @DeleteMapping(path = "/{reportId}")
    public void deleteReport(@PathVariable("reportId") Integer reportId){
        reportService.deleteReport(reportId);
    }
}
