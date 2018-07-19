<%@ page language="java" import="java.util.*,com.shengrong.hibernate.*,java.io.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
response.setCharacterEncoding("utf-8");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Map<Integer, String> producttypeMap = (Map<Integer, String>)request.getAttribute("producttypeMap");
Product product = (Product)request.getAttribute("currentProduct");
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
	
	<link href="<%=basePath%>Plugins/bootstrap/bootstrap1.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath%>Portal/style.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath%>Portal/css/css.css" type="text/css" rel="stylesheet">
     
    <script src="<%=basePath%>Plugins/bootstrap/bootstrap.min.js"></script>
    <script src="<%=basePath%>Plugins/jquery/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>Portal/js/jquery-1.2.6.pack.js" type=text/javascript></script>
    <script src="<%=basePath%>Portal/js/base.js" type=text/javascript></script>

	<!---fonts-->
    </head>
  
<body>
    <jsp:include page="navbar.jsp" flush="true" />
	<!---banner--->
	<div class="banner-section">
		<div class="container">
			<h2>产品中心</h2>
		</div>
	</div>
	<!---banner--->
	<div class="place-section">
		<div class="pro_d">
			<div id=preview>
				<div class=jqzoom id=spec-n1 >
				    <% 
				    Set<Productpic> pics = product.getProductpics();
			  	    Iterator<Productpic> iter_pics = pics.iterator();
			  	    while(iter_pics.hasNext()){
			  	    	Productpic pic = iter_pics.next();
			  			boolean isMain = pic.getMainpic();
						if(isMain){
								InputStream is =pic.getPic().getBinaryStream();
			  					byte[] b = new byte[is.available()];
			 					is.read(b, 0, b.length);
			 					String imageString = new String(b);
					%>
					<img height=350px src="<%=imageString %>" jqimg="<%=imageString %>" width=350px>
						<%} %>
				    <%} %>
	            </div>
	            <div id=spec-n5>
					<div class=control id=spec-left>
						<img src="<%=basePath%>Portal/images/left.gif" />
					</div>
					<div id=spec-list>
						<ul class=list-h>
							<% 
						   pics = product.getProductpics();
			  	           iter_pics = pics.iterator();
			  			    while(iter_pics.hasNext()){
			  			    	Productpic pic = iter_pics.next();
			  					InputStream is =pic.getPic().getBinaryStream();
			  					byte[] b = new byte[is.available()];
			 					is.read(b, 0, b.length);
			 					String imageString = new String(b);
							%>
							<li><img src="<%=imageString %>"></li>
							<%} %>
						</ul>
					</div>
					<div class=control id=spec-right>
						<img src="<%=basePath%>Portal/images/right.gif" />
					</div>
    			</div>
			</div>
			<div class="des">
				<h4 style="text-align:center;line-height:2em"><%=product.getProductname()%></h4>
				<%=product.getDes() %>
			</div>
			<script type=text/javascript>
				$(function(){			
	  				$(".jqzoom").jqueryzoom({
						xzoom:400,
						yzoom:400,
						offset:10,
						position:"right",
						preload:1,
						lens:1
					});
					$("#spec-list").jdMarquee({
						deriction:"left",
						width:350,
						height:56,
						step:2,
						speed:4,
						delay:10,
						control:true,
						_front:"#spec-right",
						_back:"#spec-left"
					});
					$("#spec-list img").bind("mouseover",function(){
						var src=$(this).attr("src");
						$("#spec-n1 img").eq(0).attr({
							src:src.replace("\/n5\/","\/n1\/"),
							jqimg:src.replace("\/n5\/","\/n0\/")
						});
						$(this).css({
							"border":"2px solid #ff6600",
							"padding":"1px"
						});
					}).bind("mouseout",function(){
						$(this).css({
							"border":"1px solid #ccc",
							"padding":"2px"
						});
					});				
				})
		</script>
   		    <script src="<%=basePath%>Portal/js/lib.js" type=text/javascript></script>
   		    <script src="<%=basePath%>Portal/js/zzsc.js" type=text/javascript></script> 
    	</div>
    	
    	<div class="membership">
			<div class="container">
				<h3 style="text-align:center;">产品参数</h3>
				<div class="membership-grids">
					<%
					Set<Productparam> params = product.getProductparams();
					Iterator<Productparam> iter_param = params.iterator();
					while(iter_param.hasNext()){
						Productparam param = iter_param.next();
					%>
					<div class="col-md-4 membership-grid">
						<div class="membership1">
						<h4><%=param.getParamname() %></h4>
							<ul class="member">
								<li><%=param.getParamvalue()%></li>
							</ul>
						</div>
					</div>
					<%} %>
					<div class="clearfix"></div>
				 </div>
			</div>
		</div>
    </div>
	<jsp:include page="footer.jsp" flush="true"/>
	<jsp:include page="floatnavbar.jsp" flush="true"/>
</body>
</html>
