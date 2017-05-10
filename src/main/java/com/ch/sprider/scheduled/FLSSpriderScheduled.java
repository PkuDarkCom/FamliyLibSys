package com.ch.sprider.scheduled;

import java.text.SimpleDateFormat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


/**
 * 定时任务
 * @author chenheng
 *
 */
@Component
public class FLSSpriderScheduled {
	
	private  static  final Logger logger = LoggerFactory.getLogger(FLSSpriderScheduled. class);

	//@Scheduled(cron="0 0/2 * * * ?") 
    public void executeSpriderTask() {
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    }
	
	
}
