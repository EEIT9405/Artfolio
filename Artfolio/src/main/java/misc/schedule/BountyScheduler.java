package misc.schedule;

import java.util.Date;


public class BountyScheduler {
	
	public void doSomethig(){
		System.out.println("一:" + new Date());
		try {
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
