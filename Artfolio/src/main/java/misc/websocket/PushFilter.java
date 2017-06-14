package misc.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;

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
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.client.standard.StandardWebSocketClient;
import org.springframework.web.socket.sockjs.client.RestTemplateXhrTransport;
import org.springframework.web.socket.sockjs.client.SockJsClient;
import org.springframework.web.socket.sockjs.client.Transport;
import org.springframework.web.socket.sockjs.client.WebSocketTransport;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.work.WorkBean;
import model.work.WorkService;

@WebFilter("/Upload/tbwork.controller")
public class PushFilter implements Filter {

	private WorkService workService;

	public PushFilter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;

		chain.doFilter(request, response);
		List<Transport> transports = new ArrayList<>(2);
		transports.add(new WebSocketTransport(new StandardWebSocketClient()));
		transports.add(new RestTemplateXhrTransport());
		SockJsClient sockJsClient = new SockJsClient(transports);

		WebSocketSession session = null;
		try {
			session = sockJsClient.doHandshake(new PushWebSocketHandler(),
					"ws://localhost:8080" + request.getContextPath() + "/ws/push").get();
		} catch (InterruptedException | ExecutionException e) {
			e.printStackTrace();
		}
		// List<WorkBean> workList = (List<WorkBean>)
		// request.getSession().getAttribute("");
		if (session != null) {
			Integer wid = (Integer) request.getAttribute("wid");
			WorkBean workBean = new WorkBean();
			workBean.setWid(wid);
			workBean = workService.select(wid).get(0);
			if(workBean != null && workBean.getWid() != 0);
			session.sendMessage(new TextMessage(new ObjectMapper().writeValueAsString(workBean)));
			session.close();
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		WebApplicationContext context = WebApplicationContextUtils
				.getWebApplicationContext(fConfig.getServletContext());
		workService = (WorkService) context.getBean("workService");
	}

}
