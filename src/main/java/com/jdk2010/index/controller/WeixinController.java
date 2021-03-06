package com.jdk2010.index.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.sd4324530.fastweixin.api.OauthAPI;
import com.github.sd4324530.fastweixin.api.config.ApiConfig;
import com.github.sd4324530.fastweixin.api.response.OauthGetTokenResponse;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.util.ConfigUtil;
import com.jdk2010.framework.util.JsonUtil;
import com.jdk2010.util.ZjjMsgUtil;

@Controller
@RequestMapping(value = "/")
public class WeixinController extends BaseController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public static String appid = "";
	public static String secret = "";
	private static final ConfigUtil configUtil = new ConfigUtil("/conf/weixin.properties");
	
	static {
		appid=configUtil.getString("appid");
		secret=configUtil.getString("secret");
	}
	
	

	@RequestMapping("/callback")
	public String callback(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ApiConfig config = new ApiConfig(appid, secret);
		OauthAPI oauthAPI = new OauthAPI(config);
		String code=getPara("code");
		if(code==null){
			setAttr("message","您好,请通过微信扫描访问！");
			return "/error";
		}
		OauthGetTokenResponse responseCode = oauthAPI
				.getToken(code);
		String openid=responseCode.getOpenid();
		//openid="123";
		System.out.println(responseCode);
		System.out.println("openid:"+openid);
		if(openid==null){
			setAttr("message","您好,请通过微信扫描访问！");
			return "/error";
		}
		
		String returnMsg=ZjjMsgUtil.getMemberByOpenid(openid);
		
		if(!"".equals(returnMsg)){
		setSessionAttr("member",JsonUtil.jsonToMap(returnMsg));
		return REDIRECT+"/";
		}else{
			setAttr("openid", openid);
			setAttr("message","您好,您暂未绑定该微信号");
			return "/error";
		}
		

	}

}
