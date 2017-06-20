package controller.login;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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


@WebServlet("/secure/login.controller")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginService loginService;
	@Override
	public void init() throws ServletException {
		WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		loginService = (LoginService) context.getBean("loginService");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		Map<String,String> errors = new HashMap<String,String>(); 
		request.setAttribute("error", errors);
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String vcode  = request.getParameter("vcode");
		 
		String  msg= (String)session.getAttribute("code");
		System.out.println(msg);
		 if (email == null || email.length() == 0) {
			errors.put("email", "請輸入帳號 ");
		}
		if (password == null || password.length() == 0) {
			errors.put("password", "請輸入密碼");
		}

		if (errors != null && !errors.isEmpty()) {
			request.getRequestDispatcher("/secure/login.jsp").forward(request, response);
			return;
		}
		
		// 呼叫Model
				 MemberBean bean = loginService.login(email, password);

				// 根據Model執行結果呼叫View
				if (bean == null) {
//				if (bean == null  || !vcode.equals(msg)) {
					errors.put("msg", "登入失敗，請再次輸入帳號密碼");
					request.getRequestDispatcher("/secure/login.jsp").forward(request, response);
					return; 
//				} else if(bean.getMid()==1||bean.getMid()==2||bean.getMid()==3){
//					session.setAttribute("loginOK", bean);
//					response.sendRedirect("/Artfolio/try.jsp");
					
				}
					else {
					session.setAttribute("loginOK", bean);
					session.setAttribute("mid", bean.getMid());
					response.sendRedirect("/Artfolio/index.jsp");
					
				}	
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		this.doPost(request, response);
	}
}
