<%@ page language="java" import="java.util.*,com.shengrong.hibernate.*,java.io.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
response.setCharacterEncoding("utf-8");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"Portal/";
List<Member> memberList = (List<Member>)request.getAttribute("memberList");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head lang="zh-CN">   
   <base href="<%=basePath%>"> 
    <title>河南晟荣建筑工业科技有限公司</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="河南晟荣,晟荣,建筑工业科技">
	<meta http-equiv="description" content="河南晟荣建筑工业科技有限公司网站">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	
	<link href="<%=basePath %>Plugins/bootstrap/bootstrap.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath %>Portal/style.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath %>Portal/aboutus.css" rel="stylesheet" type='text/css'/>
	
	<script src="<%=basePath%>Plugins/jquery/jquery-1.11.1.min.js"></script>
	<script src="<%=basePath%>Plugins/jquery/jquery.baiduMap.min.js"></script>
	<script src="<%=basePath%>Plugins/bootstrap/bootstrap.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=cbZBSnBB0OtXxG4Zh1LWGOFTXvqbXmdO"></script>
	
	<!---fonts-->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
  </head>
  
  
  <body>
    <!---header--->
	 <jsp:include page="navbar.jsp" flush="true" />
	<!-- /header -->
	<!---banner--->
		<div class="banner-section">
			<div class="container">
				<h2>关于我们</h2>
		    </div>
		    
		    <div class="dynamic-news">
		         <a class="dynamic" href="<%=basePath%>Aboutus/aboutshengrong.action" >关于晟荣</a> 
		         <a class="dynamic active" href="<%=basePath%>Aboutus/aboutteam.action">关于团队</a>
		    </div>
		</div>
	<!---banner--->
	   <div class="content">
	       <ul class="team-ul">
	       		<li>
	       			<img alt="" src="<%=basePath %>Images/team1.png">
	       			<p>五险一金</p>
	       		</li>
	       		<li>
	       			<img alt="" src="<%=basePath %>Images/team2.png">
	       			<p>双休年假</p>
	       		</li>
	       		<li>
	       			<img alt="" src="<%=basePath %>Images/team3.png">
	       			<p>生日礼物</p>
	       		</li>
	       		<li>
	       			<img alt="" src="<%=basePath %>Images/team4.png">
	       			<p>健康体验</p>
	       		</li>
	       		<li>
	       			<img alt="" src="<%=basePath %>Images/team5.png">
	       			<p>零食饮料</p>
	       		</li>
	       		<li>
	       			<img alt="" src="<%=basePath %>Images/team6.png">
	       			<p>弹性工作</p>
	       		</li>
	       </ul>
	       <div class="border-top"></div>
	   	   <div class="tit-5">绿色<span> · </span>环保</div>
	   	   <div class="subtitle">因为刚好遇见你，留下梦想的期许</div>
	   	   
	   	   <div class="friend-agent">
				<div class="container">
					<div class="friend-grids">
		
					    <%    for(int i=0; i<memberList.size(); i++){
					            InputStream is = memberList.get(i).getImage().getBinaryStream();
					            byte[] b = new byte[is.available()];
					            is.read(b, 0, b.length);
					            String imageString = new String(b);
					     %>
						<div class="col-md-3 friend-grid">
							<img style="width:100%;" src="<%=imageString%>">
							<h4><%=memberList.get(i).getMembername() %></h4>
							<p><%=memberList.get(i).getPost() %></p>
						</div>
						<%
						} 
						%>
						
						
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
	       
	  </div>
	
	 <jsp:include page="footer.jsp" flush="true"/>
	 <jsp:include page="floatnavbar.jsp" flush="true"/>
  </body>
	          
</html>

