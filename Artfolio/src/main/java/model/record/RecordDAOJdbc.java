package model.record;

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
public class RecordDAOJdbc implements RecordDAO {
	@Autowired
	private DataSource dataSource;
	
	private static final String INSERT="insert into tb_record (mid,wid,record_1,record_2,record_3,record_4,record_5,recordversion) values (?,?,?,?,?,?,?,?)";
	@Override
	public boolean insert(RecordBean bean) {
		try (Connection conn = dataSource.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if (bean != null) {
				stmt.setInt(1, bean.getMid());
				stmt.setInt(2, bean.getWid());
				stmt.setInt(3, bean.getRecord_1().intValue());
				stmt.setInt(4, bean.getRecord_2().intValue());
				stmt.setInt(5, bean.getRecord_3().intValue());
				stmt.setInt(6, bean.getRecord_4().intValue());
				stmt.setInt(7, bean.getRecord_5().intValue());
				stmt.setInt(8, bean.getRecordversion());
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
	
	private static final String UPDATE="update tb_record set record_1=?,record_2=?,record_3=?,record_4=?,record_5=?,recorddate=getDate() where mid=? and wid=? and recordversion=?";
	@Override
	public boolean update(RecordBean bean) {
		try (Connection conn = dataSource.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			if (bean != null) {
				stmt.setInt(6, bean.getMid());
				stmt.setInt(7, bean.getWid());
				stmt.setInt(1, bean.getRecord_1().intValue());
				stmt.setInt(2, bean.getRecord_2().intValue());
				stmt.setInt(3, bean.getRecord_3().intValue());
				stmt.setInt(4, bean.getRecord_4().intValue());
				stmt.setInt(5, bean.getRecord_5().intValue());
				stmt.setInt(8, bean.getRecordversion());
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
	
	private static final String SELECT="select record_1,record_2,record_3,record_4,record_5,recorddate from tb_record where mid=? and wid=? and recordversion=?";
	@Override
	public RecordBean select(RecordBean bean) {
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT);) {
			if (bean != null) {
				stmt.setInt(1, bean.getMid());
				stmt.setInt(2, bean.getWid());
				stmt.setInt(3, bean.getRecordversion());
				rset = stmt.executeQuery();
				
				if(rset.next()) {
					bean.setRecord_1(rset.getDouble(1));
					bean.setRecord_2(rset.getDouble(2));
					bean.setRecord_3(rset.getDouble(3));
					bean.setRecord_4(rset.getDouble(4));
					bean.setRecord_5(rset.getDouble(5));
					bean.setRecorddate(rset.getTimestamp(6));
					return bean;
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
	
	private static final String DELETE="delete from tb_record where mid=? and wid=? and recordversion=?";
	@Override
	public boolean delete(RecordBean bean) {
		try (Connection conn = dataSource.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(DELETE);) {
			if (bean != null) {
				stmt.setInt(1, bean.getMid());
				stmt.setInt(2, bean.getWid());
				stmt.setInt(3, bean.getRecordversion());
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
	
	private static final String SELECT_STATS=
			"select mid,record_1,record_2,record_3,record_4,record_5 from tb_record "
			+ "where wid=? and recordversion=?";
	@Override
	public List<RecordBean> get(Integer wid, Integer recordversion) {
		ResultSet rset = null;
		List<RecordBean> list=null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_STATS);) {
			if (wid != null && recordversion!=null) {
				stmt.setInt(1, wid);
				stmt.setInt(2, recordversion);
				rset = stmt.executeQuery();
				list=new ArrayList<>();
				while(rset.next()) {
					list.add(new RecordBean(rset.getInt(1),wid,rset.getDouble(2),rset.getDouble(3),rset.getDouble(4),
							rset.getDouble(5),rset.getDouble(6),recordversion));
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
