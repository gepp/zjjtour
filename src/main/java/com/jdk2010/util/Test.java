package com.jdk2010.util;

import org.apache.commons.lang.StringEscapeUtils;

import com.jdk2010.framework.util.HttpUtil;
import com.jdk2010.framework.util.MD5Utils;

public class Test {
	//String sign=MD5(“v7line001{\"ctel\":\"18616240385\",\"type\":\"3\"}#ESDfsdfff”)
	//c9ffe4b0ec0a04591b7e9edc1f14fe00 
	public static void main(String[] args) {
		String url="http://ststest.travelzjj.com:15404/sts-app/Api/member/";
//		String method="sendCode";
//		String sendurl=url+method+"?format=json&user=v7line001&paramsJson=";
//		String username="v7line001";
//		String key="#ESDfsdfff";
	String paramsJson="{\"id\":215}";
//		String paramsJson1="{\\\"ctel\":\\\"18616240385\\\",\\\"type\\\":\\\"3\\\"}";
//		System.out.println("文档中的MD5字符串:v7line001{\"ctel\":\"18616240385\",\"type\":\"3\"}#ESDfsdfff");
//		System.out.println("正确MD5结果值：c9ffe4b0ec0a04591b7e9edc1f14fe00");
//		String encodeStr1=username+paramsJson+key;
//		System.out.println("MD5字符串："+encodeStr1);
//		System.out.println(MD5Utils.md5(encodeStr1));
//		System.out.println("============");
//		encodeStr1=username+paramsJson1+key;
//		System.out.println("MD5字符串："+encodeStr1);
//		System.out.println(MD5Utils.md5(encodeStr1));
//		System.out.println("============");
//		
//		encodeStr1=username+paramsJson+key;
//		System.out.println("MD5字符串："+StringEscapeUtils.escapeHtml(encodeStr1));
//		System.out.println(MD5Utils.md5(StringEscapeUtils.escapeHtml(encodeStr1)));
//		System.out.println("============");
//		
//		encodeStr1=username+paramsJson1+key;
//		System.out.println("MD5字符串："+StringEscapeUtils.escapeHtml(encodeStr1));
//		System.out.println(MD5Utils.md5(StringEscapeUtils.escapeHtml(encodeStr1)));
//		System.out.println("============");
//		
//		System.out.println("sign:"+username+paramsJson+key);
//		System.out.println(StringEscapeUtils.escapeHtml(username+paramsJson+key));
//		String sign=MD5Utils.md5(StringEscapeUtils.escapeHtml(username+paramsJson+key));
//		System.out.println(sign);
//		sendurl=sendurl+"&sign=c9ffe4b0ec0a04591b7e9edc1f14fe00";
		//System.out.println(HttpUtil.post(url+"getMember?format=json&user=v7line001&paramsJson="+paramsJson+"&sign=a98d4566326dbb7df834bfb40c5ad117",""));
		System.out.println(HttpUtil.get(url+"getMember?format=json&user=v7line001&paramsJson="+paramsJson+"&sign=a98d4566326dbb7df834bfb40c5ad117"));

	}
}
