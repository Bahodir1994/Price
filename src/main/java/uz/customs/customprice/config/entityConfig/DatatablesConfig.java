package uz.customs.customprice.config.entityConfig;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.hibernate5.Hibernate5Module;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import uz.customs.customprice.CustompriceinApplication;

@Configuration
public class DatatablesConfig implements InitializingBean {
    @Autowired
    private ObjectMapper objectMapper;

    @Override
    public void afterPropertiesSet() throws Exception {
        objectMapper.registerModule(new Hibernate5Module());
        objectMapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
    }

    @Bean
    public CustompriceinApplication datatablesModule() {
        return new CustompriceinApplication();
    }
}