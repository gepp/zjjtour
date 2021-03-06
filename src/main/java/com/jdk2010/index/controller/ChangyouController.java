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

import com.jdk2010.base.security.menu.model.SecurityMenu;
import com.jdk2010.base.security.securitynews.model.SecurityNews;
import com.jdk2010.base.security.securitynews.service.ISecurityNewsService;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.dal.client.DalClient;
import com.jdk2010.framework.util.DbKit;
import com.jdk2010.framework.util.Page;
import com.jdk2010.framework.util.StringUtil;
import com.jdk2010.system.systemadv.service.ISystemAdvService;


@Controller
@RequestMapping(value = "/")
public class ChangyouController extends BaseController {
    Logger logger = LoggerFactory.getLogger(this.getClass());


    @Resource
    ISecurityNewsService securityNewsService;

    @Resource
    DalClient dalClient;
    
    @Resource
    ISystemAdvService systemAdvService;

    
    @RequestMapping("/changyou")
    public String changyou(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<SecurityMenu> quanjingMenuList=dalClient.queryForObjectList("select * from security_menu where parent_id=1011",SecurityMenu.class);
        setAttr("quanjingMenuList",quanjingMenuList);
        
        List<SecurityMenu> changyouMenuList=dalClient.queryForObjectList("select * from security_menu where parent_id=1010",SecurityMenu.class);
        setAttr("changyouMenuList",changyouMenuList);
        
        List<SecurityMenu> tingwenMenuList=dalClient.queryForObjectList("select * from security_menu where parent_id=1037",SecurityMenu.class);
        setAttr("tingwenMenuList",tingwenMenuList);
        
        Map<String,Object>  indexMap=dalClient.queryForObject("select * from system_indexsetting");
        setAttr("indexMap", indexMap);
        
        SecurityMenu menu=dalClient.queryForObject("select * from security_menu where id=1010" ,SecurityMenu.class);
        setAttr("changyou", menu);
        //畅游
        String sql="select * from security_menu where  parent_id=1010 and status=1  order by orderlist asc";
        List<SecurityMenu> secondMenuList=dalClient.queryForObjectList(sql,SecurityMenu.class);
        setAttr("secondMenuList", secondMenuList);
        
        String secondMenuId=getPara("secondMenuId");
        if(StringUtil.isBlank(secondMenuId)){
        	  if(secondMenuList.size()!=0){
              	secondMenuId=secondMenuList.get(0).getId();
              }
        }
        
      
        setAttr("secondMenuId", secondMenuId);
        String thirdShowName="";
        //畅游的新闻
        List<Map<String,Object>> newsList;
        DbKit dbKit=null;
        if(secondMenuId!=""){
        	 dbKit = new DbKit("select * from security_news where menu_id="+secondMenuId+" and review_status=1 order by orderlist asc");
            SecurityMenu thirdShowMenu=   dalClient.findById(secondMenuId,SecurityMenu.class);
            thirdShowName=thirdShowMenu.getName();
        }else{
        	thirdShowName="全部";
        	dbKit = new DbKit("select * from security_news where  review_status=1 and menu_id in (select id from security_menu where  parent_id=1010) order by orderlist asc");
         }
        
        setAttr("thirdShowName", thirdShowName);
        
        Page pagePage = getPage();
		pagePage.setPageSize(6);
		Page pageList = dalClient.queryForPageList(dbKit, pagePage,
				SecurityNews.class);
		setAttr("pageList", pageList);
         
        return "/changyou" ;
    }
    
    @RequestMapping("/changyouDetail")
    public String changyouDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<SecurityMenu> quanjingMenuList=dalClient.queryForObjectList("select * from security_menu where parent_id=1011",SecurityMenu.class);
        setAttr("quanjingMenuList",quanjingMenuList);
        
        List<SecurityMenu> changyouMenuList=dalClient.queryForObjectList("select * from security_menu where parent_id=1010",SecurityMenu.class);
        setAttr("changyouMenuList",changyouMenuList);
        
        List<SecurityMenu> tingwenMenuList=dalClient.queryForObjectList("select * from security_menu where parent_id=1037",SecurityMenu.class);
        setAttr("tingwenMenuList",tingwenMenuList);
        
        Map<String,Object>  indexMap=dalClient.queryForObject("select * from system_indexsetting");
        setAttr("indexMap", indexMap);
        
        SecurityMenu menu=dalClient.queryForObject("select * from security_menu where id=1010" ,SecurityMenu.class);
        setAttr("changyou", menu);
         
        String id=getPara("id");
        dalClient.update("update security_news set readtotal=readtotal+1 where id="+id);
        
        SecurityNews securityNew=dalClient.findById(id, SecurityNews.class);
       
        setAttr("securityNew", securityNew);
        
        SecurityMenu securityMenu=dalClient.queryForObject("select * from security_menu where id="+securityNew.getMenuId() ,SecurityMenu.class);
        setAttr("securityMenu", securityMenu);
     // 标签
     		List<Map<String, Object>> biaoqianList = dalClient
     				.queryForObjectList("select * from news_maodian where news_id="
     						+ id);
     		setAttr("biaoqianList", biaoqianList);
        
        return "/changyouDetail" ;
    }
     
   
 

}
    