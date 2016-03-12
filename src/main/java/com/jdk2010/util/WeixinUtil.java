package com.jdk2010.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.github.sd4324530.fastweixin.api.MenuAPI;
import com.github.sd4324530.fastweixin.api.OauthAPI;
import com.github.sd4324530.fastweixin.api.config.ApiConfig;
import com.github.sd4324530.fastweixin.api.response.GetMenuResponse;
import com.github.sd4324530.fastweixin.api.response.OauthGetTokenResponse;

public class WeixinUtil {
	public static final String appid = "wxadd92f5db958ea4f";
	public static final String secret = "e4b46183fe41a3b95bef1a74644f0a09";
	private static final Logger LOG = LoggerFactory.getLogger(WeixinUtil.class);
  //https://open.weixin.qq.com/connect/qrconnect?appid=wxadd92f5db958ea4f&redirect_uri=http%3A%2F%2Fpad.pinhai.com.cn%2Fcallback&response_type=code&scope=snsapi_login&state=8cfe1117-5b33-4467-9ea0-aae35793f53c#wechat_redirect
	public static void getToken(ApiConfig config) {
		OauthAPI oauthAPI = new OauthAPI(config);
		OauthGetTokenResponse response = oauthAPI
				.getToken("041821d373d6a18679cb0b1d8d5cc1ez");
		System.out.println(response);
	}

	public static void getMenu(ApiConfig config) {
		MenuAPI api = new MenuAPI(config);
		GetMenuResponse response = api.getMenu();
		LOG.debug("菜单:{}", response.toJsonString());
	}

	public static void main(String[] args) {
		ApiConfig config = new ApiConfig(appid, secret);
		getMenu(config);
	}

}
