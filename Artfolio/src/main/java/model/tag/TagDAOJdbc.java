package model.tag;

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
public class TagDAOJdbc implements TagDAO {
	@Autowired
	private DataSource dataSource;

	private final static String INSERT = "insert into tb_tag (wid,tag) values (?,?)";

	public boolean insert(TagBean bean) {
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if (bean != null) {
				stmt.setInt(1, bean.getWid());
				stmt.setString(2, bean.getTag());
				
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

	private final static String SELECT_TAGS = "select tag,lock from tb_tag where wid=?";

	public List<TagBean> select(Integer wid) {
		ResultSet rset = null;
		List<TagBean> list=null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_TAGS);) {
			if (wid != null) {
				stmt.setInt(1, wid);
				rset = stmt.executeQuery();
				list=new ArrayList<>();
				while(rset.next()) {
					list.add(new TagBean(wid,rset.getString(1),rset.getBoolean(2)));
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

	private final static String DELETE="delete from tb_tag where wid=? and tag=?";
	@Override
	public boolean delete(TagBean bean) {
		try (Connection conn = dataSource.getConnection(); 
			PreparedStatement stmt = conn.prepareStatement(DELETE);) {
			if (bean!=null){
				stmt.setInt(1, bean.getWid());
				stmt.setString(2, bean.getTag());
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
	private final static String UPDATE="update tb_tag set lock=? where wid=? and tag=?";
	@Override
	public boolean update(TagBean bean) {
		try (Connection conn = dataSource.getConnection(); 
			PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			if (bean!=null){
				stmt.setInt(2, bean.getWid());
				stmt.setString(3, bean.getTag());
				stmt.setBoolean(1, bean.isLock());
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
	

}
