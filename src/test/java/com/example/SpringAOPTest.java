package com.example;


import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ch.fls.controller.LoginController;

public class SpringAOPTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Test public void interceptorTest(){
		ApplicationContext cxt = new ClassPathXmlApplicationContext("classpath:application-context.xml");
		LoginController personService = (LoginController)cxt.getBean("loginController");
		//personService.TestLogin();
	}
}
