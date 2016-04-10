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
				<li><a href="#">游客中心</a></li>
				<li>个人信息</li>
			</ul>
		</div>
		<!--面包屑  end-->

		<!--游客中心-->
		<div class="tourist-center clr">
			<div class="tourist-left">
				<ul>
					<li onclick="window.location.href='${contextpath}/memberCenter.htm'">游客中心</li>
					<li class="active">个人信息</li>
					<li  onclick="window.location.href='${contextpath}/myActivityList.htm'">我的活动</li>
					<li  onclick="window.location.href='${contextpath}/myTousuList.htm'">我的投诉</li>
				</ul>
			</div>
			<div class="tourist-right">
				<!--我的活动编辑-->
				<form method="post" action="${contextpath }/memberEditAction.htm" id="postForm" name="postForm">
				<div class="tourist-right-item">
					<div class="item-title clr">
						<h5>个人信息编辑</h5>
					</div>
					<div class="item-content">
						<div class="retrieval lg clr">
							<div class="form-group">
								<label>*头像</label>
								<div class="thumbnail clr">
									<div class="thumbnail-img">
									<img id="memberImage" name="memberImage" src="
									<c:if test="${member.data.cheadimgurl==null }">${contextpath }/images/4.jpg</c:if><c:if test="${member.data.cheadimgurl!=null }">${contextpath}${member.data.cheadimgurl }</c:if>
									">
									</div>
									<div class="upload"><i class="iconfont">&#xe619;</i>
									 	<input type="file" value="" capture="camera" accept="image/*" id="cameraInput" name="cameraInput"/>
										<canvas id="myCanvas" style="display:none"></canvas>
										<input type="hidden" value="" name="memberImage1" id="memberImage1"/>
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<label>真实姓名</label>
								<input type="text" placeholder="请输入真实姓名" name="cname" value="${member.data.cname }"/>
							</div>
							<div class="form-group">
								<label>昵称</label>
								<input type="text" placeholder="请输入昵称" name="cnickname"  value="${member.data.cnickname }"/>
							</div>
							 
							<div class="form-group">
								<label>邮箱</label>
								<input type="text" id="cemail" placeholder="请输入邮箱" name="cemail" value="${member.data.cemail }"/>
							</div>
							<div class="form-group">
								<label>性别</label>
								<div class="sex">
									<label>
										
										<input type="radio" name="csex" value="man"  <c:if test="${member.data.csex=='man' }">checked</c:if>/>
										<span class="text">男</span>
									</label>
									<label>
										<input type="radio"  name="csex" value="wom" <c:if test="${member.data.csex=='wom' }">checked</c:if>/>
										<span class="text">女</span>
									</label>
								</div>
							</div>
							<div class="form-group">
								<label>生日</label>
								<input class="laydate-icon" onclick="laydate()" placeholder="请选择生日时间" name="dbirthday"  value="${dbirthday}">
							</div>
							 
							<div class="form-group">
								<label></label>
								<button type="button" onclick="dosubmit();">保存</button>
								<!-- <button>更改密码</button> -->
							</div>
						</div>
					</div>
				</div>
				</form>
				<!--我的活动编辑 end-->
			</div>
		</div>
		<!--游客中心 end-->

		<div id="footer">
			 
		</div>

		<script type="text/javascript" src="${contextpath}/js/jquery.min.js"></script>
		<script src="${contextpath}/js/bootstrap.min.js"></script>
		<script src="${contextpath}/js/jquery.bootstrap-autohidingnavbar.js"></script>
		<script src="${contextpath}/js/laydate/laydate.js"></script>
		<script src="${contextpath}/js/MegaPixImage.js" type="text/javascript"></script>
		<script src="${contextpath}/js/exif.min.js" type="text/javascript"></script>
 		<script src="${contextpath}/js/layer/layer.js"></script>
		<script src="${contextpath}/js/common.js"></script>
	</body>

<script type="text/javascript">
jQuery(document).ready(function() {
	$("#header").load("${contextpath}/header.htm?type=youke");
	$("#footer").load("${contextpath}/footer.htm");
	  var fileInput = document.getElementById('cameraInput');
      fileInput.onchange = function () {
          var file = fileInput.files[0];
          var mpImg = new MegaPixImage(file);
          var resCanvas1 = document.getElementById('myCanvas');
          var _max = 320;
          EXIF.getData(file, function(){ 
              var Orientation= EXIF.getTag(this,'Orientation'); 
               mpImg.render(resCanvas1, {
              maxHeight: _max,
              orientation: Orientation
          });
              
          }); 
          setTimeout(function(){
        	  $("#memberImage").attr("src",resCanvas1.toDataURL());
        	  $("#memberImage1").val(resCanvas1.toDataURL());
          },100);

      };
});
function dosubmit(){
	 var str = document.getElementById('cemail').value.trim();    
     if(str.length!=0){    
     reg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;    
     if(!reg.test(str)){    
    	 layer.msg("对不起，请输入正确的邮箱!");
    	 return false;
     }    
     }   
	$("#postForm").submit();
}
</script>
</html>