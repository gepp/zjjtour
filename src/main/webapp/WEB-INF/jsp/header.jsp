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
	<link rel="shortcut icon" href="${contextpath }/favicon.ico"/>
	<link rel="bookmark" href="${contextpath }/favicon.ico"/>
	<link rel="stylesheet" href="${contextpath }/css/tianqi.css" />
	<script src="${contextpath }/js/jquery.bootstrap-autohidingnavbar.js"></script>

	<body>
		<!--视频弹窗遮罩  这一段需要放在前面-->
		<div class="box"></div>
		<div class="navbar-fixed-top clr topNav"  >
			<div class="logo" onclick="window.location.href='${contextpath}/'">
				<img src="${contextpath }/images/logo.png"/>
			</div>
			<div class="logo-title">
				<h6>张家界市人民政府旅游官网</h6>
				<h4>走遍全世界&nbsp;&nbsp;还是张家界</h4>
			</div>
			<div class="logo-right">
				<div class="logo-right-top clr">
				<c:if test="${member!=null }">
					<div class="login">
						<a href="${contextpath }/memberCenter.htm">欢迎您,${member.data.cloginname }</a><a href="javascript:void(0)" onclick="logout();">退出</a>
					</div>

				</c:if>
				<c:if test="${member==null }">
					<div class="login">
						<a href="${contextpath }/toLogin.htm">登录</a><a
							href="${contextpath }/toRegister.htm">注册</a>
					</div>
				</c:if>
				<div class="search">
						<input type="text" class="transition" placeholder="请输入搜索关键字" value="${keyword }" autocomplete="off" id="keyword" >
						<button class="iconfont transition" type="button" onclick="search()">&#xe605;</button>
						<!--搜索提示-->
							<div id="searchTag" style="display:none">
								 
								<p><span>热门标签：</span>
								<c:forEach items="${wordList }" var="word">
								<a href="javascript:void(0)" onClick="searchSelectKeyword('${word.name}')">${word.name }</a>
								</c:forEach>
								</p>
							</div>
							<!--搜索提示 end-->
					</div>
				<div class="weather topWeather" style="height:25px;line-height:25px;cursor:pointer;overflow:hidden">
				<div style="float:left">张家界&nbsp;&nbsp;&nbsp;</div>
				<div style="float:left" class="${realPic }"  style="border:0;width:25px;height:25px;vertical-align:middle;float:left">
				</div>
				 <span style="float:left">${leixing }&nbsp;&nbsp;</span>
				<span style="color:#c30;font-family:Arial;float:left">${upWendu }</span>
				～
				<span style="color:#390;font-family:Arial;margin-right:10px">${downWendu }℃</span>
				<strong>${xingqi }&nbsp;&nbsp;</strong>
					</div>						
 				</div>
				<div class="logo-right-bottom">
					<!--导航-->
					<ul class="nav navbar-nav clr">
						
						<li class="<c:if test="${type=='index'||type=='' }">active</c:if>" _t_nav="home">
							<div class="normal"><a href="${contextpath }/"><i class="iconfont font-150">&#xe608;</i></a></div>
						</li>
						<li _t_nav="shijue" class="<c:if test="${type=='shipin' }">active</c:if>">
							<div class="normal"><a href="${contextpath }/shipin.htm">视界</a></div>
						</li>
						<li _t_nav="panorama" class="<c:if test="${type=='quanjing' }">active</c:if>">
							<div class="normal"><a href="${contextpath }/quanjing.htm">资讯</a></div>
						</li>
						<li _t_nav="activity" class="<c:if test="${type=='changyou' }">active</c:if>">
							<div class="normal"><a href="${contextpath }/changyou.htm">畅游</a></div>
						</li>
						<li _t_nav="news" class="<c:if test="${type=='yule' }">active</c:if>">
							<div class="normal"><a href="${contextpath }/activity.htm">活动</a></div>
						</li>
						<li _t_nav="xiuxian" class="<c:if test="${type=='xiuxian' }">active</c:if>">
							<div class="normal"><a href="${contextpath }/xiuxian.htm?secondMenuId=1091">市情</a></div>
						</li>
						<li _t_nav="community" class="<c:if test="${type=='tingwen' }">active</c:if>">
							<div class="normal"><a href="${contextpath }/tingwen.htm">新闻</a></div>
						</li>
						<li _t_nav="route" class="<c:if test="${type=='youke' }">active</c:if>">
							<div class="normal"><a href="${contextpath }/about.htm?secondMenuId=1118">游客中心</a></div>
						</li>
						<c:forEach var="otherNew" items="${otherNewsMenuList }">
						
						<li _t_nav="${otherNew.id }" class="<c:if test="${type=='otherNew.id' }">active</c:if>">
							<div class="normal"><a href="${contextpath }/other.htm?otherId=${otherNew.id}">${otherNew.name }</a></div>
						</li>
							
						</c:forEach>
					</ul>
					<div class="navigation-down phone-header">
						
						<div id="shijue" class="nav-down-menu" style="display: none;" _t_nav="shijue">
							<div class="item">
								<ul class="clr">
									<c:forEach var="menu"  items="${videoMenuList }">
									<li class="transition" onclick="jumpShipinM('${menu.id }')">
										<div class="img-content"><img src="${menu.img }" class="transition"><span>${menu.description }</span></div>
										<h5 class="transition">${menu.name }</h5>
									</li>
									 </c:forEach>
								</ul>
							</div>
						</div>
						
						<div id="panorama" class="nav-down-menu" style="display: none;" _t_nav="panorama">
							<div class="item">
								<ul class="clr">
									<c:forEach var="menu"  items="${quanjingMenuList }">
									<li class="transition" onclick="jumpQuanjing('${menu.id }')">
										<div class="img-content"><img src="${menu.img }" class="transition"><span>${menu.description }</span></div>
										<h5 class="transition">${menu.name }</h5>
									</li>
									 </c:forEach>
								</ul>
							</div>
						</div>
						<div id="activity" class="nav-down-menu" style="display: none;" _t_nav="activity">
							<div class="item">
								<ul class="clr">
									<c:forEach var="menu"  items="${changyouMenuList }">
									<li class="transition" onclick="jumpChangyou('${menu.id}')">
										<div class="img-content"><img src="${menu.img }" class="transition"><span>${menu.description }</span></div>
										<h5 class="transition">${menu.name }</h5>
									</li>
									 </c:forEach>
								</ul>
							</div>
						</div>
						<div id="news" class="nav-down-menu" style="display: none;" _t_nav="news">
						</div>
							<div id="xiuxian" class="nav-down-menu" style="display: none;" _t_nav="xiuxian">
							<div class="item">
								<ul class="clr">
									<c:forEach var="menu"  items="${xiuxianMenuList }">
									<li class="transition" onclick="jumpXiuxian('${menu.id}');" >
										<div class="img-content"><img src="${menu.img }" class="transition"><span>${menu.description }</span></div>
										<h5 class="transition">${menu.name }</h5>
									</li>
									 </c:forEach>
								</ul>
							</div>
						</div>
						
						<div id="community" class="nav-down-menu" style="display: none;" _t_nav="community">
							<div class="item">
								<ul class="clr">
									<c:forEach var="menu"  items="${tingwenMenuList }">
									<li class="transition" onclick="jumpTingwen('${menu.id}');" >
										<div class="img-content"><img src="${menu.img }" class="transition"><span>${menu.description }</span></div>
										<h5 class="transition">${menu.name }</h5>
									</li>
									 </c:forEach>
								</ul>
							</div>
						</div>
						
						<div id="route" class="nav-down-menu" style="display: none;" _t_nav="route">
							 
						</div>
						
						<c:forEach var="newMap" items="${newsMap }">
							<div id="${newMap.key }" class="nav-down-menu" style="display: none;" _t_nav="${newMap.key }">
							<div class="item">
								<ul class="clr">
									<c:forEach var="menu"  items="${newMap.value }">
									<li class="transition" onclick="jumpOther('${menu.id}','${newMap.key }');" >
										<div class="img-content"><img src="${menu.img }" class="transition"><span>${menu.description }</span></div>
										<h5 class="transition">${menu.name }</h5>
									</li>
									 </c:forEach>
								</ul>
							</div>
						</div>
						</c:forEach>
					</div>
					<!--导航 结束-->
				</div>
			</div>
		</div>
		<script>
		function jumpQuanjing(secondMenuId){
			var currentId="";
			window.location.href="${contextpath}/quanjing.htm?currentId="+currentId+"&secondMenuId="+secondMenuId;
		}
		function jumpOther(secondMenuId,otherId){
			var currentId="";
			window.location.href="${contextpath}/other.htm?currentId="+currentId+"&otherId="+otherId+'&secondMenuId='+secondMenuId;
		}
		function jumpTingwen(secondMenuId){
			window.location.href="${contextpath}/tingwen.htm?secondMenuId="+secondMenuId;
		}
		function jumpChangyou(secondMenuId){
			window.location.href="${contextpath}/changyou.htm?secondMenuId="+secondMenuId;
		}
		function jumpXiuxian(secondMenuId){
			window.location.href="${contextpath}/xiuxian.htm?secondMenuId="+secondMenuId;
		}
		
		
		function logout(){
			 $.ajax({
					type: "post", 
					url: "${contextpath}/loginout.htm", 
					dataType: "json",
					success: function (data) { 
						 layer.msg("注销成功！");
						 window.location.href="${contextpath}/";
					} 
			});
		}
			//		头部悬浮
			$("div.navbar-fixed-top").autoHidingNavbar();
			jQuery(document).ready(function() {
				
				$('#keyword').hover(function () {
		            showSearch();
		        }, function () {
		            closeSearch();
		        })
		        $('#keyword').focus(function () {
		        	closeSearch();
		        })
		        
		        $('#searchTag').hover(function () {
		            showSearch();
		        }, function () {
		            closeSearch();
		        })
				
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
			function jumpShipinM(secondMenuId){
				var currentId="";
				window.location.href="${contextpath}/shipin.htm?currentId="+currentId+"&secondMenuId="+secondMenuId;
			}
			function showSearch(){
				$("#searchTag").show();
			}
			 
			function closeSearch(){
				$("#searchTag").hide();
			}
			
			function searchSelectKeyword(keyword){
				window.location.href="${contextpath}/search.htm?keyword="+keyword;
			}
 			
			function search(){
				var keyword=$("#keyword").val();
				if(keyword==''){
					layer.msg('请输入搜索关键字');
					return false;
				}
				window.location.href="${contextpath}/search.htm?keyword="+keyword;
			}
			$(document).keyup(function(event){ 
			    var keycode = event.which; 
			    //处理回车的情况 
			    if(keycode==13){ 
					if (document.title=='登录'){
						login();
					}else{
						search();
					}
			    	
			   } 
			    
			});
 
		</script>
	</body>
	<c:if test="${type!='index'&&type!='' }"> 
	<script type="text/javascript" src="${contextpath }/js/scrolltopcontrol.js"></script><!--返回顶部-->
	</c:if>
</html>
