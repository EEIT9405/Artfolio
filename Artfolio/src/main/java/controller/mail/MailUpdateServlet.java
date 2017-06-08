package controller.mail;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import model.mail.MailBean;
import model.mail.MailService;


@WebServlet("/mail/mailUpdate.controller")
public class MailUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MailService mailService;
	@Override
	public void init() throws ServletException {
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		mailService = (MailService)context.getBean("mailService");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		
		//接收資料
		String temp = request.getParameter("mailid");  //取得要處理的信件id
		String readOrDelete = request.getParameter("ReadOrDelete");
				
		//轉換資料
		Integer mailid = null;
		if(temp!=null && temp.trim().length()!=0){
			mailid = Integer.parseInt(temp);
		}
		
		//選取該mail所有資訊(MailBean)	
		MailBean bean = new MailBean(mailid);
		List<MailBean> pkBean = mailService.select(bean);//findByPrimaryKey	
		MailBean updateBean = new MailBean();
		for(MailBean b : pkBean){
			updateBean= b;
		}
						
		//確認信件要進行的處理方式
		switch(readOrDelete){
			case "delete":
				updateBean.setIsdelete(true);
				break;
			case "undelete":
				updateBean.setIsdelete(false);
				break;
			case "read":
				updateBean.setIsread(true);
				break;
			case "unread":
				updateBean.setIsread(false);
				break;
		}
		
		MailBean result = mailService.update(updateBean);
			
		if("read".equals(readOrDelete)){
			request.setAttribute("mailid", mailid);
			request.getRequestDispatcher("/mail/mailPage.controller").forward(request, response);
		}else if("unread".equals(readOrDelete)){
			response.sendRedirect("/Artfolio//mail/readmail.jsp");
		}else{
			if(result!=null && "delete".equals(readOrDelete)){
				//刪除成功
				out.println("信件移至垃圾桶");
			}else if (result!=null && "undelete".equals(readOrDelete)){
				out.println("信件移至收件匣");
			}else{
				//失敗
				out.println("發生錯誤");
			}	
		}	
	}
}
