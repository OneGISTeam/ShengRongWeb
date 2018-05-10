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
	<script src="<%=basePath%>Plugins/jquery/jquery-1.11.1.min.js"></script>
	<script src="<%=basePath%>Plugins/bootstrap/bootstrap.js"></script>
	
	<!---fonts-->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
	
	<script src="<%=basePath %>Plugins/slides/responsiveslides.min.js"></script>
	<script>
		$(function () {
		  $("#slider").responsiveSlides({
			auto:true,
			nav: false,
			speed: 500,
			namespace: "callbacks",
			pager:true,
		  });
		});
	</script>
	<link href="<%=basePath %>Plugins/carousel/owl.carousel.css" rel="stylesheet" type='text/css'/>
	<script src="<%=basePath %>Plugins/carousel/owl.carousel.js"></script>
	<script>
		$(document).ready(function() {
		$("#owl-demo").owlCarousel({
			items : 1,
			lazyLoad : true,
			autoPlay : true,
			navigation : false,
			navigationText : false, 
			pagination : true,
		});
		});
	</script>
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
						<li class="active"><a href="homePage.jsp">公司首页 <span class="sr-only">(current)</span></a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">产品中心<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="Products/coffeeMachine.jsp">咖啡机</a></li>
										<li><a href="Products/coffeeMachine.jsp">消防器材</a></li>
									</ul>
							</li>
							<li class="dropdown ">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">新闻前线<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="News/tradenews.jsp">行业新闻</a></li>
										<li><a href="News/companynews.jsp">公司动态</a></li>
									</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">资料共享 <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="2columnsgallery.html">2 Columns Gallery</a></li>
										<li><a href="3columnsgallery.html">3 Columns Gallery</a></li>
										<li><a href="4columnsgallery.html">4 Columns Gallery</a></li>
									</ul>
							</li>
						<li><a href="Aboutus/aboutshengrong.jsp">关于我们</a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
			</nav>
		</div>
	</div>
	<!-- /heander -->
	<!---banner--->
	<div class="slider">
		<div class="callbacks_container">
			<ul class="rslides" id="slider">
				<div class="slid banner1">
					  <div class="caption">
							<h3>标题</h3>
							<p>新型节能环保材料、建筑材料的技术研发及销售；消防器材销售及售后服务；消防工程设计及施工。</p>
							<a href="#" class="button">了解一下</a>
					  </div>
				</div>
				<div class="slid banner2">	
					  <div class="caption">
							<h3>标题</h3>
							<p>新型节能环保材料、建筑材料的技术研发及销售；消防器材销售及售后服务；消防工程设计及施工。</p>
							<a href="#" class="button">了解一下</a>
					  </div>
				</div>
				<div class="slid banner3">	
					<div class="caption">
						<h3>标题</h3>
						<p>新型节能环保材料、建筑材料的技术研发及销售；消防器材销售及售后服务；消防工程设计及施工。</p>
						<a href="#" class="button">了解一下</a>
					</div>
				</div>
			</ul>
		</div>
	</div>
	<!---banner--->
	<div class="content">
		<div class="place-section">
			<div class="container">
				<h3>公司简介</h3>
				<h5>Company Introduction</h5>
				<hr/>
				<p class="introduction">
					公司成立于2017年4月26日，主要是新型节能环保材料、建筑材料的技术研发及销售；消防器材销售及售后服务；消防工程设计及施工。
					公司成立于2017年4月26日，主要是新型节能环保材料、建筑材料的技术研发及销售；消防器材销售及售后服务；消防工程设计及施工。
					公司成立于2017年4月26日，主要是新型节能环保材料、建筑材料的技术研发及销售；消防器材销售及售后服务；消防工程设计及施工。
					公司成立于2017年4月26日，主要是新型节能环保材料、建筑材料的技术研发及销售；消防器材销售及售后服务；消防工程设计及施工。
					公司成立于2017年4月26日，主要是新型节能环保材料、建筑材料的技术研发及销售；消防器材销售及售后服务；消防工程设计及施工。
					公司成立于2017年4月26日，主要是新型节能环保材料、建筑材料的技术研发及销售；消防器材销售及售后服务；消防工程设计及施工。
				</p>
				<p class="introduction">
					公司成立于2017年4月26日，主要是新型节能环保材料、建筑材料的技术研发及销售；消防器材销售及售后服务；消防工程设计及施工。
					公司成立于2017年4月26日，主要是新型节能环保材料、建筑材料的技术研发及销售；消防器材销售及售后服务；消防工程设计及施工。
					公司成立于2017年4月26日，主要是新型节能环保材料、建筑材料的技术研发及销售；消防器材销售及售后服务；消防工程设计及施工。
					公司成立于2017年4月26日，主要是新型节能环保材料、建筑材料的技术研发及销售；消防器材销售及售后服务；消防工程设计及施工。
					公司成立于2017年4月26日，主要是新型节能环保材料、建筑材料的技术研发及销售；消防器材销售及售后服务；消防工程设计及施工。
					公司成立于2017年4月26日，主要是新型节能环保材料、建筑材料的技术研发及销售；消防器材销售及售后服务；消防工程设计及施工。
				</p>
			</div>
		</div>
		<div class="feature-section">
			<div class="container">
				<h3>业务范围</h3>
				<h5>Sphere of Business</h5>
				<hr/>
				<div class="service-grids">
					<div class="col-md-3 service-grid hvr-bounce-to-bottom">
						<i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>
						<h4>主营业务一</h4>
						<p>
							主营业务是指企业为完成其经营目标而从事的日常活动中的主要活动，
							可根据企业营业执照上规定的主要业务范围确定，例如工业、商品流通
							企业的主营业务是销售商品，银行的主营业务是贷款和为企业办理结算等。
						</p>
					</div>
					<div class="col-md-3 service-grid hvr-bounce-to-bottom">
						<i class="glyphicon glyphicon-user" aria-hidden="true"></i>
						<h4>主营业务二</h4>
						<p>
							主营业务是指企业为完成其经营目标而从事的日常活动中的主要活动，
							可根据企业营业执照上规定的主要业务范围确定，例如工业、商品流通
							企业的主营业务是销售商品，银行的主营业务是贷款和为企业办理结算等。
						</p>
					</div>
					<div class="col-md-3 service-grid hvr-bounce-to-bottom">
						<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
						<h4>主营业务三</h4>
						<p>
							主营业务是指企业为完成其经营目标而从事的日常活动中的主要活动，
							可根据企业营业执照上规定的主要业务范围确定，例如工业、商品流通
							企业的主营业务是销售商品，银行的主营业务是贷款和为企业办理结算等。
						</p>
					</div>
					<div class="col-md-3 service-grid hvr-bounce-to-bottom">
						<i class="glyphicon glyphicon-cloud-download" aria-hidden="true"></i>
						<h4>主营业务四</h4>
						<p>
							主营业务是指企业为完成其经营目标而从事的日常活动中的主要活动，
							可根据企业营业执照上规定的主要业务范围确定，例如工业、商品流通
							企业的主营业务是销售商品，银行的主营业务是贷款和为企业办理结算等。
						</p>
					</div>
					<div class="clearfix">
					</div>
				</div>
			</div>
		</div>
		<div class="place-section">
			<div class="container">
				<h3>公司理念</h3>
				<h5>Company Philosophy</h5>
				<hr/>
				<img src="<%=basePath%>Images/philosophy.png"/>
			</div>
		</div>
		<div class="place-section">
			<div class="container">
				<div class="about-grids">
					<div class="col-md-6 about-grid">
						<div class="headline">
							<h4>河南晟荣公司在郑州各校园进行春季招聘</h4>
							<p>
								2017年3月11日，“梦在苏州科技城”第五届春季大型人才招聘会在中国苏州人力资源产业
								园科技城分园举行，作为中国科学院地理信息与文
							</p>
							<img src="<%=basePath %>Images/a1.jpg">
							<div>
								<a href="#" class="button">详细情况</a>
							</div>
						</div>
					</div>
					<div class="col-md-6 about-grid1">
						<div class="newsRow">
							<h4>国家重点研发计划“全空间信息系统与智能设施管理”项目实施方案</h4>
							<span class="badge badge-info">2017-5-19</span>
							<p>
								2017年5月18日，地球观测与导航重点专项管理办公室和总体专家组在北京召开了国家重点研发计划地球观测与导航重点专项“全空间信息系统与智能设施管理
							</p>
						</div>
						<div class="newsRow">
							<h4>国家重点研发计划“全空间信息系统与智能设施管理”项目实施方案</h4>
							<span class="badge badge-info">2017-5-19</span>
							<p>
								2017年5月18日，地球观测与导航重点专项管理办公室和总体专家组在北京召开了国家重点研发计划地球观测与导航重点专项“全空间信息系统与智能设施管理
							</p>
						</div>
						<div class="newsRow">
							<h4>国家重点研发计划“全空间信息系统与智能设施管理”项目实施方案</h4>
							<span class="badge badge-info">2017-5-19</span>
							<p>
								2017年5月18日，地球观测与导航重点专项管理办公室和总体专家组在北京召开了国家重点研发计划地球观测与导航重点专项“全空间信息系统与智能设施管理
							</p>
						</div>
						<div class="newsRow">
							<h4>国家重点研发计划“全空间信息系统与智能设施管理”项目实施方案</h4>
							<span class="badge badge-info">2017-5-19</span>
							<p>
								2017年5月18日，地球观测与导航重点专项管理办公室和总体专家组在北京召开了国家重点研发计划地球观测与导航重点专项“全空间信息系统与智能设施管理
							</p>
						</div>
					</div>
					<div class="clearfix">
					</div>
				</div>
			</div>
		</div>
		<div class="team-process">
			<h3>团队足迹</h3>
			<h5>Team Process</h5>
			<img style="width:100%" src="<%=basePath %>Images/team-bg.jpg"/>
		</div>
		
		<script type="text/javascript">
			$(function(){
				initTeamProcess();
			});
			
			function initTeamProcess(){
				var canvas = document.getElementById("team_process");
				var context = canvas.getContext("2d");  
				var width = canvas.clientWidth;
				var height = canvas.clientHeight;
				context.beginPath();
				context.moveTo(0,50);
				context.lineTo(width,50);
				//context.strokeStyle = "#969696";
				context.stroke();
			}
		</script>
	</div>
	<!-- 添加pannel，动态链接方式，需要jsp重新编译 -->
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
