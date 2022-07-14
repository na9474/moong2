package com.kh.moong.web;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker  // Stomp를 사용하기 위해 선언하는 Annotation
public class StompWebSocketConfig implements WebSocketMessageBrokerConfigurer{
	
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		// client가 Websocket HandShake Connection을 생성할 경로
		// allowedOrigins를 "*"로 하지 않고 개발 도메인으로 변경(*로 하면 404 에러 발생)
		registry.addEndpoint("/stomp/chat")
		        .setAllowedOrigins("http://localhost:8887")
		        .withSockJS();
	}
	
	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		// client에서 SEND 요청 처리
		registry.setApplicationDestinationPrefixes("/pub");  
		
		// 해당 경로로 SimpleBroker 등록
		// SimpleBroker는 해당 경로를 subscribe한 client에게 메세지를 전달하는 간단한 작업을 수행
		registry.enableSimpleBroker("/sub");
	}
}