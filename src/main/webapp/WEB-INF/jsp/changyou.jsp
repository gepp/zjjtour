<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>${indexMap.title }</title>
	</head>
	<link rel="stylesheet" href="${contextpath }/css/style.css" />
	<link rel="stylesheet" href="${contextpath }/font/iconfont.css" />

	<body>
		 
		 <div id="header">
		</div>
		<img src="${changyou.img }" width="100%"/>
		<!--面包屑-->
		<div class="page-breadcrumbs">
			<ul class="clr">
				<span>当前位置：</span>
				<li><a href="${contextpath }/">首页</a></li>
				<li><a href="${contextpath }/changyou.htm">${changyou.name }</a></li>
				<li><a href="#">${thirdShowName }</a></li>
			</ul>
		</div>
		<!--面包屑  end-->
		<!--分类标签-->
		<div class="list-label">
			<%-- <button onclick="jumpChangyou('')" <c:if test="${secondMenuId==''}"> class="active"</c:if>>全部</button> --%>
			<c:forEach var="menu" items="${secondMenuList }">
			<button onclick="jumpChangyou('${menu.id}')" <c:if test="${secondMenuId==menu.id}"> class="active"</c:if>>${menu.name }</button>
			</c:forEach>
		</div>
		<!--分类标签 end-->
		 
		 <!--新闻列表-->
		 <div class="panorama-details clr" id="tupian">
			<div class="section">
				<div class="news-font-list">
					<ul>
						<c:forEach items="${pageList.list }" var="item">
									 <li class="clr" style="float:none" onclick="jumpDetail('${item.id}','${item.jumpType }','${item.url }')">
											<h4 class="transition">
											<c:if test="${item.indexStatus==1 }">
											<span class="zhiding"><em></em>置顶</span>
											</c:if>
											<c:if test="${item.topStatus==1 }">
											<span class="toutiao"><em></em>头条</span>
											</c:if>
											${item.title }
											<fmt:formatDate value="${item.ctime }" pattern="yyyy-MM-dd" var="ctime"/>
											</h4>
											<div class="time">${ctime }<span class="number"><i class="iconfont">&#xe616;</i>${item.readtotal }</span></div>
								<p>${item.abstractContent }<span class="transition">查看详情<i class="iconfont">&#xe611;</i></span></p>
									</li>
								 
						</c:forEach>
					
					</ul>
					
				  <page:page href="${contextpath}/changyou.htm?secondMenuId=${secondMenuId }&currentId=${currentId }&otherId=${otherId }" data="pageList" />	
				</div>
			</div>
			 <div id="rightNews"></div>
		</div>
		 
		<!--图标列表-->	
		
		<input type="hidden" name="secondMenuId" id="secondMenuId" value="${secondMenuId }"/>
		<input type="hidden" name="currentId" id="currentId" value="${currentId }"/>
		<div id="footer">
		</div>
		 
		
		<!--<script src="${contextpath }/js/jquery-2.1.0.js"></script>-->
		<script type="text/javascript" src="${contextpath }/js/jquery.min.js"></script>
		<script src="${contextpath }/js/bootstrap.min.js"></script>
		<script src="${contextpath }/js/jquery.bootstrap-autohidingnavbar.js"></script>
		<script src="${contextpath}/js/layer/layer.js"></script>
		<script src="${contextpath}/js/common.js"></script>
		<script>
		String.prototype.endWith=function(s){ 
			if(s==null||s==""||this.length==0||s.length>this.length) 
			return false; 
			if(this.substring(this.length-s.length)==s) 
			return true; 
			else 
			return false; 
			return true; 
			} 
			String.prototype.startWith=function(s){ 
			if(s==null||s==""||this.length==0||s.length>this.length) 
			return false; 
			if(this.substr(0,s.length)==s) 
			return true; 
			else 
			return false; 
			return true; 
			} 
			//		头部悬浮
			$("div.navbar-fixed-top").autoHidingNavbar();
			jQuery(document).ready(function() {
				$("#header").load("${contextpath}/header.htm?type=changyou");
				$("#footer").load("${contextpath}/footer.htm");
				$("#rightNews").load("${contextpath}/right.htm");
			});
			 
			function jumpDetail(id,jumpType,url){
				if(url==''){
				if(jumpType=='0'){
					window.open('${contextpath}/changyouDetail.htm?id='+id);
				}else{
					window.location.href='${contextpath}/changyouDetail.htm?id='+id;
				}
				}else{
					if(jumpType=='0'){
						if(url.startWith('http')){
							window.open(url);
						}else{
							window.open("${contextpath}"+url);
						}
						 
					}else{
						if(url.startWith('http')){
							window.location.href=url;
						}else{
							window.location.href="${contextpath}/"+url;
						}
						
					}
				}
				
			}
			 
			function jumpChangyou(secondMenuId){
				if(secondMenuId==''){
					window.location.href="${contextpath}/changyou.htm";
				}else{
					window.location.href="${contextpath}/changyou.htm?secondMenuId="+secondMenuId;
				}
				
			}
			 
			
		</script>
	</body>

</html>