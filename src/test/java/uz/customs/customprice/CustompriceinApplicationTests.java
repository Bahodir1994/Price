package uz.customs.customprice;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;

@SpringBootTest
class CustompriceinApplicationTests {

    @Test
    void contextLoads() {
        Date date = new Date();
        long dd = date.getTime();
        System.out.println(dd);
    }

}
