package misc.schedule;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.bounty.BountyService;

@Component
public class BountyScheduler {
	
	@Autowired
	private BountyService bountyService;
	
	public void doSomethig(){
		System.out.println("一:" + new Date());
		bountyService.updateByDate(2);
		bountyService.updateByDate(1);
	}
}
