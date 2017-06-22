package misc.websocket;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import model.member.MemberBean;

@Component
public class PushHandShakeBrowser extends HttpSessionHandshakeInterceptor {

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		System.out.println("broeser handshake");
		if (request instanceof ServletServerHttpRequest) {
			ServletServerHttpRequest servletServerHttpRequest = (ServletServerHttpRequest) request;
			HttpSession session = servletServerHttpRequest.getServletRequest().getSession(false);
			MemberBean user = null;
			if (session != null)
				user = (MemberBean) session.getAttribute("loginOK");
			if (user != null) {
				attributes.put("user", user);
			} else {
				return false;
			}
			return true;
		}
		return false;
	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		super.afterHandshake(request, response, wsHandler, ex);
	}
}
