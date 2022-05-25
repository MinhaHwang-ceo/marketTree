package com.gloryDuck.marketTree.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

/*
 *	root-context 역할 
 * */

public class WebInit implements WebApplicationInitializer {
	
    public void onStartup(ServletContext container) throws ServletException {

        AnnotationConfigWebApplicationContext appContext = new AnnotationConfigWebApplicationContext();
        appContext.register(AppConfig.class);
        container.addListener(new ContextLoaderListener(appContext));

        CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
        encodingFilter.setEncoding("UTF-8");
        container.addFilter("encodingFilter", encodingFilter)
                .addMappingForUrlPatterns(null, false, "/*");

        AnnotationConfigWebApplicationContext servletContext = new AnnotationConfigWebApplicationContext();
        servletContext.register(WebMvcConfig.class);
        ServletRegistration.Dynamic appServlet = container.addServlet("appServlet", new DispatcherServlet(servletContext));
        appServlet.setLoadOnStartup(1);
        appServlet.addMapping("/");
    }
}