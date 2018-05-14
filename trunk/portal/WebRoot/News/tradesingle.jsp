<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head lang="zh-CN">    
    <title>河南晟荣建筑工业科技有限公司</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="河南晟荣,晟荣,建筑工业科技">
	<meta http-equiv="description" content="河南晟荣建筑工业科技有限公司网站">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	
	<link href="<%=basePath%>Plugins/bootstrap/bootstrap.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath%>Portal/style.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath%>Portal/news.css" rel="stylesheet" type='text/css'/>
	<script src="<%=basePath%>Plugins/jquery/jquery-1.11.1.min.js"></script>
	<script src="<%=basePath%>Plugins/bootstrap/bootstrap.js"></script>
	
	<!---fonts-->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
	<!-- //FlexSlider-->
	<link rel="stylesheet" href="Plugins/jquery/flexslider.css" type="text/css" media="screen" />
	<script src="<%=basePath %>Plugins/jquery/jquery.flexslider.js"></script>
	<script>
		// Can also be used with $(document).ready()
				$(window).load(function() {
				$('.flexslider').flexslider({
				animation: "slide",
				controlNav: "thumbnails"
				});
				});
	</script>
	<!-- //FlexSlider-->
	<style>
	p{ text-indent:2em; padding:0px; margin:0px; }
	</style>
  </head>
  
