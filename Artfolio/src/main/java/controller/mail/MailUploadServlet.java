package controller.mail;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import model.mail.MailBean;
import model.mail.MailDAOHibernate;
import model.mail.MailService;
import model.member.MemberBean;

@MultipartConfig
@WebServlet("/mail/mail.controller")
public class MailUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MailService mailService;
	@Override
	public void init() throws ServletException {
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		mailService = (MailService) context.getBean("mailService");
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
		 String title = null;
		 String content = null;
		 String mState = null;
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
						}else if (fldName.equals("title")){
							title = value;
						}else if (fldName.equals("content"))
							content = value;
						else if (fldName.equals("mState"))
							mState = value;			
					}else{
						if(fldName.equals("file")){
							String filename = null;
							for (String file : p.getHeader("content-disposition").split(";")) { // 從part取得"content-disposition"標頭(內含上傳檔案資訊(包含名稱))，並從標頭中取得filenanme
								if (file.trim().startsWith("filename")) {
									filename = file.substring(file.indexOf('=') + 1).trim().replace("\"", "");
									System.out.println(filename);
								}
							}	

							fileStorageURL = "C:/Artfolio/BountyImgs/"+ filename;
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
			if (recipient == null || recipient.trim().length() == 0) {
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
										
			//呼叫Model		
			MailBean bean = new MailBean();	
			MemberBean memberBean = new MemberBean();
			memberBean.setMid(fromId);
			bean.setMemberBean(memberBean);
			bean.setToId(toId);
			bean.setMailtitle(title);
			bean.setMailcontent(content);
			bean.setMstatus(mstate);
			bean.setMattach(fileStorageURL);
			
			//新增資料至DB
			MailBean result = mailService.insert(bean);
			
			if(result!=null){
				request.getRequestDispatcher("/mail/mailIndex.jsp").forward(request, response);	
			}else{
				errors.put("alert", "寄件失敗");
				request.getRequestDispatcher("/mail/mailSendPage.jsp").forward(request, response);
			}	
	}
}
