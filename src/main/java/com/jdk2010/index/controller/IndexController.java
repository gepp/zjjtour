package com.jdk2010.index.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hsqldb.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ch.qos.logback.core.util.SystemInfo;

import com.jdk2010.base.security.menu.model.SecurityMenu;
import com.jdk2010.base.security.securitynews.model.SecurityNews;
import com.jdk2010.base.security.securitynews.service.ISecurityNewsService;
import com.jdk2010.framework.constant.Constants;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.dal.client.DalClient;
import com.jdk2010.framework.util.JsonUtil;
import com.jdk2010.framework.util.ReturnData;
import com.jdk2010.member.memberactivity.model.MemberActivity;
import com.jdk2010.system.systemadv.model.SystemAdv;
import com.jdk2010.system.systemadv.service.ISystemAdvService;
import com.sun.xml.internal.bind.v2.runtime.reflect.opt.Const;


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

    @RequestMapping("/")
    public String index(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        //滚动图
        List<SystemAdv> advList=systemAdvService.queryForList("select * from system_adv  where status=1 order by orderlist asc",SystemAdv.class);
        setAttr("advList", advList);
      
        List<SecurityMenu> quanjingMenuList=dalClient.queryForObjectList("select * from security_menu where parent_id=1011",SecurityMenu.class);
        setAttr("quanjingMenuList",quanjingMenuList);
        
        List<SecurityMenu> changyouMenuList=dalClient.queryForObjectList("select * from security_menu where parent_id=1010",SecurityMenu.class);
        setAttr("changyouMenuList",changyouMenuList);
        
        List<SecurityMenu> tingwenMenuList=dalClient.queryForObjectList("select * from security_menu where parent_id=1037",SecurityMenu.class);
        setAttr("tingwenMenuList",tingwenMenuList);
        
        //视频管理
        List<SecurityNews> videoList=dalClient.queryForObjectList("select * from security_news where menu_id=1054 and index_status=1 and review_status=1 limit 0,5",SecurityNews.class);
        setAttr("videoList", videoList);
        
        //全景管理
        List<SecurityNews> quanjingList=dalClient.queryForObjectList("select * from security_news where menu_id in (select id from security_menu where parent_id=1011) and index_status=1 and review_status=1   limit 0,8",SecurityNews.class);
        setAttr("quanjingList", quanjingList);
        
        //畅游
        List<SecurityNews> changyouList=dalClient.queryForObjectList("select * from security_news where menu_id in (select id from security_menu where parent_id=1010) and index_status=1 and review_status=1   limit 0,8",SecurityNews.class);
        setAttr("changyouList", changyouList);
        
        //活动
        List<MemberActivity> activityList=dalClient.queryForObjectList("select * from member_activity where  index_status=1 and review_status=1 limit 0,2",MemberActivity.class);
        setAttr("activityList", activityList);
        
        
        //听闻管理
        List<SecurityNews> tingwenList=dalClient.queryForObjectList("select * from security_news where menu_id in (select id from security_menu where parent_id=1037) and index_status=1 and review_status=1   limit 0,8",SecurityNews.class);
        setAttr("tingwenList", tingwenList);
        
        
        SecurityMenu meishiMenu=dalClient.queryForObject("select * from security_menu where id=1059",SecurityMenu.class);
        setAttr("meishiMenu",meishiMenu);
        
        SecurityMenu jiudianMenu=dalClient.queryForObject("select * from security_menu where id=1061",SecurityMenu.class);
        setAttr("jiudianMenu",jiudianMenu);
        
        SecurityMenu jingdianMenu=dalClient.queryForObject("select * from security_menu where id=1060",SecurityMenu.class);
        setAttr("jingdianMenu",jingdianMenu);
        
        SecurityMenu menpiaoMenu=dalClient.queryForObject("select * from security_menu where id=1062",SecurityMenu.class);
        setAttr("menpiaoMenu",menpiaoMenu);
        
        Map<String,Object>  indexMap=dalClient.queryForObject("select * from system_indexsetting");
        setAttr("indexMap", indexMap);
        
        return "/index";
    }
    
    @RequestMapping("/header")
    public String header(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        List<SecurityMenu> quanjingMenuList=dalClient.queryForObjectList("select * from security_menu where parent_id=1011",SecurityMenu.class);
        setAttr("quanjingMenuList",quanjingMenuList);
        
        List<SecurityMenu> changyouMenuList=dalClient.queryForObjectList("select * from security_menu where parent_id=1010",SecurityMenu.class);
        setAttr("changyouMenuList",changyouMenuList);
        
        List<SecurityMenu> tingwenMenuList=dalClient.queryForObjectList("select * from security_menu where parent_id=1037",SecurityMenu.class);
        setAttr("tingwenMenuList",tingwenMenuList);
        
        Map<String,Object>  indexMap=dalClient.queryForObject("select * from system_indexsetting");
        setAttr("indexMap", indexMap);
        
        String type=getPara("type");
        setAttr("type", type);
        
        return "/header";
    }
    
    @RequestMapping("/right")
    public String right(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
    	//活动
        List<MemberActivity> activityList=dalClient.queryForObjectList("select * from member_activity where  top_status=1 and review_status=1 limit 0,2",MemberActivity.class);
        setAttr("activityList", activityList);
      //畅游
        List<SecurityNews> changyouList=dalClient.queryForObjectList("select * from security_news where menu_id in (select id from security_menu where parent_id=1010) and index_status=1 and review_status=1   limit 0,8",SecurityNews.class);
        setAttr("changyouList", changyouList);
        return "/right";
    }
    
    @RequestMapping("/footer")
    public String footer(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/footer";
    }
    @RequestMapping("/myActivityList")
    public String myActivityList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String,Object> member=getSessionAttr("member");
        if(member==null){
            return "/login";
        }else{
          //活动
            Map<String,Object> data=(Map<String,Object>)member.get("data");
            String memberid=data.get("id")+"";
            String searchSQL = "";
            
            String title = getPara("title");
            if (title != null && !"".equals(title)) {
                searchSQL = searchSQL + " and  title LIKE '%" + title + "%'";
                setAttr("title", title);
            }
            String activity_status = getPara("activity_status");
            if (activity_status != null && !"".equals(activity_status)) {
                searchSQL = searchSQL + " and  activity_status ="+activity_status ;
                setAttr("activity_status", activity_status);
            }
            
            String start_time_start = getPara("start_time_start");
            if (start_time_start != null && !"".equals(start_time_start)) {
                searchSQL = searchSQL + " and  start_time >='"+start_time_start+"'";
                setAttr("start_time_start", start_time_start);
            }
            
            String start_time_end= getPara("start_time_end");
            if (start_time_end != null && !"".equals(start_time_end)) {
                searchSQL = searchSQL + " and  end_time <='"+start_time_end+"'";
                setAttr("start_time_end", start_time_end);
            }
            
            List<MemberActivity> activityList=dalClient.queryForObjectList("select * from member_activity where id in (select  activity_id from member_activity_detail where userid="+memberid+") "+searchSQL,MemberActivity.class);
            setAttr("activityList", activityList);
            return "/myActivityList";
        }
    }
    @RequestMapping("/cancelActivity")
    public void cancelActivity(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String activity_id=getPara("activity_id");
        String flag=Constants.SUCCESS;
        String reason="";

        Map<String,Object> member=getSessionAttr("member");
        if(member==null){
            flag=Constants.ERROR;
            reason="请重新登录！";
        }else{
            Map<String,Object> data=(Map<String,Object>)member.get("data");
            String memberid=data.get("id")+"";
            dalClient.update("delete from member_activity_detail where userid="+memberid +" and activity_id="+activity_id);
        }
        ReturnData returnData = new ReturnData(flag,reason);
        renderJson(response, returnData);
    }
    
    
    @RequestMapping("/memberCenter")
    public String memberCenter(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String testMember="{\"status\":\"success\",\"data\":{\"id\":252,\"cloginname\":\"18952028230\",\"ctel\":\"18952028230\",\"dupdate\":\"Feb 5, 2016 11:29:34 PM\"}}";
        setSessionAttr("member",JsonUtil.jsonToMap(testMember));
        Map<String,Object> member=getSessionAttr("member");
        if(member==null){
            return "/login";
        }else{
          //活动
            Map<String,Object> data=(Map<String,Object>)member.get("data");
            String memberid=data.get("id")+"";
            List<MemberActivity> activityList=dalClient.queryForObjectList("select * from member_activity where id in (select  activity_id from member_activity_detail where userid="+memberid+")",MemberActivity.class);
            setAttr("activityList", activityList);
            return "/memberCenter";
        }
    }
    
    
    @RequestMapping("/toMemberEdit")
    public String toMemberEdit(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        return "/memberEdit";
    }
    
    
    @RequestMapping("/quanjing")
    public String quanjing(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<SecurityMenu> quanjingMenuList=dalClient.queryForObjectList("select * from security_menu where parent_id=1011",SecurityMenu.class);
        setAttr("quanjingMenuList",quanjingMenuList);
        
        List<SecurityMenu> changyouMenuList=dalClient.queryForObjectList("select * from security_menu where parent_id=1010",SecurityMenu.class);
        setAttr("changyouMenuList",changyouMenuList);
        
        List<SecurityMenu> tingwenMenuList=dalClient.queryForObjectList("select * from security_menu where parent_id=1037",SecurityMenu.class);
        setAttr("tingwenMenuList",tingwenMenuList);
        
        Map<String,Object>  indexMap=dalClient.queryForObject("select * from system_indexsetting");
        setAttr("indexMap", indexMap);
        
        SecurityMenu menu=dalClient.queryForObject("select * from security_menu where id=1011" ,SecurityMenu.class);
        setAttr("quanjing", menu);
        //全景的二级目录
        
        List<SecurityMenu> secondMenuList=dalClient.queryForObjectList("select * from security_menu where parent_id=1011" ,SecurityMenu.class);
        setAttr("secondMenuList", secondMenuList);
        
        String secondMenuId=getPara("secondMenuId");
        if(secondMenuId==null){
            if(secondMenuList!=null)
            secondMenuId=secondMenuList.get(0).getId()+"";
        }
        setAttr("secondMenuId", secondMenuId);
        
        //全景的标签list
        List<SecurityMenu> bqMenuList=dalClient.queryForObjectList("select * from security_menu where banner_id="+secondMenuId+" order by orderlist asc",SecurityMenu.class);
        setAttr("bqMenuList", bqMenuList);
        
        
        String currentId=getPara("currentId");
        if(currentId==null||currentId==""){
            if(bqMenuList!=null&&bqMenuList.size()!=0)
            currentId=bqMenuList.get(0).getId()+"";
        }
        setAttr("currentId", currentId);
        
        //全景的新闻
        List<Map<String,Object>> newsList;
        if(currentId==""){
            newsList=new ArrayList<Map<String,Object>>();
         }else{
             newsList=dalClient.queryForObjectList("select * from security_news where id in (select news_id from bq_news where bq_id="+currentId+")");
         }
        
        setAttr("quanjingList", newsList);
        return "/quanjing" ;
    }
    
    @RequestMapping("/quanjingDetail")
    public String quanjingDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<SecurityMenu> quanjingMenuList=dalClient.queryForObjectList("select * from security_menu where parent_id=1011",SecurityMenu.class);
        setAttr("quanjingMenuList",quanjingMenuList);
        
        List<SecurityMenu> changyouMenuList=dalClient.queryForObjectList("select * from security_menu where parent_id=1010",SecurityMenu.class);
        setAttr("changyouMenuList",changyouMenuList);
        
        List<SecurityMenu> tingwenMenuList=dalClient.queryForObjectList("select * from security_menu where parent_id=1037",SecurityMenu.class);
        setAttr("tingwenMenuList",tingwenMenuList);
        
        Map<String,Object>  indexMap=dalClient.queryForObject("select * from system_indexsetting");
        setAttr("indexMap", indexMap);
        
        SecurityMenu menu=dalClient.queryForObject("select * from security_menu where id=1011" ,SecurityMenu.class);
        setAttr("quanjing", menu);
         
        String id=getPara("id");
        SecurityNews securityNew=dalClient.findById(id, SecurityNews.class);
        setAttr("securityNew", securityNew);
        
        String bqId=getPara("bqId");
        SecurityMenu bq=dalClient.queryForObject("select * from security_menu where id="+bqId ,SecurityMenu.class);
        setAttr("bqMenu", bq);
        
        String secondMenuId=getPara("secondMenuId");
        SecurityMenu secondMenu=dalClient.queryForObject("select * from security_menu where id="+secondMenuId ,SecurityMenu.class);
        setAttr("secondMenu", secondMenu);
        
        
        
        //标签
        List<Map<String,Object>> biaoqianList=dalClient.queryForObjectList("select * from news_maodian where news_id="+id);
        setAttr("biaoqianList", biaoqianList);
        
        return "/quanjingDetail" ;
    }
    
    @RequestMapping("/newsList")
    public void newsList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String secondMenuId=getPara("secondMenuId");
        String currentId=getPara("currentId");
        List<Map<String,Object>> newsList=dalClient.queryForObjectList("select id,title,abstract_content,indeximg from security_news where id in (select news_id from bq_news where bq_id="+currentId+")");
        renderJson(response, newsList);
    }
   
 

}
    