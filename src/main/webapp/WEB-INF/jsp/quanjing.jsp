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
				<li><a href="#">首页</a></li>
				<li><a href="#">全景</a></li>
				<li><a href="#">绝美风光</a></li>
				<li>地标美景</li>
			</ul>
		</div>
		<!--面包屑  end-->
		<!--分类标题-->
		<div class="list-title">
			<ul class="clr">
				<c:forEach var="secondMenu" items="${secondMenuList }">
				<li <c:if test="${secondMenu.id==secondMenuId}">class="transition active"</c:if>
					<c:if test="${secondMenu.id!=secondMenuId}">class="transition "</c:if>
				onclick="jumpQuanjing('${secondMenu.id}')">${secondMenu.name }</li>
				</c:forEach>
				
			</ul>
		</div>
		<!--分类标题 end-->
		<!--分类标签-->
		<div class="list-label">
			<c:forEach var="bq" items="${bqMenuList }">
			<button onclick="gotoBiaoqian('${bq.id}')" <c:if test="${bq.id==currentId}">class="active"</c:if>>${bq.name }</button>
			</c:forEach>
		</div>
		<!--分类标签 end-->
		<!--图片列表-->
		<div class="item-list">
			<ul class="clr" id="newsListUl">
				<c:forEach items="${quanjingList }" var="quanjingNews">
				<li class="transition" onclick="jumpDetail('${quanjingNews.id}')">
					<div class="img-content"><img src="${quanjingNews.indeximg }" class="transition"><span>${quanjingNews.abstract_content }</span></div>
					<h5 class="transition">${quanjingNews.title }</h5>
				</li>
				</c:forEach>
			</ul>
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
			//		头部悬浮
			$("div.navbar-fixed-top").autoHidingNavbar();
			jQuery(document).ready(function() {
				$("#header").load("${contextpath}/header.htm?type=quanjing");
				$("#footer").load("${contextpath}/footer.htm");
			});
			
			function jumpDetail(id){
				var secondMenuId=$("#secondMenuId").val();
				var bqId=$("#currentId").val();
				window.location.href='${contextpath}/quanjingDetail.htm?id='+id+"&bqId="+bqId+"&secondMenuId="+secondMenuId;
			}
			function gotoBiaoqian(bqId){
				var secondMenuId=$("#secondMenuId").val();
				 
				window.location.href="${contextpath}/quanjing.htm?currentId="+bqId+"&secondMenuId="+secondMenuId;
			}
			
		</script>
	</body>

</html>