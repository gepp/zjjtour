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
			<li>会员中心</li>
			<li>我的活动</li>
		</ul>
	</div>
	<!--面包屑  end-->

	<div class="tourist-center clr">
		<div class="tourist-left">
			<ul>
				<li onclick="window.location.href='${contextpath}/memberCenter.htm'">会员中心</li>
				<li onclick="window.location.href='${contextpath}/toMemberEdit.htm'">个人信息</li>
				<li class="active" onclick="window.location.href='${contextpath}/myActivityList.htm'">我的活动</li>
				<li  onclick="window.location.href='${contextpath}/myTousuList.htm'">我的投诉</li>
			</ul>
		</div>
		<div class="tourist-right">
		 <form method="post" action="${contextpath }/myActivityList.htm" id="myform" name="myform">
				<div class="retrieval clr">
					<div class="form-group">
						<label>标题</label>
						<input type="text" placeholder="请输入检索标题" name="title" value="${title }" />
					</div>
					<div class="form-group">
						<label>状态</label>
							<select  name="activity_status" onchange="doSearch();">
							<option value="" <c:if test="${activity_status==''}">selected</c:if>>全部</option>
							<option value="0" <c:if test="${activity_status=='0'}">selected</c:if>>未开始</option>
							<option value="1" <c:if test="${activity_status=='1'}">selected</c:if>>进行中</option>
							<option value="2" <c:if test="${activity_status=='2'}">selected</c:if>>已结束</option>
					      </select>
					</div>
					 
					<div class="form-group">
						<label>起始时间</label>
						<input class="laydate-icon" value="${start_time_start }" onclick="laydate()" placeholder="请选择起始时间" name="start_time_start" id="start_time_start" >
					</div>
					<div class="form-group">
						<label>截止时间</label>
						<input class="laydate-icon" value="${start_time_end }" onclick="laydate()" placeholder="请选择截止时间" name="start_time_end" id="start_time_end">
					</div>
					<div class="form-group">
						<button type="button" onclick="doSearch();"  style="margin-left: 75px">搜索</button>
					</div>
					
				</div>
			 </form>
				<!--我参加的活动-->
				<div class="tourist-right-item">
						<table cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									 
									<th style="width:140px">标题</th>
									<th>活动开始时间</th>
									<th>活动截止时间</th>
									<th>活动状态</th>
									<th>操作</th>
								</tr>
								<c:forEach items="${activityList }" var="item">
								<tr>
									 
									<td>&nbsp;&nbsp;${item.title }&nbsp;&nbsp;</td>
									<fmt:formatDate value="${item.startTime }" pattern="yyyy-MM-dd" var="startTime"/>
									<fmt:formatDate value="${item.endTime }" pattern="yyyy-MM-dd" var="endTime"/>
									<td>${startTime}</td>
									<td>${endTime }</td>
									<td>${ item.activityStatus==0?'未开始':(item.activityStatus==1?'进行中':'已结束')}</td>
									<td>
									<c:if test="${ item.activityStatus==0}">
									<span onclick="cancelActivity('${item.id}')">取消报名</span>
									</c:if>
									<c:if test="${ item.activityStatus==1}">
									 <span onclick="cancelActivity('${item.id}')">取消报名</span>
									</c:if>
									<c:if test="${ item.activityStatus==2}">
									 <span onclick="cancelActivity('${item.id}')">删除报名</span>
									</c:if>
									</td>
								</tr>
							 </c:forEach>
							</tbody>
						</table>
						 
				</div>
				</div>
	</div>

	<div id="footer">
		 
	</div>

<script type="text/javascript" src="${contextpath}/js/jquery.min.js"></script>
		<script src="${contextpath}/js/bootstrap.min.js"></script>
		<script src="${contextpath}/js/jquery.bootstrap-autohidingnavbar.js"></script>
		<script src="${contextpath}/js/laydate/laydate.js"></script>
		<script src="${contextpath}/js/layer/layer.js"></script>
		
	<script type="text/javascript">
	jQuery(document).ready(function() {
		$("#header").load("${contextpath}/header.htm?type=youke");
		$("#footer").load("${contextpath}/footer.htm");
	});
	function jumpActivity(id){
		window.location.href="${contextpath}/activityDetail.htm?id="+id;
	}
	function doSearch(){
		var complain_time_start=$("#start_time_start").val();
		var complain_time_end=$("#start_time_end").val();
		if(complain_time_start!=''&&complain_time_end!=''){
			  var start_at =  new Date(complain_time_start.replace(/^(\d{4})(\d{2})(\d{2})$/,"$1/$2/$3"));
		      var end_at = new Date(complain_time_end.replace(/^(\d{4})(\d{2})(\d{2})$/,"$1/$2/$3"));
		      if(start_at > end_at) {
				  layer.alert('起始时间应该小于截止时间，请重新选择', {
						closeBtn: 0
					}, function(index){
						layer.close(index);
						 
					});
				  return false;
				} 
		}
		$("#myform").submit();
	}
	
	function cancelActivity(id){
		layer.confirm('您确认取消您所选择的活动？',function(index){
			//ajax提交删除数据
			jQuery.ajax({
						type: "post", 
						url: "${contextpath}/cancelActivity.htm?activity_id="+id, 
						dataType: "json",
						success: function (data) { 
							layer.close(index);
							if(data.status=='success'){
								layer.alert('取消报名成功', {
									closeBtn: 0
								}, function(index){
									layer.close(index);
									window.location.reload();
								});
							}else{
								layer.close(index);
								layer.alert(data.message, {
									closeBtn: 0
								}, function(index){
									layer.close(index);
									window.location.reload();
								});
							}
							
							 
						} 
				});
		});
	}
	</script>
</body>

</html>