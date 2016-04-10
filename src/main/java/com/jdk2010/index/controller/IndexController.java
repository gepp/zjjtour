package com.jdk2010.index.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.jdk2010.base.security.menu.model.SecurityMenu;
import com.jdk2010.base.security.securitynews.model.SecurityNews;
import com.jdk2010.base.security.securitynews.service.ISecurityNewsService;
import com.jdk2010.framework.constant.Constants;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.dal.client.DalClient;
import com.jdk2010.framework.util.DbKit;
import com.jdk2010.framework.util.HttpUtil;
import com.jdk2010.framework.util.JsonUtil;
import com.jdk2010.framework.util.Page;
import com.jdk2010.framework.util.ReturnData;
import com.jdk2010.framework.util.StringUtil;
import com.jdk2010.member.memberactivity.model.MemberActivity;
import com.jdk2010.search.systemsearchword.model.SystemSearchword;
import com.jdk2010.system.systemadv.model.SystemAdv;
import com.jdk2010.system.systemadv.service.ISystemAdvService;
import com.jdk2010.util.ZjjMsgUtil;

@Controller
@RequestMapping(value = "/")
public class IndexController extends BaseController {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource
	ISecurityNewsService securityNewsService;

	@Resource
	DalClient dalClient;

	@Resource
	ISystemAdvService systemAdvService;

	@RequestMapping("/dtIndex")
	public String dtIndex(HttpServletRequest request,
			HttpServletResponse response) {
		return "index";
	}

	@RequestMapping("/")
	public String index(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// 滚动图
		List<SystemAdv> advList = systemAdvService
				.queryForList(
						"select * from system_adv  where status=1 order by orderlist asc",
						SystemAdv.class);
		setAttr("advList", advList);

		List<SecurityMenu> quanjingMenuList = dalClient.queryForObjectList(
				"select * from security_menu where parent_id=1011",
				SecurityMenu.class);
		setAttr("quanjingMenuList", quanjingMenuList);

		List<SecurityMenu> changyouMenuList = dalClient.queryForObjectList(
				"select * from security_menu where parent_id=1010",
				SecurityMenu.class);
		setAttr("changyouMenuList", changyouMenuList);

		List<SecurityMenu> tingwenMenuList = dalClient.queryForObjectList(
				"select * from security_menu where parent_id=1037",
				SecurityMenu.class);
		setAttr("tingwenMenuList", tingwenMenuList);

		// 视频管理
		List<SecurityNews> videoList = dalClient
				.queryForObjectList(
						"select * from security_news where menu_id=1054 and index_status=1 and review_status=1 limit 0,5",
						SecurityNews.class);
		setAttr("videoList", videoList);

		// 全景管理
		List<SecurityNews> quanjingList = dalClient
				.queryForObjectList(
						"select * from security_news where menu_id in (select id from security_menu where parent_id=1011) and index_status=1 and review_status=1   limit 0,8",
						SecurityNews.class);
		setAttr("quanjingList", quanjingList);

		// 畅游
		List<SecurityNews> changyouList = dalClient
				.queryForObjectList(
						"select * from security_news where menu_id in (select id from security_menu where parent_id=1010) and index_status=1 and review_status=1   limit 0,8",
						SecurityNews.class);
		setAttr("changyouList", changyouList);

		// 活动
		List<MemberActivity> activityList = dalClient
				.queryForObjectList(
						"select * from member_activity where  index_status=1 and review_status=1 limit 0,2",
						MemberActivity.class);
		setAttr("activityList", activityList);

		// 听闻管理
		List<SecurityNews> tingwenList = dalClient
				.queryForObjectList(
						"select * from security_news where menu_id in (select id from security_menu where parent_id=1037) and index_status=1 and review_status=1   limit 0,8",
						SecurityNews.class);
		setAttr("tingwenList", tingwenList);

		SecurityMenu meishiMenu = dalClient
				.queryForObject("select * from security_menu where id=1091",
						SecurityMenu.class);
		setAttr("meishiMenu", meishiMenu);

		SecurityMenu jiudianMenu = dalClient
				.queryForObject("select * from security_menu where id=1093",
						SecurityMenu.class);
		setAttr("jiudianMenu", jiudianMenu);

		SecurityMenu jingdianMenu = dalClient
				.queryForObject("select * from security_menu where id=1094",
						SecurityMenu.class);
		setAttr("jingdianMenu", jingdianMenu);

		SecurityMenu menpiaoMenu = dalClient
				.queryForObject("select * from security_menu where id=1095",
						SecurityMenu.class);
		setAttr("menpiaoMenu", menpiaoMenu);

		Map<String, Object> indexMap = dalClient
				.queryForObject("select * from system_indexsetting");
		setAttr("indexMap", indexMap);

		return "/index";
	}

