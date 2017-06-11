package model.work2;

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
public class WorkDAOJdbc implements WorkDAO2 {
	@Autowired
	private DataSource dataSource;
	
	private final static String SELECT_BY_WID=
			"select wid,mid,picurl,aid,winfo,wtitle,wlike,iswmsg,isscore,wstart,wend,score_1,score_2,score_3,score_4,score_5,scoreversion from tb_work where wid=?";
	@Override
	public WorkBean2 select(Integer wid) {
		ResultSet rset = null;
		WorkBean2 bean=null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_WID);) {
			if (wid != null) {
				stmt.setInt(1, wid);
				rset = stmt.executeQuery();
				
				if(rset.next()) {
					bean=new WorkBean2();
					bean.setWid(rset.getInt(1));
					bean.setMid(rset.getInt(2));
					bean.setPicurl(rset.getString(3));
					bean.setAid(rset.getInt(4));
					bean.setWinfo(rset.getString(5));
					bean.setWtitle(rset.getString(6));
					bean.setWlike(rset.getInt(7));
					bean.setIswmsg(rset.getBoolean(8));
					bean.setIsscore(rset.getBoolean(9));
					bean.setWstart(rset.getTimestamp(10));
					bean.setWend(rset.getTimestamp(11));
					bean.setScore_1(rset.getString(12));
					bean.setScore_2(rset.getString(13));
					bean.setScore_3(rset.getString(14));
					bean.setScore_4(rset.getString(15));
					bean.setScore_5(rset.getString(16));
					bean.setScoreversion(rset.getInt(17));
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
	
	private static final String UPDATE_SCORE="update tb_work set isscore=?,score_1=?,score_2=?,score_3=?,score_4=?,score_5=?,scoreversion=? where wid=?";
	@Override
	public boolean updateScore(WorkBean2 bean) {
		try (Connection conn = dataSource.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(UPDATE_SCORE);) {
			if (bean != null) {
				stmt.setBoolean(1, bean.getIsscore());
				stmt.setString(2, bean.getScore_1());
				stmt.setString(3, bean.getScore_2());
				stmt.setString(4, bean.getScore_3());
				stmt.setString(5, bean.getScore_4());
				stmt.setString(6, bean.getScore_5());
				stmt.setInt(7, bean.getScoreversion());
				stmt.setInt(8, bean.getWid());
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
	
	private static final String SEARCH_BY_TITLE="select wid,mid,picurl,aid,winfo,wtitle,wlike,iswmsg,isscore,wstart,wend,score_1,score_2,score_3,score_4,score_5,scoreversion from tb_work where";
	private final String AND=" and",OR=" or",NOT=" not",LB=" (",RB=")";
	@Override
	public List<WorkBean2> searchByTitle(String[] and, String[] or, String[] not,boolean content) {
		ResultSet rset = null;
		WorkBean2 bean=null;
		List<WorkBean2> list=null;
		StringBuilder condition=new StringBuilder(SEARCH_BY_TITLE);
		final String LIKE=content?" (wtitle like ? or winfo like ?)":" wtitle like ?";
		if(and!=null){
			for(int i=0;i<and.length;i++){
				if(i==0){
					condition.append(LIKE);
				}else{
					condition.append(AND).append(LIKE);
				}
			}
		}
		if(or!=null){
			for(int i=0;i<or.length;i++){
				if(condition.toString().equals(SEARCH_BY_TITLE)){
					condition.append(LB).append(LIKE);
				}else if(i==0){
					condition.append(AND).append(LB).append(LIKE);
				}else{
					condition.append(OR).append(LIKE);
				}
			}
			condition.append(RB);
		}
		if(not!=null){
			for(int i=0;i<not.length;i++){
				if(condition.toString().equals(SEARCH_BY_TITLE)){
					condition.append(NOT).append(LB).append(LIKE);
				}else if(i==0){
					condition.append(AND).append(NOT).append(LB).append(LIKE);
				}else{
					condition.append(OR).append(LIKE);
				}
			}
			condition.append(RB);
		}
		System.out.println(condition.toString());
		
		if (!condition.toString().equals(SEARCH_BY_TITLE)) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(condition.toString());) {
				list=new ArrayList<>();
				int i=1;
				if(and!=null)
					i=set(stmt,and,i,content);
				
				if(or!=null)
					i=set(stmt,or,i,content);	
				
				if(not!=null)
					i=set(stmt,not,i,content);	
				
				rset = stmt.executeQuery();
				
				while(rset.next()) {
					bean=new WorkBean2();
					bean.setWid(rset.getInt(1));
					bean.setMid(rset.getInt(2));
					bean.setPicurl(rset.getString(3));
					bean.setAid(rset.getInt(4));
					bean.setWinfo(rset.getString(5));
					bean.setWtitle(rset.getString(6));
					bean.setWlike(rset.getInt(7));
					bean.setIswmsg(rset.getBoolean(8));
					bean.setIsscore(rset.getBoolean(9));
					bean.setWstart(rset.getTimestamp(10));
					bean.setWend(rset.getTimestamp(11));
					bean.setScore_1(rset.getString(12));
					bean.setScore_2(rset.getString(13));
					bean.setScore_3(rset.getString(14));
					bean.setScore_4(rset.getString(15));
					bean.setScore_5(rset.getString(16));
					bean.setScoreversion(rset.getInt(17));
					list.add(bean);
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
	
	private int set(PreparedStatement stmt,String[] conditions,int count,boolean content) throws SQLException{
		for(String c:conditions){
			stmt.setString(count++, "%"+c+"%");
			if(content){
				stmt.setString(count++, "%"+c+"%");
			}
		}
		return count;
	}

	private static final String UPDATE_LIKE="update tb_work set wlike=? where wid=?";
	@Override
	public boolean updateLike(Integer wid, Integer wlike) {
		try (Connection conn = dataSource.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(UPDATE_LIKE);) {
			if (wid != null && wlike!=null) {
				stmt.setInt(2, wid);
				stmt.setInt(1, wlike);
				
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
