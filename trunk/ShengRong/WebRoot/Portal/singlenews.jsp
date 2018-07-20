<%@ page language="java" import="java.util.*,com.shengrong.hibernate.*,java.io.*,java.text.SimpleDateFormat,com.shengrong.portal.tools.*" pageEncoding="utf-8" %>
<%
String path = request.getContextPath();
response.setCharacterEncoding("utf-8");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"Portal/";
News news = (News)request.getAttribute("news");
List<News> newsList = (List<News>)request.getAttribute("newsList");
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
	<style>
	p{ text-indent:2em; padding:0px; margin:0px; }
	</style>
  </head>
  
<body>
	<!---header--->
	<jsp:include page="navbar.jsp" flush="true" />
	<!---banner--->
	<div class="banner-section">
			<div class="container">
				<h2>新闻前线</h2>
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
							    <% String newsDate = new SimpleDateFormat("yyyy-MM-dd").format(news.getNewsdate());
							       InputStream is = news.getImage().getBinaryStream();
							       byte[] b = new byte[is.available()];
							       is.read(b, 0, b.length);
						           String imageString = new String(b);
							     %>
								    <h3><%=news.getTitle() %></h3>
								    <p><%=newsDate %>  / <%=news.getManager().getName()%> </p>
								    <%-- <a href="#" class="news_img"><img src="<%=imageString%>" class="img-responsive" alt=""></a> --%>
								     <%=news.getContent()%>
							</div>
						</div>
						
						 <div class="col-md-3 blog-grid1">	
							<div class="feature">
								<h4>相关新闻</h4>
						      <% int size = newsList.size();
				                 if(size>0)
				                {
                                for(int i=0;i<(size<4?size:4);i++){
                           	 	is = newsList.get(i).getImage().getBinaryStream();
								b = new byte[is.available()];
								is.read(b, 0, b.length);
						   		String imageStrings = new String(b);
								String contentPlainTexts = HtmlFilterTool.toPlainText(newsList.get(i).getContent());
								if(i==0){
                              %>
								<div class="feature-top" onclick="openNews(<%=newsList.get(i).getNewsid()%>)">
									<img src="<%=imageString%>" class="img-responsive" alt="/">
									<h5><%=newsList.get(i).getTitle()%></h5>
									<p><%=contentPlainTexts%></p>
								</div>
								 <%
					                }else{
					              %>
								<div class="feature-top top2" onclick="openNews(<%=newsList.get(i).getNewsid()%>)">
									<img src="<%=imageStrings%>" class="img-responsive" alt="/">
									<h5><%=newsList.get(i).getTitle()%></h5>
									<p><%=contentPlainTexts%><a onclick="openNews(<%=newsList.get(i).getNewsid()%>)">详情信息</a></p>
								</div>
								     <%}%>
							     <%}%>
							   <%}
							    else {
				               %> 
				                                                       暂无相关新闻
				               <% 
				                 }
				               %>  
							</div>
						</div>

						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		
	<!-- 添加pannel，动态链接方式，需要jsp重新编译 -->
	<jsp:include page="./footer.jsp" flush="true" />
	<jsp:include page="floatnavbar.jsp" flush="true"/>
	<script type="text/javascript">
		function openNews(newsid){
			window.location.href = "<%=basePath%>openNews.action?newsid=" + newsid;
		}
	</script>
</body>
</html>

