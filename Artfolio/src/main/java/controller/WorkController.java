package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import model.album.AlbumBean;
import model.album.AlbumService;
import model.tag.TagService;
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
	private TagService tagService;
	
	@Autowired
	HttpSession session;

	@RequestMapping(path = "upload.controller", method = RequestMethod.POST)
	public String upload(MultipartFile[] files, @RequestParam Map<String, String> params) {
		Integer mid = (Integer) session.getAttribute("mid");
		if (mid == null) {
			return "login";
		}
		
		File path = new File("C:/Artfolio/works/" + mid);
		if (!path.exists())
			path.mkdirs();
		List<List<String>> list = new ArrayList<>();
		List<WorkBean> wblist = new ArrayList<>();
		session.setAttribute("workList", wblist);
		session.setAttribute("uploadmsg", list);
		if(params!=null && files!=null)
		for (MultipartFile file : files) {
			LinkedList<String> errors = new LinkedList<>();
			int count = -1;
			String errorin = file.getOriginalFilename();
			for (int i = 0; i < files.length; i++) {
				if (file.getOriginalFilename().equals(params.get("filename_" + i))) {
					count = i;
					break;
				}
			}
			if (count == -1) {
				errors.add("filename error");
			} else {
				WorkBean bean = new WorkBean();

				String wtitle = params.get("wtitle_" + count);
				if (wtitle != null && wtitle.length() > 0) {
					bean.setWtitle(wtitle.trim());
				} else {
					errors.add("title cannot be null");
				}

				String winfo = params.get("winfo_" + count);
				if (winfo != null)
					bean.setWinfo(winfo.trim());

				Integer aid = null;
				AlbumBean ab = null;
				String said = params.get("aid_" + count);
				if (said != null && said.trim().length() > 0) {
					try {
						aid = Integer.parseInt(said.trim());
						if ((ab = albumService.select(aid).get(0)) != null)
							bean.setAlbumBean(ab);
						else {
							errors.add("ablum does not exist");
						}
					} catch (Exception e) {
						e.printStackTrace();
						errors.add("aid type error");
					}
				} else
					errors.add("aid cannot be null");

				String isscore = params.get("isscore_" + count);
				bean.setIsscore(isscore != null && isscore.trim().equals("true"));
				String iswmsg = params.get("iswmsg_" + count);
				bean.setIswmsg(iswmsg != null && iswmsg.trim().equals("true"));

				int s = 0;
				String score_1 = params.get("score_1_" + count);
				if (score_1 != null && score_1.trim().length() > 0) {
					bean.setScore_1(score_1.trim());
					s++;
				}
				String score_2 = params.get("score_2_" + count);
				if (score_2 != null && score_2.trim().length() > 0) {
					bean.setScore_2(score_2.trim());
					s++;
				}
				String score_3 = params.get("score_3_" + count);
				if (score_3 != null && score_3.trim().length() > 0) {
					bean.setScore_3(score_3.trim());
					s++;
				}
				String score_4 = params.get("score_4_" + count);
				if (score_4 != null && score_4.trim().length() > 0) {
					bean.setScore_4(score_4.trim());
					s++;
				}
				String score_5 = params.get("score_5_" + count);
				if (score_5 != null && score_5.trim().length() > 0) {
					bean.setScore_5(score_5.trim());
					s++;
				}
				if (s > 0)
					bean.setScoreversion(1);
				else if (bean.getIsscore()) {
					bean.setIsscore(false);
					errors.add("close isscore since no scores have been set");
				}

				String type = file.getContentType();
				String filename = String.valueOf(System.currentTimeMillis()) + "."
						+ type.substring(type.indexOf("/") + 1);
				if (!errors.isEmpty()) {
					errors.add("failed to upload since data error");
				} else {
					bean.setMid(mid);
					bean.setPicurl("/img/" + mid + "/" + filename);
					bean = workService.insert(bean);
					if (bean != null && bean.getWid() != null) {
						try {
							file.transferTo(new File(path, filename));
						} catch (IllegalStateException e) {
							e.printStackTrace();
							errors.add("IllegalState error");
						} catch (IOException e) {
							e.printStackTrace();
							errors.add("failed to save image");
						}
						if (errors.isEmpty()) {
							String tagstring = params.get("tags_" + count);
							List<String> tags = new ArrayList<>();
							if (tagstring != null && tagstring.trim().length()>0){
								for(String tag:tagstring.trim().split(",")){
									if(tag.matches("[A-Za-z \u4E00-\u9FFF]+") && tag.trim().length()!=0 && tag.trim().length()<=20)
										tags.add(tag.trim());
									else
										errors.add("omit tag:\""+tag.trim()+"\" since it's invalid");
								}
								if(!tags.isEmpty()){
									if(tagService.addTag(bean.getWid(),tags.toArray(new String[0]))==null)
										errors.add("failed to add tag");
								}else
									errors.add("no tag has been added");
									
							}
							wblist.add(bean);
						}else
							workService.delete(bean);
					} else {
						errors.add("failed to insert");
					}
				}
			}
			if (!errors.isEmpty()) {
				errors.offerFirst(errorin);
				list.add(errors);
			}

		}
		return "upload";
	}
	
	@RequestMapping(path = "update.controller", method = RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public boolean update(Integer wid,String wtitle,String winfo,Integer aid,Boolean iswmsg){
		Integer mid = (Integer) session.getAttribute("mid");
		if(mid!=null && wid!=null && wtitle!=null && wtitle.trim().length()>0){
			
			//this part should be moved to service
			WorkBean bean=workService.getWork(wid);
			if(bean!=null && bean.getMid().equals(mid)){
				bean.setWtitle(wtitle.trim());
				if(winfo!=null)
				bean.setWinfo(winfo.trim());
				if(aid!=null){
					bean.setAlbumBean(albumService.select(aid).get(0));
					bean.setWorder(9999999);
				}
				bean.setIswmsg(iswmsg!=null && iswmsg);
				return workService.update(bean)!=null;
			}
		}
		return false;
	}

	@RequestMapping(path = "delete.controller", method = RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public boolean hide(Integer wid){
		Integer mid = (Integer) session.getAttribute("mid");
		if(mid!=null && wid!=null){
			
			//this part should be moved to service,and maybe create a new method
			WorkBean bean=workService.getWork(wid);
			if(bean.getMid().equals(mid)){
				bean.setWend(new java.util.Date());
				return workService.update(bean)!=null;
			}
		}
		return false;
	}
	
	@RequestMapping(path = "getNewDate.controller", method = RequestMethod.GET, produces="application/json;charset=utf-8")
	@ResponseBody
	public Date getNewWorkDate(Integer mid){
		if(mid != null){
			return workService.getNewWorkDate(mid);
		}
		return null;
	}
}
