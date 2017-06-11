package util;



import java.util.Date;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

//@Service
public class SpringEmailService {
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private TaskExecutor taskExecutor;
	
	public void sendEmailTask(String toAddress,String subject,String message){
		taskExecutor.execute(new Runnable(){
			public void run() {
				sendEmail(toAddress,subject,message);
			}
		});
	}
	
	public void sendEmail(String toAddress,String subject,String message){
	        try {
	            mailSender.send(new MimeMessagePreparator() {
		            public void prepare(MimeMessage mimeMessage) throws Exception {
		            	MimeMessageHelper msg=new MimeMessageHelper(mimeMessage,"UTF-8");
		            	msg.setFrom("fortest432@outlook.com");
		    			msg.setTo(toAddress);
		    			msg.setSubject(subject);
		    			msg.setSentDate(new Date());
		    			msg.setText(message);
		            }
		        });
	        }
	        catch (MailException ex) {
	            ex.printStackTrace();
	        }
	}
	
}
