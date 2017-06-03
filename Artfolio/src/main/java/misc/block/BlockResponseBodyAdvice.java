package misc.block;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

import model.block.BlockBean;
import model.block.BlockService;
import model.bounty.BountyBean;
import model.member.MemberBean;
import model.wmsg.WmsgBean;

@ControllerAdvice
public class BlockResponseBodyAdvice implements ResponseBodyAdvice<Object> {
	@Autowired
	private BlockService blockService;

	@Override
	public Object beforeBodyWrite(Object returnValue, MethodParameter methodParameter, MediaType mediaType,
			Class<? extends HttpMessageConverter<?>> clazz, ServerHttpRequest req, ServerHttpResponse resp) {

		if (returnValue != null && methodParameter != null) {
			String className = methodParameter.getMethod().getName();
			MemberBean user = (MemberBean) ((ServletServerHttpRequest) req).getServletRequest().getSession(false)
					.getAttribute("loginOK");
			if(user == null){
				return null;
			}
			Integer mid = user.getMid();
			List<BlockBean> blockList = blockService.getAllList(user);
			//ObjectMapper mapper = new ObjectMapper();
			if (blockList != null && !blockList.isEmpty()) {
				if ("bountyDisplay".equals(className)) {
					// List<BountyBean> bountyList = mapper.readValue((String)
					// returnValue,
					// mapper.getTypeFactory().constructCollectionType(ArrayList.class,
					// BountyBean.class));
					List<BountyBean> bountyList = (List<BountyBean>) returnValue;
					return BlockUtils.filterBounty(blockList, bountyList, mid);
				}
				if ("getAllWmsg".equals(className)) {
					List<WmsgBean> wmsgList = (List<WmsgBean>) returnValue;
					return BlockUtils.filterWmsg(blockList, wmsgList, mid);
				}
			}
			return returnValue;
		}
		return null;
	}

	@Override
	public boolean supports(MethodParameter methodParameter, Class<? extends HttpMessageConverter<?>> clazz) {

		String className = methodParameter.getMethod().getName();

		if ("bountyDisplay".equals(className)) {
			return true;
		}
		if ("getAllWmsg".equals(className)) {
			return true;
		}
		return false;
	}
}
