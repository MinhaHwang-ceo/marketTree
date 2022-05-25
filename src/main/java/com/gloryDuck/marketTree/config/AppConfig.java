package com.gloryDuck.marketTree.config;

import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.cache.ehcache.EhCacheManagerFactoryBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.web.filter.CharacterEncodingFilter;

/*
 * 메소드가 실행되는 시점에 파라미터에 대한 캐시 존재 여부를 판단하여 없으면 캐시를 등록하게 되고, 캐시가 있으면 메소드를 실행 시키지 않고 캐시 데이터를 Return 
 * 서버 간 분산 캐시를 지원한다 (동기/비동기 복제)
 * 
 * 반드시 Cache Key를 등록해 줘야 함 등록하지않고 Cache Key를 막쓰다가 계속 Cache Key가 없다는 오류가 발생
 * 
 * 참고 https://jaehun2841.github.io/2018/11/07/2018-10-03-spring-ehcache/#cache%EB%9E%80
 * */
@Configuration
@ComponentScan("com.gloryDuck.marketTree")
@PropertySource("classpath:application.yml")
public class AppConfig {

    @Bean
    public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
        PropertySourcesPlaceholderConfigurer placeholderConfigurer = new PropertySourcesPlaceholderConfigurer();
        placeholderConfigurer.setFileEncoding("UTF-8");
        placeholderConfigurer.setIgnoreUnresolvablePlaceholders(true);
        placeholderConfigurer.setIgnoreResourceNotFound(true);
        return placeholderConfigurer;
    }
    
    @Bean
    public EhCacheCacheManager cacheManager(EhCacheManagerFactoryBean factoryBean) {
        EhCacheCacheManager cacheManager = new EhCacheCacheManager();
        cacheManager.setCacheManager(factoryBean.getObject());
        return cacheManager;
    }
  
    @Bean
    public EhCacheManagerFactoryBean ehcache(ApplicationContext context) {
        EhCacheManagerFactoryBean factoryBean = new EhCacheManagerFactoryBean();
        factoryBean.setConfigLocation(context.getResource("classpath:ehcache.xml"));
        factoryBean.setShared(true);
        return factoryBean;
    }
    
    @Bean
    public CharacterEncodingFilter characterEncodingFilter() {
    	CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setEncoding("UTF-8");
        characterEncodingFilter.setForceEncoding(true);
        return characterEncodingFilter;
    }
    
}