package com.bs.common.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceBuilder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

/**
 * 连接池配置相关
 */
@Configuration
public class DruidConfig {

    @Value("${spring.datasource.druid.master.url}")
    private String url;
    @Value("${spring.datasource.druid.master.username}")
    private String username;
    @Value("${spring.datasource.druid.master.password}")
    private String password;
    @Value("${spring.datasource.druid.minIdle}")
    private int minIdle;
    @Value("${spring.datasource.druid.initialSize}")
    private int initialSize;
    @Value("${spring.datasource.druid.maxActive}")
    private int maxActive;
    @Value("${spring.datasource.druid.maxWait}")
    private int maxWait;
    @Value("${spring.datasource.druid.validationQuery}")
    private String validationQuery;

    /**
     * 配置数据连接池
     * @param dataSource
     * @return
     */
    private DruidDataSource dataSource(DruidDataSource dataSource) {
        dataSource.setInitialSize(initialSize);
        dataSource.setMaxWait(maxWait);
        dataSource.setMaxActive(maxActive);
        dataSource.setMinIdle(minIdle);
        dataSource.setValidationQuery(validationQuery);
        return dataSource;
    }

    /**
     * 设置master数据源
     */
    @Bean
    @ConfigurationProperties("spring.datasource.druid.master")
    public DataSource masterDataSource() {
        DruidDataSource dataSource = DruidDataSourceBuilder.create().build();
        return dataSource(dataSource);
    }
}
