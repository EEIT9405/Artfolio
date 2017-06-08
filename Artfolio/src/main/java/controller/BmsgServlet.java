package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import model.bmsg.BmsgBean;
import model.bmsg.BmsgService;
import model.member.MemberBean;
import model.member.MemberService;

@WebServlet("/message.controller")
public class BmsgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BmsgService bmsgService;
	private MemberService memberService;

	@Override
	public void init() throws ServletException {
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		bmsgService = (BmsgService) context.getBean("bmsgService");
		memberService = (MemberService) context.getBean("memberService");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		MemberBean user = (MemberBean) session.getAttribute("loginOK");

		Integer bid = Integer.parseInt(request.getParameter("bid"));

		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("error", errors);

		String message = request.getParameter("message");
		String action = request.getParameter("prodaction");
		String msgid = request.getParameter("cmsgid");

		if (message == null || message.length() == 0) {
			errors.put("message", "請輸入留言 ");
		}

		BmsgBean bean = new BmsgBean();
		bean.setMid(user.getMid());
		bean.setB_id(bid);
		bean.setB_msgcontent(message);

		Integer selectmsgMid = null;
		BmsgBean bean1 = new BmsgBean();
		if (msgid != null && msgid.trim().length() != 0) {
			bean1.setB_msgid(Integer.parseInt(msgid));
			selectmsgMid = bmsgService.select(Integer.parseInt(msgid)).getMid();
		}

		if ("Insert".equals(action)) {

			BmsgBean result = bmsgService.insert(bean);
			if (result == null) {
				errors.put("action", "Insert失敗");
			} else {
				request.setAttribute("insOK", result);
				List<BmsgBean> bb = bmsgService.selectByBid(bid);
				List<Map<String, Object>> select = new ArrayList<>();
				for (BmsgBean ca : bb) {
					Map<String, Object> map = new HashMap<>();
					map.put("member", memberService.select(ca.getMid()));
					map.put("msg", ca);
					select.add(map);
				}
				request.setAttribute("select", select);

			}
			request.getRequestDispatcher("/bounty/bountyPage.controller?id=" + bid).forward(request, response);
			return;
		} else if ("Delete".equals(action)) {

			if (user.getMid().equals(selectmsgMid)) {
				bmsgService.delete(bean1);
			}
			request.getRequestDispatcher("/bounty/bountyPage.controller?id=" + bid).forward(request, response);
			return;
		} else if ("Update".equals(action)) {

			BmsgBean result = bmsgService.select(Integer.parseInt(msgid));
			result.setB_msgcontent(message);
			bmsgService.update(result);
			request.getRequestDispatcher("/bounty/bountyPage.controller?id=" + bid).forward(request, response);

			return;
		}

		if (errors != null && !errors.isEmpty()) {
			request.getRequestDispatcher("/bounty/BountyPage.jsp").forward(request, response);
		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
