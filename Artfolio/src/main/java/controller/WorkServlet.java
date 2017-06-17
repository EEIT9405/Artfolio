package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import model.album.AlbumBean;
import model.album.AlbumService;
import model.member.MemberBean;
import model.work.WorkBean;
import model.work.WorkService;

@WebServlet(urlPatterns = { "/Upload/tbwork.controller" })
public class WorkServlet extends HttpServlet {
	private WorkService workService;
	private SimpleDateFormat sdFormat;
	private AlbumService albumService;

	@Override
	public void init() throws ServletException {
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		workService = (WorkService) context.getBean("workService");
		albumService = (AlbumService) context.getBean("albumService");
		sdFormat = new SimpleDateFormat("yyyy-MM-dd");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/plain; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		MemberBean user = (MemberBean) request.getSession(false).getAttribute("loginOK");
		if (user != null) {
			// 接收前端資料資料
			String wid_temp = request.getParameter("wid");
			String picurl_temp = request.getParameter("picurl");
			String wtitle_temp = request.getParameter("wtitle");
			String winfo_temp = request.getParameter("winfo");
			String aname_temp = request.getParameter("aname");
			String iswmsg_temp = request.getParameter("iswmsg");
			String isscore_temp = request.getParameter("isscore");
			String wend_temp = request.getParameter("wend");
			String score_1_temp = request.getParameter("score_1");
			String score_2_temp = request.getParameter("score_2");
			String score_3_temp = request.getParameter("score_3");
			String score_4_temp = request.getParameter("score_4");
			String score_5_temp = request.getParameter("score_5");
			String tbaction = request.getParameter("tbaction");

			// 驗證資料前端資料
			Map<String, String> errors = new HashMap<String, String>();
			request.setAttribute("errors", errors);

			if (wtitle_temp == null || wtitle_temp.length() == 0) {
				errors.put("wtitleError", "請輸入圖片名稱");
			}

			// 轉換資料
			int wid = 0;
			if (wid_temp != null && wid_temp.length() != 0) {
				try {
					wid = Integer.parseInt(wid_temp);
				} catch (NumberFormatException e) {
					e.printStackTrace();
					errors.put("wid", "圖片編號異常");
				}
			}

			Boolean iswmsg = null;
			if (iswmsg_temp != null) {
				iswmsg = Boolean.parseBoolean(iswmsg_temp);
			}
			Boolean isscore = null;
			if (isscore_temp != null) {
				isscore = Boolean.parseBoolean(isscore_temp);
			}

			Boolean wend = null;
			if (wend_temp != null) {
				wend = Boolean.parseBoolean(wend_temp);
			}

			Date dNow = new Date();// 現在時間
			Date dBefore = new Date(); // 前一天
			Date frDate = null; // 永久時間

			try {
				frDate = sdFormat.parse("9911-12-31");

			} catch (ParseException e) {
				e.printStackTrace();
			}
			GregorianCalendar cal = new GregorianCalendar();
			cal.setTime(frDate);
			sdFormat.setCalendar(cal);

			Calendar calendar = Calendar.getInstance();
			calendar.setTime(dNow);// 設定當前時間
			calendar.add(Calendar.DAY_OF_MONTH, -1); // 設置前一天
			dBefore = calendar.getTime(); // 得到前一天的時間

			// 將前端網頁的資料設定到變數
			AlbumBean albumbean = new AlbumBean();
			WorkBean bean = new WorkBean();
			bean.setWid(wid);
			bean.setPicurl(picurl_temp);
			bean.setWtitle(wtitle_temp);
			bean.setWinfo(winfo_temp);
			bean.setIswmsg(iswmsg);
			bean.setIsscore(isscore);
			bean.setScore_1(score_1_temp);
			bean.setScore_2(score_2_temp);
			bean.setScore_3(score_3_temp);
			bean.setScore_4(score_4_temp);
			bean.setScore_5(score_5_temp);

			// 是否需要顯示圖片
			if (wend) {
				bean.setWend(frDate);
				request.setAttribute("Displaywend", true);
			} else {
				bean.setWend(dBefore);
				request.setAttribute("Displaywend", false);
			}

			bean.setMid(user.getMid());

			// 判斷使用者是否在新增作品冊
			if (aname_temp != null && aname_temp.length() != 0) {
				albumbean.setAname(aname_temp);
				albumbean.setMid(bean.getMid());
				AlbumBean albumResult = albumService.insert(albumbean);
				if (albumResult==null || albumResult.getAid()==null) {
					errors.put("action", "相簿建立失敗");
				} else {
					bean.setAlbumBean(albumbean);
				}
			}

			if ("上傳".equals(tbaction)) {
				if (wid_temp != null && wid_temp.length() != 0) {
					// 修改圖片
					workService.update(bean);

					request.setAttribute("wid", bean.getWid());
					request.setAttribute("fileUrl", bean.getPicurl());
					request.getRequestDispatcher("/Upload/UploadIndex.jsp").forward(request, response);

				} else if (picurl_temp != null) {
					// 新增圖片
					WorkBean workResult=workService.insert(bean);
					if (workResult==null ||workResult.getWid()==null) {
						errors.put("action", "作品資料新增失敗");
					} else {
						// 回傳新相冊預設圖片值為剛剛新增的圖片
						albumbean.setWid(bean.getWid());
						albumService.update(albumbean);

						// 設定新作品的流水號回傳回主User頁面
						request.setAttribute("wid", bean.getWid());
						request.setAttribute("fileUrl", bean.getPicurl());
						request.getRequestDispatcher("/Upload/UploadIndex.jsp").forward(request, response);
					}
				} else {
				}

			} else if ("取消上傳".equals(tbaction)) {
				boolean result = workService.delete(bean);
				if (result) {
					errors.put("action", "刪除資料成功");
				} else {
					errors.put("action", "查無此筆資料");
				}
				request.getRequestDispatcher("/Upload/UploadIndex.jsp").forward(request, response);
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
