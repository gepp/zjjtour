<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>注册</title>
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
					<h5>扫描以二维码登录</h5>
				    <p onclick="javascript:window.location.href='https://open.weixin.qq.com/connect/qrconnect?appid=${appid }&redirect_uri=http%3A%2F%2F${callbackurl }%2Fcallback&response_type=code&scope=snsapi_login&state=<%=request.getSession().getId()%>#wechat_redirect'">微信登录</p>
					
				</div>
				<!--二维码 end-->
				<div class="right">
					<h4>注册</h4>
					<img src="${contextpath }/images/logo.png" />
					<div class="mt40">
						<input type="text" placeholder="手机号码"  id="mobile" name="mobile"/>
						<input type="password" placeholder="请输入密码" id="cpassword" name="cpassword"/>
						<div class="yzm">
							<input type="text" placeholder="请输手机验证码" id="verifyCode" name="verifyCode"/>
							<button onclick="sendCode();" id="getCode">获取验证码</button>
						</div>
						<button onclick="register();">注册</button>
						 <input type="hidden" value="${openid }" name="openid" id="openid"/>
				<p class="signup-guide clr"><span>已有账号<a href="${contextpath }/toLogin.htm">立即登录</a></span></p>
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
			function sendCode() {
				var mobile = $("#mobile").val();
				if (trim(mobile) == '') {
					layer.msg('请输入手机号码！');
					return false;
				} else if (!(/^1[3|4|5|7|8]\d{9}$/.test(mobile))) {
					layer.msg("手机号码有误，请 重新输入！");
					$("#mobile").focus();
					return false;
				} else {
					$.ajax({
						type: "post", 
						url: "${contextpath}/isExists.htm?mobile="+mobile, 
						dataType: "json",
						success: function (data) { 
							 var jsonArray=str2json(data);
							 if(jsonArray.data==false){
								 var codeBtn=$("#getCode");
									var ti=120;
									var t=setInterval(function(){
										codeBtn.html("重新获取(<span style='color:red;font-size:16px;padding:0 3px;font-weight:bold;'>"+ ti +"</span>) ");
										ti--;
										if(ti<0){clearInterval(t);codeBtn.html("获取验证码").removeAttr("disabled")}
									},1000);
									codeBtn.attr("disabled","disabled");
								setTimeout('sendCodeTrue()', 100);
							 }else{
								 layer.msg('手机号码已存在,请重新输入您的手机号码！');
								 $("#mobile").focus();
								 return false;
							 }
						} 
				});
				}

			}
			function sendCodeTrue(){
				var mobile = $("#mobile").val();
				 $.ajax({
						type: "post", 
						  async: false,
						url: "${contextpath}/sendCode.htm?mobile="+mobile, 
						dataType: "json",
						success: function (data) { 
							 var jsonArray=str2json(data);
							 if(jsonArray.status=='success'){
								 layer.msg('验证码已发送！');
							 }else{
								 layer.msg(jsonArray.error.msg);
								 $("#mobile").focus();
								 return false;
							 }
						} 
				});
			}
		

			function register() {
				var mobile = $("#mobile").val();
				var verifyCode = $("#verifyCode").val();
				var cpassword = $("#cpassword").val();
				var openid=$("#openid").val();
				if (trim(mobile) == '') {
					layer.msg('请输入手机号码！');
					return false;
				} else if (trim(verifyCode) == '') {
					layer.msg('请输入验证码！');
					return false;
				} else if (trim(cpassword) == '') {
					layer.msg('请输入密码！');
					return false;
				}else if(trim(cpassword).length<6){
					layer.msg('密码最低长度6位！');
					return false;
				}
				
				
				 $.ajax({
						type: "post", 
						  async: false,
						url: "${contextpath}/register.htm?mobile="+mobile+"&verifyCode="+verifyCode+"&cpassword="+cpassword+"&openid="+openid, 
						dataType: "json",
						success: function (data) { 
							 
							 var jsonArray=str2json(data);
							 if(jsonArray.status=='success'){
								 layer.alert('恭喜您,注册成功！', {
									    closeBtn: 0
									}, function(){
									     window.location.href="${contextpath}/";
									});
								 
							 }else{
								 layer.msg(jsonArray.error.msg);
								 $("#mobile").focus();
								 return false;
							 }
						} 
				});

			}
		</script>
	</body>

</html>