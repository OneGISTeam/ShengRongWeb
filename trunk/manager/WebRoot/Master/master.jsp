<%@ page language="java" import="java.util.*, com.shengrong.hibernate.*, com.shengrong.hibernate.customization.*, java.text.SimpleDateFormat, java.io.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
response.setCharacterEncoding("utf-8");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<Manager> managerList = (List<Manager>)request.getAttribute("managerList");
Long totalCount = (Long)request.getAttribute("totalCount");
PagingInfo pagingInfo = (PagingInfo)request.getAttribute("pagingInfo");
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
	<link href="<%=basePath%>Plugins/cropper/cropper.css" rel="stylesheet"/>
	<link href="<%=basePath%>Plugins/validform/css/validform.css" rel="stylesheet"/>
	<!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link href="<%=basePath%>Plugins/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" />
  	<link href="<%=basePath%>Plugins/pagination/pagination.css" rel="stylesheet"/>
  </head>
  
<body>
	<div id="wrapper">
		
		<!-- 添加navbar，动态链接方式，需要jsp重新编译 -->
		<jsp:include page="./navbar.jsp" flush="true"/>
				
		<div id="page-wrapper">
			<div class="header"> 
				<h1 class="page-header">
					管理员审核<small>Manager Audit</small>
				</h1>
				<ol class="breadcrumb">
				  <li><a href="#">河南晟荣</a></li>
				  <li class="active">管理员</li>
				</ol> 
			</div>
			<div id="page-inner">
				<!-- form -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								管理员列表
							</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>姓名</th>
												<th>头像</th>
												<th>性别</th>
												<th>注册时间</th>
												<th>状态</th>
												<th>通过审核</th>
												<th>撤销审核</th>
												<th>删除账号</th>
											</tr>
										</thead>
										<tbody>
											<%
												for(int i=0; i<managerList.size();i++){
													InputStream is = managerList.get(i).getPortrait().getBinaryStream();
													byte[] b = new byte[is.available()];
													is.read(b, 0, b.length);
													String imageString = new String(b); 
													
													String regDate = new SimpleDateFormat("yyyy-MM-dd").format(managerList.get(i).getRegdatetime());
													
													if(managerList.get(i).getPermitted()){
													%>
													<tr class="success">
													<%
													}else{
													%>
													<tr class="danger">
													<%
													}
												%>
													<td><%=managerList.get(i).getName() %></td>
		                                            <td><img style="width:30px;height:30px" src="<%=imageString %>"></td>
		                                            <td>
		                                            	<%
		                                            		if(managerList.get(i).getSex()){
		                                            		%>
		                                            		男
		                                            		<%
		                                            		}else{
		                                            		%>
		                                            		女
		                                            		<%
		                                            		} 
		                                            	%>
		                                            </td>
		                                            <td><%=regDate %></td>
		                                            <th>
		                                            	<%
		                                            		if(managerList.get(i).getPermitted()){
		                                            		%>
		                                            		已通过审核
		                                            		<%
		                                            		}else{
		                                            		%>
		                                            		未通过审核
		                                            		<%
		                                            		} 
		                                            	%>
		                                            </th>
		                                            <td>
		                                            	<%
		                                            		if(managerList.get(i).getPermitted()){
		                                            		%>
		                                            		<a disabled="disabled" type="button" class="btn btn-success btn-sm" onclick="passAudit('<%=managerList.get(i).getName() %>')" >
		                                            		<%
		                                            		}else{
		                                            		%>
		                                            		<a type="button" class="btn btn-success btn-sm" onclick="passAudit('<%=managerList.get(i).getName() %>')" >
		                                            		<%
		                                            		} 
		                                            	%>
		                                            		<span class="fa fa-check"></span>&nbsp;通过审核
		                                            	</a>
		                                            </td>
		                                            <td>
		                                            	<%
		                                            		if(managerList.get(i).getPermitted()){
		                                            		%>
		                                            		<a type="button" class="btn btn-warning btn-sm" onclick="revokeAudit('<%=managerList.get(i).getName() %>')" >
		                                            		<%
		                                            		}else{
		                                            		%>
		                                            		<a disabled="disabled" type="button" class="btn btn-warning btn-sm" onclick="revokeAudit('<%=managerList.get(i).getName() %>')" >
		                                            		<%
		                                            		} 
		                                            	%>
		                                            		<span class="fa fa-undo"></span>&nbsp;撤销审核
		                                            	</a>
		                                            </td>
		                                            <td>
		                                            	<a type="button" class="btn btn-danger btn-sm" onclick="deleteManager('<%=managerList.get(i).getName() %>')" >
		                                            		<span class="fa fa-minus"></span>&nbsp;删除账号
		                                            	</a>
		                                            </td>
		                                        </tr>
												<%
												} 
											%>
										</tbody>
									</table>
									<p style="font-style:italic">
										“<font color="#3c763d">绿色</font>”栏代表已通过审核，“<font color="#a94442">红色</font>”栏代表还未通过审核。
									</p>
									<!-- paging -->
                                	<div id="pagination" style="text-align: center">
       								</div>
								</div>
							</div>
						</div>
					</div>
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
	                <button onclick="window.location.href='<%=basePath%>masterPage.action';" type="button" class="btn btn-default" data-dismiss="modal">确定</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<script src="<%=basePath%>Plugins/jquery/jquery-1.10.2.js"></script>
	<script src="<%=basePath%>Plugins/jquery/jquery.metisMenu.js"></script>
	<script src="<%=basePath%>Plugins/bootstrap/bootstrap.min.js"></script>
	<script src="<%=basePath%>scripts.js"></script>
	<script src="<%=basePath%>Plugins/cropper/cropper.js"></script>
	<script src="<%=basePath%>Plugins/validform/js/Validform_v5.3.2_ncr_min.js"></script>
	<!-- ueditor -->
	<script type="text/javascript" charset="utf-8" src="<%=basePath%>Plugins/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>Plugins/ueditor/ueditor.all.js"> </script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>Plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
	<!-- datetimepicker -->
	<script src="<%=basePath%>Plugins/datetimepicker/moment-with-locales.min.js"></script>
	<script src="<%=basePath%>Plugins/datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<script src="<%=basePath%>Plugins/pagination/jquery.pagination.js"></script>
	<script type="text/javascript">
		$(function(){
			var paginationOpt = {
				callback: pageTo,
				prev_text: "« 上一页",
				next_text: "下一页 »",
				items_per_page: 10,
				num_edge_entries: 2,
				num_display_entries: 5,
				current_page: <%=pagingInfo.getCurrentPage()%> - 1
			};

			$("#pagination").pagination(<%=totalCount%>, paginationOpt);
		});
		function passAudit(name){
			$.ajax({  
				type:"POST",
        		url:"<%=basePath%>passAudit.action",
        		dataType:"json",
        		data:{
       				"name":name
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
		}
		
		function revokeAudit(name){
			$.ajax({  
				type:"POST",
        		url:"<%=basePath%>revokeAudit.action",
        		dataType:"json",
        		data:{
       				"name":name
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
		}
		
		function pageTo(index, jq){
			var page = index + 1;
			var url = "<%=basePath %>" + "masterPage.action?"
				+ "&pagingInfo.currentPage=" + page + "&pagingInfo.itemPerPage=10";
			window.location.href=url;
			return false;
		}
		
		function deleteManager(name){
			var result = confirm("删除后无法恢复，是否确认删除管理员：" + name + "?");
			
			if(result == false){
				return;
			}
			$.ajax({  
				type:"POST",
        		url:"<%=basePath%>deleteManager.action",
        		dataType:"json",
        		data:{
       				"name":name
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
		}
	</script>
</body>
</html>
