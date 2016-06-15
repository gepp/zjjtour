<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>${securityNew.title }</title>
	</head>
	<link rel="stylesheet" href="${contextpath }/css/style.css" />
	<link rel="stylesheet" href="${contextpath }/font/iconfont.css" />
	<meta name="Keywords" content="${securityNew.keywords }">
	<body>
		 
		<div id="header">
		</div>
		 
		<img src="${quanjing.img }" width="100%"/>
		<!--面包屑-->
		<div class="page-breadcrumbs">
			<ul class="clr">
				<span>当前位置：</span>
				<li><a href="${contextpath }/">首页</a></li>
				<li><a href="${contextpath }/tingwen.htm">${quanjing.name }</a></li>
				<li>${securityNew.title }</li>
			</ul>
		</div>
		<!--面包屑  end-->
		  <!--全景详情-->
		<div class="panorama-details clr">
			<div class="section">
				<c:if test="${securityNew.maodianStatus==1 }">
				<div id="menu1" class="menu">
					
					<div id="menu">
						<div class="line"></div>
						<ul>
							<c:if test="${securityNew.quanjingUrl !=null&&securityNew.quanjingUrl !='' }">
							<li><a href="#item-1" class="cur transition">360°全景</a></li>
							</c:if>
								<c:forEach items="${biaoqianList }" var="biaoqian">
								<li><a href="#item${biaoqian.orderlist }" class="transition">${biaoqian.maodian_name }</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div id="content">
				<c:if test="${securityNew.quanjingUrl !=null&&securityNew.quanjingUrl !='' }">
					<div class="content-item" id="item-1">
						<h4><i class="iconfont">&#xe610;</i>360°全景</h4>
						<iframe allowtransparency="true" frameborder="0" src="${securityNew.quanjingUrl }" width="750" height="400" style="border: 1px solid #eee;">这里是全景控件</iframe>
				
					</div>
				</c:if>
					<c:forEach items="${biaoqianList }" var="biaoqian">
	 				    <div class="content-item" id="item${biaoqian.orderlist }">
	 				    	<h4><i class="iconfont">&#xe610;</i>${biaoqian.maodian_name }</h4>
	 				    	${biaoqian.maodian_content }
						</div>
 				    </c:forEach>
				</div>
			</c:if>
			<c:if test="${securityNew.maodianStatus!=1 }">
			<div  >
			<div class="news-font-list">
					<h4>${securityNew.title }</h4>
					<div class="tit-bar">
					<fmt:formatDate value="${securityNew.ctime }" pattern="yyyy-MM-dd" var="ctime"/>
						<span>${ctime }</span>
						<span><i class="iconfont">&#xe616;</i>&nbsp;${securityNew.readtotal }</span></span>
						<span>来源：
						<c:if test="${securityNew.newsFrom=='' }">
						本站原创
						</c:if>
						<c:if test="${securityNew.newsFrom!='' }">
						${securityNew.newsFrom }
						</c:if>
						</span>
					</div>
					<div class="abstract">${securityNew.abstractContent }</div>
					<div class="news-content">
						 ${securityNew.content }
					</div>
				<!--分页-->
				<!-- <div class="page">
					<ul class="clr">
						<li title="下一篇"><i class="iconfont">&#xe611;</i></li>
						<li title="上一篇"><i class="iconfont">&#xe611;</i></li>
					</ul>
				</div> -->
				<!--分页end-->
				</div>
			</div>
			</c:if>
			</div>
			 <div id="rightNews"></div>
		</div>
		<!--图标列表-->

		<div id="footer">
		</div>
<div id="tbox" style='position: fixed;right: 20px;top: 150px;'>
			<c:if test="${securityNew.price!=null }">
				<a class="taoba-1" title="购买"><i class="iconfont">&#xe609;</i>购买
					<ul>
						<li onclick="gotoShangcheng('${securityNew.goodUrl}');"><i class="iconfont">&#xe624;</i><span >
						查看
						</span></li>
						<li><span>价格：${securityNew.price }</span></li>
					</ul>
				</a>
			</c:if>
			
			<a id="gotop" href="javascript:void(0)" title="回到顶部"
			<c:if test="${securityNew.price==null }">
			 style="margin-left:-60px"
			</c:if>
			
			 class="transition"><i class="iconfont transition">&#xe60d;</i></a>
			<!-- 这个也是id="gotop"  -->
		</div>
		 
		
		<!--<script src="${contextpath }/js/jquery-2.1.0.js"></script>-->
		<script type="text/javascript" src="${contextpath }/js/jquery.min.js"></script>
		<script src="${contextpath }/js/bootstrap.min.js"></script>
		<script src="${contextpath }/js/jquery.bootstrap-autohidingnavbar.js"></script>
		<script src="${contextpath}/js/layer/layer.js"></script>
		<script src="${contextpath}/js/common.js"></script>
			<script type="text/javascript" src="${contextpath}/js/juheweb.js"></script>
		<script type="text/javascript" src="${contextpath}/js/menu.js"></script>
		<script>
			//		头部悬浮
			$("div.navbar-fixed-top").autoHidingNavbar();
			jQuery(document).ready(function() {
				$("#header").load("${contextpath}/header.htm?type=tingwen");
				$("#footer").load("${contextpath}/footer.htm");
				$("#rightNews").load("${contextpath}/right.htm");
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

                })
                $('#gotop').click(function() {
                    $('body,html').animate({
                            scrollTop: 0
                        },
                        800); //点击回到顶部按钮，缓懂回到顶部,数字越小越快
                    return false;
                })
			});
			$(document).ready(function() {
				$('#menu1').stickyfloat({
					duration : 0
				});
			});
			
			function gotoShangcheng(goodUrl){
				window.open(goodUrl);
			}
			
		</script>
	</body>

</html>