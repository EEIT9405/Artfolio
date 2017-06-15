package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.album.AlbumBean;
import model.album.AlbumService;

@Controller
@ResponseBody
@RequestMapping(path = "album")
public class AlbumController {
	@Autowired
	private AlbumService albumService;
	@Autowired
	HttpSession session;
	
	@RequestMapping(path = "get.controller", method = RequestMethod.GET)
	public List<AlbumBean> getAlbums(Integer aid){
		Integer mid = (Integer) session.getAttribute("mid");
		if(mid==null)
			return null;
		return albumService.selectByMid(mid);
	}
	
	@RequestMapping(path = "insert.controller", method = RequestMethod.POST)
	public AlbumBean insert(String aname,@RequestParam(required=false)Integer wid){
		Integer mid = (Integer) session.getAttribute("mid");
		if(mid==null || aname==null)
			return null;
		return albumService.insert(new AlbumBean(null, aname, wid, mid, null));
	}
	
}
