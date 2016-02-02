package com.jdk2010.index.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ch.qos.logback.core.util.SystemInfo;

import com.jdk2010.base.security.menu.model.SecurityMenu;
import com.jdk2010.base.security.securitynews.model.SecurityNews;
import com.jdk2010.base.security.securitynews.service.ISecurityNewsService;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.dal.client.DalClient;
import com.jdk2010.member.memberactivity.model.MemberActivity;
import com.jdk2010.system.systemadv.model.SystemAdv;
import com.jdk2010.system.systemadv.service.ISystemAdvService;


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
        
        return "/header";
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
    