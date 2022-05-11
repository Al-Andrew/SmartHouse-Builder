package com.smarthousebuilder.forum.report;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Configuration
public class ReportConfig {

    @Bean
    CommandLineRunner commandLineRunnerReport(ReportRepository repository){
        return args -> {

            Report report1 =  new Report(1, 1,5,
                    "Primul report",
                    "Imi era foame",
                    "07.05.2022");
            Report report2 =  new Report(2, 1,5,
                    "Al doilea set-up",
                    "Imi era sete",
                    "07.05.2022");
            repository.saveAll(List.of(report1, report2));
        };
    }
}
