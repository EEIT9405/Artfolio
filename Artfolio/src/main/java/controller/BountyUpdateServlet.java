package controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import model.bounty.BountyBean;
import model.bounty.BountyService;
import model.member.MemberBean;

@MultipartConfig
@WebServlet("/bounty/personal.controller")
public class BountyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BountyService bountyService;
	SimpleDateFormat sdf;

	@Override
	public void init() throws ServletException {
		sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		bountyService = (BountyService) context.getBean("bountyService");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//取得session資訊 //取得loginOK MemberBean
		HttpSession session = request.getSession(false);
		MemberBean memberBean = (MemberBean) session.getAttribute("loginOK");
		Integer mid = memberBean.getMid(); //新增活動時需要使用
		
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("error", errors);
		
		//接收資料    從multipart post request取得請求表單的parts
		Collection<Part> parts = request.getParts();
	
		String topic = null;
		String[] tags = null;
		String temp1 = null;
		String temp2 = null;
		String temp3 = null;
		String temp4 = null;
		String temp5 = null;
		String organizer = null;
		String content = null;
		String particimethod =null;
		String pisStorageURL = null;
		String attchStorageURL=null;
		String oriurl = null;
		String temp6 = request.getParameter("bid");

		Integer b_id = null;
		if (temp6 != null && temp6.trim().length() != 0) {
			b_id = Integer.parseInt(temp6);
		}

		String action = request.getParameter("action");


		if (parts != null) {
			for (Part p : parts) {
				String fldName = p.getName();
				String value = request.getParameter(fldName);
				// System.out.println("fldName=" + fldName + ", value=" +
				// value);
				if (p.getContentType() == null) { // 非檔案類型資料
					if (fldName.equals("topic")) {
						topic = value;
					} else if (fldName.equals("tag")) {
						tags = request.getParameterValues("tag");
					} else if (fldName.equals("startdate")) {
						temp1 = value;
					} else if (fldName.equals("enddate")) {
						temp2 = value;
					} else if (fldName.equals("announced")) {
						temp3 = value;
					} else if (fldName.equals("totalbonus")) {
						temp4 = value;
					} else if (fldName.equals("maxbonus")) {
						temp5 = value;
					} else if (fldName.equals("organizer")) {
						organizer = value;
					} else if (fldName.equals("content")) {
						content = value;
					} else if (fldName.equals("particimethod")) {
						particimethod = value;
					} else if (fldName.equals("oriurl")) {
						oriurl = value;
					}
				} else { // 檔案類型資料
					if (fldName.equals("pic")) {
						String picname = null;
						for (String file : p.getHeader("content-disposition").split(";")) { // 從part取得"content-disposition"標頭(內含上傳檔案資訊(包含名稱))，並從標頭中取得filenanme
							if (file.trim().startsWith("filename")) {	
								if(file.substring(file.indexOf('=') + 1).trim().replace("\"", "").length()==0){
									pisStorageURL = oriurl;
								}else{
									picname = file.substring(file.indexOf('=') + 1).trim().replace("\"", "");
									pisStorageURL = "C:/Artfolio/BountyImgs/" + picname;		
								}	
							}				
						}		
						if (picname != null && picname.trim().length() > 0) {
							try (InputStream is = p.getInputStream(); // 開啟輸入檔
									FileOutputStream os = new FileOutputStream(pisStorageURL);// 將上傳檔案寫入至資料庫硬碟
							) {
								byte[] b = new byte[8192];
								int len = 0;
								while ((len = is.read(b)) != -1) {
									os.write(b, 0, len);
								}
							}
						}
					}
					if (fldName.equals("file")) {
						String filename = null;
						for (String file : p.getHeader("content-disposition").split(";")) { // 從part取得"content-disposition"標頭(內含上傳檔案資訊(包含名稱))，並從標頭中取得filenanme
							if (file.trim().startsWith("filename")) {
								filename = file.substring(file.indexOf('=') + 1).trim().replace("\"", "");
								System.out.println(filename);
							}
						}

						attchStorageURL = "C:/Artfolio/BountyAttchs/" + filename;
						if (filename != null && filename.trim().length() > 0) {
							try (InputStream is = p.getInputStream(); // 開啟輸入檔
									FileOutputStream os = new FileOutputStream(attchStorageURL);// 將上傳檔案寫入至資料庫硬碟
							) {
								byte[] b = new byte[8192];
								int len = 0;
								while ((len = is.read(b)) != -1) {
									os.write(b, 0, len);
								}
							}
						} else {
							// errors.put("attach", "必須挑選附件檔");
						}
					}
				}
			}
		}
		
		// 驗證資料
		if (topic == null || topic.trim().length() == 0) {
			errors.put("topic", "請輸入活動主題");
		}
		if (temp1 == null || temp1.trim().length() == 0) {
			errors.put("start", "請輸入開始日期");
		}
		if (temp2 == null || temp2.trim().length() == 0) {
			errors.put("end", "請輸入截止日期");
		}
		if (temp3 == null || temp3.trim().length() == 0) {
			errors.put("anno", "請輸入得獎公布日期");
		}
		if (temp4 == null || temp4.trim().length() == 0) {
			errors.put("totalbonus", "請輸入總獎金");
		}
		if (temp5 == null || temp5.trim().length() == 0) {
			errors.put("maxbonus", "請輸入最高獎金");
		}
		if (particimethod == null || particimethod.trim().length() == 0) {
			errors.put("particimethod", "請輸入活動詳情");
		}
		if (content == null || content.trim().length() == 0) {
			errors.put("content", "請輸入參加辦法");
		}
		if (organizer == null || organizer.trim().length() == 0) {
			errors.put("organizer", "請輸入主辦單位");
		} else {
			errors.put("state", "此表單不是上傳檔案的表單");
		}

		// 轉換資料
		java.util.Date startdate = null;
		if (temp1 != null && temp1.length() != 0) {

			try {
				startdate = sdf.parse(temp1);
			} catch (ParseException e) {
				e.printStackTrace();
				errors.put("start", "必須是擁有YYYY-MM-DD格式的日期");
			}
		}
		java.util.Date enddate = null;
		if (temp2 != null && temp2.length() != 0) {
			try {
				enddate = sdf.parse(temp2);
			} catch (ParseException e) {
				errors.put("end", "必須是擁有YYYY-MM-DD格式的日期");
			}
		}

		java.util.Date announced = null;
		if (temp3 != null && temp3.length() != 0) {
			try {
				announced = sdf.parse(temp3);
			} catch (ParseException e) {
				errors.put("anno", "必須是擁有YYYY-MM-DD格式的日期");
			}
		}

		int totalbonus = 0;
		if (temp4 != null && temp4.length() != 0) {
			try {
				totalbonus = Integer.parseInt(temp4);
			} catch (NumberFormatException e) {
				errors.put("totalbonus", "請輸入整數");
			}
		}

		int maxbonus = 0;
		if (temp5 != null && temp5.length() != 0) {
			try {
				maxbonus = Integer.parseInt(temp5);
			} catch (NumberFormatException e) {
				errors.put("totalbonus", "請輸入整數");
			}
		}
		
		System.out.println(new Date());
		System.out.println(enddate);
		
		long now = new Date().getTime(); //現在時間
		long end = enddate.getTime();//結束時間
		long twoWeek = 14*24*60*60*1000; //2周毫秒數
		
		System.out.println("now: "+now);
		System.out.println("end: "+end);
		System.out.println((end-now));
		
		BountyBean bean = bountyService.selectById(b_id);
		
		if(end<now){
			bean.setB_state(1);
			System.out.println("ooooooo");
			//b_state 1 已結束
		}else{
			if((end-now)>=twoWeek){
				bean.setB_state(0);
				System.out.println("hahaha");
				//b_state 0 徵件中
			}else if((end-now)<twoWeek){
				bean.setB_state(2);
				System.out.println("hehee");
				//b_state 2 即將截止
			}
		}
			
		bean.setMid(mid);
		bean.setB_id(b_id);
		bean.setB_title(topic);
		bean.setB_startdate(startdate);
		bean.setB_enddate(enddate);
		bean.setB_announced(announced);
		bean.setB_bonus_total(totalbonus);
		bean.setB_bonus_max(maxbonus);
		bean.setB_organizer(organizer);
		bean.setB_content(content);
		bean.setB_partimethod(particimethod);
		bean.setB_attach_pic(pisStorageURL);
		bean.setB_attach_pdf(attchStorageURL);

		if ("修改".equals(action)) {
			BountyBean inser = bountyService.update(bean);
			if (inser == null) {
				errors.put("error", "更新失敗");
				request.getRequestDispatcher("/bounty/bountyPersonal.jsp").forward(request, response);
			} else {
				request.setAttribute("inser", inser);
				request.getRequestDispatcher("/bounty/bountyPage.controller?id=" + b_id).forward(request, response);	
			//6/7
			}		
		}
	}
}
