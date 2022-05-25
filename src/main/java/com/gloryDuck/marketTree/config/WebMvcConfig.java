package com.gloryDuck.marketTree.config;

import javax.servlet.MultipartConfigElement;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.gloryDuck.marketTree.config.handler.LogInterceptor;


/*
 *	servlet-context 역할 
 * */

@Configuration
@EnableWebMvc
@ComponentScan("com.gloryDuck.marketTree.controller")
public class WebMvcConfig implements WebMvcConfigurer {
	
	private static final String LOCATION = System.getProperty("user.dir"); // Temporary location where files will be stored

	private static final long MAX_FILE_SIZE = 50 * 1024 * 1024; // 50MB : Max file size.
	private static final long MAX_REQUEST_SIZE = 50 * 1024 * 1024; // 50MB : Total request size containing Multi part.
	private static final int FILE_SIZE_THRESHOLD = 0; // Size threshold after which files will be written to disk
	 
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LogInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/");
    }

    @Bean
    public InternalResourceViewResolver internalResourceViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
    }
    
    @Override 
    public void addViewControllers(ViewControllerRegistry registry) { 
    	// /에 해당하는 url mapping을 index로 forward한다. 
		/* registry.addViewController( "/test/test" ).setViewName( "/test/test" ); */
    	registry.addViewController( "/" ).setViewName( "forward:/index" );     
    	// 우선순위를 가장 높게 잡는다. 
    	registry.setOrder(Ordered.HIGHEST_PRECEDENCE); 
    }

    
    // 정적 파일의 경로를 매핑한다.
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**")
                .addResourceLocations("/resources/");
    }
    
    //	파일 업로드 제한 설정
    @Bean
    public MultipartConfigElement multipartConfigElement() {
    	MultipartConfigElement multipartConfigElement = new MultipartConfigElement( LOCATION, MAX_FILE_SIZE, MAX_REQUEST_SIZE, FILE_SIZE_THRESHOLD);
    	return multipartConfigElement;
    }
    
    @Bean
    public StandardServletMultipartResolver StandartMultipartResolver() {
     return new StandardServletMultipartResolver();
    }

}
