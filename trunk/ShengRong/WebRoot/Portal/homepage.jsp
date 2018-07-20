<%@ page language="java" import="java.util.*,com.shengrong.hibernate.*,com.shengrong.system.*,java.io.*,java.text.SimpleDateFormat,com.shengrong.portal.tools.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/" + "Portal/";
List<Carousel> carousels = (List<Carousel>)request.getAttribute("carousels");
List<Introduction> introductions = (List<Introduction>)request.getAttribute("introductions");
List<Business> businesses = (ArrayList<Business>)request.getAttribute("businessList");
List<News> newsList = (List<News>)request.getAttribute("newsList");
List<Teamprocess> teamprocesses = (List<Teamprocess>)request.getAttribute("teamprocessList");
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
	<link rel="stylesheet" href="<%=basePath%>Plugins/horizontal-timeline/css/reset.css"> <!-- CSS reset -->
    <link rel="stylesheet" href="<%=basePath%>Plugins/horizontal-timeline/css/style.css"><!-- Resource style -->
	<script src="<%=basePath%>Plugins/horizontal-timelinejs/modernizr.js"> </script> <!-- Modernizr -->
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
    <link href="<%=basePath %>Plugins/carousel/owl.carousel1.css" rel="stylesheet" type='text/css'/>
    <link href="<%=basePath %>Plugins/carousel/owl.theme.css" rel="stylesheet" type='text/css'/>
    <style type="text/css">
    	 #scroll .item{position:relative;width:90%;margin:0 auto;overflow:hidden;} 
        /* 左右箭头 */
       .owl-buttons div{
             position:absolute;
             top:180px;
             width:30px;
             height:60px;
             margin:0;
             padding:0;
             border-radius:0; 
             font:55px/55px "宋体";  
             background-color:transparent;
             overflow:hidden;
             _display:none; 
             } 
       .owl-prev{left:-50px;background-position:0 0;}
       .owl-next{right:-50px;background-position:right 0;}
       .owl-prev:before{content:"<";}
       .owl-next:before{content:">";}
</style>
	<script src="<%=basePath %>Plugins/carousel/owl.carousel.min.js"></script>
	<script>
		$(document).ready(function() {
		$("#scroll").owlCarousel({
			items : 4,
			lazyLoad : true,
			autoPlay : false,
			navigation : true,
			navigationText: ["",""],
		});
		});
	</script>
  </head>
  
