<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		 
		<img src="${quanjing.img }" width="100%"/>
		<!--面包屑-->
		<div class="page-breadcrumbs">
			<ul class="clr">
				<span>当前位置：</span>
				<li><a href="${contextpath }/">首页</a></li>
				<li><a href="#">听闻</a></li>
				<li><a href="#">${thirdShowName }</a></li>
			</ul>
		</div>
		<!--面包屑  end-->
		<!--分类标签-->
		<div class="list-label">
			<button onclick="jumpTingwen('')" <c:if test="${secondMenuId==''}"> class="active"</c:if>>全部</button>
			<c:forEach var="menu" items="${secondMenuList }">
			<button onclick="jumpTingwen('${menu.id}')" <c:if test="${secondMenuId==menu.id}"> class="active"</c:if>>${menu.name }</button>
			</c:forEach>
			<span class="transition" onclick="changeType();"><i class="iconfont" id="tingwensrc">&#xe621;</i></span>
		</div>
		
		<!--分类标签 end-->
		 
		 <!--新闻列表-->
		<div class="news-list" id="tupian">
			<ul class="clr" id="tupian">
				<c:forEach var="item" items="${newsList }">
				<li class="transition" onclick="jumpDetail('${item.id}')">
					<div class="news-list-img">
						<img src="${item.indeximg }" class="transition">
					</div>
					<h5 class="transition">
					<c:if test="${item.index_status==1 }">
						<span class="zhiding f14"><em></em>置顶</span>
						</c:if>
						<c:if test="${item.top_status==1 }">
						<span class="toutiao f14"><em></em>头条</span>
						</c:if>
					${item.title }</h5>
					<p>${item.abstract_content }</p>
					<fmt:formatDate value="${item.ctime }" pattern="yyyy-MM-dd" var="ctime"/>
					<span class="time">${ctime }</span>
					<span class="number"><i class="iconfont" >&#xe616;</i>0</span>
				</li>
				 </c:forEach>
			</ul>
		</div>
		<!--图标列表-->	
		 <div class="panorama-details clr"  id="wenzi" style="display:none">
			<div class="section">
				<div class="news-font-list">
					<ul>
						<c:forEach var="item" items="${newsList }">
									 <li class="clr" style="float:none" onclick="jumpDetail('${item.id}')">
											<h4 class="transition">
											<c:if test="${item.index_status==1 }">
											<span class="zhiding"><em></em>置顶</span>
											</c:if>
											<c:if test="${item.top_status==1 }">
											<span class="toutiao"><em></em>头条</span>
											</c:if>
											${item.title }
											<fmt:formatDate value="${item.ctime }" pattern="yyyy-MM-dd" var="ctime"/>
											</h4>
											<div class="time">${ctime }<span class="number"><i class="iconfont">&#xe616;</i>0</span></div>
								<p>${item.abstract_content }<span class="transition">查看详情<i class="iconfont">&#xe611;</i></span></p>
									</li>
								 
						</c:forEach>
					
					</ul>
					
				 
				</div>
			</div>
			 <div id="rightNews"></div>
		</div>
		
		<input type="hidden" name="secondMenuId" id="secondMenuId" value="${secondMenuId }"/>
		<input type="hidden" name="currentId" id="currentId" value="${currentId }"/>
		<div id="footer"></div>
		<input type="hidden" id="changeType" value="2"/>
		 
		
		<!--<script src="${contextpath }/js/jquery-2.1.0.js"></script>-->
		<script type="text/javascript" src="${contextpath }/js/jquery.min.js"></script>
		<script src="${contextpath }/js/bootstrap.min.js"></script>
		<script src="${contextpath }/js/jquery.bootstrap-autohidingnavbar.js"></script>
		<script src="${contextpath}/js/layer/layer.js"></script>
		<script src="${contextpath}/js/common.js"></script>
		<script>
			function changeType(){
				var type=$("#changeType").val();
				if(type==1){
					$("#tupian").show();
					$("#wenzi").hide();
					$("#changeType").val("2");
					$("#tingwensrc").html("&#xe621;");
				}else if(type==2){
					$("#tupian").hide();
					$("#wenzi").show();
					$("#changeType").val("1");
					$("#tingwensrc").html("&#xe620;");
				}
			}
			//		头部悬浮
			$("div.navbar-fixed-top").autoHidingNavbar();
			jQuery(document).ready(function() {
				$("#header").load("${contextpath}/header.htm?type=tingwen");
				$("#footer").load("${contextpath}/footer.htm");
				$("#rightNews").load("${contextpath}/right.htm");
			});
		 
			function jumpDetail(id){
				window.location.href='${contextpath}/tingwenDetail.htm?id='+id;
			}
		 
		</script>
	</body>

</html>