package javafiles;

import java.util.Calendar;
import java.util.Timer;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class FineCalc implements ServletContextListener{
	        //Run this before web application is started
	private ScheduledExecutorService scheduler;
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("ServletContextListener started");	
		Calendar time = Calendar.getInstance();
		time.set(Calendar.SECOND,10);
		
		 scheduler = Executors.newSingleThreadScheduledExecutor();
		    scheduler.scheduleAtFixedRate(new AutoFineDb(),0,1,TimeUnit.DAYS);
	}
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
	    scheduler.shutdownNow();
		System.out.println("ServletContextListener destroyed");
	}
}
