package model.expoint;

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
public class ExpointDAOJdbc implements ExpointDAO {
	@Autowired
	private DataSource dataSource;
	
	private static final String INSERT="insert into tb_expoint (mid,ptype,point) values(?,?,?)";
	@Override
	public boolean insert(ExpointBean bean) {
		try (Connection conn = dataSource.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if (bean != null) {
				stmt.setInt(1, bean.getMid());
				stmt.setBoolean(2, bean.getPtype());
				stmt.setInt(3, bean.getPoint());
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

	private static final String SELECT="select pno,mid,ptype,point,expointdate from tb_expoint where mid=?";
	@Override
	public List<ExpointBean> select(Integer mid) {
		ResultSet rset = null;
		List<ExpointBean> list=null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT);) {
			if (mid != null) {
				stmt.setInt(1, mid);
				rset = stmt.executeQuery();
				list=new ArrayList<>();
				while(rset.next()) {
					list.add(new ExpointBean(rset.getInt(1),rset.getInt(2),rset.getBoolean(3),rset.getInt(4),rset.getTimestamp(5)));
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
