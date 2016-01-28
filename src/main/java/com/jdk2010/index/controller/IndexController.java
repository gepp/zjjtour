package com.jdk2010.index.controller;

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

   
 

}
    