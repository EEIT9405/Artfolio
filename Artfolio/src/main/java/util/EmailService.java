package util;
//package util;
//
//import java.util.Date;
//import java.util.concurrent.ExecutorService;
//import java.util.concurrent.Executors;
//
//import javax.mail.Message;
//
//import javax.mail.Session;
//import javax.mail.Transport;
//
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
//import javax.naming.InitialContext;
//import javax.naming.NamingException;
//
//class Test{
//	Test(){
//		EmailService.getExecutor().execute(new Runnable(){
//			public void run(){
//				EmailService.send("", "", "");
//			}
//		});	
//	}
//}
//
//public class EmailService {
//	private static Session session;
//	private final static String userName = "fortest432@outlook.com";
//	private final static ExecutorService executor=Executors.newFixedThreadPool(10);
//
//	static {
//		try {
//			session = (Session) new InitialContext().lookup("java:comp/env/mail/Session");
//		} catch (NamingException e) {
//			e.printStackTrace();
//		}
//	}
//	
//	public static ExecutorService getExecutor(){
//		return executor;
//	}
//
//	public static void send(String toAddress, String subject, String message) {
//		try {
//			MimeMessage msg = new MimeMessage(session);
//			msg.setFrom(new InternetAddress(userName));
//			InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
//			msg.setRecipients(Message.RecipientType.TO, toAddresses);
//			msg.setSubject(subject, "UTF-8");
//			msg.setSentDate(new Date());
//			msg.setText(message, "UTF-8");
//			Transport.send(msg);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	// private final static Session session;
//	// private final static String userName="fortest432@outlook.com";
//	// private final static String password="hk4g4m/4";
//	// static{
//	// Properties properties = new Properties();
//	// properties.put("mail.smtp.host", "smtp.live.com");
//	// properties.put("mail.smtp.port", "587");
//	// properties.put("mail.smtp.auth", "true");
//	// properties.put("mail.smtp.starttls.enable", "true");
//	// session = Session.getInstance(properties, new Authenticator() {
//	// public PasswordAuthentication getPasswordAuthentication() {
//	// return new PasswordAuthentication(userName,password );
//	// }
//	// });
//	// }
//}
