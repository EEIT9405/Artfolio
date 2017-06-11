package model.donate;

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
public class DonateDAOJdbc implements DonateDAO {
	@Autowired
	private DataSource dataSource;
	
	private static final String INSERT="insert into tb_donate (mid,targetid,point) values (?,?,?)";
	@Override
	public boolean insert(DonateBean bean) {
		try (Connection conn = dataSource.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if (bean != null) {
				stmt.setInt(1, bean.getMid());
				stmt.setInt(2, bean.getTargetid());
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
	private static final String SELECT="select dno,mid,targetid,point,donatedate from tb_donate where mid=?";
	@Override
	public List<DonateBean> select(Integer mid) {
		ResultSet rset = null;
		List<DonateBean> list=null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT);) {
			if (mid != null) {
				stmt.setInt(1, mid);
				rset = stmt.executeQuery();
				list=new ArrayList<>();
				while(rset.next()) {
					list.add(new DonateBean(rset.getInt(1),rset.getInt(2),rset.getInt(3),rset.getInt(4),rset.getTimestamp(5)));
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
	private static final String SELECT_SELF="select dno,mid,targetid,point,donatedate from tb_donate where targetid=?";
	@Override
	public List<DonateBean> selectDonated(Integer targetid) {
		ResultSet rset = null;
		List<DonateBean> list=null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_SELF);) {
			if (targetid != null) {
				stmt.setInt(1, targetid);
				rset = stmt.executeQuery();
				list=new ArrayList<>();
				while(rset.next()) {
					list.add(new DonateBean(rset.getInt(1),rset.getInt(2),rset.getInt(3),rset.getInt(4),rset.getTimestamp(5)));
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
