package controller.login;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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

import model.member.LoginService;
import model.member.MemberBean;
import model.member.MemberService;

@MultipartConfig
@WebServlet("/member.controller")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService;
	private LoginService loginService;

	@Override

	public void init() throws ServletException {
		WebApplicationContext context = WebApplicationContextUtils
				.getRequiredWebApplicationContext(getServletContext());
		memberService = (MemberService) context.getBean("memberService");
		loginService = (LoginService) context.getBean("loginService");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String info = request.getParameter("info");
		String mphoto = request.getParameter("mphoto");
		String action = request.getParameter("action");
		String sqlphoto = null;

		MemberBean user = (MemberBean) session.getAttribute("loginOK");

		Map<String, String> errorMessage = new HashMap<String, String>();
		request.setAttribute("ErrorMsg", errorMessage);

		Collection<Part> parts = request.getParts();
		if (parts != null) {
			for (Part p : parts) {
				String fldName = p.getName();
				String value = request.getParameter(fldName);
				if (p.getContentType() == null) { // 非檔案類型資料
					if (fldName.equals("email")) {
						email = value;
					} else if (fldName.equals("pwd")) {
						pwd = value;
					} else if (fldName.equals("name")) {
						name = value;
					} else if (fldName.equals("gender")) {
						gender = value;
					} else if (fldName.equals("info")) {
						info = value;
					}
				} else { // 檔案類型資料
					if (fldName.equals("mphoto")) {
						String picname = null;
						for (String file : p.getHeader("content-disposition").split(";")) { // 從part取得"content-disposition"標頭(內含上傳檔案資訊(包含名稱))，並從標頭中取得filenanme
							if (file.trim().startsWith("filename")) {
								picname = new Date().getTime()
										+ file.substring(file.indexOf('=') + 1).trim().replace("\"", "");
								if (file.substring(file.indexOf('=') + 1).trim().replace("\"", "").length() == 0) {
									sqlphoto = "/memberPhoto/user.png";
									picname = null;
								} else {
									sqlphoto = "/memberPhoto/" + picname;
								}
							}

						}

						mphoto = "C:/Artfolio/MemberPhoto/" + picname;
						if (picname != null && picname.trim().length() > 0) {
							try (InputStream is = p.getInputStream(); // 開啟輸入檔
									FileOutputStream os = new FileOutputStream(mphoto);// 將上傳檔案寫入至資料庫硬碟
							) {
								byte[] b = new byte[8192];
								int len = 0;
								while ((len = is.read(b)) != -1) {
									os.write(b, 0, len);
								}
							}
						}
					}

				}
			}
		}

		if (email == null || email.trim().length() == 0) {
			errorMessage.put("email", "帳號欄必須輸入");
		}

		if (pwd == null || pwd.trim().length() == 0) {
			errorMessage.put("pwd", "密碼欄必須輸入");
		}

		if (name == null || name.trim().length() == 0) {
			errorMessage.put("name", "姓名欄必須輸入");
		}

		if (errorMessage != null && !errorMessage.isEmpty()) {
			request.getRequestDispatcher("Member.jsp").forward(request, response);
			return;
		}

		MemberBean bean = new MemberBean();
		if ("boy".equals(gender)) {
			bean.setGender(true);
		} else {
			bean.setGender(false);
		}
		if ("更新".equals(action)) {
			bean.setMid(user.getMid());
		}

		bean.setEmail(email);
		bean.setPwd(pwd);
		bean.setName(name);
		bean.setInfo(info);
		bean.setMphoto(sqlphoto);

		List<MemberBean>  em =    loginService.select(email);
		if(em!=null&&!em.isEmpty()&&"更新".equals(action)&&!em.get(0).getMid().equals(user.getMid())){
			
			errorMessage.put("noupdate", "更新失敗,email重複");
		
			request.getRequestDispatcher("/MemberUpdate.jsp").forward(request, response);
			return;			
		}else if(em!=null&&!em.isEmpty()&&"完成".equals(action)){

			errorMessage.put("noupdate", "更新失敗,email重複");
		
			request.getRequestDispatcher("/Member.jsp").forward(request, response);
			return;
		}
		
		if (bean != null && "更新".equals(action)) {
			MemberBean result = memberService.update(bean);			
			session.setAttribute("loginOK", result);
			errorMessage.put("noupdate", "更新成功");
			request.getRequestDispatcher("/information.jsp").forward(request, response);
			return;
		}
		
		
		if (bean != null && "完成".equals(action)) {
			MemberBean result = memberService.insert(bean);
			if (result == null) {
				errorMessage.put("error", "Insert失敗");
			} else {
			
				request.setAttribute("InsertOK", result);
			}
			response.sendRedirect("/Artfolio/secure/login.jsp");

		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
