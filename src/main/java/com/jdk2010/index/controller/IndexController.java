package com.jdk2010.index.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
      
        //视频管理
        List<SecurityNews> videoList=dalClient.queryForObjectList("select * from security_news where menu_id=1054 and index_status=1 and review_status=1 limit 0,5",SecurityNews.class);
        setAttr("videoList", videoList);
        
        //全景管理
        List<SecurityNews> quanjingList=dalClient.queryForObjectList("select * from security_news where menu_id=1011 and index_status=1 and review_status=1 limit 0,8",SecurityNews.class);
        setAttr("quanjingList", quanjingList);
        
        //畅游
        List<SecurityNews> changyouList=dalClient.queryForObjectList("select * from security_news where menu_id=1012 and index_status=1 and review_status=1 limit 0,4",SecurityNews.class);
        setAttr("changyouList", changyouList);
        
        //活动
        List<MemberActivity> activityList=dalClient.queryForObjectList("select * from member_activity where  index_status=1 and review_status=1 limit 0,2",MemberActivity.class);
        setAttr("activityList", activityList);
        
        
        return "/index";
    }

   
 

}
    