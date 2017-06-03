package model.block;

import java.util.List;

import model.member.MemberBean;

public interface BlockDAO {
	
	public boolean insert(BlockBean bean);
	public boolean delete(MemberBean midBean, MemberBean targetBean);
	public List<BlockBean> selectOne(MemberBean midBean, MemberBean targetBean);
	public List<BlockBean> selectAllBlock(MemberBean midBean);
	public List<BlockBean> selectAll(MemberBean midBean);
}
