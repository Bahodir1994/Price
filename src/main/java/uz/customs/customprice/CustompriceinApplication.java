package uz.customs.customprice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@Configuration
@ServletComponentScan
@SpringBootApplication
@EnableJpaAuditing(auditorAwareRef = "auditorAware")
public class CustompriceinApplication extends SpringBootServletInitializer {
    public final static String MODEL_PACKAGE = "uz.customs.customprice.entity";

    public static void main(String[] args) {
        SpringApplication.run(CustompriceinApplication.class, args);
    }

    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(CustompriceinApplication.class);
    }

}
