package com.jdk2010.util;

import java.io.IOException;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.jdk2010.framework.util.HttpUtil;
import com.jdk2010.framework.util.JsonUtil;

public class Zjjtest1 {
	 
	
	
	
	public static void main(String[] args) throws IOException {
//		Document doc = Jsoup.connect("http://i.tianqi.com/index.php?c=code&id=1&icon=1&py=zhangjiajie&wind=0&num=1").timeout(5000).get();
//		Elements elem = doc.select(".cityname");
//		String cityName=elem.text();
//		String imgUrl= doc.select(".pngtqico").attr("src");
//		String tianqiType=doc.select(".divCurrentWeather").text();
//		String upWendu=doc.select(".cc30").get(0).text();
//		String downWendu=doc.select(".c390").get(0).text();
//		String xingqi=doc.select("strong").get(0).text();
//		System.out.println("xingqi:"+xingqi);
//		System.out.println("upWendu："+upWendu);
//		System.out.println("downWendu:"+downWendu);
//		System.out.println(tianqiType);
//		String leixing=doc.select("divCurrentWeather").text();
//		System.out.println(tianqiType.split(" ")[0]);
		
		
		String returnMsg = HttpUtil.get("http://api.map.baidu.com/telematics/v3/weather?location=z&output=json&ak=BB70434a0c0facb5cf2b3bfd7406e86c");
		System.out.println("returnMsg"+returnMsg);
		Map<String,Object> returnMap=JsonUtil.jsonToMap(returnMsg);
		JSONArray array=(JSONArray)returnMap.get("results");
		Map<String,Object> result=(Map<String,Object>)array.get(0);
		String cityName=(String)result.get("currentCity");
		Map<String,Object> weather_data=(Map<String,Object>)(((JSONArray)result.get("weather_data")).get(0));
		String realPic="sun";
		String pic=(String)weather_data.get("weather");
		if(pic.equals("暴雨")){
    		realPic="rainstorm";
    	}
    	if(pic.equals("大暴雨")){
    		realPic="heavyRain";
    	}
    	if(pic.equals("大雪")){
    		realPic="heavySnow";
    	}
    	if(pic.equals("大雨")){
    		realPic="hardRain";
    	}
    	if(pic.equals("冻雨")){
    		realPic="freezingRain";
    	}
    	if(pic.equals("多云")){
    		realPic="cloudy";
    	}
    	if(pic.equals("浮沉")){
    		realPic="dust";
    	}
    	if(pic.equals("雷阵雨")){
    		realPic="thunderShower";
    	}
    	if(pic.equals("雷阵雨伴有冰雹")){
    		realPic="thunderstormsWithHail";
    	}
    	if(pic.equals("霾")){
    		realPic="haze";
    	}
    	if(pic.equals("强沙尘暴")){
    		realPic="severeSandAndDustStorm";
    	}
    	if(pic.equals("晴")){
    		realPic="sun";
    	}
    	if(pic.equals("沙尘暴")){
    		realPic="sandStorm";
    	}
    	if(pic.equals("特大暴雨")){
    		realPic="heavyRainfall";
    	}
    	if(pic.equals("雾")){
    		realPic="fog";
    	}
    	if(pic.equals("小雪")){
    		realPic="lightSnow";
    	}
    	if(pic.equals("小雨")){
    		realPic="lightRain";
    	}
    	if(pic.equals("扬沙")){
    		realPic="blowingSand";
    	}
    	if(pic.equals("阴")){
    		realPic="yin";
    	}
    	if(pic.equals("雨夹雪")){
    		realPic="sleet";
    	}
    	if(pic.equals("阵雪")){
    		realPic="snowShower";
    	}
    	if(pic.equals("阵雨")){
    		realPic="shower";
    	}
    	if(pic.equals("中雪")){
    		realPic="moderateSnow";
    	}
    	if(pic.equals("中雨")){
    		realPic="moderateRain";
    	}
    	if(pic.equals("暴雪")){
    		realPic="rainstorm";
    	}
    	String temperature=(String)weather_data.get("temperature");
    	String xingqi=(String)weather_data.get("date");
    	System.out.println(xingqi);
		System.out.println("weather:"+realPic);
		System.out.println(cityName);
		System.out.println("data:"+xingqi);
		System.out.println("temperature:"+temperature);
				
		 
	}
	
}
