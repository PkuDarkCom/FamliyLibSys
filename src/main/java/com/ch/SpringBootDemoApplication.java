package com.ch;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
@ImportResource("classpath:application-context.xml")
@Configuration
@ComponentScan
@EnableAutoConfiguration
@SpringBootApplication
public class SpringBootDemoApplication extends SpringBootServletInitializer{

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return  application.sources(SpringBootDemoApplication.class);
	}
	public static void main(String[] args) {
		
		SpringApplication.run(SpringBootDemoApplication.class, args);
		
	}
	

}
