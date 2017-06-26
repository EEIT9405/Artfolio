package misc.schedule;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.CronTask;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.stereotype.Component;

@Component
@EnableScheduling
public class WorkTopScheduler extends ScheduledTaskRegistrar implements SchedulingConfigurer {
	
	private static WorkTopTrigger trigger;
	private CronTask cronTask;
	private static String cronStatus = "59 59 23 * * 7";
	
	@Autowired
	private CreateWorkTop createWorkTop;

	@Override
	public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {
		startUp("59 59 23 * * 7");
		taskRegistrar.scheduleCronTask(cronTask);
	}
	
	public void startUp(String cron){
		trigger = new WorkTopTrigger(cron);
		cronTask = new CronTask(new Runnable() {
			
			@Override
			public void run() {
				//do schedule...
				System.out.println("二:"+new Date() + " : " + trigger);
				//createWorkTop.createWorkTop(11);
			}
		}, trigger);
	}
	
	public boolean pause(boolean toggle){
		trigger.setStop(toggle);
		return trigger.isStop();
	}
	
	public boolean start(String cron){
		cronStatus = cron;
		startUp(cron);
		scheduleCronTask(cronTask);
		return !trigger.isStop();
	}

	public static String getCronStatus() {
		return cronStatus;
	}

	public static void setCronStatus(String cronStatus) {
		WorkTopScheduler.cronStatus = cronStatus;
	}
}
