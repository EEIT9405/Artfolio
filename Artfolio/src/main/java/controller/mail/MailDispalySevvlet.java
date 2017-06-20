package controller.mail;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;

import model.mail.MailBean;
import model.mail.MailService;

@WebServlet("/mail/mailDisplay.controller")
public class MailDispalySevvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MailService mailService;
	DateFormat sdf;
	@Override
	public void init() throws ServletException {
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		mailService = (MailService) context.getBean("mailService");
		sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		String temp = request.getParameter("targetId");
		String showReadOrDelete = request.getParameter("ShowReadOrDelete");
		
		Integer targetId=null;
		if(temp!=null && temp.trim().length()!=0){
			targetId = Integer.parseInt(temp);
		}
	
		System.out.println(showReadOrDelete);
		
		MailBean bean = null; //根據條件查詢信件
		switch(showReadOrDelete){
			case "delete":
				bean = new MailBean(targetId,true,"delete");//選取該id所有delete的信件
				break;
			case "undelete":
				bean = new MailBean(targetId,false,"delete");//選取該id所有undelete的信件
				break;
			case "read":	
				bean = new MailBean(targetId,true,"read");
				break;
			case "unread":
				bean = new MailBean(targetId,false,"read");
				break;
		}
							
		//呼叫model選取資料
		List<MailBean> result = mailService.select(bean);
		System.out.println(result);
		
		//將資料轉換成JSON格式
		ObjectMapper mapper = new ObjectMapper();
//		mapper.setDateFormat(sdf);
		JsonGenerator generator = mapper.getFactory().createGenerator(out);
		generator.writeObject(result);
	}
}
