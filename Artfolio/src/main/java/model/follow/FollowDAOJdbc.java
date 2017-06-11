package model.follow;

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
public class FollowDAOJdbc implements FollowDAO {
	@Autowired
	private DataSource dataSource;
	
	private static final String INSERT="insert into tb_follow (mid,followid) values (?,?)";
	@Override
	public boolean insert(FollowBean bean) {
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if (bean != null) {
				stmt.setInt(1, bean.getMid());
				stmt.setInt(2, bean.getFollowid());
				
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
	private final static String DELETE="delete from tb_follow where mid=? and followid=?";
	@Override
	public boolean delete(FollowBean bean) {
		try (Connection conn = dataSource.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(DELETE);) {
				if (bean!=null){
					stmt.setInt(1, bean.getMid());
					stmt.setInt(2, bean.getFollowid());
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
	private static final String SELECT_FOLLOWING="select mid,followid,followdate from tb_follow where mid=?";
	@Override
	public List<FollowBean> select(Integer mid) {
		ResultSet rset = null;
		List<FollowBean> list=null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_FOLLOWING);) {
			if (mid != null) {
				stmt.setInt(1, mid);
				rset = stmt.executeQuery();
				list=new ArrayList<>();
				while(rset.next()) {
					list.add(new FollowBean(rset.getInt(1),rset.getInt(2),rset.getTimestamp(3)));
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
	private static final String SELECT_FOLLOWED="select mid,followid,followdate from tb_follow where followid=?";
	@Override
	public List<FollowBean> selectFollowed(Integer followid) {
		ResultSet rset = null;
		List<FollowBean> list=null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_FOLLOWED);) {
			if (followid != null) {
				stmt.setInt(1, followid);
				rset = stmt.executeQuery();
				list=new ArrayList<>();
				while(rset.next()) {
					list.add(new FollowBean(rset.getInt(1),rset.getInt(2),rset.getTimestamp(3)));
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