	@RequestMapping("/header")
	public String header(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
//		String returnMsg = HttpUtil.get("http://i.tianqi.com/index.php?c=code&id=1&icon=1&py=zhangjiajie&wind=0&num=1");
		//System.out.println("returnMsg:"+returnMsg);
//		Map<String,Object> returnMap=JsonUtil.jsonToMap(returnMsg);
//		setAttr("returnMap", returnMap);
//		Document doc = Jsoup.connect("http://i.tianqi.com/index.php?c=code&id=1&icon=1&py=zhangjiajie&wind=0&num=1").timeout(5000).get();
//		Elements elem = doc.select(".cityname");
//		String cityName=elem.text();
//		String imgUrl= doc.select(".pngtqico").attr("src");
//		String upWendu=doc.select(".cc30").get(0).text();
//		String downWendu=doc.select(".c390").get(0).text();
//		String xingqi=doc.select("strong").get(0).text();
//		String tianqiType=doc.select(".divCurrentWeather").text();
		String location="zhangjiajie";
		System.out.println("location:"+location);
//		String returnMsg = HttpUtil.get("http://183.232.231.25/telematics/v3/weather?location="+location+"&output=json&ak=BB70434a0c0facb5cf2b3bfd7406e86c");
//		System.out.println("returnMsg:"+returnMsg);
//		Map<String,Object> returnMap=JsonUtil.jsonToMap(returnMsg);
//		JSONArray array=(JSONArray)returnMap.get("results");
//		Map<String,Object> result=(Map<String,Object>)array.get(0);
//		String cityName=(String)result.get("currentCity");
//		Map<String,Object> weather_data=(Map<String,Object>)(((JSONArray)result.get("weather_data")).get(0));
		try{
		String returnMsgOld= HttpUtil.get("http://220.168.198.144:8006/webpc/indexdata/getWeather");
		Map<String,Object> returnMapOld=JsonUtil.jsonToMap(returnMsgOld);
		Map<String,Object> returnMap=(Map<String,Object>)returnMapOld.get("weather");
		String realPic="sun";
		String pic=(String)returnMap.get("weather");
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
    	String temperature=(String)returnMap.get("temperature");
    	//String xingqi=(String)weather_data.get("date");
		
		//setAttr("cityName", cityName);
		setAttr("imgUrl", realPic);
		setAttr("upWendu", temperature.split("~")[1]);
		setAttr("downWendu", temperature.split("~")[0]);
	//	setAttr("xingqi", xingqi.split(" ")[0]);
		setAttr("leixing",pic.split(" ")[0]);
		}catch(Exception e){
			e.printStackTrace();
			setAttr("imgUrl", "");
			setAttr("upWendu", "0");
			setAttr("downWendu","0");
		//	setAttr("xingqi", xingqi.split(" ")[0]);
			setAttr("leixing","");
		}
		List<SecurityMenu> quanjingMenuList = dalClient.queryForObjectList(
				"select * from security_menu where parent_id=1011",
				SecurityMenu.class);
		setAttr("quanjingMenuList", quanjingMenuList);

		List<SecurityMenu> changyouMenuList = dalClient.queryForObjectList(
				"select * from security_menu where parent_id=1010",
				SecurityMenu.class);
		setAttr("changyouMenuList", changyouMenuList);

		List<SecurityMenu> tingwenMenuList = dalClient.queryForObjectList(
				"select * from security_menu where parent_id=1037",
				SecurityMenu.class);
		setAttr("tingwenMenuList", tingwenMenuList);

		List<SecurityMenu> xiuxianMenuList = dalClient.queryForObjectList(
				"select * from security_menu where parent_id=1058",
				SecurityMenu.class);
		setAttr("xiuxianMenuList", xiuxianMenuList);

		Map<String, Object> indexMap = dalClient
				.queryForObject("select * from system_indexsetting");
		setAttr("indexMap", indexMap);

		String type = getPara("type");
		setAttr("type", type);

		List<SystemSearchword> wordList = dalClient
				.queryForObjectList(
						"select * from system_searchword where status=1 order by orderlist ",
						SystemSearchword.class);
		setAttr("wordList", wordList);

		return "/header";
	}

