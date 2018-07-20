<%@ page language="java" import="java.util.*,com.shengrong.hibernate.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"Manager/";
List<Business> businesses = (ArrayList<Business>)request.getAttribute("businessList");
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
	<link href="<%=basePath%>Plugins/FontAwesome/font-awesome.css" rel="stylesheet"/>
	<link href="<%=basePath%>styles.css" rel="stylesheet"/>
	<link href="<%=basePath%>Plugins/validform/css/validform.css" rel="stylesheet"/>
	<!-- Google Fonts-->
    <link href='<%=basePath%>fonts.css' rel='stylesheet' type='text/css' />
  	<style>
  		.bs-glyphicons {
			margin: 0 -10px 20px;
			overflow: hidden
		}
		
		.bs-glyphicons-list {
			padding-left: 0;
			list-style: none
		}
		
		.bs-glyphicons li {
			float: left;
			width: 25%;
			height: 115px;
			padding: 10px;
			font-size: 10px;
			line-height: 1.4;
			text-align: center;
			background-color: #f9f9f9;
			border: 1px solid #fff
		}
		
		.bs-glyphicons .glyphicon {
			margin-top: 5px;
			margin-bottom: 10px;
			font-size: 24px
		}
		
		.bs-glyphicons .glyphicon-class {
			display: block;
			text-align: center;
			word-wrap: break-word
		}
		
		.bs-glyphicons li:hover {
			color: #fff;
			background-color: #563d7c
		}
  	</style>
  </head>
  
<body>
	<div id="wrapper">
		
		<!-- 添加navbar，动态链接方式，需要jsp重新编译 -->
		<jsp:include page="../navbar.jsp" flush="true"/>
		
		<div id="page-wrapper">
			<div class="header"> 
				<h1 class="page-header">
					业务范围管理<small>Sphere of Business Manager</small>
				</h1>
				<ol class="breadcrumb">
				  <li><a href="#">河南晟荣</a></li>
				  <li class="active">业务范围</li>
				</ol> 
			</div>
			<div id="page-inner">
				<!-- form -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								增加新的公司业务
	                        </div>
	                        <div class="panel-body">
	                        	<div class="row">
	                        		<div class="col-lg-12">
	                        			<form method="post" role="form" action="<%=basePath %>homepage/saveBusiness.action">
	                        				<div class="form-group">
	                        					<label>业务名称</label>
	                        					<input type="text" class="form-control" datatype="*1-16" errormsg="业务名称不能为空，且不要超过16个字！" name="business.businessname"/>
	                        					<p class="help-block">请输入业务的名称，为了前台页面美观，请尽可能不要超过16个字</p>
	                        				</div>
	                        				<div class="form-group">
	                        					<label>业务描述</label> 
	                        					<textarea class="form-control" rows="3" name="business.des" datatype="*90-128" errormsg="业务描述最好在90-128个字之间！"></textarea>
	                        					<p class="help-block">请输入业务的描述内容，为了前台页面美观,请控制在128个字以内，并保证各个业务描述字数大致相等</p>
	                        				</div>
	                        				<div class="form-group">
	                        					<label>业务图标</label><br>
	                        					<input id="selectedIcon" value="glyphicon glyphicon-leaf" name="business.icon" style="display:none" />
	                        					<span>当前图标：</span><i id="currentIcon" class="glyphicon glyphicon-leaf fa-5x"></i>
	                        					<p class="help-block">请<a onclick="selectIcon()" target="_blank">点击这里</a>选择最能代表公司该项业务的图标，否则将使用默认图标</p>
	                        				</div>
	                        				<button type="submit" class="btn btn-default">确认提交</button>
                                        	<button type="reset" onclick="resetIcon()" class="btn btn-default">内容重置</button>
	                        			</form>
	                        		</div>
	                        	</div>
	                        </div>
						</div>
					</div>
				</div>
				
				<!-- businesses -->
				<%
					int rowCount =  businesses.size()%4 == 0?businesses.size()/4:businesses.size()/4+1;
					for(int i=0; i<rowCount; i++){
					%>
					<div class="row">
						<%
							int row = i==rowCount-1?businesses.size()-(rowCount-1)*4:4;
							for(int j=0;j<row;j++ ){
								int currentIndex = j + i*4;
							%>
								<div class="col-md-3 col-sm-3">
									<div class="panel panel-success">
										<div class="panel-heading">
											<i id="currentIcon" class="<%=businesses.get(currentIndex).getIcon()%>"></i>
											<%=businesses.get(currentIndex).getBusinessname() %>
										</div>
										<div class="panel-body">
			                           		<p><%=businesses.get(currentIndex).getDes() %></p>
			                       		</div>
			                       		<div class="panel-footer">
											添加人:<%=businesses.get(currentIndex).getManager()==null?"":businesses.get(currentIndex).getManager().getName() %>
				                        	<a class="btn btn-danger" onclick="deleteBusiness(<%=businesses.get(currentIndex).getBusinessid() %>)">删除</a>
				                        </div>
									</div>
								</div>
							<%
							}
						 %>
					</div>
					<%
					}
				%>

				<footer>
					<p>Copyright &copy; 2018.河南晟荣建筑工业科技有限公司版权所有.</p>
				</footer>
			</div>
		</div>
	</div>
	
	<!-- 模态对话框 -->
	<div class="modal fade" id="iconSelect_dlg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content">
	            <div class="modal-header">
	            	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="iconSelect_title">请选择合适的图标</h4>
	            </div>
	            <div class="modal-body" id="iconSelect_content">
	                <!-- 添加glyphicon，动态链接方式，需要jsp重新编译 -->
					<jsp:include page="./glyphicon.jsp" flush="true"/>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	            </div>
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
	                <button onclick="window.location.href='<%=basePath%>homepage/businesses.action';" type="button" class="btn btn-default" data-dismiss="modal">确定</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<script src="<%=basePath%>Plugins/jquery/jquery-1.10.2.js"></script>
	<script src="<%=basePath%>Plugins/jquery/jquery.metisMenu.js"></script>
	<script src="<%=basePath%>Plugins/bootstrap/bootstrap.min.js"></script>
	<script src="<%=basePath%>scripts.js"></script>
	<script src="<%=basePath%>Plugins/validform/js/Validform_v5.3.2_ncr_min.js"></script>
	<script type="text/javascript">
		$(function(){
			//初始化表单验证信息
			var form = $("form").Validform({
				tiptype:3,
				label:".label",
				showAllError:true
			});
		});
		function resetIcon(){
			$("#currentIcon").attr("class","glyphicon glyphicon-leaf fa-5x");
			return true;
		}
		
		function selectIcon(){
			$("#iconSelect_dlg").modal();
			return false;
		}
		
		function iconClicked(li){
			var icon = $(li).children(":first").attr("class");
			//设置预览图标
			$("#currentIcon").attr("class", icon + " fa-5x");
			//设置选择的图标值
			$("#selectedIcon").val(icon);
			$("#iconSelect_dlg").modal("hide");
		}
		
		function deleteBusiness(businessid){
			$.ajax({  
				type:"POST",
        		url:"<%=basePath%>homepage/deleteBusiness.action",
        		dataType:"json",
        		data:{
       				"id":businessid
        		},
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
        	return false;
		}
		
	</script>
</body>
</html>
