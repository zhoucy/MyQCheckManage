package com.springmvc.util;

import java.text.SimpleDateFormat;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicInteger;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.log4j.Logger;


@ServerEndpoint(value="/websocket/helponline")
public class HelpOnline {

	private static final Logger log=Logger.getLogger(HelpOnline.class);
	
	private static final String GUEST_NAME="Guest";
	private static final AtomicInteger connectionIds=new AtomicInteger();
	private static final Set<HelpOnline> connections=new CopyOnWriteArraySet<HelpOnline>();
	
	private final SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private final String nickname;
	private Session session;
	
	public HelpOnline(){
		nickname=GUEST_NAME+connectionIds.getAndIncrement();
	}
	
	@OnOpen
	public void OnOpen(){
		this.session=session;
		connections.add(this);
		String message=String.format(sdf.format(System.currentTimeMillis()+":"),nickname, "进入房间");
		broadcast(message);
	}
	
	@OnClose
	public void OnClose(){
		connections.remove(this);
		String message=String.format(sdf.format(System.currentTimeMillis()+":"),nickname, "离开房间");
		broadcast(message);
	}
	
	@OnMessage
	public void OnMessage(String message){
		String filteredMessage=String.format(sdf.format(System.currentTimeMillis()+":"),nickname, "说:"+message);
		broadcast(filteredMessage);
	}
	
	@OnError
	public void OnError(Throwable t)throws Throwable{
		log.error("ERROR"+t.toString(),t);
	}
	
	private static void broadcast(String msg){
		for (HelpOnline client : connections) {
			try {
				synchronized (client) {
					client.session.getBasicRemote().sendText(msg);
				}
			} catch (Exception e) {
				log.debug("ERROR:向浏览器发送数据失败",e);
				connections.remove(client);
				try {
					client.session.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
				String message=String.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").
						format(System.currentTimeMillis()+":"),client.nickname, "已经断开连接");
				broadcast(message);
			}
		}
	}
}
