package misc.block;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import model.block.BlockBean;
import model.block.BlockService;
import model.bounty.BountyBean;
import model.member.MemberBean;

public class BlockInterceptor implements HandlerInterceptor {

	@Autowired
	private BlockService blockService;

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		MemberBean user = (MemberBean) request.getSession(false).getAttribute("loginOK");
		if (user == null) {
			return;
		}
		int mid = user.getMid();
		modelAndView.getModel();
		List<BlockBean> blockList = blockService.getAllList(user);

		Object obj = modelAndView.getModel().get("bean");

		if (blockList != null && !blockList.isEmpty()) {
			// if (workList != null) {
			// request.setAttribute("works", filterWork(blockList, workList));
			// }
			if (obj != null) {
				if (obj instanceof BountyBean) {
					BountyBean bountyBean = (BountyBean) obj;
					BountyBean bean = BlockUtils.filterBounty(blockList, bountyBean, mid);
					request.setAttribute("bean", bean);
				}
			}
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		return true;
	}
}
