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
		<!--视频弹窗遮罩  这一段需要放在前面-->
		<div class="box"></div>
		<!--视频弹窗遮罩 end-->
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
					<div class="login"><a href="">登录</a><a href="">注册</a></div>
					<div class="search">
						<input type="text" class="transition" placeholder="请输入搜索关键字">
						<button class="iconfont transition" type="button">&#xe605;</button>
					</div>
					<div class="weather">
						<iframe allowtransparency="true" frameborder="0" width="180" height="36" scrolling="no" src="http://tianqi.2345.com/plugin/widget/index.htm?s=3&z=2&t=0&v=0&d=1&bd=0&k=&f=&q=1&e=1&a=1&c=57558&w=180&h=36&align=left"></iframe>
					</div>
				</div>
				<div class="logo-right-bottom">
					<!--导航-->
					<ul class="nav navbar-nav clr">
						<li class="active" _t_nav="home">
							<div class="normal"><a href="#"><i class="iconfont font-150">&#xe608;</i></a></div>
						</li>
						<li _t_nav="panorama">
							<div class="normal"><a href="#">全景</a></div>
						</li>
						<li _t_nav="activity">
							<div class="normal"><a href="#">畅游</a></div>
						</li>
						<li _t_nav="news">
							<div class="normal"><a href="#">娱乐</a></div>
						</li>
						<li _t_nav="community">
							<div class="normal"><a href="#">听闻</a></div>
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
									<li class="transition">
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
		 
		  
		
		
		<script type="text/javascript" src="${contextpath }/js/jquery.min.js"></script>
		<script src="${contextpath }/js/bootstrap.min.js"></script>
		<script src="${contextpath }/js/jquery.bootstrap-autohidingnavbar.js"></script>
		<script src="${contextpath }/js/jquery.SuperSlide.js"></script>
		<script type="text/javascript" src="${contextpath }/js/slide.js"></script>

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
			//			 焦点图
			jQuery(".index_focus").hover(function() {
				jQuery(this).find(".index_focus_pre,.index_focus_next").stop(true, true).fadeTo("show", 1)
			}, function() {
				jQuery(this).find(".index_focus_pre,.index_focus_next").fadeOut()
			});
			jQuery(".index_focus").slide({
				titCell: ".slide_nav a ",
				mainCell: ".bd ul",
				delayTime: 500,
				interTime: 3500,
				prevCell: ".index_focus_pre",
				nextCell: ".index_focus_next",
				effect: "fold",
				autoPlay: true,
				trigger: "click",
				startFun: function(i) {
					jQuery(".index_focus_info").eq(i).find("h3").css("display", "block").fadeTo(1000, 1);
					jQuery(".index_focus_info").eq(i).find(".text").css("display", "block").fadeTo(1000, 1);
				}
			});
			
//			悬浮定位
jQuery(document).ready(function($) {
                $(".index_nav li a").click(function(event) {
                    var index = this.title
                    var id = '#' + 'index_' + index
                    $("html,body").animate({
                        scrollTop: $(id).offset().top
                    }, 1000);
                });
                $(".taoba").click(function(event) {
                    var index = this.title;

                    $(".taoba").removeClass('active');
                    $(this).addClass('active');

                    var id = '#' + 'index_' + index
                    $("html,body").animate({
                        scrollTop: $(id).offset().top
                    }, 1000);
                });

                $(function() {
                    $(window).scroll(function() {
                        t = $(document).scrollTop();
                        if (t > 500) {
                            $('#tbox').show();
                        } else {
                            $('#tbox').hide();
                        }
                        if (t > 50) {
                            $('#gotop').fadeIn('slow');
                        } else {
                            $('#gotop').fadeOut('slow');
                        }

                        var windowTopHeight = t;
                        if(windowTopHeight >= $('#index_1').offset().top && windowTopHeight < $('#index_2').offset().top){
                            // 第一页
                            $('.taoba').removeClass('active');
                            $('.taoba[title=1]').addClass('active');
                        }else if(windowTopHeight >= $('#index_2').offset().top && windowTopHeight < $('#index_3').offset().top){
                            // 第二页
                            $('.taoba').removeClass('active');
                            $('.taoba[title=2]').addClass('active');
                        }else if(windowTopHeight >= $('#index_3').offset().top && windowTopHeight < $('#index_4').offset().top){
                            // 第三页
                            $('.taoba').removeClass('active');
                            $('.taoba[title=3]').addClass('active');
                        }else if(windowTopHeight >= $('#index_4').offset().top && windowTopHeight < $('#index_5').offset().top){
                            // 第四页
                            $('.taoba').removeClass('active');
                            $('.taoba[title=4]').addClass('active');
                        }else if(windowTopHeight >= $('#index_5').offset().top && windowTopHeight < $('#index_6').offset().top){
                            // 第五页
                            $('.taoba').removeClass('active');
                            $('.taoba[title=5]').addClass('active');
                        }else if(windowTopHeight >= $('#index_6').offset().top){
                            // 第六页
                            $('.taoba').removeClass('active');
                            $('.taoba[title=6]').addClass('active');
                        }
                    })
                    $('#gotop').click(function() {
                        $('body,html').animate({
                                scrollTop: 0
                            },
                            800); //点击回到顶部按钮，缓懂回到顶部,数字越小越快
                        return false;
                    })
                });
            });
            
//         视频弹窗
$(document).ready(function($){

	$(".btn1").click(function(event){
		$(".hint").css({"display":"block"});
		$(".box").css({"display":"block"});
	});
	
	$(".hint3").click(function(event) {
		$(this).parent().parent().css({"display":"none"});
		$(".box").css({"display":"none"});
	});
	
});
		</script>
	</body>

</html>