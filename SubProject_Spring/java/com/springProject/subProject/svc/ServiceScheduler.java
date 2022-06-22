package com.springProject.subProject.svc;

import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.Trigger;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.scheduling.support.PeriodicTrigger;
import org.springframework.stereotype.Service;

@Service
public class ServiceScheduler {
	
	@Autowired
	private ThreadPoolTaskScheduler scheduler;
	@Autowired
	private ServiceSubPay pay;
	
	private Runnable getRunnable(String customer_uid,String price,String merchant_uid,HttpSession session) {
		return new Runnable() {
			
			@Override
			public void run() {
				pay.SubPaySchedule(customer_uid, price, merchant_uid, session);
				pay.SubRePay(customer_uid, price, merchant_uid, session);
				//결제진행
			}
		};
	}
	private Trigger getTrigger() {  
		return new PeriodicTrigger(1, TimeUnit.MINUTES);
	}
	//스케줄러 취소
	public void stopSchedule() {
		scheduler.shutdown();
	}
	
	//스케줄러 시작
	public void startSchedule(String customer_uid,String price,String merchant_uid,HttpSession session) {
		scheduler = new ThreadPoolTaskScheduler();
		scheduler.initialize();
		scheduler.schedule(getRunnable(customer_uid, price, merchant_uid, session), getTrigger());
	}
}
