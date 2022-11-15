package com.business.framework.properties;

import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DruidProperties {
    @Value("${spring.datasource.druid.initialSize}")
    private int initialSize;
    @Value("${spring.datasource.druid.validationQuery}")
    private String validationQuery;
    @Value("${spring.datasource.druid.minIdle}")
    private int minIdle;
    @Value("${spring.datasource.druid.maxActive}")
    private int maxActive;
    @Value("${spring.datasource.druid.maxWait}")
    private int maxWait;

    public DruidDataSource dataSource(DruidDataSource datasource) {
        datasource.setInitialSize(initialSize);
        datasource.setValidationQuery(validationQuery);
        datasource.setMinIdle(minIdle);
        datasource.setMaxActive(maxActive);
        datasource.setMaxWait(maxWait);
        return datasource;
    }
}
