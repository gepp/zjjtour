package com.jdk2010.util;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdk2010.framework.util.ConfigUtil;

/**
 * Servlet implementation class WeixinLoginServlet
 */
public class WeixinLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public static String appid = "";
	public static String secret = "";
	public static String callbackurl="";
	private static final ConfigUtil configUtil = new ConfigUtil("/conf/weixin.properties");
	static {
		appid=configUtil.getString("appid");
		secret=configUtil.getString("secret");
		callbackurl=configUtil.getString("callbackurl");
	}
	
    public WeixinLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sessionId=request.getSession().getId();
		String renderUrl="https://open.weixin.qq.com/connect/qrconnect?appid="+appid+"&redirect_uri=http%3A%2F%2F"+callbackurl+"%2Fcallback&response_type=code&scope=snsapi_login&state="+sessionId+"#wechat_redirect";
		response.sendRedirect(renderUrl);
	}

}
