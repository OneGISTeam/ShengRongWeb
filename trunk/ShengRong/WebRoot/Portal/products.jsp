<%@ page language="java" import="java.util.*,com.shengrong.hibernate.*,java.io.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
response.setCharacterEncoding("utf-8");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"Portal/";
Producttype producttype = (Producttype)request.getAttribute("producttype");
Map<Integer, String> producttypeMap = (Map<Integer, String>)request.getAttribute("producttypeMap");
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
	<link href="<%=basePath%>Plugins/FontAwesome/font-awesome.css" rel="stylesheet"/>
	<link href="<%=basePath%>Portal/style.css" rel="stylesheet" type='text/css'/>
		<link href="<%=basePath%>Portal/products.css" rel="stylesheet" type='text/css'/>
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
  <div id="page-wrapper">
	<div id="page-inner">
		<div class="productNavbarIcon" id="productIcon">
			<span class="fa fa-th-list"></span>产品分类列表
		</div>
		<div class="productNavbar" id="productNav">
			<ul class="nav">
			<% for(Map.Entry<Integer, String> entry : producttypeMap.entrySet()) {%>
				<li>
					<a href="<%=basePath %>Products/products.action?currenttypeID=<%=entry.getKey() %>"><i class="fa fa-circle-o"></i><%=entry.getValue() %></a>
				</li>
					<%	
					}
				    %>
			</ul>
		</div>
		<div class="row">
			<% 
			  Set<Product> productSet = producttype.getProducts();
			  Iterator<Product> iter = productSet.iterator();
			  while(iter.hasNext()){
					Product pd = iter.next();
					Set<Productpic> picSet = pd.getProductpics();
					Iterator<Productpic> iter_pic = picSet.iterator();
					String imageString = null;
					while(iter_pic.hasNext()){
						Productpic pc = iter_pic.next();
						if(pc.getMainpic()){
							InputStream is = pc.getPic().getBinaryStream();
							byte[] b = new byte[is.available()];
							is.read(b, 0, b.length);
							imageString = new String(b); 
							break;
						}
					}
			%>
			<div class="col-lg-4">
				<div class="panel panel-default">
					<div class="panel-heading">
			             <%=pd.getProductname() %>/<font color="#878787"><%=pd.getProductmodel() %></font>
			        </div>
			        <hr>
			       <div class="panel-body">
						<div class="gallery-grid">
							<img src="<%=imageString %>" class="img-responsive zoom-img" alt="图片丢失">	                                
						</div>
						<hr>
						<div style="text-align:center">
					    <a href="<%=basePath%>Products/openProduct.action?currentproductID=<%=pd.getProductid() %>" class="btn btn-default"><span class="fa fa-eye"></span>&nbsp;查看该产品</a>
						</div>
					</div>
				</div>
			</div>
			<%} %>
		</div>
	 </div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
	<jsp:include page="floatnavbar.jsp" flush="true"/>
	<script src="<%=basePath%>Plugins/jquery/jquery-1.11.1.min.js"></script>
	<script src="<%=basePath%>Plugins/bootstrap/bootstrap.min.js"></script>
	<script src="<%=basePath%>Plugins/jquery/jquery.metisMenu.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#productIcon").mouseover(function(){
				$("#productNav").fadeIn();
				$("#productNav").fadeIn("slow");
				$("#productNav").fadeIn(3000);
			});
			
			$("#productNav").mouseleave(function(){
				$("#productNav").fadeOut();
				$("#productNav").fadeOut("slow");
				$("#productNav").fadeOut(3000);
			});
		});
	</script>
</body>
</html>
