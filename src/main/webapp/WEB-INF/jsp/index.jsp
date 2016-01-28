<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>首页</title>
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
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/1.png" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/2.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/3.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/4.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/4.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/3.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/2.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/1.png" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
								</ul>
							</div>
						</div>
						<div id="activity" class="nav-down-menu" style="display: none;" _t_nav="activity">
							<div class="item">
								<ul class="clr">
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/3.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/2.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/1.png" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/4.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/4.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/3.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/2.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/1.png" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
								</ul>
							</div>
						</div>
						<div id="news" class="nav-down-menu" style="display: none;" _t_nav="news">
							<div class="item">
								<ul class="clr">
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/4.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/3.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/2.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/1.png" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/1.png" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/2.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/3.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/4.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
								</ul>
							</div>
						</div>
						<div id="community" class="nav-down-menu" style="display: none;" _t_nav="community">
							<div class="item">
								<ul class="clr">
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/1.png" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/2.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/3.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/4.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/4.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/3.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/2.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/1.png" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
								</ul>
							</div>
						</div>
						<div id="route" class="nav-down-menu" style="display: none;" _t_nav="route">
							<div class="item">
								<ul class="clr">
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/4.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/3.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/2.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/1.png" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/1.png" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/2.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
									<li class="transition">
										<div class="img-content"><img src="${contextpath }/images/3.jpg" class="transition"><span>这里是天子山简介</span></div>
										<h5 class="transition">天子山</h5>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!--导航 结束-->
				</div>
			</div>
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
								<h3>${adv.title }</h3>
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

		<div id="show" rel="autoPlay">
			<div class="img">
				<span>
		              <a class="btn1"><i class="iconfont transition">&#xe600;</i><div class="title">葛大爷在此，谁敢造次。</div><img src="${contextpath }/images/1.png" /></a>
		              <a class="btn1"><i class="iconfont transition">&#xe600;</i><div class="title">葛大爷在此，谁敢造次。</div><img src="${contextpath }/images/2.jpg" /></a>
		              <a class="btn1"><i class="iconfont transition">&#xe600;</i><div class="title">葛大爷在此，谁敢造次。</div><img src="${contextpath }/images/3.jpg" /></a>
		              <a class="btn1"><i class="iconfont transition">&#xe600;</i><div class="title">葛大爷在此，谁敢造次。</div><img src="${contextpath }/images/4.jpg" /></a>
		              <a class="btn1"><i class="iconfont transition">&#xe600;</i><div class="title">葛大爷在此，谁敢造次。</div><img src="${contextpath }/images/2.jpg" /></a>
		          </span>
				<div class="masks mk1"></div>
				<div class="masks mk2"></div>
			</div>
		</div>
		<!--视频弹窗-->
		<div class="hint">
			<div class="hint-in1">
				<div class="hint2">葛大爷在此，只有海公公敢爆菊</div>
				<div class="hint3"><i class="iconfont transition">&#xe614;</i></div>
			</div>
			<!--<embed src="http://player.youku.com/player.php/sid/XMTQzODM3NDg3Ng==/v.swf" allowFullScreen="true" quality="high" width="780" height="430" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash"></embed>-->
			<video width="780" height="430" src="${contextpath }/images/乱剪.mp4" controls="controls">您的浏览器不支持改视频播放</video>
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
			<div class="more transition">查看更多</div>
		</div>
		<!--标题  end-->

		<!--全景张家界-->
		<div class="panorama clr">
			<ul>
				<li>
					<img src="${contextpath }/images/11.jpg">
					<div class="mask transition">
						<h4>海公公</h4>
						<button>查看全景</button>
					</div>
				</li>
				<li>
					<img src="${contextpath }/images/12.jpg">
					<div class="mask transition">
						<h4>海公公</h4>
						<button>查看全景</button>
					</div>
				</li>
				<li>
					<img src="${contextpath }/images/13.jpg">
					<div class="mask transition">
						<h4>海公公</h4>
						<button>查看全景</button>
					</div>
				</li>
				<li>
					<img src="${contextpath }/images/14.jpg">
					<div class="mask transition">
						<h4>海公公</h4>
						<button>查看全景</button>
					</div>
				</li>
				<li>
					<img src="${contextpath }/images/15.jpg">
					<div class="mask transition">
						<h4>海公公</h4>
						<button>查看全景</button>
					</div>
				</li>
				<li>
					<img src="${contextpath }/images/16.jpg">
					<div class="mask transition">
						<h4>海公公</h4>
						<button>查看全景</button>
					</div>
				</li>
				<li>
					<img src="${contextpath }/images/11.jpg">
					<div class="mask transition">
						<h4>海公公</h4>
						<button>查看全景</button>
					</div>
				</li>
				<li>
					<img src="${contextpath }/images/17.jpg">
					<div class="mask transition">
						<h4>海公公</h4>
						<button>查看全景</button>
					</div>
				</li>
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
					<div class="more transition">查看更多</div>
				</div>
			</div>
			<!--标题  end-->
			<ul>
				<li class="transition">
					<h4>张家界、凤凰古城精品旅游线路</h4>
					<p class="transition">—— 张家界位于湖南西北部，属武陵山脉腹地。因旅游而建、因旅游而兴的张家界市，拥有令世人惊叹的风光。九寨沟看水，张家界看山。武陵源核心景区面积达264平方公里。景区中三千座石峰拨地而起。</p>
				</li>
				<li class="transition">
					<h4>张家界雪景摄影旅游线路</h4>
					<p class="transition">—— 雪景是张家界一大特色奇观，冬天张家界景区都是被白白积雪覆盖着，整个景区是洁白如瑕的景象展现给所有人的眼中。感觉走向另外一个世界了。张家界一连下的好几场雪，一般最大的一场雪是最好的...</p>
				</li>
				<li class="transition">
					<h4>张家界天门山一日游精品旅游线路</h4>
					<p class="transition">—— 湖南，张家界，澧水南岸，有座奇山。山高1518.6米，孤峰高耸，临空独尊。千米绝壁之上，有洞开如门，悬空危立，似明镜高悬。此山，名天门山，称湘西第一神山。此洞，曰天门洞，为举世罕见...</p>
				</li>
				<li class="transition">
					<h4>2015年张家界自助游旅游线路</h4>
					<p class="transition">—— 张家界国家森林公园（门票248元，四日有效；年票298元，一年有效。包含黄石寨、金鞭溪、袁家界、 杨家界、大观台、天子山、十里画廊等景区。是“世界地质公园”“中国第一个国家森林公园”</p>
				</li>
			</ul>
		</div>
		<!--畅游张家界 end-->

		<!--娱乐张家界-->
		<div class="entertainment clr" id="index_4">
			<div class="entertainment-content">
				<img src="${contextpath }/images/19.png" />
				<div class="mask">
					<button>立即报名</button>
					<p>万福温泉属天然自涌温泉，泉水清澈碧透，常年恒温53℃，富含多种有益人体的微量元素和矿物质，景区建有具神奇魅力</p>
				</div>
			</div>
			<div class="entertainment-content">
				<img src="${contextpath }/images/18.png" />
				<div class="mask">
					<button>立即报名</button>
					<p>与浪共舞是我们精心为您策划的一场青春之旅，在与大自然抗争中演绎精彩的瞬间，这就是漂流，一项勇敢者的运动。</p>
				</div>
			</div>
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
			<div class="more transition">查看更多</div>
		</div>
		<!--标题  end-->
		<!--休闲张家界-->
		<div class="leisure clr">
			<div class="delicacy"><img src="${contextpath }/images/meishi.png">
				<div class="mask">
					<h4>美食</h4>
					<p>菜肴风味属翼菜，以咸为主，粗犷大气，兼收八大菜系的特点，擅长爆、炸、炒。回民扒鸡、狗肉全席、金毛狮子鱼、菊花鱿鱼、抓炒全鱼，都是广受好评的当地名菜。</p>
				</div>
			</div>
			<div class="hotel">
				<div class="leisure-top"><img src="${contextpath }/images/hotel.png"></div>
				<div class="leisure-bottom transition">
					<h5>酒店</h5>
					<p>张家界住宿设备完善，有很多酒店、旅馆和便捷酒店，可选择余地很多，但暂时没有开设国际青年旅舍。 张家界的住宿区域主要分布在两个区域：老火车站-中山路和水上公园。老火车站-中山路处于市中心，购物和...<a href="#">［详细介绍］</a></p><i></i></div>
			</div>
			<div class="spots">
				<div class="leisure-top transition">
					<h5>景点</h5>
					<p>张家界住宿设备完善，有很多酒店、旅馆和便捷酒店，可选择余地很多，但暂时没有开设国际青年旅舍。 张家界的住宿区域主要分布在两个区域：老火车站-中山路和水上公园。老火车站-中山路处于市中心，购物和...<a href="#">［详细介绍］</a></p><i></i></div>
				<div class="leisure-bottom"><img src="${contextpath }/images/hotel.png"></div>
			</div>
			<div class="gate">
				<div class="leisure-top"><img src="${contextpath }/images/hotel.png"></div>
				<div class="leisure-bottom transition">
					<h5>门票</h5>
					<p>张家界住宿设备完善，有很多酒店、旅馆和便捷酒店，可选择余地很多，但暂时没有开设国际青年旅舍。 张家界的住宿区域主要分布在两个区域：老火车站-中山路和水上公园。老火车站-中山路处于市中心，购物和...<a href="#">［详细介绍］</a></p><i></i></div>
			</div>
		</div>
		<!--休闲张家界 end-->

		<!--听闻张家界-->
		<div class="index-swim clr" id="index_6">
			<ul>
				<li class="transition">
					<h4>张家界、凤凰古城精品旅游线路</h4>
					<p class="transition">—— 张家界位于湖南西北部，属武陵山脉腹地。因旅游而建、因旅游而兴的张家界市，拥有令世人惊叹的风光。九寨沟看水，张家界看山。武陵源核心景区面积达264平方公里。景区中三千座石峰拨地而起。</p>
				</li>
				<li class="transition">
					<h4>张家界雪景摄影旅游线路</h4>
					<p class="transition">—— 雪景是张家界一大特色奇观，冬天张家界景区都是被白白积雪覆盖着，整个景区是洁白如瑕的景象展现给所有人的眼中。感觉走向另外一个世界了。张家界一连下的好几场雪，一般最大的一场雪是最好的...</p>
				</li>
				<li class="transition">
					<h4>张家界天门山一日游精品旅游线路</h4>
					<p class="transition">—— 湖南，张家界，澧水南岸，有座奇山。山高1518.6米，孤峰高耸，临空独尊。千米绝壁之上，有洞开如门，悬空危立，似明镜高悬。此山，名天门山，称湘西第一神山。此洞，曰天门洞，为举世罕见...</p>
				</li>
				<li class="transition">
					<h4>2015年张家界自助游旅游线路</h4>
					<p class="transition">—— 张家界国家森林公园（门票248元，四日有效；年票298元，一年有效。包含黄石寨、金鞭溪、袁家界、 杨家界、大观台、天子山、十里画廊等景区。是“世界地质公园”“中国第一个国家森林公园”</p>
				</li>
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
					<div class="more transition">查看更多</div>
				</div>
			</div>
			<!--标题  end-->
		</div>
		<!--听闻张家界 end-->
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
			<div class="copyright">版权所有：张家界市人民政府    湘ICP备15001419号-2    E-mail：admin@travelzjj.com</div>
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
		
		
		<!--<script src="${contextpath }/js/jquery-2.1.0.js"></script>-->
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