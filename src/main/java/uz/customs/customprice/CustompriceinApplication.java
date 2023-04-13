package uz.customs.customprice;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.scheduling.annotation.EnableScheduling;

@Configuration
@ServletComponentScan
@SpringBootApplication
@EnableJpaAuditing(auditorAwareRef = "auditorAware")
@EnableScheduling
public class CustompriceinApplication implements CommandLineRunner {

    public final static String MODEL_PACKAGE = "uz.customs.customprice.entity";

    public static void main(String[] args) {
        SpringApplication.run(CustompriceinApplication.class, args);
    }

    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(CustompriceinApplication.class);
    }

    @Override
    public void run(String... args) throws Exception {

    }
}
