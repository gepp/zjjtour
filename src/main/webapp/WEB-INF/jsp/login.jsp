<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>登录</title>
	</head>
	<link rel="stylesheet" href="${contextpath}/css/style.css" />
	<link rel="stylesheet" href="${contextpath}/font/iconfont.css" />

	<body>
		 <div id="header"></div>
		 <!-- banner -->
		<div class="login-bg">
			<img src="${contextpath }/images/banner1.png"  class="blur"/>
			<div class="blackBg"></div>
			<!--登录内容-->
			<div class="login clr">
				<!--二维码-->
				<div class="left">
				<img src="${contextpath}/images/qrcode_for_gh_14fe25658a90_344.jpg" />
					<h5>扫描关注张家界旅游官方微信</h5>
					<p onclick="javascript:window.location.href='https://open.weixin.qq.com/connect/qrconnect?appid=${appid }&redirect_uri=http%3A%2F%2F${callbackurl }%2Fcallback&response_type=code&scope=snsapi_login&state=<%=request.getSession().getId()%>#wechat_redirect'">微信登录</p>
				</div>
				<!--二维码 end-->
				<div class="right">
					<h4>登录</h4>
					<img src="${contextpath }/images/logo.png" />
					<div class="mt85">
						<input type="text" placeholder="请输入用户名" id="mobile" name="mobile"/>
						<input type="password" placeholder="请输入密码" id="cpassword" name="cpassword"/>
						<br/>
						<button onclick="login();">登录</button>
						<input type="hidden" value="${openid }" name="openid" id="openid"/>
						<p class="clr"><span><a href="${contextpath }/toRegister.htm">免费注册</a></span><a href="${contextpath}/toGetPwd.htm">忘记密码</a></p>
					</div>
				</div>
			</div>
			<!--登录内容 end-->
		</div>
		<!--banner end-->
		 
	 
		<div id="footer">
			 
		</div>

		
		
		
		<script type="text/javascript" src="${contextpath}/js/jquery.min.js"></script>
		<script src="${contextpath}/js/bootstrap.min.js"></script>
		<script src="${contextpath}/js/jquery.bootstrap-autohidingnavbar.js"></script>
		<script src="${contextpath}/js/layer/layer.js"></script>
		<script src="${contextpath}/js/common.js"></script>
		<script>
		jQuery(document).ready(function() {
			$("#header").load("${contextpath}/header.htm?type=index");
			$("#footer").load("${contextpath}/footer.htm");
		});
	 
		 $(document).keyup(function(event){ 
		    var keycode = event.which; 
		    //处理回车的情况 
		    if(keycode==13){ 
		    	if(document.title='登录'){
		    		login();
		    	}
		   } 
		    
		}); 
		function login(){
			var mobile = $("#mobile").val();
			var cpassword = $("#cpassword").val();
			var openid=$("#openid").val();
			if (trim(mobile) == '') {
				layer.msg('请输入手机号码！');
				return false;
			} else if (trim(cpassword) == '') {
				layer.msg('请输入密码！');
				return false;
			}
			
			 $.ajax({
					type: "post", 
					  async: false,
					url: "${contextpath}/login.htm?mobile="+mobile+"&cpassword="+cpassword+"&openid="+openid, 
					dataType: "json",
					success: function (data) { 
						 var jsonArray=str2json(data);
						 if(jsonArray.status=='success'){
							 layer.load(3, {
								    shade: [0.6,'#fff'] //0.1透明度的白色背景
								});
							 if('${retrunUrl}'==''){
								 window.location.href="${contextpath}/";
							 }else{
								 window.location.href="${retrunUrl}";
							 }
							 
						 }else{
							 layer.msg(jsonArray.error.msg);
							 $("#mobile").focus();
							 return false;
						 }
					} 
			});
		}
		
			//		头部悬浮
			$("div.navbar-fixed-top").autoHidingNavbar();
			jQuery(document).ready(function() {
				var qcloud = {};
				$('[_t_nav]').hover(function() {
					var _nav = $(this).attr('_t_nav');
					clearTimeout(qcloud[_nav + '_timer']);
					qcloud[_nav + '_timer'] = setTimeout(function() {
						$('[_t_nav]').each(function() {
							$(this)[_nav == $(this).attr('_t_nav') ? 'addClass' : 'removeClass']('nav-up-selected');
						});
						$('#' + _nav).stop(true, true).slideDown(200);
					}, 150);
				}, function() {
					var _nav = $(this).attr('_t_nav');
					clearTimeout(qcloud[_nav + '_timer']);
					qcloud[_nav + '_timer'] = setTimeout(function() {
						$('[_t_nav]').removeClass('nav-up-selected');
						$('#' + _nav).stop(true, true).slideUp(200);
					}, 150);
				});
			});
		</script>
	</body>

</html>