package controller.mail;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import model.member.LoginService;
import model.member.MemberBean;


@WebServlet("/mail/mailUploadList.controller")
public class MailUploadListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginService memberService;
	@Override
	public void init() throws ServletException {
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		memberService = (LoginService) context.getBean("loginService");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		MemberBean loginOK = (MemberBean) session.getAttribute("loginOK");
		if(loginOK==null){
			System.out.println("請登入");
			return;
		}
		
		String fromIdName = loginOK.getName();
		String fromEmail = loginOK.getEmail(); //取得寄件者資訊
		
		//接收資料
		String temp  = request.getParameter("toId");  //收件者ID
		String title = request.getParameter("title"); //信件標題
		String mailClass = request.getParameter("mailClass");
		
		//轉換資料
		Integer toId = null;
		if(temp!=null && temp.trim().length()!=0){
			toId = Integer.parseInt(temp);
		}
			
		//判斷信件類別mailClass (一般會員<->會員[general]/報名[signup]/客服[service]/檢舉[report])
		//根據信件類別設定mclass
		switch(mailClass){   
			case "general":
				request.setAttribute("mState", 0);
				request.setAttribute("title", "[一般]:");
				break;
			case "signup":
				request.setAttribute("mState", 1);
				request.setAttribute("title", "[報名]:"+ title);
				break;
			case "service":
				request.setAttribute("mState", 2);
				request.setAttribute("title", "[客服]:");
				break;
			case "report":
				request.setAttribute("mState", 3);
				request.setAttribute("title", "[檢舉]:");
				break;	
		}	
		
			String toName = "";
			String toEmail = "";
			if(toId!=null){      //若toId!=null取得收件者的名稱與email
				MemberBean memberBean =memberService.selectById(toId);
				toName = memberBean.getName();
				toEmail = memberBean.getEmail();
			}
				
				//setAttribute將資訊導入mailSendPage.jsp供user上傳時使用
				request.setAttribute("fromName", fromIdName); 
				request.setAttribute("fromEmail", fromEmail);
				request.setAttribute("toId", toId);
				request.setAttribute("toName", toName);
				request.setAttribute("toEmail", toEmail);
						
		request.getRequestDispatcher("/mail/mailSendPage.jsp").forward(request, response);
//		response.sendRedirect("/Artfolio/mail/mailSendPage.jsp");
		
	}
}
