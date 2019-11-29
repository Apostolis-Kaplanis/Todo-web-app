package com.tolis.springboot.web.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{
	
	@Autowired
	public void configureGlobalSecurity(AuthenticationManagerBuilder auth)
			throws Exception {
		
		auth.inMemoryAuthentication()
		.withUser("admin").password("{noop}pass").roles("USER", "ADMIN", "MANAGER")
		.and()
		.withUser("user").password("{noop}pass").roles("USER");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.authorizeRequests()
		.antMatchers("/login", "/h2-console/**").permitAll()
		.antMatchers("/", "/*todo*/**").hasAnyRole("USER", "ADMIN", "MANAGER")//.access("hasRole('USER')")
		.antMatchers("/admin").hasRole("ADMIN")
		.and()
		//Custom login page
		.formLogin().loginPage("/login").permitAll()
		.and()
		.logout().permitAll()
		.and()
		.rememberMe()
		.and()
	    .exceptionHandling().accessDeniedPage("/accessDenied.jsp");
		
	    http
		.csrf().disable();
		
		http
		.headers().frameOptions().disable(); //To enable h2-console to work in its frame.
		
	}
	
	
}
