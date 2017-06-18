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
	public List<AlbumBean> getAlbums(Integer mid){
		if(mid==null)
			return null;
		List<AlbumBean> list=albumService.selectByMid(mid);
		if(list.isEmpty()){
			list.add(albumService.insert(new AlbumBean(null,"default",null,mid,null)));
		}
		return list;
	}
	
	@RequestMapping(path = "insert.controller", method = RequestMethod.POST)
	public AlbumBean insert(String aname){
		Integer mid = (Integer) session.getAttribute("mid");
		if(mid==null || aname==null || aname.trim().length()==0 || aname.equals("default"))
			return null;
		return albumService.insert(new AlbumBean(null, aname.trim(), null, mid, null));
	}
	
	@RequestMapping(path = "update.controller", method = RequestMethod.POST)
	public boolean update(Integer aid,String aname){
		Integer mid = (Integer) session.getAttribute("mid");
		if(mid!=null && aid!=null && aname!=null && aname.trim().length()!=0){
			
			//this part should move to service
			AlbumBean bean=albumService.select(aid).get(0);
			if(bean.getAname().equals("default") || aname.equals("default"))
				return false;
			if(bean.getMid().equals(mid) && bean.getAid().equals(aid)){
				bean.setAname(aname);
				return albumService.update(bean)!=null;
			}	
		}
		return false;
	}
	
	@RequestMapping(path = "delete.controller", method = RequestMethod.POST)
	public Boolean delete(Integer aid){
		if(aid!=null){
			Integer mid = (Integer) session.getAttribute("mid");
			if(mid!=null){ 
				return albumService.delete(aid,mid);
			}
		}
		return false;
	}
}
