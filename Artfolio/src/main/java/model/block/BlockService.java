package model.block;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.member.MemberBean;

@Service
@Transactional
public class BlockService {
	@Autowired
	private BlockDAO blockDAO;

	public boolean blockSomeone(BlockBean bean) {
		return blockDAO.insert(bean);
	}

	public boolean unblockSomeone(MemberBean midBean, MemberBean targetBean) {
		return blockDAO.delete(midBean, targetBean);
	}

	public List<BlockBean> getList(MemberBean midBean, MemberBean targetBean) {
		if (midBean != null && targetBean != null) {
			return blockDAO.selectOne(midBean, targetBean);
		} else if (midBean != null) {
			return blockDAO.selectAllBlock(midBean);
		} else
			return null;
	}

	public List<BlockBean> getAllList(MemberBean midBean) {
		if (midBean != null) {
			return blockDAO.selectAll(midBean);
		}
		return null;
	}
}
