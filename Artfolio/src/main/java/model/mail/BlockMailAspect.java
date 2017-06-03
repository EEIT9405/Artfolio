package model.mail;

import java.util.List;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.block.BlockBean;
import model.block.BlockService;

@Component
@Aspect
public class BlockMailAspect {
	
	@Autowired
	private BlockService blockService;
	
	@Before("execution(* model.mail.MailService.insert(..))")
	public void beforeMailInsert(JoinPoint joinPoint){
		Object[] obja = joinPoint.getArgs();
		if(obja.length > 0){
			MailBean mailBean = (MailBean) obja[0];
			int targetId =  mailBean.getToId();
			List<BlockBean> blockList = blockService.getAllList(mailBean.getMemberBean());
			for(BlockBean blockBean: blockList){
				int id =blockBean.getMyBean().getMid();
				if(targetId == id){
					mailBean.setMstatus((byte)127);
					return;
				}
			}	
		}	
	}
}
