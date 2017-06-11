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

	private final static String SELECT_TAGS = "select tag,lock,vote from tb_tag where wid=?";

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
					list.add(new TagBean(wid,rset.getString(1),rset.getBoolean(2),rset.getInt(3)));
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
	private final static String UPDATE_LOCK="update tb_tag set lock=? where wid=? and tag=?";
	@Override
	public boolean lock(TagBean bean) {
		try (Connection conn = dataSource.getConnection(); 
			PreparedStatement stmt = conn.prepareStatement(UPDATE_LOCK);) {
			if (bean!=null){
				stmt.setInt(2, bean.getWid());
				stmt.setString(3, bean.getTag());
				stmt.setBoolean(1, bean.getLock());
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
	
	private static final String SELECT_WORKS="select distinct wid from tb_tag where";
	private final String TAG=" tag=?",OR=" or",AND=" and",IN=" wid in",NOT_IN=" wid not in",LB=" (",RB=")";
	@Override
	public List<Integer> search(String[] and,String[] or,String[] not) {
		ResultSet rset = null;
		List<Integer> list=null;
		StringBuilder condition=new StringBuilder(SELECT_WORKS);
		if(and!=null){
			for(int i=0;i<and.length;i++){
				if(i==0){
					condition.append(TAG);
				}else{
					condition.append(AND).append(IN).append(LB).append(SELECT_WORKS).append(TAG).append(RB);
				}
			}
		}
		if(or!=null){
			for(int i=0;i<or.length;i++){
				if(condition.toString().equals(SELECT_WORKS)){
					condition.append(LB).append(TAG);
				}else if(i==0){
					condition.append(AND).append(IN).append(LB).append(SELECT_WORKS).append(TAG);
				}else{
					condition.append(OR).append(TAG);
				}
			}
			condition.append(RB);
		}
		if(not!=null){
			for(int i=0;i<not.length;i++){
				if(condition.toString().equals(SELECT_WORKS)){
					condition.append(NOT_IN).append(LB).append(SELECT_WORKS).append(TAG).append(RB);
				}else{
					condition.append(AND).append(NOT_IN).append(LB).append(SELECT_WORKS).append(TAG).append(RB);
				}
			}
		}
		System.out.println(condition);
		if(!condition.toString().equals(SELECT_WORKS)){
			try (Connection conn = dataSource.getConnection();
					PreparedStatement stmt = conn.prepareStatement(condition.toString());) {
					int i=1;
					if(and!=null)
						i=set(stmt,and,i);
					if(or!=null)
						i=set(stmt,or,i);
					if(not!=null)
						i=set(stmt,not,i);
					rset = stmt.executeQuery();
					list=new ArrayList<>();
					while(rset.next()) {
						list.add(rset.getInt(1));
					
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
		}
		return list;
	}
	
	private int set(PreparedStatement stmt,String[] conditions,int count) throws SQLException{
		for(String c:conditions){
			stmt.setString(count++, c);
		}
		return count;
	}

	private static final String UPDATE_VOTE="update tb_tag set vote=? where wid=? and tag=?";
	@Override
	public boolean vote(TagBean bean) {
		try (Connection conn = dataSource.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(UPDATE_VOTE);) {
				if (bean!=null){
					stmt.setInt(2, bean.getWid());
					stmt.setString(3, bean.getTag());
					stmt.setInt(1, bean.getVote());
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
