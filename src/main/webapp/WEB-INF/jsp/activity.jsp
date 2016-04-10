<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<div id="header"></div>

	<img src="${contextpath }/images/08.jpg" style="width: 100%" />
	<!--面包屑-->
	<div class="page-breadcrumbs">
		<ul class="clr">
			<span>当前位置：</span>
			<li><a href="${contextpath }/">首页</a></li>
			<li><a href="${contextpath }/activity.htm">活动</a></li>
			<li>精彩活动</li>
		</ul>
	</div>
	<!--面包屑  end-->
	<div class="list-label">

		<button <c:if test="${activityStatus=='' }">class="active"</c:if>
			onclick="jumpActivity('')">全部</button>
		<button <c:if test="${activityStatus=='0' }">class="active"</c:if>
			onclick="jumpActivity('0')">未开始</button>
		<button <c:if test="${activityStatus=='1' }">class="active"</c:if>
			onclick="jumpActivity('1')">进行中</button>
		<button <c:if test="${activityStatus=='2' }">class="active"</c:if>
			onclick="jumpActivity('2')">已结束</button>
	</div>
	<!--图片列表-->
	<div class="activity-item-list">
		<ul class="clr">
			<c:forEach items="${pageList.list }" var="item">
				<li class="transition" onclick="jumpDetail('${item.id}')">
					<div class="img-content">
						<img src="${item.smallimg }" class="transition">
						<c:if test="${item.topStatus==1 }">
							<i class="iconfont">&#xe617;</i>
						</c:if>
						<span>活动介绍：${item.abstractContent }</span>
					</div>
					<div class="intro">
						<h5 class="transition">${item.title }</h5>
						<fmt:formatDate value="${item.startTime }" pattern="yyyy-MM-dd"
							var="startTime" />
						<fmt:formatDate value="${item.endTime }" pattern="yyyy-MM-dd"
							var="endTime" />
						<span class="transition"><font class="transition">活动时间:</font>${startTime }至${endTime }</span>
						<span class="transition"><font class="transition">报名人数:</font>${item.usercount }</span>
					</div> <c:if test="${item.activityStatus==0 }">
						<div class="activity  not-started">
							<i class="iconfont">&#xe61e;</i>
						</div>
					</c:if> <c:if test="${item.activityStatus==1 }">
						<div class="activity  start">
							<i class="iconfont">&#xe61d;</i>
						</div>
					</c:if> <c:if test="${item.activityStatus==2 }">
						<div class="activity  end">
							<i class="iconfont">&#xe61f;</i>
						</div>
					</c:if>



				</li>
			</c:forEach>
		</ul>
		<page:page href="${contextpath}/activity.htm?activityStatus=${activityStatus }" data="pageList" />


	</div>
	<!--图标列表-->

	<div id="footer"></div>




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
			$("#header").load("${contextpath}/header.htm?type=yule");
			$("#footer").load("${contextpath}/footer.htm");
		});

		function jumpActivity(activityStatus) {
			window.location.href = "${contextpath}/activity.htm?activityStatus="
					+ activityStatus;
		}
		function jumpDetail(id) {
			window.location.href = "${contextpath}/activityDetail.htm?id=" + id;
		}
	</script>
</body>

</html>