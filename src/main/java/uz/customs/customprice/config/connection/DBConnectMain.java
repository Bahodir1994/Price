package uz.customs.customprice.config.connection;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.hibernate.jpa.HibernatePersistenceProvider;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.datatables.repository.DataTablesRepositoryFactoryBean;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;
import java.util.Properties;


import static uz.customs.customprice.CustompriceinApplication.MODEL_PACKAGE;

@Configuration
@ConfigurationProperties("spring.datasource.expertise")
@EnableTransactionManagement
@EnableJpaRepositories(
        repositoryFactoryBeanClass = DataTablesRepositoryFactoryBean.class,
        entityManagerFactoryRef = "entityManagerFactoryExpertise",
        transactionManagerRef = "transactionManagerExpertise",
        basePackages = {"uz.customs.customprice.repository"}
)
public class DBConnectMain {

    private static HikariDataSource hikariDataSource;

    protected final String PERSISTENCE_UNIT_NAME = "expertise";
    protected final Properties JPA_EXPERTISE = new Properties() {{
        put("database-platform", "org.hibernate.dialect.DB2400Dialect");
        put("hibernate.hbm2ddl.auto", "update");
        put("hibernate.dialect", "org.hibernate.dialect.DB2400Dialect");
        put("show-sql", "true");
        put("generate-ddl", "true");
    }};

    public static Connection getConnection() throws SQLException {
        return hikariDataSource.getConnection();
    }

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }

    @Bean
    @Qualifier("expertise")
    public HikariDataSource expertise() throws UnknownHostException, SocketException {
        HikariConfig hikariConfig = new HikariConfig();
        hikariConfig.setAutoCommit(true);
        hikariConfig.addDataSourceProperty("characterEncoding", "utf8");
        hikariConfig.addDataSourceProperty("encoding", "UTF-8");
        hikariConfig.addDataSourceProperty("useUnicode", "true");
        hikariConfig.setPoolName("expertise");
        hikariConfig.setDriverClassName("com.ibm.as400.access.AS400JDBCDriver");
        hikariConfig.setConnectionTestQuery("select current_timestamp cts from sysibm.sysdummy1");

        String ip = InetAddress.getLocalHost().getHostAddress();
        try (final DatagramSocket socket = new DatagramSocket()) {
            socket.connect(InetAddress.getByName("8.8.8.8"), 10002);
            ip = socket.getLocalAddress().getHostAddress();
        }
        if ((ip.equals("192.168.224.224") || ip.equals("192.168.224.18") || ip.equals("192.168.224.127") || ip.equals("localhost"))) {
            hikariConfig.setJdbcUrl("jdbc:as400://192.168.2.10/CPID");
            hikariConfig.setUsername("rustamadm");
            hikariConfig.setPassword("rustamadm");
            hikariConfig.setConnectionTimeout(30000);
            hikariConfig.setValidationTimeout(5000);
            hikariConfig.setMinimumIdle(5);
            hikariConfig.setMaximumPoolSize(10);
            hikariConfig.setIdleTimeout(500000);
            hikariConfig.setMaxLifetime(600000);
        } else {
            hikariConfig.setJdbcUrl("jdbc:as400://192.168.212.231/CPID");
            hikariConfig.setUsername("rustam");
            hikariConfig.setPassword("9061648");
            hikariConfig.setConnectionTimeout(30000);
            hikariConfig.setValidationTimeout(5000);
            hikariConfig.setMinimumIdle(10);
            hikariConfig.setMaximumPoolSize(500);
            hikariConfig.setIdleTimeout(600000);
            hikariConfig.setMaxLifetime(3600000);
        }
        hikariDataSource = new HikariDataSource(hikariConfig);
        return hikariDataSource;
    }

    @Primary
    @Bean(name = "entityManagerFactoryExpertise")
    public LocalContainerEntityManagerFactoryBean entityManagerFactoryExpertise(
            final HikariDataSource expertise) throws SQLException {
        return new LocalContainerEntityManagerFactoryBean() {{
            setDataSource(expertise);
            setPersistenceProviderClass(HibernatePersistenceProvider.class);
            setPersistenceUnitName(PERSISTENCE_UNIT_NAME);
            setPackagesToScan(MODEL_PACKAGE);
            setJpaProperties(JPA_EXPERTISE);
        }};
    }

    @Primary
    @Bean
    public PlatformTransactionManager transactionManagerExpertise(
            final @Qualifier("entityManagerFactoryExpertise") LocalContainerEntityManagerFactoryBean entityManagerFactoryExpertise) {
        return new JpaTransactionManager(Objects.requireNonNull(entityManagerFactoryExpertise.getObject()));
    }
}


