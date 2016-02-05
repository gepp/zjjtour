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
		 
		<div class="navbar-fixed-top clr">
			<div class="logo">
				<img src="${contextpath }/images/logo.png" />
			</div>
			<div class="logo-title">
				<h6>张家界市人民政府旅游官网</h6>
				<h4>走遍全世界，还是张家界</h4>
			</div>
			<div class="logo-right">
				<div class="logo-right-top clr">
 					
				<c:if test="${member!=null }">
					<div class="login">
						<a href="">欢迎您,${member.data.cloginname }</a><a href="javascript:void(0)" onclick="logout();">退出</a>
					</div>

				</c:if>
				<c:if test="${member==null }">
					<div class="login">
						<a href="${contextpath }/toLogin.htm">登录</a><a
							href="${contextpath }/toRegister.htm">注册</a>
					</div>
				</c:if>
				
 
 					<div class="search">
						<input type="text" class="transition" placeholder="请输入搜索关键字">
						<button class="iconfont transition" type="button">&#xe605;</button>
					</div>
					<div class="weather">
					<iframe allowtransparency="true" frameborder="0" width="317" height="28" scrolling="no" src="http://tianqi.2345.com/plugin/widget/index.htm?s=3&z=1&t=1&v=0&d=1&bd=0&k=000000&f=&q=1&e=1&a=1&c=57558&w=317&h=28&align=center"></iframe>
					
 					</div>
				</div>
				<div class="logo-right-bottom">
					<!--导航-->
					<ul class="nav navbar-nav clr">
						<li _t_nav="home">
							<div class="normal"><a href="${contextpath }/"><i class="iconfont font-150">&#xe608;</i></a></div>
						</li>
						<li class="active" _t_nav="panorama">
							<div class="normal"><a href="${contextpath }/quanjing.htm">全景</a></div>
						</li>
						<li _t_nav="activity">
							<div class="normal"><a href="${contextpath }/changyou.htm">畅游</a></div>
						</li>
						<li _t_nav="news">
							<div class="normal"><a href="${contextpath }/activity.htm">娱乐</a></div>
						</li>
						<li _t_nav="community">
							<div class="normal"><a href="${contextpath }/tingwen.htm">听闻</a></div>
						</li>
						<li _t_nav="route">
							<div class="normal"><a href="#">游客中心</a></div>
						</li>
					</ul>
					<div class="navigation-down phone-header">
						<div id="panorama" class="nav-down-menu" style="display: none;" _t_nav="panorama">
							<div class="item">
								<ul class="clr">
									<c:forEach var="menu"  items="${quanjingMenuList }">
									<li class="transition" onclick="jumpQuanjing('${menu.id }')">
										<div class="img-content"><img src="${menu.img }" class="transition"><span>${menu.description }</span></div>
										<h5 class="transition" >${menu.name }</h5>
									</li>
									 </c:forEach>
								</ul>
							</div>
						</div>
						<div id="activity" class="nav-down-menu" style="display: none;" _t_nav="activity">
							<div class="item">
								<ul class="clr">
									<c:forEach var="menu"  items="${changyouMenuList }">
									<li class="transition">
										<div class="img-content"><img src="${menu.img }" class="transition"><span>${menu.description }</span></div>
										<h5 class="transition">${menu.name }</h5>
									</li>
									 </c:forEach>
								</ul>
							</div>
						</div>
						<div id="news" class="nav-down-menu" style="display: none;" _t_nav="news">
							 
						</div>
						<div id="community" class="nav-down-menu" style="display: none;" _t_nav="community">
							<div class="item">
								<ul class="clr">
									<c:forEach var="menu"  items="${tingwenMenuList }">
									<li class="transition">
										<div class="img-content"><img src="${menu.img }" class="transition"><span>${menu.description }</span></div>
										<h5 class="transition">${menu.name }</h5>
									</li>
									 </c:forEach>
								</ul>
							</div>
						</div>
						<div id="route" class="nav-down-menu" style="display: none;" _t_nav="route">
							 
						</div>
					</div>
					<!--导航 结束-->
				</div>
			</div>
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
		<div class="footer">
			<!--友情链接 -->
			<h4>友情链接</h4>
			<div class="footer-link">
				<ul class="clr">
					<li>
						<select>
							<option value="张家界政府网站">张家界政府网站</option>
							<option value="张家界政府网站">张家界政府网站</option>
							<option value="张家界政府网站">张家界政府网站</option>
							<option value="张家界政府网站">张家界政府网站</option>
						</select>
					</li>
					<li>
						<select>
							<option value="各省旅游政务网站">各省旅游政务网站</option>
							<option value="各省旅游政务网站">各省旅游政务网站</option>
							<option value="各省旅游政务网站">各省旅游政务网站</option>
							<option value="各省旅游政务网站">各省旅游政务网站</option>
						</select>
					</li>
					<li>
						<select>
							<option value="各市旅游政务网站">各市旅游政务网站</option>
							<option value="各市旅游政务网站">各市旅游政务网站</option>
							<option value="各市旅游政务网站">各市旅游政务网站</option>
							<option value="各市旅游政务网站">各市旅游政务网站</option>
						</select>
					</li>
					<li>
						<select>
							<option value="国际旅游组织">国际旅游组织</option>
							<option value="国际旅游组织">国际旅游组织</option>
							<option value="国际旅游组织">国际旅游组织</option>
							<option value="国际旅游组织">国际旅游组织</option>
						</select>
					</li>
					<li>
						<select>
							<option value="张家界旅游相关网站">张家界旅游相关网站</option>
							<option value="张家界旅游相关网站">张家界旅游相关网站</option>
							<option value="张家界旅游相关网站">张家界旅游相关网站</option>
							<option value="张家界旅游相关网站">张家界旅游相关网站</option>
						</select>
					</li>
				</ul>
			</div>
			<!--友情链接 end-->
			<div class="footer-item-list clr">
				<div class="footer-item"><i class="iconfont">&#xe601;</i><span>投诉中心</span></li>
				</div>
				<div class="footer-item"><i class="iconfont">&#xe60e;</i><span>景区数据</span></li>
				</div>
				<div class="footer-item"><i class="iconfont">&#xe60c;</i><span>诚信中心</span></li>
				</div>
				<div class="footer-item"><img src="${contextpath }/images/mmqrcode.jpg"><span>关注微信公众号</span></li>
				</div>
				<div class="footer-item"><i class="iconfont">&#xe607;</i><span>关注新浪微博</span></li>
				</div>
			</div>
			<div class="footer-img-list clr"><img src="${contextpath }/images/footer.png"><img src="${contextpath }/images/footer1.png"><img src="${contextpath }/images/footer2.png"><img src="${contextpath }/images/footer3.png"><img src="${contextpath }/images/footer4.png"></div>
			<div class="copyright">版权所有：张家界市人民政府    湘ICP备15001419号-2    E-mail：admin@travelzjj.com</div>
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
			function gotoBiaoqian(bqId){
				var secondMenuId=$("#secondMenuId").val();
				 
				window.location.href="${contextpath}/quanjing.htm?currentId="+bqId+"&secondMenuId="+secondMenuId;
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
		</script>
	</body>

</html>