package model.like;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDAOJdbc implements LikeDAO {
	@Autowired
	private DataSource dataSource;
	
	
	private static final String INSERT="insert into tb_like (mid,wid) values (?,?)";
	@Override
	public boolean insert(LikeBean bean) {
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if (bean != null) {
				stmt.setInt(1, bean.getMid());
				stmt.setInt(2, bean.getWid());
				
				int i = stmt.executeUpdate();
				if (i == 1) {
					return true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	private final static String DELETE="delete from tb_like where mid=? and wid=?";
	@Override
	public boolean delete(LikeBean bean) {
		try (Connection conn = dataSource.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(DELETE);) {
				if (bean!=null){
					stmt.setInt(1, bean.getMid());
					stmt.setInt(2, bean.getWid());
					int i = stmt.executeUpdate();
					if (i == 1) {
						return true;
					}
				}
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
			return false;
	}
	private static final String SELECT="select mid,wid,likedate from tb_like where mid=?";
	@Override
	public List<LikeBean> select(Integer mid) {
		ResultSet rset = null;
		List<LikeBean> list=null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT);) {
			if (mid != null) {
				stmt.setInt(1, mid);
				rset = stmt.executeQuery();
				list=new ArrayList<>();
				while(rset.next()) {
					list.add(new LikeBean(rset.getInt(1),rset.getInt(2),rset.getTimestamp(3)));
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}
		}
		return list;
	}
	private static final String SELECT_LIKED="select mid,wid,likedate from tb_like where wid=?";
	@Override
	public List<LikeBean> selectLiked(Integer wid) {
		ResultSet rset = null;
		List<LikeBean> list=null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_LIKED);) {
			if (wid != null) {
				stmt.setInt(1, wid);
				rset = stmt.executeQuery();
				list=new ArrayList<>();
				while(rset.next()) {
					list.add(new LikeBean(rset.getInt(1),rset.getInt(2),rset.getTimestamp(3)));
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}
		}
		return list;
	}

}
