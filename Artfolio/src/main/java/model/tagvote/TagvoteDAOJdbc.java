package model.tagvote;

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
public class TagvoteDAOJdbc implements TagvoteDAO {
	
	@Autowired
	private DataSource dataSource;

	private static final String INSERT="insert into tb_tagvote (mid,wid,tag) values (?,?,?)";
	@Override
	public boolean insert(TagvoteBean bean) {
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if (bean != null) {
				stmt.setInt(1, bean.getMid());
				stmt.setInt(2, bean.getWid());
				stmt.setString(3, bean.getTag());
				
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

	private static final String DELETE="delete from tb_tagvote where mid=? and wid=? and tag=?";
	@Override
	public boolean delete(TagvoteBean bean) {
		try (Connection conn = dataSource.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(DELETE);) {
				if (bean!=null){
					stmt.setInt(1, bean.getMid());
					stmt.setInt(2, bean.getWid());
					stmt.setString(3, bean.getTag());
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

	private static final String SELECT="select mid,wid,tag,votedate from tb_tagvote where wid=? and tag=?";
	@Override
	public List<TagvoteBean> select(Integer wid, String tag) {
		ResultSet rset = null;
		List<TagvoteBean> list=null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT);) {
			if (wid != null && tag!=null) {
				stmt.setInt(1, wid);
				stmt.setString(2, tag);
				rset = stmt.executeQuery();
				list=new ArrayList<>();
				while(rset.next()) {
					if(wid.equals(rset.getInt(2)) && tag.equals(rset.getString(3)))
					list.add(new TagvoteBean(rset.getInt(1),wid,tag,rset.getTimestamp(4)));
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

	private static final String SELECT_BY_MID="select mid,wid,tag,votedate from tb_tagvote where mid=?";
	@Override
	public List<TagvoteBean> select(Integer mid) {
		ResultSet rset = null;
		List<TagvoteBean> list=null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_MID);) {
			if (mid != null) {
				stmt.setInt(1, mid);
				rset = stmt.executeQuery();
				list=new ArrayList<>();
				while(rset.next()) {
					if(mid.equals(rset.getInt(1)))
					list.add(new TagvoteBean(mid,rset.getInt(2),rset.getString(3),rset.getTimestamp(4)));
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
