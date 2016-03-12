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
	<div class="footer">
			<!--友情链接 -->
			<h4>友情链接</h4>
			<div class="footer-link">
				<ul class="clr">
					<li>
						<select name="pageselect1" onchange="javascript:window.open(this.options[this.selectedIndex].value)">
					<option value="">张家界市政府网站</option>
					<option value="http://www.zjj.gov.cn">张家界公众信息网</option>
					<option value="http://www.zjjga.gov.cn">张家界公安信息网</option>
					<option value="http://www.zjjyd.gov.cn/">永定区政府网站</option>
					<option value="http://www.zjjwly.gov.cn/">武陵源区政府网站</option>
					<option value="http://www.sangzhi.gov.cn/">桑植县政府网站</option>
					<option value="http://www.zjjcl.gov.cn/">慈利县政府网站</option>
					<option value="http://www.zjjgood.com/">张家界市旅游局</option>
				</select>
					</li>
					<li>
						<select name="pageselect2" onchange="javascript:window.open(this.options[this.selectedIndex].value)">
					<option value="">各省旅游政务网站</option>
					<option value="http://www.bjta.gov.cn/">北京旅游网</option>
					<option value="http://www.tjtour.cn/">天津旅游网</option>
					<option value="http://www.hebeitour.com.cn/">河北旅游网</option>
					<option value="http://www.shanxichina.gov.cn/zh/index.shtml">山西旅游网</option>
					<option value="http://www.nmglyj.gov.cn/">内蒙古旅游网</option>
					<option value="http://www.lntour.gov.cn/">辽宁旅游网</option>
					<option value="http://www.jlta.gov.cn/">吉林旅游网</option>
					<option value="http://www.hljtour.gov.cn/">黑龙江旅游网</option>
					<option value="http://lyw.sh.gov.cn/">上海旅游网</option>
					<option value="http://www.jstour.com/">江苏旅游网</option>
					<option value="http://www.tourzj.gov.cn/">浙江旅游网</option>
					<option value="http://www.ahta.com.cn/">安徽旅游网</option>
					<option value="http://www.fjta.com/">福建旅游网</option>
					<option value="http://www.jxta.gov.cn/">江西旅游网</option>
					<option value="http://www.sdta.gov.cn/">山东旅游网</option>
					<option value="http://www.hnta.cn/">河南旅游网</option>
					<option value="http://www.hubeitour.gov.cn/">湖北旅游网</option>
					<option value="http://www.hnt.gov.cn/">湖南旅游网</option>
					<option value="http://www.gdta.gov.cn/">广东旅游网</option>
					<option value="http://www.gxta.gov.cn/">广西旅游网</option>
					<option value="http://www.visithainan.gov.cn/">海南旅游网</option>
					<option value="http://www.cqta.gov.cn/">重庆旅游网</option>
					<option value="http://www.scta.gov.cn/">四川旅游网</option>
					<option value="http://www.gztour.gov.cn/">贵州旅游网</option>
					<option value="http://www.innyo.com/">云南旅游网</option>
					<option value="http://www.xzta.gov.cn/">西藏旅游网</option>
					<option value="http://www.sxtour.com/">陕西旅游网</option>
					<option value="http://www.gsta.gov.cn/">甘肃旅游网</option>
					<option value="http://www.nxtour.com.cn/">宁夏旅游网</option>
					<option value="http://www.qhly.gov.cn/">青海旅游网</option>
					<option value="http://www.xinjiangtour.gov.cn/">新疆旅游网</option>
					<option value="http://www.discoverhongkong.com/china/index.jsp">香港旅游发展局</option>
					<option value="http://www.macautourism.gov.mo/">澳门特别行政区旅游局</option>
					<option value="http://www.btwql.gov.cn/">兵团旅游网</option>
				</select>
					</li>
					<li>
						<select name="pageselect3" onchange="javascript:window.open(this.options[this.selectedIndex].value)">
					<option value="">各市旅游政务网站</option>
					<option value="http://www.csta.gov.cn/">长沙旅游网</option>
					<option value="http://www.zzly.gov.cn/">株洲旅游网</option>
					<option value="http://www.xtly.net/">湘潭旅游网</option>
					<option value="http://www.hytour.com.cn/">衡阳旅游网</option>
					<option value="http://www.sylywsj.gov.cn/">邵阳旅游网</option>
					<option value="http://yytour.yueyang.gov.cn/lyj/index.htm">岳阳旅游网</option>
					<option value="http://changdets.com/">常德旅游网</option>
					<option value="http://lyj.yiyang.gov.cn/home.html">益阳旅游网</option>
					<option value="http://www.czly.czs.gov.cn/lywsj/">郴州旅欧网</option>
					<option value="http://www.yzly.gov.cn/">永州旅游网</option>
					<option value="http://www.hhly.gov.cn/">怀化旅游网</option>
					<option value="http://www.gotold.cn/">娄底旅游网</option>
					<option value="http://www.xxly.gov.cn/">湘西旅游网</option>
				</select>
					</li>
					<li>
						<select name="pageselect4" onchange="javascript:window.open(this.options[this.selectedIndex].value)">
					<option value="">国际旅游组织</option>
					<option value="http://www.fia.com/">国际汽车运动联合会</option>
					<option value="http://ec.europa.eu/enterprise/sectors/tourism/index_en.htm">欧盟委员会旅游事务处</option>
					<option value="http://www.pata.org/">亚太旅游协会</option>
					<option value="http://www.apec.org/">亚太经合组织</option>
					<option value="http://www.asta.org/">美国旅行代理商协会</option>
					<option value="http://www.womenintourism.gr/annual_convention/index.html">妇女旅游组织国际联合会</option>
					<option value="http://ih-ra.com/">国际饭店与餐饮协会</option>
				</select>
					</li>
					<li>
						<select name="pageselect5" onchange="javascript:window.open(this.options[this.selectedIndex].value)">
					<option value="">友情链接</option>
					<option value="http://www.travelzjj.com">张家界旅游官网</option>
					<option value="http://www.travelzjj.com">张家界旅游网</option>
					<option value="http://www.travelzjj.com">张家界度假酒店</option>
					<option value="http://www.travelzjj.com">凤凰古城旅游网</option>
					<option value="http://www.ziyoulvshen.com">自由旅神</option>
					<option value="http://www.zjjgf.com">张家界旅游集团</option>
				</select>
					</li>
				</ul>
			</div>
			<!--友情链接 end-->
			<div class="footer-item-list clr">
				<c:if test="${indexMap.show_tousu==1 }">
				<div class="footer-item" onclick="window.location.href='${contextpath}/tousu.htm'"><i class="iconfont">&#xe601;</i><span>投诉中心</span></li>
				</div>
				</c:if>
				<c:if test="${indexMap.show_tousu==0}">
				
				<div class="footer-item" style="display:none"><i class="iconfont">&#xe601;</i><span>投诉中心</span></li>
				</div>
				</c:if>
				<div class="footer-item" onclick="window.location.href='${contextpath}/jingqu.htm'"><i class="iconfont">&#xe60e;</i><span>景区数据</span></li>
				</div>
				<div class="footer-item" onclick="window.location.href='${contextpath}/chengxin.htm'"><i class="iconfont">&#xe60c;</i><span>诚信中心</span></li>
				</div>
				<div class="footer-item"><img src="${contextpath}/images/qrcode_for_gh_14fe25658a90_344.jpg"><span>关注微信公众号</span></li>
				</div>
				<div class="footer-item" onclick="window.location.href='http://weibo.com/u/1729314032?topnav=1&wvr=6&topsug=1'"><i class="iconfont">&#xe607;</i><span>关注新浪微博</span></li>
				</div>
			</div>
			<div class="footer-img-list clr"><img src="${contextpath }/images/footer.png"><img src="${contextpath }/images/footer1.png"><img src="${contextpath }/images/footer2.png"><img src="${contextpath }/images/footer3.png"><img src="${contextpath }/images/footer4.png"></div>
			<div class="copyright">版权所有：张家界市人民政府    湘ICP备15001419号-2    E-mail：admin@travelzjj.com</div>
		</div>
	</body>

</html>
