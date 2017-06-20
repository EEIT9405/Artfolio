package controller.login;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import model.mail.MailBean;
import model.member.LoginService;
import model.member.MemberBean;
import model.member.MemberService;
@WebServlet("/secure/forgotpass.controller")
public class ForgotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginService loginService;
	private MemberService memberService;
	@Override
	public void init() throws ServletException {
		WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		loginService = (LoginService) context.getBean("loginService");
		memberService = (MemberService) context.getBean("memberService");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		Map<String,String> errors = new HashMap<String,String>(); 
		request.setAttribute("error", errors);
		
		String femail = request.getParameter("femail");
	   
		
		char seeds[] = {'a','b','c','d','e','f','g','0','1','2','3','4','5','6','7','8','9','0'};
		int strLen = (int)Math.round(Math.random() * 10) + 5;
		char randStr[] = new char[strLen];
		for (int i=0;i<randStr.length;i++)
		{
			randStr[i] = seeds[(int)Math.round(Math.random() * (seeds.length - 1))];
		}
		String returnStr = new String(randStr);
		
		System.out.println(returnStr);
	

		 if (femail == null || femail.length() == 0) {
			errors.put("femail", "請輸入帳號 ");
		}		
		if (errors != null && !errors.isEmpty()) {
			request.getRequestDispatcher("/secure/forgotpass.jsp").forward(request, response);
			return;
		}
		
		// 呼叫Model
		List<MemberBean>  bean = loginService.select(femail);
				
		if(bean!=null&&bean.size()!=0){
		for(MemberBean ca :bean){
		    ca.setPwd(returnStr);
		    MemberBean result = memberService.update(ca);
		    request.setAttribute("newemail", bean.size());
		    
		    }
		request.getRequestDispatcher("/secure/login.jsp").forward(request, response);
		}else{
			errors.put("action", "請輸入正確email");
			request.setAttribute("newemail", bean.size());
			
		}
		if (errors != null && !errors.isEmpty()) {
			request.getRequestDispatcher("/secure/forgotpass.jsp").forward(request, response);
			
			return;
		
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		this.doPost(request, response);
	}
}