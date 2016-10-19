package com.springmvc.util;


import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.fr.base.Base64;
import com.gangdian.qc.model.QCUser;




public class CookieUtil {

	
	//保存cookie时的cookiename
	private final static String cookieDomainName="QCCheckManage";
	//加密cookie时的网站自定码
	private final static String webKey="KE";
	//设置cookie有效期,暂时两周
	private final static long cookieMaxAge=60*60*24*7*2;
	
	//保存cookie到客户端
	public static void saveCookie(QCUser user,HttpServletResponse response){
		//cookie的有效期
		long validTime=System.currentTimeMillis()+(cookieMaxAge*1000);
		//md5加密用户详细信息
		String cookieValueWithMd5=user.getName()+"&"+user.getPassword()+"&"+validTime+"&"+webKey;
		//将要被保存的完整cookie值
		String cookieValue=user.getName()+":"+validTime+":"+cookieValueWithMd5;
		//再次对cookie的值进行base64编码
		String cookieValueBase64=new String(Base64.encode(cookieValue.getBytes()));
		//开始保存cookie
		Cookie cookie=new Cookie(cookieDomainName, cookieValueBase64);
		//存两年(这个值应该大于或者等于validTime)
		cookie.setMaxAge(60*60*24*365*2);
		cookie.setPath("/");
		//向客户端写入
		response.addCookie(cookie);
	}
	//对cookie进行验证,并且如果通过验证,返回解密的cookie
	public static QCUser readCookie(HttpServletRequest request, HttpServletResponse response) 
			throws UnsupportedEncodingException{
		//根据cookieName取cookieValue
		Cookie cookies[]=request.getCookies();
		String cookieValue=null;
		if(cookies!=null){
			for (int i = 0; i < cookies.length; i++) {
				if(cookieDomainName.equals(cookies[i].getName())){
					cookieValue=cookies[i].getValue();
					break;
				}
			}
		}
		if(cookieValue==null){
			return null;
		}
		//如果cookieValue不为空,才执行下面的代码
		//先得到cookievalue经i系那个base64解码
		String cookieValueAfterDecode=new String(Base64.decode(cookieValue),"utf-8");
		//对解码后的值进行分拆,得到一个数组,如果数组长度不为3,就是非法登陆
		String cookieValues[]=cookieValueAfterDecode.split(":");
		if(cookieValues.length!=3){
			System.out.println("数组长度不为3,非法登陆");
			return null;
		}
		
		//判断是否在有效期内,过期就删除Cookie
		long validTimeInCookie=new Long(cookieValues[1]);
		if(validTimeInCookie < System.currentTimeMillis()){
			//删除cookie
			clearCookie(response);
			System.out.println("过期的cookie");
			return null; 
		}
		//返回用户名和密码
		String userinfo[]=cookieValues[2].split("&");
		QCUser user=new QCUser();
		user.setName(userinfo[0]);
		user.setPassword(userinfo[1]);
		System.out.println("读取cookie"+user);
		return user;	
	}
	
	//用户注销时,清除Cookie,在需要时可随时调用
	public static void clearCookie(HttpServletResponse response){
		Cookie cookie=new Cookie(cookieDomainName, null);
		cookie.setMaxAge(0);
		cookie.setPath("/"); 
		response.addCookie(cookie); 
	}
	

	//获取Cookie组合字符串的MD5码的字符串(无法解密,暂时不用)
	public static String getMD5(String value){
		String result=null;
		try {
			byte[] valueByte=value.getBytes();
			MessageDigest md=MessageDigest.getInstance("MD5");
			md.update(valueByte);
			result=toHex(md.digest());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//将传递进来的字节数组转换成十六进制的字符串形式并返回
	public static String toHex(byte[] buffer){
		StringBuffer sb=new StringBuffer(buffer.length*2);
		for (int i = 0; i < buffer.length; i++) {
			sb.append(Character.forDigit((buffer[i] & 0xf0) >> 4, 16));
			sb.append(Character.forDigit(buffer[i] & 0x0f, 16)); 
		}
		return sb.toString();
	}
}
