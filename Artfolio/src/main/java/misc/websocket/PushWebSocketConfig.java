package misc.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebMvc
@EnableWebSocket
public class PushWebSocketConfig implements WebSocketConfigurer {

	@Autowired
	private PushWebSocketHandler handler;
	@Autowired
	private PushHandShakeBrowser pushHandShakeBrowser;
	@Autowired
	private PushHandShakeJava pushHandShakeJava;
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(handler, "/echo").addInterceptors(pushHandShakeBrowser);
		registry.addHandler(handler, "/push").addInterceptors(pushHandShakeJava).withSockJS();
	}

}