<body>
    <jsp:include page="navbar.jsp" flush="true" />
	<!---banner--->
	<div class="slider">
		<div class="callbacks_container">
			<ul class="rslides" id="slider">
			<%   for(int i=0; i<carousels.size(); i++){
			     InputStream is = carousels.get(i).getImage().getBinaryStream();
				 byte[] b = new byte[is.available()];
			     is.read(b, 0, b.length);
				 String imageString = new String(b);
				 String style= "background:" + "url(" + imageString + ")" + " no-repeat 0px 0px;background-size:cover;min-height:500px;";
			 %> 
				<div class="slid banner" style="<%=style %>">
				
					  <div class="caption">
							<h3><%=carousels.get(i).getTitle() %></h3>
							<p><%=carousels.get(i).getContent() %></p>
					  </div>
				</div>
			 <% } %>  
				
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
				    <%  int size = introductions.size();
				        if(size>0)
				        {
				     %>
				        <%=introductions.get(0).getContent()%> 
				     <% 
				         }
				        else {
				      %> 
				      暂无公司简介
				      <% 
				         }
				      %>  
				</p>
			</div>
		</div>
		<div class="feature-section">
			<div class="container">
				<h3>业务范围</h3>
				<h5>Sphere of Business</h5>
				
				<div id="scroll" class="owl-carousel owl-theme service-grids">
				
				   <% for(int j=0; j<businesses.size(); j++){ %>
					<div class="item col-md-3 service-grid hvr-bounce-to-bottom">
						<i class="<%=businesses.get(j).getIcon()%>" aria-hidden="true"></i>
						<h4><%=businesses.get(j).getBusinessname()%></h4>
						<p><%=businesses.get(j).getDes()%></p>
					</div>
					<%} %>	
					
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
				<%  for(int i=0; i<(newsList.size()<5?newsList.size():5); i++){
			        InputStream is = newsList.get(i).getImage().getBinaryStream();
				    byte[] b = new byte[is.available()];
			        is.read(b, 0, b.length);
				    String imageString = new String(b);
				    String newsDate = new SimpleDateFormat("yyyy-MM-dd").format(newsList.get(i).getNewsdate());
					String contentPlainText = HtmlFilterTool.toPlainText(newsList.get(i).getContent());
				     if(i==0){
			     %> 
					<div class="col-md-6 about-grid">
						<div class="headline">
							<h4><%=newsList.get(i).getTitle()%></h4>
							<span class="badge badge-info"><%=newsDate%></span>
							<p><%=contentPlainText%></p>
							<img src="<%=imageString%>">
							<div>
								<a onclick="openNews(<%=newsList.get(i).getNewsid()%>)" class="button">详细情况</a>
							</div>
						</div>
					</div>
					<div class="col-md-6 about-grid1">
					<%}else{ %>
						<div class="newsRow"  onclick="openNews(<%=newsList.get(i).getNewsid()%>)">
							<h4><%=newsList.get(i).getTitle()%></h4>
							<span class="badge badge-info"><%=newsDate%></span>
							<p><%=contentPlainText%></p>
						</div>
					 <%}%>
					 <%}%>
					 </div>
					
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		<div class="feature-section">
		   <div class="container">
			<h3>团队足迹</h3>
			<h5>Team Process</h5>
			  <section class="cd-horizontal-timeline">
	        	<div class="timeline">
					<div class="events-wrapper">
						<div class="events">
							<ol>
							  <% for(int k=0;k<teamprocesses.size();k++){
							     String processDate = new SimpleDateFormat("yyyy/MM").format(teamprocesses.get(k).getDate());
							     String processDate2 = new SimpleDateFormat("dd/MM/yyyy").format(teamprocesses.get(k).getDate());
							     if(k==0){
							   %>
								<li><a href="#0" data-date="<%=processDate2%>" class="selected"><%=processDate%></a></li>
								 <%
								  }else{%>
								<li><a href="#0" data-date="<%=processDate2%>"><%=processDate%></a></li>
							        <%} %>
							   <%} %>
				            </ol>
							<span class="filling-line" aria-hidden="true"></span>
						</div> <!-- .events -->
					</div> <!-- .events-wrapper -->
			
					<ul class="cd-timeline-navigation">
						<li><a href="#0" class="prev inactive">Prev</a></li>
						<li><a href="#0" class="next">Next</a></li>
					</ul> <!-- .cd-timeline-navigation -->
				</div> <!-- .timeline -->

				<div class="events-content">
					<ol>
					     <% for(int k=0; k<teamprocesses.size();k++){
					      InputStream is = teamprocesses.get(k).getImage().getBinaryStream();
				          byte[] b = new byte[is.available()];
			              is.read(b, 0, b.length);
				          String imageString = new String(b);
				          String processDate2 = new SimpleDateFormat("dd/MM/yyyy").format(teamprocesses.get(k).getDate());
				          if(k==0){
					      %>
						<li class="selected" data-date="<%=processDate2%>">
						<%}else{ %>
						<li data-date="<%=processDate2%>">
						 <%} %>
						<div class="team-main-d">
						    <div class="team-main-img"><img class="process-img" src="<%=imageString%>"></div>
						    <div class="team-main-fr">
						        <div class="team-main-tit"><%=teamprocesses.get(k).getLocation()%></div>
						        <div title="<%=teamprocesses.get(k).getBrief()%>" class="team-main-dd"><%=teamprocesses.get(k).getBrief()%></div>
						    </div>
						</div>
						</li>
			              <%} %>
					</ol>
				</div> <!-- .events-content -->
		      </section>
	       </div>	
	  </div>

     <script src="<%=basePath%>Plugins/horizontal-timeline/js/jquery.mobile.custom.min.js"></script>
     <script src="<%=basePath%>Plugins/horizontal-timeline/js/main.js"></script> <!-- Resource jQuery -->
	<!-- 添加pannel，动态链接方式，需要jsp重新编译 -->
	 
	<jsp:include page="footer.jsp" flush="true"/>
	<jsp:include page="floatnavbar.jsp" flush="true"/>
	<script type="text/javascript">
		function openNews(newsid){
			window.location.href = "<%=basePath%>openNews.action?newsid=" + newsid;
		}
	</script>
</body>
</html>
