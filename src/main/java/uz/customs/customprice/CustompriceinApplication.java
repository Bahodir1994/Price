package uz.customs.customprice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;

@SpringBootApplication
public class CustompriceinApplication {

    public final static String MODEL_PACKAGE = "uz.customs.customprice.entity";

    public static void main(String[] args) {
        SpringApplication.run(CustompriceinApplication.class, args);
    }

    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(CustompriceinApplication.class);
    }

}
