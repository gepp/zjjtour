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
		 
		<div id="header"></div>
		 
		<img src="${xiuxian.img }" width="100%"/>
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
			<c:forEach var="menu" items="${secondMenuList }">
			<button onclick="jumpXiuxian('${menu.id}')" <c:if test="${secondMenuId==menu.id}"> class="active"</c:if>>${menu.name }</button>
			</c:forEach>
		</div>
		<!--分类标签 end-->
		 <div class="panorama-details clr">
			<div class="section">
				<div class="news-font-list">
					 
					<div class="news-content">
						 ${securityNews.content }
					</div>
				<!--分页-->
				<!-- <div class="page">
					<ul class="clr">
						<li title="下一篇"><i class="iconfont">&#xe611;</i></li>
						<li title="上一篇"><i class="iconfont">&#xe611;</i></li>
					</ul>
				</div> -->
				<!--分页end-->
				</div>
			</div>
			<div id="rightNews">
			 
			</div>
		  </div>
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
		$("#rightNews").load("${contextpath}/right.htm");
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