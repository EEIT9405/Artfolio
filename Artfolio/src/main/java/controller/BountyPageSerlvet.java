package controller;

import java.io.IOException;
import java.util.List;
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


@WebServlet("/bountyPage.controller")
public class BountyPageSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BountyService bountyService;
	@Override
	public void init() throws ServletException {
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		bountyService = (BountyService) context.getBean("bountyService");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
			
		String id = request.getParameter("id");
		BountyBean bean = new BountyBean();	
		bean.setB_id(Integer.parseInt(id));
		List<BountyBean> beans = bountyService.select(bean);
		for(BountyBean b:beans){
			request.setAttribute("bean", b);
			
			System.out.println(b.getB_startdate().toString().substring(0,10));
			Set<BountyTagBean> tags = b.getTags();
			request.setAttribute("tags", tags);	
		}	
		request.getRequestDispatcher("/BountyPage.jsp").forward(request, response);	
	}

}
