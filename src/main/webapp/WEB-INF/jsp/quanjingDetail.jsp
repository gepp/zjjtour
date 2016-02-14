<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>全景详情</title>
	</head>
	<link rel="stylesheet" href="${contextpath}/css/style.css" />
	<link rel="stylesheet" href="${contextpath}/font/iconfont.css" />

	<body>
		 <div id="header">
		</div>
		<!-- banner -->
			<img src="${quanjing.img }" width="100%"/>
		<!--banner end-->
		<!--面包屑-->
		<div class="page-breadcrumbs">
			<ul class="clr">
				<span>当前位置：</span>
				<li><a href="#">首页</a></li>
				<li><a href="#">全景</a></li>
				<c:if test="${secondMenu!=null }">
				<li><a href="#">${secondMenu.name }</a></li>
				<li><a href="#">${bqMenu.name }</a></li>
				</c:if>
				<li>${securityNew.title }</li>
			</ul>
		</div>
		<!--面包屑  end-->

		<!--全景详情-->
		<div class="panorama-details clr">
			<div class="section">
				<div id="menu1" class="menu">

					<div id="menu">
						<div class="line"></div>
						<ul>
							<li><a href="#item-1" class="cur transition">360°全景</a></li>
								<c:forEach items="${biaoqianList }" var="biaoqian">
								<li><a href="#item${biaoqian.orderlist }" class="transition">${biaoqian.maodian_name }</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div id="content">
					<div class="content-item" id="item-1">
						<h4><i class="iconfont">&#xe610;</i>扩大的盆景，缩小的仙境</h4>
						<iframe allowtransparency="true" frameborder="0" src="${securityNew.quanjingUrl }" width="750" height="400" style="border: 1px solid #eee;">这里是全景控件</iframe>
					</div>
					<c:forEach items="${biaoqianList }" var="biaoqian">
	 				    <div class="content-item" id="item${biaoqian.orderlist }">
	 				    	<h4><i class="iconfont">&#xe610;</i>${biaoqian.maodian_name }</h4>
	 				    	${biaoqian.maodian_content }
						</div>
 				    </c:forEach>
				</div>
			</div>
			<div class="panorama-details-right">
				<div class="tj-pic">
					<img src="${contextpath}/images/11.jpg">
					<span>神秘宝峰寺</span>
				</div>
				<div class="tj-pic">
					<img src="${contextpath}/images/13.jpg">
					<span>神秘宝峰寺</span>
				</div>
				<ul>
					<h5>相关新闻</h5>
					<div class="clr"></div>
					<li>去年国际旅游人次11.8亿...</li>
					<li>张家界天门山索道今日恢复运...</li>
					<li>23亿元风能发电项目落户桑植...</li>
					<li>武陵源天子山景区联合开展...</li>
					<li>中国游客给新西兰旅游业...</li>
					<li>武陵源天子山景区联合开展...</li>
					<li>中国游客给新西兰旅游业...</li>
				</ul>
			</div>
		</div>
		<!--图标列表-->

		<div id="footer">
		</div>

		<script type="text/javascript" src="${contextpath}/js/jquery.min.js"></script>
		<script src="${contextpath}/js/bootstrap.min.js"></script>
		<script src="${contextpath}/js/jquery.bootstrap-autohidingnavbar.js"></script>
		<script type="text/javascript" src="${contextpath}/js/juheweb.js"></script>
		<script type="text/javascript" src="${contextpath}/js/menu.js"></script>
		<script src="${contextpath}/js/layer/layer.js"></script>
		<script src="${contextpath}/js/common.js"></script>
		<script>

			//		头部悬浮
			$("div.navbar-fixed-top").autoHidingNavbar();
			jQuery(document).ready(function() {
				$("#header").load("${contextpath}/header.htm?type=quanjing");
				$("#footer").load("${contextpath}/footer.htm");
			});
			//			定位悬浮
			$(document).ready(function() {
				$('#menu1').stickyfloat({
					duration : 0
				});
			});
			function jumpQuanjing(secondMenuId) {
				var currentId = "";
				window.location.href = "${contextpath}/quanjing.htm?currentId="
						+ currentId + "&secondMenuId=" + secondMenuId;
			}
		</script>
	</body>

</html>