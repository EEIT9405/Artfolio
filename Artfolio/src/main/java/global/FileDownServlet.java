package global;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//http://www.codejava.net/java-ee/servlet/java-servlet-download-file-example
//Java Servlet Download File Example
@WebServlet(urlPatterns={"/bounty/FileDownServlet","/mail/FileDownServlet"})
public class FileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//前端==============
		//點選下載網址
		//取得欲下載的檔案名稱
		
		//後端==============	
		
		String fileId = request.getParameter("fileId");
		String attachId = request.getParameter("attachId");

		Enumeration<String> names = request.getParameterNames();
		String name="";
		while(names.hasMoreElements()){
			name = names.nextElement();
		}
		String filePath ="";
		switch(name){
			case "fileId":
				//set filepath from an absolute storage path;
				filePath ="C:/Artfolio/BountyAttchs/"+fileId;
				break;
			case "attachId":
				filePath ="C:/Artfolio/MailAttachs/"+attachId;
				break;
		}			
		 //reads input file from an absolute path
		File downloadFile = new File(filePath);
		FileInputStream in = new FileInputStream(downloadFile);
		
		 // obtains ServletContext
		ServletContext context = getServletContext();
		
		// gets MIME type of the file
		String mimeType = context.getMimeType(filePath); //取得檔案的mimeType
		if(mimeType==null){
			//set to binary type if MIME mapping not found
			mimeType = "application/octet-stream";
		}
		System.out.println("MIME type: " + mimeType);
		
		// modifies response
		response.setContentType(mimeType);
		response.setContentLengthLong((int)downloadFile.length());
		
		// forces download  //https://developer.mozilla.org/zh-TW/docs/Web/HTTP/Headers/Content-Disposition
		String headerKey = "Content-Disposition";
		String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
        response.setHeader(headerKey, headerValue);
         
        // obtains response's output stream
        OutputStream out = response.getOutputStream(); 
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        while ((bytesRead = in.read(buffer)) != -1) {
        	out.write(buffer, 0, bytesRead);
        }
        
        in.close();
        out.close();  	
	}
}
