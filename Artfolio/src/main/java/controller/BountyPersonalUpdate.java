package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import model.bounty.BountyBean;
import model.bounty.BountyService;
import model.bounty.BountyTagBean;
@WebServlet("/bounty/personalUpdate.controller")
public class BountyPersonalUpdate extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private BountyService bountyService;

	public void init() throws ServletException {
		WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		bountyService = (BountyService) context.getBean("bountyService");
	}
		
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");	
		String temp1 = request.getParameter("b_id");	
		Integer b_id=null;
		if(temp1!=null && temp1.trim().length()!=0){
			b_id = Integer.parseInt(temp1);
		}
		BountyBean change=	bountyService.selectById(b_id);	
    	if(change!=null) {	
			request.setAttribute("change", change);
		}
    	request.getRequestDispatcher(
				"/bounty/bountyChange.jsp").forward(request, response);  	
    }
}
