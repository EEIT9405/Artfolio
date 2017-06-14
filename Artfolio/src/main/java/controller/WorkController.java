package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.album.AlbumBean;
import model.album.AlbumService;
import model.work.WorkBean;
import model.work.WorkService;

@Controller
@RequestMapping(path = "work")
public class WorkController {
	@Autowired
	private AlbumService albumService;
	@Autowired
	private WorkService workService;
	@Autowired
	HttpSession session;

	@RequestMapping(path = "upload.controller", method = RequestMethod.POST)
	public String upload(MultipartFile[] files, @RequestParam Map<String, String> params) {
		Integer mid = (Integer) session.getAttribute("mid");
		if (mid == null) {
			return "work";
		}
		
		File path =new File("C:\\EEIT94_05_Project\\" + mid);
		if(!path.exists())path.mkdirs();
		List<Map<String, String>> list = new ArrayList<>();
		session.setAttribute("uploadmsg", list);

		for (MultipartFile file : files) {
			
			Map<String, String> errors = new HashMap<String, String>();
			int count = -1;
			for (int i = 0; i < files.length; i++) {
				if (file.getOriginalFilename().equals(params.get("filename_" + i))) {
					count = i;
					break;
				}
			}

			if (count == -1) {
				errors.put("file", "error");
			} else {
				WorkBean bean = new WorkBean();
				
				String wtitle = params.get("wtitle_" + count);
				if (wtitle != null && wtitle.trim().length() > 0) {
					bean.setWtitle(wtitle);
				} else {
					errors.put("wtitle_" + count, "not null");
				}

				
				bean.setWinfo(params.get("winfo_" + count));
				

				Integer aid = null;
				AlbumBean ab = null;
				String said = params.get("aid_" + count);
				if (said != null && said.trim().length() > 0) {
					try {
						aid = Integer.parseInt(said);
						if ((ab = albumService.select(new AlbumBean(aid)).get(0)) != null)
							bean.setAlbumBean(ab);
						else {
							errors.put("aid_" + count, "doesnt exist");
						}
					} catch (Exception e) {
						e.printStackTrace();
						errors.put("aid_" + count, "type error");
					}
				} else
					errors.put("aid_" + count, "not null");

				String isscore = params.get("isscore_" + count);
				bean.setIsscore(isscore != null && isscore.equals("true"));
				String iswmsg = params.get("iswmsg_" + count);
				bean.setIswmsg(iswmsg != null && iswmsg.equals("true"));

				bean.setScore_1(params.get("score_1_" + count));
				bean.setScore_2(params.get("score_2_" + count));
				bean.setScore_3(params.get("score_3_" + count));
				bean.setScore_4(params.get("score_4_" + count));
				bean.setScore_5(params.get("score_5_" + count));
				if (bean.getScore_1().length() > 0 || bean.getScore_2().length() > 0 || bean.getScore_3().length() > 0
						|| bean.getScore_4().length() > 0 || bean.getScore_5().length() > 0)
					bean.setScoreversion(1);

				String type=file.getContentType();
				String filename = String.valueOf(System.currentTimeMillis())+"."+type.substring(type.indexOf("/")+1);
		
				try {
					file.transferTo(new File(path, filename));
					bean.setMid(mid);
					bean.setPicurl("/" + mid + "/" + filename);
					workService.insert(bean);
				
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
			list.add(errors);
		}
		return "work";
	}

}