	@RequestMapping("/right")
	public String right(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		// 活动
		List<MemberActivity> activityList = dalClient
				.queryForObjectList(
						"select * from member_activity where  id in (select key_id from setting where type=2)",
						MemberActivity.class);
		setAttr("activityList", activityList);
		// 畅游
		List<SecurityNews> changyouList = dalClient
				.queryForObjectList(
						"select * from security_news where id in (select key_id from setting where type=1)",
						SecurityNews.class);
		setAttr("changyouList", changyouList);
		return "/right";
	}

	@RequestMapping("/footer")
	public String footer(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> indexMap = dalClient
				.queryForObject("select * from system_indexsetting");
		setAttr("indexMap", indexMap);
		return "/footer";
	}

	@RequestMapping("/myActivityList")
	public String myActivityList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> member = getSessionAttr("member");
		if (member == null) {
			return REDIRECT + "/toLogin";
		} else {
			// 活动
			Map<String, Object> data = (Map<String, Object>) member.get("data");
			String memberid = data.get("id") + "";
			String searchSQL = "";

			String title = getPara("title");
			if (title != null && !"".equals(title)) {
				searchSQL = searchSQL + " and  title LIKE '%" + title + "%'";
				setAttr("title", title);
			}
			String activity_status = getPara("activity_status");
			if (activity_status != null && !"".equals(activity_status)) {
				searchSQL = searchSQL + " and  activity_status ="
						+ activity_status;
				setAttr("activity_status", activity_status);
			}

			String start_time_start = getPara("start_time_start");
			if (start_time_start != null && !"".equals(start_time_start)) {
				searchSQL = searchSQL + " and  start_time >='"
						+ start_time_start + "'";
				setAttr("start_time_start", start_time_start);
			}

			String start_time_end = getPara("start_time_end");
			if (start_time_end != null && !"".equals(start_time_end)) {
				searchSQL = searchSQL + " and  end_time <='" + start_time_end
						+ "'";
				setAttr("start_time_end", start_time_end);
			}

			List<MemberActivity> activityList = dalClient
					.queryForObjectList(
							"select * from member_activity where id in (select  activity_id from member_activity_detail where userid="
									+ memberid + ") " + searchSQL,
							MemberActivity.class);
			setAttr("activityList", activityList);
			return "/myActivityList";
		}
	}

	@RequestMapping("/cancelActivity")
	public void cancelActivity(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String activity_id = getPara("activity_id");
		String flag = Constants.SUCCESS;
		String reason = "";

		Map<String, Object> member = getSessionAttr("member");
		if (member == null) {
			flag = Constants.ERROR;
			reason = "请重新登录！";
		} else {
			Map<String, Object> data = (Map<String, Object>) member.get("data");
			String memberid = data.get("id") + "";
			dalClient.update("delete from member_activity_detail where userid="
					+ memberid + " and activity_id=" + activity_id);
		}
		ReturnData returnData = new ReturnData(flag, reason);
		renderJson(response, returnData);
	}

	@RequestMapping("/memberCenter")
	public String memberCenter(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// String
		// testMember="{\"status\":\"success\",\"data\":{\"id\":252,\"cloginname\":\"18952028230\",\"ctel\":\"18952028230\",\"dupdate\":\"Feb 5, 2016 11:29:34 PM\"}}";
		// setSessionAttr("member",JsonUtil.jsonToMap(testMember));
		Map<String, Object> member = getSessionAttr("member");
		if (member == null) {
			return REDIRECT + "/toLogin";
		} else {
			// 活动
			Map<String, Object> data = (Map<String, Object>) member.get("data");
			String memberid = data.get("id") + "";
			String birthday = (String) data.get("dbirthday");
			if (birthday != null) {
				String dbirthday = ZjjMsgUtil.transdate(birthday);
				setAttr("dbirthday", dbirthday);
			}
			List<MemberActivity> activityList = dalClient
					.queryForObjectList(
							"select * from member_activity where id in (select  activity_id from member_activity_detail where userid="
									+ memberid + ")", MemberActivity.class);
			setAttr("activityList", activityList);
			return "/memberCenter";
		}
	}

	@SuppressWarnings("unused")
	@RequestMapping("/toMemberEdit")
	public String toMemberEdit(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> member = getSessionAttr("member");

		if (member == null) {
			return REDIRECT + "/toLogin";
		} else {
			Map<String, Object> data = (Map<String, Object>) member.get("data");
			String birthday = (String) data.get("dbirthday");
			if (birthday != null) {
				String dbirthday = ZjjMsgUtil.transdate(birthday);
				setAttr("dbirthday", dbirthday);
			}
			return "/memberEdit";
		}
	}

	@RequestMapping("/memberEditAction")
	public String memberEditAction(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> member = getSessionAttr("member");
		System.out.println("member:" + member);
		if (member == null) {
			return REDIRECT + "/toLogin";
		} else {

			Map<String, Object> data = (Map<String, Object>) member.get("data");
			String memberid = data.get("id") + "";
			Integer id = Integer.parseInt(memberid);
			String cnickname = getPara("cnickname");
			// cnickname = "";
			String cname = getPara("cname");
			String csex = getPara("csex");
			// csex = "";
			String dbirthday = getPara("dbirthday");
			// dbirthday = "";

			String cemail = getPara("cemail");
			// cemail = "";
			String cheadimgurl = getPara("memberImage1");
			if (StringUtil.isNotBlank(cheadimgurl)) {

				String path = request.getRealPath("/") + "headimg/";
				String type = cheadimgurl.split(",")[0].split(";")[0]
						.split("/")[1];
				String imgName = UUID.randomUUID().toString() + "." + type;
				com.jdk2010.util.ImageUtils.decodeBase64ToImage(
						cheadimgurl.split(",")[1], path, imgName);
				System.out.println("path + imgName:" + path + imgName);
				System.out.println("cheadimgurl:" + cheadimgurl);
				// cheadimgurl = QiniuUtil.upload(path + imgName);
				cheadimgurl = "/headimg/" + imgName;
				System.out.println("cheadimgurl:---" + cheadimgurl);
			}
			// cheadimgurl = "";
			String returnMsg = ZjjMsgUtil.updateMember(id, cnickname, cname,
					csex, dbirthday, cemail, cheadimgurl);
			Map returnMap = JsonUtil.jsonToMap(returnMsg);
			if (returnMap.get("status").equals("failure")) {

			} else {
				setSessionAttr("member", returnMap);
			}

			return FORWARD + "/memberCenter";
		}
	}

	@RequestMapping("/quanjing")
	public String quanjing(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<SecurityMenu> quanjingMenuList = dalClient.queryForObjectList(
				"select * from security_menu where parent_id=1011",
				SecurityMenu.class);
		setAttr("quanjingMenuList", quanjingMenuList);

		List<SecurityMenu> changyouMenuList = dalClient.queryForObjectList(
				"select * from security_menu where parent_id=1010",
				SecurityMenu.class);
		setAttr("changyouMenuList", changyouMenuList);

		List<SecurityMenu> tingwenMenuList = dalClient.queryForObjectList(
				"select * from security_menu where parent_id=1037",
				SecurityMenu.class);
		setAttr("tingwenMenuList", tingwenMenuList);

		Map<String, Object> indexMap = dalClient
				.queryForObject("select * from system_indexsetting");
		setAttr("indexMap", indexMap);

		SecurityMenu menu = dalClient
				.queryForObject("select * from security_menu where id=1011",
						SecurityMenu.class);
		setAttr("quanjing", menu);
		// 全景的二级目录

		List<SecurityMenu> secondMenuList = dalClient.queryForObjectList(
				"select * from security_menu where parent_id=1011",
				SecurityMenu.class);
		setAttr("secondMenuList", secondMenuList);

		String secondMenuId = getPara("secondMenuId");
		if (secondMenuId == null) {
			if (secondMenuList != null)
				secondMenuId = secondMenuList.get(0).getId() + "";
		}
		setAttr("secondMenuId", secondMenuId);

		// 全景的标签list
		List<SecurityMenu> bqMenuList = dalClient.queryForObjectList(
				"select * from security_menu where banner_id=" + secondMenuId
						+ " order by orderlist asc", SecurityMenu.class);
		setAttr("bqMenuList", bqMenuList);

		String currentId = getPara("currentId");
		if (currentId == null || currentId == "") {
			if (bqMenuList != null && bqMenuList.size() != 0)
				if(bqMenuList!=null&&bqMenuList.size()>0)
				currentId = bqMenuList.get(0).getId() + "";
		}
		setAttr("currentId", currentId);
		if(currentId.equals("")){
			currentId="0";
		}
		DbKit dbKit = new DbKit(
				"select * from security_news where id in (select news_id from bq_news where bq_id="
						+ currentId + ")");
		Page pagePage = getPage();
		pagePage.setPageSize(6);
		Page pageList = dalClient.queryForPageList(dbKit, pagePage,
				SecurityNews.class);
		setAttr("pageList", pageList);
		return "/quanjing";
	}

	@RequestMapping("/quanjingDetail")
	public String quanjingDetail(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<SecurityMenu> quanjingMenuList = dalClient.queryForObjectList(
				"select * from security_menu where parent_id=1011",
				SecurityMenu.class);
		setAttr("quanjingMenuList", quanjingMenuList);

		List<SecurityMenu> changyouMenuList = dalClient.queryForObjectList(
				"select * from security_menu where parent_id=1010",
				SecurityMenu.class);
		setAttr("changyouMenuList", changyouMenuList);

		List<SecurityMenu> tingwenMenuList = dalClient.queryForObjectList(
				"select * from security_menu where parent_id=1037",
				SecurityMenu.class);
		setAttr("tingwenMenuList", tingwenMenuList);

		Map<String, Object> indexMap = dalClient
				.queryForObject("select * from system_indexsetting");
		setAttr("indexMap", indexMap);

		SecurityMenu menu = dalClient
				.queryForObject("select * from security_menu where id=1011",
						SecurityMenu.class);
		setAttr("quanjing", menu);

		String id = getPara("id");
		SecurityNews securityNew = dalClient.findById(id, SecurityNews.class);
		securityNew.setReadtotal(securityNew.getReadtotal() + 1);
		dalClient.update(securityNew);
		setAttr("securityNew", securityNew);

		String bqId = getPara("bqId");
		SecurityMenu bq = dalClient.queryForObject(
				"select * from security_menu where id=" + bqId,
				SecurityMenu.class);
		setAttr("bqMenu", bq);

		String secondMenuId = getPara("secondMenuId");
		SecurityMenu secondMenu = dalClient.queryForObject(
				"select * from security_menu where id=" + secondMenuId,
				SecurityMenu.class);
		setAttr("secondMenu", secondMenu);

		// 标签
		List<Map<String, Object>> biaoqianList = dalClient
				.queryForObjectList("select * from news_maodian where news_id="
						+ id);
		setAttr("biaoqianList", biaoqianList);

		return "/quanjingDetail";
	}

	@RequestMapping("/newsList")
	public void newsList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String secondMenuId = getPara("secondMenuId");
		String currentId = getPara("currentId");
		List<Map<String, Object>> newsList = dalClient
				.queryForObjectList("select id,title,abstract_content,indeximg from security_news where id in (select news_id from bq_news where bq_id="
						+ currentId + ")");
		renderJson(response, newsList);
	}

	@RequestMapping("/jingqu")
	public String jingqu(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return "/jingqu";
	}

}
