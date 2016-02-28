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
		<div id="header">
		</div>
		<!-- Start 焦点图 -->
		<div class="index_focus">
			<a href="javascript:;" class="index_focus_pre" title="上一张"><i class="iconfont">&#xe609;</i></a>
			<a href="javascript:;" class="index_focus_next" title="下一张"><i class="iconfont">&#xe612;</i></a>
			<div class="bd">
				<ul>
					<c:forEach var="adv" items="${advList }">
					<li>
						<a href="${adv.jumpUrl }" class="pic" target="_blank">
							<div class="index_focus_info">
								<c:if test="${adv.showFlag=='1' }">
								<h3>${adv.title }</h3>
								<p class="text">
									${adv.abstractContent }
								</p>
								</c:if>
							</div>
							<img class="pic" src="${adv.imgUrl }" width="1600" height="600" alt="">
						</a>
					</li>
					</c:forEach>
					 
				</ul>
			</div>
			<div class="slide_nav">
				<c:forEach var="adv" items="${advList }">
				<a href="javascript:;"><i class="iconfont">&#xe613;</i></a>
				</c:forEach>
			</div>
		</div>
		<!-- End 焦点图 -->
		<!--标题-->
		<div class="index-title clr" id="index_1">
			<h2 class="transition">
				<span>视觉</span>张家界
				<svg id="svgLineTutorial" style=" position: absolute; top: -50px; left:0 ; z-index: -1;" height="160px" width="200px" xmlns="http://www.w3.org/2000/svg">
				   <line x1="0" y1="160" x2="63" y2="110"  style="stroke:rgb(0,187,158);stroke-width:1" />
					<line x1="138" y1="50" x2="200" y2="0"  style="stroke:rgb(0,187,158);stroke-width:1" />
				</svg>
			</h2>
			<div class="more transition">查看更多</div>
		</div>
		<!--标题  end-->
		<!--视频轮播-->
          
		 <div class="slider"  >
			<div class="bd">
				<ul>
					<c:forEach items="${videoList }" var="video">
					<li onclick="openShipin('${video.title}','${video.outJs }');">
						<a  class="btn1"><i class="iconfont transition">&#xe600;</i><div class="title">${video.title }</div><img src="${video.indeximg }" /></a>
					</li>
 					 </c:forEach>
				</ul>
			</div>
			<div class="hd">
				<ul>
				</ul>
			</div>
			<div class="pnBtn prev"> <span class="blackBg"></span>
				<a class="arrow" href="javascript:void(0)"><i class="iconfont">&#xe609;</i></a>
			</div>
			<div class="pnBtn next"> <span class="blackBg"></span>
				<a class="arrow" href="javascript:void(0)"><i class="iconfont">&#xe612;</i></a>
			</div>
		</div>
		<!--视频弹窗-->
		<div class="hint">
			<div class="hint-in1">
				<div class="hint2" id="shipinTitle"></div>
				<div class="hint3"><i class="iconfont transition">&#xe614;</i></div>
			</div>
			<div id="shipinUrl">
			<div id="youkuplayer" style="width:780px;height:430px"></div>
			
			</div>
 		</div>
		<!--视频轮播 end-->
		<!--标题-->
		<div class="index-title clr" id="index_2">
			<h2 class="transition">
				<span>全景</span>张家界
				<svg id="svgLineTutorial" style=" position: absolute; top: -50px; left:0 ; z-index: -1;" height="160px" width="200px" xmlns="http://www.w3.org/2000/svg">
				   <line x1="0" y1="160" x2="63" y2="110"  style="stroke:rgb(0,187,158);stroke-width:1" />
					<line x1="138" y1="50" x2="200" y2="0"  style="stroke:rgb(0,187,158);stroke-width:1" />
				</svg>
			</h2>
			<div class="more transition" onclick="window.location.href='${contextpath}/quanjing.htm'">查看更多</div>
		</div>
		<!--标题  end-->

		<!--全景张家界-->
		<div class="panorama clr">
			<ul>
			
			<c:forEach var="quanjing" items="${quanjingList }">
				<li onclick="jumpQuanjingDetail('${quanjing.id}')">
					<img src="${quanjing.indeximg }">
					<div class="mask transition">
						<h4>${quanjing.title }</h4>
						<button>查看全景</button>
					</div>
				</li>
				 </c:forEach>
			</ul>
		</div>
		<!--全景张家界 end-->

		<!--畅游张家界-->
		<div class="index-swim clr" id="index_3">
			<!--标题-->
			<div class="index-swim-left">
				<div class="index-title clr">
					<h2 class="transition">
					<span>畅游</span>张家界
					<svg id="svgLineTutorial" style=" position: absolute; top: -50px; left:0 ; z-index: -1;" height="160px" width="200px" xmlns="http://www.w3.org/2000/svg">
					   <line x1="0" y1="160" x2="63" y2="110"  style="stroke:rgb(0,187,158);stroke-width:1" />
						<line x1="138" y1="50" x2="200" y2="0"  style="stroke:rgb(0,187,158);stroke-width:1" />
					</svg>
				</h2>
					<div class="more transition" onclick="window.location.href='${contextpath}/changyou.htm'">查看更多</div>
				</div>
			</div>
			<!--标题  end-->
			<ul>
				
				<c:forEach var="changyou" items="${changyouList }">
				<li class="transition" onclick="jumpChangyouDetail('${changyou.id}')">
					<h4>${changyou.title }</h4>
					<p class="transition">${changyou.abstractContent }</p>
				</li>
				</c:forEach>
				 
			</ul>
		</div>
		<!--畅游张家界 end-->

		<!--娱乐张家界-->
		<div class="entertainment clr" id="index_4">
			<c:forEach var="yule" items="${activityList }">
			<div class="entertainment-content">
				<img src="${yule.indeximg }" />
				<div class="mask">
					<button onclick="checkUser('${yule.activityStatus}','${yule.id }')">立即报名</button>
					<p>${yule.abstractContent }</p>
				</div>
			</div>
			 </c:forEach>
			<!--标题-->
			<div class="index-title clr">
				<h2 class="transition">
					<span>娱乐</span>张家界
					<svg id="svgLineTutorial" style=" position: absolute; top: -50px; left:0 ; z-index: -1;" height="160px" width="200px" xmlns="http://www.w3.org/2000/svg">
					   <line x1="0" y1="160" x2="63" y2="110"  style="stroke:rgb(0,187,158);stroke-width:1" />
						<line x1="138" y1="50" x2="200" y2="0"  style="stroke:rgb(0,187,158);stroke-width:1" />
					</svg>
				</h2>
			</div>
			<!--标题  end-->
		</div>
		<!--娱乐张家界 end-->
		<!--标题-->
		<div class="index-title clr" id="index_5">
			<h2 class="transition">
				<span>休闲</span>张家界
				<svg id="svgLineTutorial" style=" position: absolute; top: -50px; left:0 ; z-index: -1;" height="160px" width="200px" xmlns="http://www.w3.org/2000/svg">
				   <line x1="0" y1="160" x2="63" y2="110"  style="stroke:rgb(0,187,158);stroke-width:1" />
					<line x1="138" y1="50" x2="200" y2="0"  style="stroke:rgb(0,187,158);stroke-width:1" />
				</svg>
			</h2>
			<div class="more transition" onclick="jumpXiuxiansecond('');">查看更多</div>
		</div>
		<!--标题  end-->
		<!--休闲张家界-->
		<div class="leisure clr">
			<div class="delicacy"  onclick="jumpXiuxiansecond('${meishiMenu.id}');"><img src="${meishiMenu.img }">
				<div class="mask">
					<h4>${meishiMenu.name }</h4>
					<p>${meishiMenu.description }</p>
				</div>
			</div>
			<div class="hotel">
				<div class="leisure-top" onclick="jumpXiuxiansecond('${jiudianMenu.id}');"><img src="${jiudianMenu.img }"></div>
				<div class="leisure-bottom transition">
					<h5>${jiudianMenu.name }</h5>
					<p>${jiudianMenu.description }<a href="#">［详细介绍］</a></p><i></i></div>
			</div>
			<div class="spots">
				<div class="leisure-top transition" onclick="jumpXiuxiansecond('${jingdianMenu.id}');">
					<h5>${jingdianMenu.name }</h5>
					<p>${jingdianMenu.description }<a href="#">［详细介绍］</a></p><i></i></div>
				<div class="leisure-bottom"><img src="${jingdianMenu.img }"></div>
			</div>
			<div class="gate">
				<div class="leisure-top" onclick="jumpXiuxiansecond('${menpiaoMenu.id}');"><img src="${menpiaoMenu.img }"></div>
				<div class="leisure-bottom transition">
					<h5>${menpiaoMenu.name }</h5>
					<p>${menpiaoMenu.description}<a href="#">［详细介绍］</a></p><i></i></div>
			</div>
		</div>
		<!--休闲张家界 end-->

		<!--听闻张家界-->
		<div class="index-swim clr" id="index_6">
			<ul>
			
				<c:forEach var="tingwen" items="${tingwenList }">
				<li class="transition" onclick="jumpTingwenDetail('${tingwen.id}')">
					<h4>${tingwen.title }</h4>
					<p class="transition">—— ${tingwen.abstractContent }</p>
				</li>
			    </c:forEach>
			</ul>
			<!--标题-->
			<div class="index-swim-left">
				<div class="index-title clr">
					<h2 class="transition">
					<span>听闻</span>张家界
					<svg id="svgLineTutorial" style=" position: absolute; top: -50px; left:0 ; z-index: -1;" height="160px" width="200px" xmlns="http://www.w3.org/2000/svg">
					   <line x1="0" y1="160" x2="63" y2="110"  style="stroke:rgb(0,187,158);stroke-width:1" />
						<line x1="138" y1="50" x2="200" y2="0"  style="stroke:rgb(0,187,158);stroke-width:1" />
					</svg>
				</h2>
					<div class="more transition" onclick="window.location.href='${contextpath}/tingwen.htm'">查看更多</div>
				</div>
			</div>
			<!--标题  end-->
		</div>
		<!--听闻张家界 end-->
		<div id="footer">
		</div>

		<!--悬浮定位-->
		<div id="tbox" style='position: fixed;right: 20px;top: 150px;'>
			<!-- 这个必须有  id="tbox"-->
			<a class="taoba" href="javascript:void(0)" title="1">视觉</a>
			<a class="taoba" href="javascript:void(0)" title="2">全景</a>
			<a class="taoba" href="javascript:void(0)" title="3">畅游</a>
			<a class="taoba" href="javascript:void(0)" title="4">娱乐</a>
			<a class="taoba" href="javascript:void(0)" title="5">休闲</a>
			<a class="taoba" href="javascript:void(0)" title="6">听闻</a>
			<a id="gotop" href="javascript:void(0)" title="回到顶部" class="transition"><i class="iconfont transition">&#xe60d;</i></a>
			<!-- 这个也是id="gotop"  -->
		</div>
		
		
		<script type="text/javascript" src="${contextpath }/js/jquery.min.js"></script>
		<script src="${contextpath }/js/bootstrap.min.js"></script>
		<script src="${contextpath }/js/jquery.bootstrap-autohidingnavbar.js"></script>
		<script src="${contextpath }/js/jquery.SuperSlide.js"></script>
		<script type="text/javascript" src="${contextpath }/js/slide.js"></script>
		<script src="${contextpath}/js/layer/layer.js"></script>
		<script src="${contextpath}/js/common.js"></script>
		<script src="http://player.youku.com/jsapi"></script>

		<script>
			//		头部悬浮
			$("div.navbar-fixed-top").autoHidingNavbar();
			jQuery(document).ready(function() {
				$("#header").load("${contextpath}/header.htm?type=index");
				$("#footer").load("${contextpath}/footer.htm");
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
			jQuery(".slider .bd li").first().before( jQuery(".slider .bd li").last() );
			jQuery(".slider").hover(function(){ jQuery(this).find(".arrow").stop(true,true).fadeIn(300) },function(){ jQuery(this).find(".arrow").fadeOut(300) });				jQuery(".slider").slide({ titCell:".hd ul", mainCell:".bd ul", effect:"leftLoop",autoPlay:true, vis:3,autoPage:true, trigger:"click"});

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
function jumpQuanjing(secondMenuId){
	var currentId="";
	window.location.href="${contextpath}/quanjing.htm?currentId="+currentId+"&secondMenuId="+secondMenuId;
}  
//         视频弹窗
$(document).ready(function($){
	$(".hint3").click(function(event) {
		$(this).parent().parent().css({"display":"none"});
		$(".box").css({"display":"none"});
	});
	
});
 	function openShipin(title,outJsId){
 		$(".hint").css({"display":"block"});
		$(".box").css({"display":"block"});
 		$("#shipinTitle").html(title);
 		
 		 /* var outJs="<div id=\"youkuplayer\" style=\"width:780px;height:430px\"></div>"+
 		"<script type=\"text/javascript\" src=\"http://player.youku.com/jsapi\">"+
 		"player = new YKU.Player('youkuplayer',{"+
 		"styleid: '0',client_id: '383f88d830f3015c',vid: '"+outJsId+"'});"
 		+"<//script>"; */
 		player = new YKU.Player('youkuplayer',{
 			styleid: '0',
 			client_id: '383f88d830f3015c',
 			vid: outJsId
 		 });
 		
 		//$("#shipinUrl").html(outJs);  
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
	
	function jumpQuanjingDetail(id){
		window.location.href='${contextpath}/quanjingDetail.htm?id='+id;
	}
	function jumpChangyouDetail(id){
		window.location.href='${contextpath}/changyouDetail.htm?id='+id;
	}
	function jumpTingwenDetail(id){
		window.location.href='${contextpath}/tingwenDetail.htm?id='+id;
	}
	function jumpXiuxiansecond(secondMenuId){
		window.location.href="${contextpath}/xiuxian.htm?secondMenuId="+secondMenuId;
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
					 
				 }else{
					 layer.alert(data.message, {
						    closeBtn: 0
						}, function(){
						     window.location.href="${contextpath}/toLogin.htm";
						});
				 }
			} 
	});
	}
	
		</script>
	</body>

</html>