package com.ch.fls.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Configuration;

@Configuration
@SuppressWarnings("all")
public class SpringContextUtil implements ApplicationContextAware {

	private static ApplicationContext applicationContext;

	public void setApplicationContext(ApplicationContext contex)
			throws BeansException {
		applicationContext = contex;
	}

	public static ApplicationContext getContext() {
		return applicationContext;
	}

	/**
	 * 根据类从spring上下文获取bean。
	 * 
	 * @param cls
	 * @return 
	 * @return
	 */
	public static <T> T getBean(Class<T> cls) {
		return applicationContext.getBean(cls);
	}

	/**
	 * 根据类名从spring上下文获取bean。
	 * 
	 * @param cls
	 * @return
	 */
	public static <T> T getBean(String beanId) {
		return (T)applicationContext.getBean(beanId);
	}

}
