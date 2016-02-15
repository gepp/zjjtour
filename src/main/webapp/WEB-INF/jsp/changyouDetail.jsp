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
		 
		<img src="${changyou.img }" width="100%"/>
		<!--面包屑-->
		<div class="page-breadcrumbs">
			<ul class="clr">
				<span>当前位置：</span>
				<li><a href="#">首页</a></li>
				<li><a href="#">${changyou.name }</a></li>
				<li><a href="${contextpath }/changyou.htm?secondMenuId=${securityMenu.id}">${securityMenu.name }</a></li>
				<li>${securityNew.title }</li>
			</ul>
		</div>
		<!--面包屑  end-->
		  <div class="panorama-details clr">
			<div class="section">
				<div class="news-font-list">
					<h4>${securityNew.title }</h4>
					<div class="tit-bar">
					<fmt:formatDate value="${securityNew.ctime }" pattern="yyyy-MM-dd" var="ctime"/>
						<span>${ctime }</span>
						<span><i class="iconfont">&#xe616;</i>&nbsp;0</span></span>
						<span>来源：本站原创</span>
					</div>
					<div class="abstract">${securityNew.abstractContent }</div>
					<div class="news-content">
						 ${securityNew.content }
					</div>
				<!--分页-->
				<div class="page">
					<ul class="clr">
						<li title="下一篇"><i class="iconfont">&#xe611;</i></li>
						<li title="上一篇"><i class="iconfont">&#xe611;</i></li>
					</ul>
				</div>
				<!--分页end-->
				</div>
			</div>
			 <div id="rightNews"></div>
		  </div>
		<div id="footer">
		</div>

		 
		
		<!--<script src="${contextpath }/js/jquery-2.1.0.js"></script>-->
		<script type="text/javascript" src="${contextpath }/js/jquery.min.js"></script>
		<script src="${contextpath }/js/bootstrap.min.js"></script>
		<script src="${contextpath }/js/jquery.bootstrap-autohidingnavbar.js"></script>
		<script src="${contextpath}/js/layer/layer.js"></script>
		<script src="${contextpath}/js/common.js"></script>
		<script>
			//		头部悬浮
			$("div.navbar-fixed-top").autoHidingNavbar();
			jQuery(document).ready(function() {
				$("#header").load("${contextpath}/header.htm?type=changyou");
				$("#footer").load("${contextpath}/footer.htm");
				$("#rightNews").load("${contextpath}/right.htm");
				 
			});
		  
			
		</script>
	</body>

</html>