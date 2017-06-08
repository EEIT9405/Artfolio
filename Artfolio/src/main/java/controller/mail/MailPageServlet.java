package controller.mail;

import java.io.IOException;
import java.text.DateFormat;
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

@WebServlet("/mail/mailPage.controller")
public class MailPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MailService mailService;
	DateFormat sdf;

	public void init() throws ServletException {
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		mailService = (MailService) context.getBean("mailService");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String temp = request.getParameter("mailid");
		// 轉換資料
		Integer mailId = null;
		if (temp != null && temp.trim().length() != 0) {
			mailId = Integer.parseInt(temp);
		}
		// if reid==null
		// 取得該信件所有內容以及該信件所有回覆的內容
		MailBean mailBean = new MailBean(mailId);
		List<MailBean> list = mailService.select(mailBean);
		List<MailBean> result = null;
		if (list != null) {
			for (MailBean bean : list) {
				request.setAttribute("mailBean", bean);
				if (bean.getReid() == null) {
					result = mailService.selectByReId(mailId);
				} else {
					result = mailService.selectByReId(bean.getReid());
				}
			}
			// setAttribute將資訊forward給mailPage.jsp呈現
			request.setAttribute("replyList", result);
			request.getRequestDispatcher("/mail/mailPage.jsp").forward(request, response);
		}
	}
}
