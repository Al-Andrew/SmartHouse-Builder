package com.smarthousebuilder.forum.report;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ReportService {
    private final ReportRepository reportRepository;

    @Autowired
    public ReportService(ReportRepository reportRepository) {
        this.reportRepository = reportRepository;
    }

    public Optional<List<Report>> getAllReport(int id_post){
        return reportRepository.findReportByIdPost(id_post);
    }

    public void addNewReport(Report report) {
        Optional<Report> userOptional= reportRepository.findReportByIdPostAndIdAuthor(report.getId_author(),report.getId_post());
        if(userOptional.isPresent())
            throw new IllegalStateException("Haterii vor da hate");
        reportRepository.save(report);
    }

    public void deleteReport(Integer reportId) {
        boolean exists = reportRepository.existsById(reportId);
        if(!exists){
            throw new IllegalStateException("student with id " + reportId + " does not exist");
        }
        reportRepository.deleteById(reportId);

    }
}

