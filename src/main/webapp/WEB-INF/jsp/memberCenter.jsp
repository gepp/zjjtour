<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>个人中心</title>
</head>
<link rel="stylesheet" href="${contextpath}/css/style.css" />
<link rel="stylesheet" href="${contextpath}/font/iconfont.css" />

<body>
	 <div id="header"></div>

	<!--面包屑-->
	<div class="page-breadcrumbs white">
		<ul class="clr">
			<span>当前位置：</span>
			<li><a href="${contextpath }/">首页</a></li>
			<li>游客中心</li>
		</ul>
	</div>
	<!--面包屑  end-->

	<!--游客中心-->
	<div class="tourist-center clr">

		
		<div class="tourist-left">
			<ul>
				<li class="active">游客中心</li>
				<li onclick="window.location.href='${contextpath}/toMemberEdit.htm'">个人信息</li>
				<li onclick="window.location.href='${contextpath}/myActivityList.htm'">我的活动</li>
				<li  onclick="window.location.href='${contextpath}/myTousuList.htm'">我的投诉</li>
			</ul>
		</div>
		<div class="tourist-right">
		<div class="tourist-top clr">
			<div class="header-img">
				
				<img   src="<c:if test="${member.data.cheadimgurl==null }">${contextpath }/images/4.jpg</c:if><c:if test="${member.data.cheadimgurl!=null }">${contextpath}${member.data.cheadimgurl }</c:if>
									">
			</div>
			<ul>
			
				<li><span>姓名:</span><font>${member.data.cname }</font></li>
				<li><span>性别:</span><font><c:if test="${member.data.csex==null }">未设置</c:if><c:if test="${member.data.csex!=null }">
				<c:if test="${member.data.csex=='man'}">男</c:if>
				<c:if test="${member.data.csex!='man' }">女</c:if>
				</c:if></font></li>
 				<li><span>生日:</span><font><c:if test="${member.data.dbirthday==null }">未设置</c:if><c:if test="${member.data.dbirthday!=null }">
 				${dbirthday }</c:if></font></li>
				<li><span>手机:</span><font>${member.data.ctel }</font></li>
				<li><span>邮箱:</span><font>${member.data.cemail }</font></li>
			</ul>
			<a href="${contextpath }/toMemberEdit.htm">信息修改</a>
		</div>
			<!--我参加的活动-->
			<div class="tourist-right-item">
				<div class="item-title clr">
					<h5>我参加的活动</h5>
				</div>
				<div class="item-content">
					<ul class="clr">
						
						<c:forEach items="${activityList }" var="activity">
						<li class="transition" onclick="jumpActivity('${activity.id}')">
							<div class="img-content">
								<img src="${activity.indeximg }" class="transition"> <span>活动介绍：${activity.abstractContent }</span>
							</div>
							<div class="intro">
								<h6>${activity.title }</h6>
							</div>
						</li>
						</c:forEach>
						 
					</ul>
				</div>
			</div>
			<!--我参加的活动 end-->
			 
		</div>
	</div>
	<!--游客中心 end-->

	<div id="footer">
		 
	</div>

	<script type="text/javascript" src="${contextpath}/js/jquery.min.js"></script>
	<script src="${contextpath}/js/bootstrap.min.js"></script>
	<script src="${contextpath}/js/jquery.bootstrap-autohidingnavbar.js"></script>
		<script src="${contextpath}/js/layer/layer.js"></script>

	<script>
	jQuery(document).ready(function() {
		$("#header").load("${contextpath}/header.htm?type=youke");
		$("#footer").load("${contextpath}/footer.htm");
	});
	function jumpActivity(id){
		window.location.href="${contextpath}/activityDetail.htm?id="+id;
	}
	</script>
</body>

</html>