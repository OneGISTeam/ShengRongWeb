<%@ page language="java" import="java.util.*,com.shengrong.hibernate.*,java.io.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
response.setCharacterEncoding("utf-8");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Producttype producttype = (Producttype)request.getAttribute("producttype");
Map<Integer, String> producttypeMap = (Map<Integer, String>)request.getAttribute("producttypeMap");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>河南晟荣建筑工业科技有限公司-企业门户网站后台管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="description" content="河南晟荣建筑工业科技有限公司-企业门户网站后台管理系统">
	
	<link href="<%=basePath%>Plugins/bootstrap/bootstrap.css" rel="stylesheet"/>
	<link href="<%=basePath %>Plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet"/>
	<link href="<%=basePath%>Plugins/FontAwesome/font-awesome.css" rel="stylesheet"/>
	<link href="<%=basePath%>styles.css" rel="stylesheet"/>
	<link href="<%=basePath%>Plugins/validform/css/validform.css" rel="stylesheet"/>
	<!-- Google Fonts-->
    <link href='<%=basePath%>fonts.css' rel='stylesheet' type='text/css' />
  </head>
  
<body>
	<div id="wrapper">
		
		<!-- 添加navbar，动态链接方式，需要jsp重新编译 -->
		<jsp:include page="../navbar.jsp" flush="true"/>
		
		<div id="page-wrapper">
			<div class="header"> 
				<h1 class="page-header">
					产品列表<small>Product List</small>
				</h1>
				<ol class="breadcrumb">
				  <li><a href="#">河南晟荣</a></li>
				  <li class="active">产品</li>
				</ol> 
			</div>
			<div id="page-inner">
				<!-- product-nav -->
				<div class="productNavbarIcon" id="productIcon">
					<span class="fa fa-th-list"></span>
					产品分类列表
				</div>
				<div class="productNavbar" id="productNav">
					<ul class="nav">
						<% 
							for(Map.Entry<Integer, String> entry : producttypeMap.entrySet()) { 
							%>
								<li>
					                <a href="<%=basePath %>product/products.action?currenttypeID=<%=entry.getKey() %>"><i class="fa fa-circle-o"></i><%=entry.getValue() %></a>
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
											<a href="<%=basePath%>product/editProductPage.action?currentproductID=<%=pd.getProductid() %>" class="btn btn-default"><span class="fa fa-eye"></span>&nbsp;查看该产品</a>
											<a onclick="deleteProduct(<%=pd.getProductid() %>);return false;" class="btn btn-default"><span class="fa fa-minus"></span>&nbsp;删除该产品</a>
										</div>
									</div>
								</div>
							</div>
						<%
						}
					%>
				</div>
				
				
				
				<footer>
					<p>Copyright &copy; 2018.河南晟荣建筑工业科技有限公司版权所有.</p>
				</footer>
			</div>
		</div>
	</div>
	
	<!-- 模态对话框 -->
	<div class="modal fade" id="operatorInfo_dlg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content">
	            <div class="modal-header">
	            	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="operatorInfo_title"></h4>
	            </div>
	            <div class="modal-body" id="operatorInfo_content">
	                
	            </div>
	            <div class="modal-footer">
	                <button onclick="window.location.href='<%=basePath%>product/products.action';" type="button" class="btn btn-default" data-dismiss="modal">确定</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<script src="<%=basePath%>Plugins/jquery/jquery-1.10.2.js"></script>
	<script src="<%=basePath%>Plugins/jquery/jquery.metisMenu.js"></script>
	<script src="<%=basePath%>Plugins/bootstrap/bootstrap.min.js"></script>
	<script src="<%=basePath%>Plugins/dataTables/jquery.dataTables.js"></script>
	<script src="<%=basePath%>Plugins/dataTables/dataTables.bootstrap.js"></script>
	<script src="<%=basePath%>scripts.js"></script>
	<script src="<%=basePath%>Plugins/validform/js/Validform_v5.3.2_ncr_min.js"></script>
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
		
		function deleteProduct(currentid){
			$.ajax({  
				type:"GET",
        		url:"<%=basePath%>product/deleteProduct.action?currentproductID=" + currentid ,
        		dataType:"json",
        		success:function(data){
        			var result = JSON.parse(data);
        			if(result.code == "200"){
        				$("#operatorInfo_title").html("提示信息");
						$("#operatorInfo_content").html(result.msg);
        			}else{
        				$("#operatorInfo_title").html("错误信息");
						$("#operatorInfo_content").html(result.msg);
        			}
        			$("#operatorInfo_dlg").modal();
        		},
        		error:function(XMLHttpRequest, textStatus, errorThrown){
        			$("#operatorInfo_title").html("错误信息");
					$("#operatorInfo_content").html(textStatus);
					$("#operatorInfo_dlg").modal();
        		}
        	});
		}
	</script>
</body>
</html>
