package model.score;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ScoreDAOJdbc implements ScoreDAO {
	@Autowired
	private DataSource dataSource;
	
	private static final String INSERT="insert into tb_score (wid,scoreversion,score_1,score_2,score_3,score_4,score_5) values (?,?,?,?,?,?,?) ";
	@Override
	public boolean insert(ScoreBean bean) {
		try (Connection conn = dataSource.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if (bean != null) {
				stmt.setInt(1, bean.getWid());
				stmt.setInt(2, bean.getScoreversion());
				stmt.setString(3, bean.getScore_1());
				stmt.setString(4, bean.getScore_2());
				stmt.setString(5, bean.getScore_3());
				stmt.setString(6, bean.getScore_4());
				stmt.setString(7, bean.getScore_5());
				
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

	private static final String SELECT="select score_1,score_2,score_3,score_4,score_5,retireddate from tb_score where wid=? and scoreversion=?";
	@Override
	public ScoreBean select(Integer wid, Integer scoreversion) {
		ResultSet rset = null;
		ScoreBean bean=null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT);) {
			if (wid != null && scoreversion!=null) {
				stmt.setInt(1, wid);
				stmt.setInt(2, scoreversion);
				rset = stmt.executeQuery();
				
				if(rset.next()) {
					bean=new ScoreBean();
					bean.setWid(wid);
					bean.setScoreversion(scoreversion);
					bean.setScore_1(rset.getString(1));
					bean.setScore_2(rset.getString(2));
					bean.setScore_3(rset.getString(3));
					bean.setScore_4(rset.getString(4));
					bean.setScore_5(rset.getString(5));
					bean.setRetireddate(rset.getTimestamp(6));
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
	
	private static final String SELECT_VERTIONS="select max(scoreversion) from tb_score where wid=?";
	@Override
	public Integer select(Integer wid) {
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_VERTIONS);) {
			if (wid != null) {
				stmt.setInt(1, wid);
				rset = stmt.executeQuery();
				
				if(rset.next()) {
					return rset.getInt(1);
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
		return null;
	}

}
