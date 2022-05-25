package com.gloryDuck.marketTree.config;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@PropertySource("classpath:/application.yml")
public class DatabaseConfig {

	   @Autowired
	    private ApplicationContext applicationContext;

	    @Value("${spring.datasource.driver-class-name}")
	    private String driverClassName;
	    @Value("${spring.datasource.url}")
	    private String url;
	    @Value("${spring.datasource.username}")
	    private String user;
	    @Value("${spring.datasource.password}")
	    private String password;
	    
	    // db 연결정보
		@Bean
		public DataSource dataSource() {
		  BasicDataSource ds = new BasicDataSource();
		  ds.setDriverClassName(driverClassName);
		  ds.setUrl(url);
		  ds.setUsername(user);
		  ds.setPassword(password);
		  return ds;
		}
		  
		// 트랜 잭션 매니저 지정
		@Bean
		public PlatformTransactionManager transactionManager() {
		    DataSourceTransactionManager dataSourceTransactionManager = new DataSourceTransactionManager();
		    dataSourceTransactionManager.setDataSource(dataSource());
		    return dataSourceTransactionManager;
		}
		
		//mybatis xml 설정
	    @Bean
	    public SqlSessionFactory sqlSessionFactory() throws Exception {
	        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
	        sqlSessionFactoryBean.setDataSource(dataSource());
	        sqlSessionFactoryBean.setConfigLocation(applicationContext.getResource("classpath:mybatis/mybatis-config.xml"));
	        sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:mybatis/mappers/**/*.xml"));
	        return sqlSessionFactoryBean.getObject();
	    }
	    /*
	    //sqlSession
		@Bean public SqlSession sqlSession() throws Exception { 
			SqlSessionTemplate sqlSessionTemplate = new SqlSessionTemplate(sqlSessionFactory()); 
			return sqlSessionTemplate; 
		}
		*/
}