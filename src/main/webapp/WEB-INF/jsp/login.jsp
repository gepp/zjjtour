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
		<!--登录-->
		<div class="login clr">
			<div class="login-left">
				<h4>登录</h4>
				<input type="text" placeholder="请输入用户名" id="mobile" name="mobile"/>
				<input type="password" placeholder="请输入密码" id="cpassword" name="cpassword"/>
				<label>
					<input type="checkbox" />
					<span class="text">记住用户名</span>
				</label>
				<button onclick="login();">登录</button>
				<p class="signup-guide clr"><span>没有账号？<a href="${contextpath }/toRegister.htm">免费注册</a></span><span>忘记密码？</span></p>
			</div>
			<div class="login-right">
				<h4>微信扫描登录</h4>
				<img src="${contextpath}/images/mmqrcode.jpg" />
			</div>
		</div>
		<!--登录 end-->
		
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
		function login(){
			var mobile = $("#mobile").val();
			var cpassword = $("#cpassword").val();
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
					url: "${contextpath}/login.htm?mobile="+mobile+"&cpassword="+cpassword, 
					dataType: "json",
					success: function (data) { 
						 var jsonArray=str2json(data);
						 if(jsonArray.status=='success'){
							 layer.load(3, {
								    shade: [0.6,'#fff'] //0.1透明度的白色背景
								});
							 window.location.href="${contextpath}/";
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