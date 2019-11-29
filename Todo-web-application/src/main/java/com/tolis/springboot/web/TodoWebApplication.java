package com.tolis.springboot.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan
public class TodoWebApplication {

	public static void main(String[] args) {
		SpringApplication.run(TodoWebApplication.class, args);
	}

}
