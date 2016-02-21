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
		 
		<div id="header"></div>
		 
		<img src="${xiuxian.img }" width="100%" height="500px"/>
		<!--面包屑-->
		<div class="page-breadcrumbs">
			<ul class="clr">
				<span>当前位置：</span>
				<li><a href="${contextpath }/">首页</a></li>
				<li><a href="#">${xiuxian.name }</a></li>
				<li><a href="#">${thirdShowName }</a></li>
			</ul>
		</div>
		<!--面包屑  end-->
		<!--分类标签-->
		<div class="list-label">
			<button onclick="jumpXiuxian('')" <c:if test="${secondMenuId==''}"> class="active"</c:if>>全部</button>
			<c:forEach var="menu" items="${secondMenuList }">
			<button onclick="jumpXiuxian('${menu.id}')" <c:if test="${secondMenuId==menu.id}"> class="active"</c:if>>${menu.name }</button>
			</c:forEach>
		</div>
		<!--分类标签 end-->
		 
		 <!--新闻列表-->
		 <div class="news-list">
								<ul class="clr">
									<c:forEach var="item" items="${newsList }">
									<li class="transition" onclick="jumpDetail('${item.id}')">
										<div class="news-list-img">
											<img src="${item.indeximg }" class="transition">
										</div>
										<h5 class="transition">${item.title }</h5>
										<p>${item.abstract_content }</p>
										<span class="time">${item.ctime }</span>
										<span class="number"><i class="iconfont">&#xe616;</i>0</span>
									</li>
									 </c:forEach>
								</ul>
								<!--分页-->
								<!-- <div class="page">
									<ul class="clr">
										<li><i class="iconfont">&#xe611;</i></li>
										<li>10</li>
										<li>9</li>
										<li>8</li>
										<li class="none">……</li>
										<li>3</li>
										<li>2</li>
										<li class="active">1</li>
										<li><i class="iconfont">&#xe611;</i></li>
									</ul>
								</div> -->
								<!--分页end-->
							</div>
		<!--图标列表-->	
		
		<input type="hidden" name="secondMenuId" id="secondMenuId" value="${secondMenuId }"/>
		<input type="hidden" name="currentId" id="currentId" value="${currentId }"/>
		<div id="footer">
			 
		</div>

		 
		
		<script type="text/javascript" src="${contextpath }/js/jquery.min.js"></script>
		<script src="${contextpath }/js/bootstrap.min.js"></script>
		<script src="${contextpath }/js/jquery.bootstrap-autohidingnavbar.js"></script>
		<script src="${contextpath}/js/layer/layer.js"></script>
		<script src="${contextpath}/js/common.js"></script>
		<script>
		jQuery(document).ready(function() {
		$("#header").load("${contextpath}/header.htm?type=xiuxian");
		$("#footer").load("${contextpath}/footer.htm");
		});
			function jumpQuanjing(secondMenuId){
				var currentId="";
				window.location.href="${contextpath}/quanjing.htm?currentId="+currentId+"&secondMenuId="+secondMenuId;
			
				/* var currentId=$("#currentId").val();
				$.ajax({
					url : "${contextpath}/newsList.htm?currentId="+currentId+"&secondMenuId="+secondMenuId,
					type : "post",
					success : function(data) {
						var str="";
						for(var i=0;i<data.length;i++){
							var item=data[i];
							str=str+"<li class=\"transition\">"
							+"<div class=\"img-content\"><img src=\""+item.indeximg+"\" class=\"transition\"><span>"+item.abstract_content+"</span></div>"
							+"<h5 class=\"transition\">"+item.title+"</h5></li>";
						}
						console.log("str:"+str);
						
						$("#newsListUl").text(str);
					}
				}); */
				
			}
			function jumpDetail(id){
				window.location.href='${contextpath}/xiuxianDetail.htm?id='+id;
			}
			function jumpXiuxian(secondMenuId){
				window.location.href="${contextpath}/xiuxian.htm?secondMenuId="+secondMenuId;
			}
		 
			
		</script>
	</body>

</html>