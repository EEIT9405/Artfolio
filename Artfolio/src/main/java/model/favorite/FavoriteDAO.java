package model.favorite;

import java.util.List;

import model.tag.TagBean;

public interface FavoriteDAO {
	
	public void insert(FavoriteBean favoriteBean);
	public int update(int mid, String tag);
	public FavoriteBean select(int mid, String tag);
	public int selectCount(int mid, String tag);
}
