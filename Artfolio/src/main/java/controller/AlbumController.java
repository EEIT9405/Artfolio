package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	
}
