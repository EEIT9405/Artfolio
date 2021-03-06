package controller.mail;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import model.mail.MailBean;
import model.mail.MailService;
import model.member.LoginService;
import model.member.MemberBean;

@MultipartConfig
@WebServlet("/mail/mail.controller")
public class MailUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MailService mailService;
	private LoginService loginService;
	@Override
	public void init() throws ServletException {
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		mailService = (MailService) context.getBean("mailService");
		loginService = (LoginService) context.getBean("loginService");
	}      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Map<String,String> errors = new HashMap<String,String>();
		request.setAttribute("err", errors);
			
		 //取得session資訊 //取得loginOK MemberBean
		HttpSession session = request.getSession();
		MemberBean loginOK = (MemberBean) session.getAttribute("loginOK");	
		Integer fromId = loginOK.getMid();  //寄件時需要使用
	
		 String recipient = null;
		 String recipientmail = null;
		 String title = null;
		 String content = null;
		 String mState = null;
		 String reply = null;
		 String mailid = null;
		 String replystate = null;
		 String fileStorageURL = null;
		 
		//接收資料    從multipart post request取得請求表單的parts
			Collection<Part> parts = request.getParts();
			if (parts != null) {
				for (Part p : parts) {
					String fldName = p.getName();
					String value = request.getParameter(fldName);
					if (p.getContentType() == null) {
						if (fldName.equals("recipient")) {
							recipient = value;
						}else if (fldName.equals("recipientmail")){
							recipientmail = value;
						}else if (fldName.equals("title")){
							title = value;
						}else if (fldName.equals("content")){
							content = value;
						}else if (fldName.equals("mState")){
							mState = value;			
						}else if (fldName.equals("reply")){
							reply = value ; 
						}else if (fldName.equals("mailid")){
							mailid = value ; 
						}else if(fldName.equals("replystate")){
							replystate = value ;
						}
					}else{		
						if(fldName.equals("file")){
							String filename = null;
							for (String file : p.getHeader("content-disposition").split(";")) { // 從part取得"content-disposition"標頭(內含上傳檔案資訊(包含名稱))，並從標頭中取得filenanme
								if (file.trim().startsWith("filename")) {
									filename = file.substring(file.indexOf('=') + 1).trim().replace("\"", "");
									System.out.println(filename);
								}
							}	
							System.out.println(replystate);
							fileStorageURL = "C:/Artfolio/MailAttachs/"+ filename;
							
							if (filename != null && filename.trim().length() > 0) {
								try (InputStream is = p.getInputStream(); // 開啟輸入檔
										FileOutputStream os = new FileOutputStream(fileStorageURL);// 將上傳檔案寫入至資料庫硬碟
								) {
									byte[] b = new byte[8192];
									int len = 0;
									while ((len = is.read(b)) != -1) {
										os.write(b, 0, len);
									}
								}
							} else{
								fileStorageURL = null;		
							}
						}
					}
				}
			}
			
			//驗證資料		
			if (recipientmail == null || recipientmail.trim().length() == 0) {
				errors.put("alert", "請至少指定一個收件人。");
			}
			if (title == null || title.trim().length() == 0) {
				errors.put("alert", "這封郵件沒有主旨或內文，確定仍要傳送嗎？");
			}
			if(content==null || content.trim().length()==0){
				errors.put("alert", "這封郵件沒有主旨或內文，確定仍要傳送嗎？");
			}
		
			if(errors!=null && !errors.isEmpty()) {
				request.getRequestDispatcher(
						"/mail/mailSendPage.jsp").forward(request, response);
				return;
			}	
			
			//轉換資料
			Integer toId= null;
			if(recipient!=null && recipient.trim().length()!=0){
				toId = Integer.parseInt(recipient);
			}
			Byte mstate= null;
			if(mState!=null && mState.trim().length()!=0){
				mstate = Byte.parseByte(mState);
			}
					
			Integer mailId = null;
			if(mailid!=null && mailid.trim().length()!=0){
				mailId = Integer.parseInt(mailid);
			}			
			Integer reId = null;
			if(reply!=null && reply.trim().length()!=0){
				reId = Integer.parseInt(reply);
			}
				
			//if toId==null //利用user輸入的email寄信
			//Select * from tb_member where email='' 取得userbean
			//bean.getMid()
			if(toId==null){
				System.out.println(recipientmail);
				List<MemberBean> member = loginService.select(recipientmail);
				System.out.println(member);
				for(MemberBean bean:member){
					toId = bean.getMid();
				}
			}
				
			System.out.println(mstate);
			
			MailBean bean = new MailBean();			
				//呼叫Model			
				MemberBean memberBean = new MemberBean();
				memberBean.setMid(fromId);
					bean.setMemberBean(memberBean);
					bean.setToId(toId);
					bean.setMailtitle(title);
					bean.setMailcontent(content);				
					bean.setMattach(fileStorageURL);
				if(mstate!=null){
					bean.setMstatus(mstate);
				}
				if(reId==null){ //if replyid=null
					//設定要回覆的mailId  
					//reid = mailid
					bean.setReid(mailId); 			
				}else{
					bean.setReid(reId); 
					// reid = reid
				}
					
			//新增資料至DB
			MailBean result = mailService.insert(bean);
	
			if("reply".equals(reply)){
				request.getRequestDispatcher("/mail/replyTest.jsp").forward(request, response);			
			}		
			if(result!=null){
				response.sendRedirect("/Artfolio/mail/mailIndex.jsp");
				//6/8
//				request.getRequestDispatcher("/mail/mailIndex.jsp").forward(request, response);	
			}else{
				errors.put("alert", "寄件失敗");
				request.getRequestDispatcher("/mail/mailSendPage.jsp").forward(request, response);
			}			
	}
}
