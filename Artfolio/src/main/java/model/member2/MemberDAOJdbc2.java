package model.member2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDAOJdbc2 implements MemberDAO2 {
	
	@Autowired
	private DataSource dataSource;

	private static final String SELECT="select mid,pwd,name,isname,email,ismail,gender,isgender,info,isinfo,mphoto,point,mstart,mend,mupdate from tb_member where mid=?";
	@Override
	public MemberBean2 select(Integer mid) {
		ResultSet rset = null;
		MemberBean2 bean=null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT);) {
			if (mid != null) {
				stmt.setInt(1, mid);
				rset = stmt.executeQuery();
				
				if(rset.next()) {
					bean=new MemberBean2();
					bean.setMid(rset.getInt(1));
					bean.setPwd(rset.getString(2));
					bean.setName(rset.getString(3));
					bean.setIsname(rset.getBoolean(4));
					bean.setEmail(rset.getString(5));
					bean.setIsmail(rset.getBoolean(6));
					bean.setGender(rset.getBoolean(7));
					bean.setIsgender(rset.getBoolean(8));
					bean.setInfo(rset.getString(9));
					bean.setIsinfo(rset.getBoolean(10));			
					bean.setMphoto(rset.getBytes(11));
					bean.setPoint(rset.getInt(12));
					bean.setMstart(rset.getTimestamp(13));
					bean.setMend(rset.getTimestamp(14));
					bean.setMupdate(rset.getTimestamp(15));
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
		return bean;
	}

	private static final String UPDATE_POINT="update tb_member set point=? where mid=?";
	@Override
	public boolean updatePoint(Integer mid, Integer point) {
		try (Connection conn = dataSource.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(UPDATE_POINT);) {
			if (mid != null && point!=null) {
				stmt.setInt(1, point);
				stmt.setInt(2, mid);
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

}
