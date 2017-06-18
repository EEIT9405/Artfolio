package misc.block;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import model.block.BlockBean;
import model.block.BlockService;
import model.bounty.BountyBean;
import model.member.MemberBean;
import model.wmsg.WmsgBean;
import model.work.WorkBean;

@ControllerAdvice
public class BlockResponseBodyAdvice implements ResponseBodyAdvice<Object> {
	@Autowired
	private BlockService blockService;

	@Override
	public Object beforeBodyWrite(Object returnValue, MethodParameter methodParameter, MediaType mediaType,
			Class<? extends HttpMessageConverter<?>> clazz, ServerHttpRequest req, ServerHttpResponse resp) {

		if (returnValue != null && methodParameter != null) {
			String methodName = methodParameter.getMethod().getName();
			HttpServletRequest request = ((ServletServerHttpRequest) req).getServletRequest();
			MemberBean user = (MemberBean) request.getSession(false).getAttribute("loginOK");
			if(user == null){
				return returnValue;
			}
			Integer mid = user.getMid();
			List<BlockBean> blockList = blockService.getAllList(user);
			ObjectMapper mapper = new ObjectMapper();
			if (blockList != null) {
				if ("BountyDisplay".equals(methodName)) {
					 List<BountyBean> bountyList = null;
					try {
						bountyList = mapper.readValue((String) returnValue,
						 mapper.getTypeFactory().constructCollectionType(ArrayList.class,BountyBean.class));
					} catch (IOException e) {
						e.printStackTrace();
					}
//					List<BountyBean> bountyList = (List<BountyBean>) returnValue;
					if(bountyList != null)
						try {
							return mapper.writeValueAsString(BlockUtils.filterBounty(blockList, bountyList, mid));
						} catch (JsonProcessingException e) {
							e.printStackTrace();
						}
				}
				if ("getAllWmsg".equals(methodName)) {
					List<WmsgBean> wmsgList = (List<WmsgBean>) returnValue;
					return BlockUtils.filterWmsg(blockList, wmsgList, mid, request);
				}
				if ("search".equals(methodName) || "searchByMid".equals(methodName)){
					List<WorkBean> workList = (List<WorkBean>) returnValue;
					return BlockUtils.filterWork(blockList, workList, mid);
				}
			}
			return returnValue;
		}
		return null;
	}

	@Override
	public boolean supports(MethodParameter methodParameter, Class<? extends HttpMessageConverter<?>> clazz) {

		String methodName = methodParameter.getMethod().getName();

		if ("BountyDisplay".equals(methodName)) {
			return true;
		}
		if ("getAllWmsg".equals(methodName)) {
			return true;
		}
		if("search".equals(methodName) || "searchByMid".equals(methodName)){
			return true;
		}
		return false;
	}
}