<body>
	<!---header--->
	<div class="header-section">
		<div class="container">
			<div class="head-top">
				<div class="social-icon">
					<a href="#"><i class="icon"></i></a>
					<a href="#"><i class="icon1"></i></a>
					<a href="#"><i class="icon2"></i></a>
					<a href="#"><i class="icon3"></i></a>
					<a href="#"><i class="icon4"></i></a>
				</div>
				<div class="email">
					<ul>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>Email: <a href="mailto:info@example.com">info@example.com</a> </li>
						<li><i class="glyphicon glyphicon-log-in" aria-hidden="true"></i><a href="#" data-toggle="modal" data-target="#myModal">Login</a></li>
						<li><i class="glyphicon glyphicon-lock" aria-hidden="true"></i><a href="#" data-toggle="modal" data-target="#myModal1">Register</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
			<nav class="navbar navbar-default">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>				  
					<div class="navbar-brand">
						<img style="height:50px" src="<%=basePath %>Images/shengrong-green.png">
					</div>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="<%=basePath%>homePage.jsp">公司首页 <span class="sr-only">(current)</span></a></li>
						<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">产品中心<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="<%=basePath%>Products/coffeeMachine.jsp" target="_blank">咖啡机</a></li>
										<li><a href="<%=basePath%>Products/coffeeMachine.jsp">消防器材</a></li>
									</ul>
							</li>
							<li class="active"><a href="<%=basePath%>News/tradenews.jsp" >新闻前线</a></li>
						<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">资料共享 <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="2columnsgallery.html">2 Columns Gallery</a></li>
										<li><a href="3columnsgallery.html">3 Columns Gallery</a></li>
										<li><a href="4columnsgallery.html">4 Columns Gallery</a></li>
									</ul>
						</li>
						<li><a href="<%=basePath%>Aboutus/aboutshengrong.jsp">关于我们</a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
			</nav>
		</div>
	</div>
	<!-- /heander -->
	<!---banner--->
	<div class="banner-section">
			<div class="container">
				<h2>行业新闻</h2>
			</div>
	</div>
	<!---banner--->
	<!---banner--->
	<div class="content">
			<div class="blog-section">
				<div class="container">
					<div class="blog-grids">
						<div class="col-md-9 blog-grid">
							<div class="blog">
								<h3><a href="tradesingle.jsp">无人驾驶技术应用到共享汽车</a></h3>
								    <p>2017-11-15 05/<a href="#">John Doe</a>/<a href="#">0 评论</a></p>
								    <a href="tradesingle.jsp" class="news_img"><img src="<%=basePath%>Images/n.jpg" class="img-responsive" alt=""></a>
								     <p>今年4月的时候，百度正式发布了阿波罗计划，将向汽车行业及自动驾驶领域的合作伙伴提供一个开放、完整、安全的软件平台，帮助他们结合车辆和硬件系统，快速搭建一套属于自己的完整的自动驾驶系统。也可以理解Apollo计划就是百度要搭建出行生态的Android系统。</p>
								     <p>无人驾驶技术的落地需要一颗可以自我学习的最强大脑外，离不开车辆的本身作为载体，汽车人工智能依靠高精度地图数据，城市的交通道路数据，例如红绿灯的优化、道路的限流分流等进行自我学习，这些都是基于大数据作为支撑。</p>
								     <p>而目前市场上的大型共享出行项目，可以给予无人驾驶技术自我学习非常宝贵的数据反馈，推动无人驾驶技术中算法的快速迭代，支撑无人驾驶解决方案的成熟度问题。最近创业邦了一家公司——盼达用车，正在与百度无人驾驶进行相关合作。</p>
								     <p>据了解，盼达的核心发展方向是以庞大出行数据库为基础，基于LBS面向消费场景的布局;在另一个方面推动车辆如何更加智能更懂人类，盼达还成立了自己的X-pand实验室，应用黑科技在共享汽车上以提升用车感官。</p>
								     <p>而大数据、智能化与百度Apollo计划的落地需求契合。一方面能够更快地帮助百度完成自动驾驶技术的优化和商业化运营，共同探索自动驾驶汽车的创新模式。另一方面，两者的结合，也将进一步帮助推出社会交通的智慧化建设，可以期待更加有序、高效的城市交通系统。</p>
								     <p>盼达用车CEO高钰对于即将落地的第一个无人驾驶出行场景有自己想象，“走出公寓，汽车自动开到人面前，行驶过程中汽车会自行决策行驶的路线，不会出现违章、交通事故等，到达目的地后，我们仅需关车门离开，汽车自己驾驶到不挡道的地方，这样的地方却不一定是专用停车场，甚至只是某个特定时段不挡其他车通行的道路，或是自动去寻找能源补给进行充换电。”高钰这样说道。</p>
								     <p>而对于无人驾驶汽车的安全性，造成交通事故的原因主要来源于驾驶者，而无人驾驶这位“机器人司机”没有情绪不会疲劳，这种层面来看，技术比人更可靠。</p>
								     <p>“它作为交通工具载人时解放了我们的手脚和眼睛，我们可以做更多有趣的事;它作为机器人移动在城市道路中，智能调节道路交通，减少拥堵和提高车位利用效率。”高钰表示，目前共享汽车行业中的不足也能通过无人驾驶去解决。</p>
								     <p>另外，创业邦(微信搜索关注：ichuangyebang)获悉，50天后盼达还将联合百度发布下一代的无人驾驶产品与服务。同时招募100名“AI- Rider”，让一部分人先行感受无人驾驶带来的便捷。</p>
								     <p>所谓“AI- Rider”，高钰向解释，无人驾驶的实现是基于AI技术的飞速发展。未来对于拥有自主驾驶能力、甚至自主学习能力的高度智能化汽车，人类扮演的角色还能被“司机”所定义吗?司机无需全神贯注，作为一名驾乘者，车内空间可以实现更多想象。</p>
								     <p>当然AI发展的意义不是取代人类，而是更好的服务人类、解放人类。但是，如何接管高度智能化的无人驾驶汽车?所以，盼达招募的100名智驾骑士，经过系列专业培训，让他们掌握如何与AI汽车共事合作，“我们称这批智驾骑士为“AI- Rider”，高钰这样说道。</p>
								     <p>（转自泰博网：http://www.3snews.net/domestic/244000049185.html）</p>
								     <p><br></p>

							</div>
						</div>
						
						<div class="col-md-3 blog-grid1">	
							<div class="feature">
								<h4>相关新闻</h4>
								<div class="feature-top">
								<img src="<%=basePath %>Images/s1.jpg" class="img-responsive" alt="/">
										<h5>大数据时代展望</h5>
										<p>当今世界进入了智能化、绿色化、网络化、全球化的相互交织时期，世界经济和人类社会正在改变,… <a href="#">详情信息</a></p>
								</div>
								<div class="feature-top top2">
								<img src="<%=basePath %>Images/s1.jpg" class="img-responsive" alt="/">
										<h5>大数据时代展望</h5>
										<p>当今世界进入了智能化、绿色化、网络化、全球化的相互交织时期，世界经济和人类社会正在改变,… <a href="#">详情信息</a></p>
								</div>
								<div class="feature-top top2">
								<img src="<%=basePath %>Images/s1.jpg" class="img-responsive" alt="/">
										<h5>大数据时代展望</h5>
										<p>当今世界进入了智能化、绿色化、网络化、全球化的相互交织时期，世界经济和人类社会正在改变,… <a href="#">详情信息</a></p>
								</div>
								<div class="feature-top top2">
								        <img src="<%=basePath%>Images/s1.jpg" class="img-responsive" alt="/">
										<h5>大数据时代展望</h5>
										<p>当今世界进入了智能化、绿色化、网络化、全球化的相互交织时期，世界经济和人类社会正在改变,… <a href="#">详情信息</a></p>
								</div>
							</div>
						</div>

						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		
	<!-- 添加pannel，动态链接方式，需要jsp重新编译 -->
	<jsp:include page="../footer.jsp" flush="true" />
</body>
</html>

