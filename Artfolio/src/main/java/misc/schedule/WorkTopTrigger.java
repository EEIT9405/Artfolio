package misc.schedule;

import java.util.Date;

import org.springframework.scheduling.TriggerContext;
import org.springframework.scheduling.support.CronTrigger;

public class WorkTopTrigger extends CronTrigger {
	
	private boolean stop = false;
	
	public WorkTopTrigger(String expression){
		super(expression);
	}

	@Override
	public Date nextExecutionTime(TriggerContext triggerContext) {
		//如果return null就暫停
		if(stop){
			return null;
		}
		return super.nextExecutionTime(triggerContext);
	}
	
	public boolean isStop(){
		return stop;
	}
	
	public void setStop(boolean stop){
		this.stop = stop;
	}
}
