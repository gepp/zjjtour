<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>${activity.title }</title>
	</head>
	<link rel="stylesheet" href="${contextpath }/css/style.css" />
	<link rel="stylesheet" href="${contextpath }/font/iconfont.css" />
	 

	<body>
		 
		 <div id="header"></div>
		 
		<img src="${xiuxian.img }" style="width: 100%" />
		<!--面包屑-->
		<div class="page-breadcrumbs">
			<ul class="clr">
				<span>当前位置：</span>
				<li><a href="${contextpath }/">首页</a></li>
				<li><a href="${contextpath }/activity.htm">${xiuxian.name }</a></li>
				<li>精彩活动</li>
			</ul>
		</div>
		<!--面包屑  end-->
		  <div class="panorama-details clr">
			<div class="section">
				<div class="news-font-list">
					<div class="event-details clr">
						<img src="${activity.indeximg }" />
						<div class="event-details-right">
							<h4>${activity.title }</h4>
							<fmt:formatDate value="${activity.startTime }" pattern="yyyy-MM-dd" var="startTime"/>
							<fmt:formatDate value="${activity.endTime }" pattern="yyyy-MM-dd" var="endTime"/>
							<span><font>活动介绍：</font>${activity.abstractContent }</span>
							<span><font>活动时间：</font>${startTime }至${endTime }</span>
							<c:if test="${activity.supportStatus==1 }">
							<span><font>已报名人数：</font>${activity.usercount }</span>
							<span><font>活动状态：</font>
							<c:if test="${activity.activityStatus==0 }">未开始</c:if>
							<c:if test="${activity.activityStatus==1 }">火热进行中</c:if>
							<c:if test="${activity.activityStatus==2 }">已结束</c:if>
							</span>
							<!--下面的按钮不可点击时，把“carried-out”换成“active”-->
							<c:if test="${activity.activityStatus==0 }">
							<button class="active" >未开始</button>
							</c:if>
							
							<c:if test="${activity.activityStatus==1 }">
							<button class="carried-out" onclick="checkUser('${activity.activityStatus }','${activity.id }')">我要报名</button>
							</c:if>
							<c:if test="${activity.activityStatus==2 }">
							<button class="active" >已结束</button>
							</c:if>
							</c:if>
						</div>
					</div>
					<div class="news-content">
					${activity.content }
					</div>
				<!--分页-->
				<!-- <div class="page">
					<ul class="clr">
						<li title="下一个活动"><i class="iconfont">&#xe611;</i></li>
						<li title="上一活动"><i class="iconfont">&#xe611;</i></li>
					</ul>
				</div> -->
				<!--分页end-->
				</div>
			</div>
			 <div id="rightNews"></div>
		</div>
		 
<div id="footer">
		</div>
		 
		
		<!--<script src="${contextpath }/js/jquery-2.1.0.js"></script>-->
		<script type="text/javascript" src="${contextpath }/js/jquery.js"></script>
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
				var secondMenuId=$("#secondMenuId").val();
				var bqId=$("#currentId").val();
				window.location.href='${contextpath}/quanjingDetail.htm?id='+id+"&bqId="+bqId+"&secondMenuId="+secondMenuId;
			}
			function jumpTingwen(secondMenuId){
				window.location.href="${contextpath}/tingwen.htm?secondMenuId="+secondMenuId;
			}
			
			function jumpChangyou(secondMenuId){
				window.location.href="${contextpath}/changyou.htm?secondMenuId="+secondMenuId;
			}
			function checkUser(status,id){
				if(status!=1){
					layer.msg('您好，活动暂未开始或已结束！');
					return false;
				}
				$.ajax({
					type: "post", 
					url: "${contextpath}/checkActivity.htm?id="+id, 
					dataType: "json",
					success: function (data) { 
						 if(data.status=='success'){
							 layer.alert('恭喜您,报名成功！', {
								    closeBtn: 0
								}, function(){
									window.location.reload();
								});
							 
						 }else if(data.status=='001'){
							 layer.open({
									type : 2, 
									title : '登录',
									shadeClose : true,
									shade : 0.8,
									area : [ '540px', '40%' ],
									content : '${contextpath}/loginForm.htm'
								});
							
							 
						 } else if(data.status=='002'){
							 layer.alert('本活动您已报名，可在会员中心中查看！', {
								    closeBtn: 0
								}, function(){
									window.location.reload();
								});
							  
						 }
					} 
			});
			}
			
		</script>
	</body>

</html>