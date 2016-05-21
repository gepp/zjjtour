package com.jdk2010.index.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jdk2010.base.security.securitynews.service.ISecurityNewsService;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.dal.client.DalClient;
import com.jdk2010.framework.util.ConfigUtil;
import com.jdk2010.framework.util.JsonUtil;
import com.jdk2010.framework.util.MD5Utils;
import com.jdk2010.framework.util.StringUtil;
import com.jdk2010.system.systemadv.service.ISystemAdvService;
import com.jdk2010.util.ZjjMsgUtil;

@Controller
@RequestMapping(value = "/")
public class RegisterController extends BaseController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	public static String appid = "";
	public static String secret = "";
	public static String callbackurl="";
	private static final ConfigUtil configUtil = new ConfigUtil("/conf/weixin.properties");
	
	static {
		appid=configUtil.getString("appid");
		secret=configUtil.getString("secret");
		callbackurl=configUtil.getString("callbackurl");
	}
	
	@Resource
	ISecurityNewsService securityNewsService;

	@Resource
	DalClient dalClient;

	@Resource
	ISystemAdvService systemAdvService;

	@RequestMapping("/toRegister")
	public String quanjingDetail(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String openid = getPara("openid");
		setAttr("openid", openid);
		setAttr("appid", appid);
		setAttr("callbackurl", callbackurl);
		return "/register";
	}

	@RequestMapping("/toLogin")
	public String toLogin(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String openid = getPara("openid");
		setAttr("openid", openid);
		setAttr("appid", appid);
		setAttr("callbackurl", callbackurl);
		String retrunUrl=getPara("retrunUrl");
		setAttr("retrunUrl", retrunUrl);
		return "/login";
	}

	@RequestMapping("/loginForm")
	public String loginForm(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return "/loginForm";
	}

	@RequestMapping("/sendCode")
	public void sendCode(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String mobile = getPara("mobile");
		String returnMsg = ZjjMsgUtil.sendCode(mobile, "1");
		renderJson(response, returnMsg);
	}

	@RequestMapping("/isExists")
	public void isExists(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String mobile = getPara("mobile");
		String returnMsg = ZjjMsgUtil.isExists(mobile);
		renderJson(response, returnMsg);
	}

	@RequestMapping("/register")
	public void register(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String mobile = getPara("mobile");
		String verifyCode = getPara("verifyCode");
		String cpassword = getPara("cpassword");
		cpassword = MD5Utils.md5(cpassword);
		String returnMsg = ZjjMsgUtil.registerMember(mobile, verifyCode,
				cpassword);
		String openid = getPara("openid");
		if (!StringUtil.isBlank(openid)) {
			if (!"".equals(returnMsg)) {
				Map<String, Object> member = JsonUtil.jsonToMap(returnMsg);
				Map<String, Object> data = (Map<String, Object>) member
						.get("data");
				String memberid = data.get("id") + "";
				ZjjMsgUtil.bindMemberOpenid(memberid, openid);
			}

		}

		renderJson(response, returnMsg);
	}

	@RequestMapping("/login")
	public void login(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String mobile = getPara("mobile");
		String cpassword = getPara("cpassword");
		cpassword = MD5Utils.md5(cpassword);
		String returnMsg = ZjjMsgUtil.login(mobile, cpassword);
		Map<String, Object> member = JsonUtil.jsonToMap(returnMsg);
		setSessionAttr("member", member);
		String openid = getPara("openid");
		Map<String, Object> data = (Map<String, Object>) member
				.get("data");
		if(data!=null){
		if (!StringUtil.isBlank(openid)) {
			String memberid = data.get("id") + "";
			ZjjMsgUtil.bindMemberOpenid(memberid, openid);
		}
		}

		renderJson(response, returnMsg);
	}

	@RequestMapping("/loginout")
	public void loginout(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		removeSessionAttr("member");
		renderJson(response, "");
	}

	@RequestMapping("/toGetPwd")
	public String toGetPwd(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		setAttr("appid", appid);
		setAttr("callbackurl", callbackurl);
		return "/toGetPwd";
	}

	@RequestMapping("/sendCodeGetPwd")
	public void sendCodeGetPwd(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String mobile = getPara("mobile");
		String returnMsg = ZjjMsgUtil.sendCode(mobile, "3");
		renderJson(response, returnMsg);
	}

	@RequestMapping("/changePass")
	public void changePass(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String mobile = getPara("mobile");
		String verifyCode = getPara("verifyCode");
		String cpassword = getPara("cpassword");
		// cpassword=MD5Utils.md5(cpassword);
		String returnMsg = ZjjMsgUtil.changePass(mobile, verifyCode, cpassword);
		renderJson(response, returnMsg);
	}

}
