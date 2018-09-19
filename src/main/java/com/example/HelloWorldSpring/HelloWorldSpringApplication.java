package com.example.HelloWorldSpring;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

@SpringBootApplication
public class HelloWorldSpringApplication{

	public static void main(String[] args) {
		SpringApplication.run(HelloWorldSpringApplication.class, args);


	}
}
