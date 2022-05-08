package forum;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
//@ComponentScan("backend.post")
public class ForumBackendApplication {

	public static void main(String[] args) {
		SpringApplication.run(ForumBackendApplication.class, args);
	}

}
