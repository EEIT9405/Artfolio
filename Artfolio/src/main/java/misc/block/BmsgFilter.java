package misc.block;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import model.block.BlockBean;
import model.block.BlockService;
import model.member.MemberBean;

@WebFilter("/message.controller")
public class BmsgFilter implements Filter {

	private BlockService blockService;

	public BmsgFilter() {
	}

	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		chain.doFilter(request, response);
		HttpServletRequest req = (HttpServletRequest) request;
		MemberBean user = (MemberBean) req.getSession().getAttribute("loginOK");
		if (user != null) {
			Integer mid = user.getMid();
			List<BlockBean> blockList = blockService.getAllList(user);
			if (blockList != null && !blockList.isEmpty()) {
				List<Map<String, Object>> temp = (List<Map<String, Object>>) request.getAttribute("select");
				if (!temp.isEmpty()) {
					req.setAttribute("select", BlockUtils.filterBmsg(blockList, temp, mid));
				}
			}
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		WebApplicationContext context = WebApplicationContextUtils
				.getWebApplicationContext(fConfig.getServletContext());
		blockService = (BlockService) context.getBean("blockService");
	}

}
