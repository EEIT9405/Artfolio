package misc.block;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import model.block.BlockBean;
import model.bmsg.BmsgBean;
import model.bounty.BountyBean;
import model.wmsg.WmsgBean;
import model.work.WorkBean;

public class BlockUtils {

	public static List<BountyBean> filterBounty(List<BlockBean> blockList, List<BountyBean> bountyList, Integer mid) {

		for (Iterator<BountyBean> iterator = bountyList.iterator(); iterator.hasNext();) {
			int bountyMid = iterator.next().getMid();
			for (int j = 0; j < blockList.size(); j++) {
				int myId = blockList.get(j).getMyBean().getMid();
				int targetId = blockList.get(j).getTargetBean().getMid();
				if (bountyMid != mid) {
					if (bountyMid == myId || bountyMid == targetId) {
						iterator.remove();
					}
				}
			}
		}
		return bountyList;
	}

	public static BountyBean filterBounty(List<BlockBean> blockList, BountyBean bountyBean, Integer mid) {
		int bountyMid = bountyBean.getMid();
		for (BlockBean blockBean : blockList) {
			int myId = blockBean.getMyBean().getMid();
			int targetId = blockBean.getTargetBean().getMid();
			if (bountyMid != mid) {
				if (bountyMid == myId || bountyMid == targetId) {
					return null;
				}
			}
		}
		return bountyBean;
	}

	public static List<WmsgBean> filterWmsg(List<BlockBean> blockList, List<WmsgBean> wmsgList, Integer mid) {

		for (Iterator<WmsgBean> iterator = wmsgList.iterator(); iterator.hasNext();) {
			int wmsgMid = iterator.next().getMemberBean().getMid();
			for (int j = 0; j < blockList.size(); j++) {
				int myId = blockList.get(j).getMyBean().getMid();
				int targetId = blockList.get(j).getTargetBean().getMid();
				if (wmsgMid != mid) {
					if (wmsgMid == myId || wmsgMid == targetId) {
						iterator.remove();
					}
				}
			}
		}
		return wmsgList;
	}

	public static List<WorkBean> filterWork(List<BlockBean> blockList, List<WorkBean> workList, Integer mid) {
		for (Iterator<WorkBean> iterator = workList.iterator(); iterator.hasNext();) {
			int workMid = iterator.next().getMid();
			for (int j = 0; j < blockList.size(); j++) {
				int myId = blockList.get(j).getMyBean().getMid();
				int targetId = blockList.get(j).getTargetBean().getMid();
				if (workMid != mid) {
					if (workMid == myId || workMid == targetId) {
						iterator.remove();
					}
				}
			}
		}
		return workList;
	}
	
	public static List<Map<String, Object>> filterBmsg(List<BlockBean> blockList, List<Map<String, Object>> mapList, Integer mid) {
		
		for (Iterator<Map<String, Object>> iterator = mapList.iterator(); iterator.hasNext();) {
			BmsgBean bmsgBean = (BmsgBean) iterator.next().get("msg");
			int bmsgMid = bmsgBean.getMid();
			for (int j = 0; j < blockList.size(); j++) {
				int myId = blockList.get(j).getMyBean().getMid();
				int targetId = blockList.get(j).getTargetBean().getMid();
				if (bmsgMid != mid) {
					if (bmsgMid == myId || bmsgMid == targetId) {
						iterator.remove();
					}
				}
			}
		}
		return mapList;
	}
}
