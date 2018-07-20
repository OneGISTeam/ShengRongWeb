<%@ page language="java" import="java.util.*,com.shengrong.hibernate.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"Manager/";
List<Recruit> recruitList = (List<Recruit>)request.getAttribute("recruitList");
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
					招聘信息列表<small>Recruit Information List</small>
				</h1>
				<ol class="breadcrumb">
				  <li><a href="#">河南晟荣</a></li>
				  <li class="active">招聘信息</li>
				</ol> 
			</div>
			<div id="page-inner">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								已发布的招聘信息
							</div>
							<div class="panel-body">
								<table class="table table-striped table-bordered table-hover" id="table_recruitinfos">
									<thead>
										<tr>
											<th>标识号</th>
											<th>发布职位</th>
											<th>发布日期</th>
											<th>截止日期</th>
											<th>发布者</th>
											<th>查看</th>
											<th>删除</th>
										</tr>
									</thead>
									<tbody>
										<% 
											for(int i=0; i<recruitList.size();i++){
												if(i%2==0){
												%>
													<tr class="odd gradeA">
														<td class="center"><%=recruitList.get(i).getRecruitid() %></td>
														<td class="center"><%=recruitList.get(i).getRecruitname() %></td>
														<td class="center"><%=recruitList.get(i).getPublishdate().toString() %></td>
														<td class="center"><%=recruitList.get(i).getDeadline().toString() %></td>
														<td class="center"><%=recruitList.get(i).getManager().getName() %></td>
														<td class="center">
															<a type="button" class="btn btn-info btn-sm" onclick="checkRecruit(<%=recruitList.get(i).getRecruitid() %>)" >
			                                            		<span class="fa fa-search"></span>&nbsp;查看
			                                            	</a>
														</td>
														<td class="center">
															<a type="button" class="btn btn-danger btn-sm" onclick="deleteRecruit(<%=recruitList.get(i).getRecruitid() %>)" >
			                                            		<span class="fa fa-minus"></span>&nbsp;删除
			                                            	</a>
														</td>
													</tr>
												<%
												}else{
												%>
													<tr class="even gradeA">
														<td class="center"><%=recruitList.get(i).getRecruitid() %></td>
														<td class="center"><%=recruitList.get(i).getRecruitname() %></td>
														<td class="center"><%=recruitList.get(i).getPublishdate().toString() %></td>
														<td class="center"><%=recruitList.get(i).getDeadline().toString() %></td>
														<td class="center"><%=recruitList.get(i).getManager().getName() %></td>
														<td class="center">
															<a type="button" class="btn btn-info btn-sm" onclick="checkRecruit(<%=recruitList.get(i).getRecruitid() %>)" >
			                                            		<span class="fa fa-search"></span>&nbsp;查看
			                                            	</a>
														</td>
														<td class="center">
															<a type="button" class="btn btn-danger btn-sm" onclick="deleteRecruit(<%=recruitList.get(i).getRecruitid() %>)" >
			                                            		<span class="fa fa-minus"></span>&nbsp;删除
			                                            	</a>
														</td>
													</tr>
												<%
												}
											}
										%>
									</tbody>
								</table>
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
	                <button onclick="window.location.href='<%=basePath%>recruit/recruitList.action';" type="button" class="btn btn-default" data-dismiss="modal">确定</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<script src="<%=basePath%>Plugins/jquery/jquery-1.10.2.js"></script>
	<script src="<%=basePath%>Plugins/jquery/ajaxfileupload.js"></script>
	<script src="<%=basePath%>Plugins/jquery/jquery.metisMenu.js"></script>
	<script src="<%=basePath%>Plugins/bootstrap/bootstrap.min.js"></script>
	<script src="<%=basePath%>scripts.js"></script>
	<script src="<%=basePath%>Plugins/dataTables/jquery.dataTables.js"></script>
	<script src="<%=basePath%>Plugins/dataTables/dataTables.bootstrap.js"></script>
	<script type="text/javascript">
		var dataTable = null;
		$(function(){
			//提示信息
	        var lang = {
	            "sProcessing": "处理中...",
	            "sLengthMenu": "每页 _MENU_ 项",
	            "sZeroRecords": "没有匹配结果",
	            "sInfo": "当前显示第 _START_ 至 _END_ 项，共 _TOTAL_ 项。",
	            "sInfoEmpty": "当前显示第 0 至 0 项，共 0 项",
	            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
	            "sInfoPostFix": "",
	            "sSearch": "搜索:",
	            "sUrl": "",
	            "sEmptyTable": "表中数据为空",
	            "sLoadingRecords": "载入中...",
	            "sInfoThousands": ",",
	            "oPaginate": {
	                "sFirst": "首页",
	                "sPrevious": "上页",
	                "sNext": "下页",
	                "sLast": "末页",
	                "sJump": "跳转"
	            },
	            "oAria": {
	                "sSortAscending": ": 以升序排列此列",
	                "sSortDescending": ": 以降序排列此列"
	            }
	        };
	        
	        dataTable = $("#table_recruitinfos").dataTable({
	        	language: lang,
	        	autoWidth: false,
	        	//serverSide: true,  
            	//searching: false,  
            	bPaginate: true,
            	deferRender: true,
            	bStateSave: false,
	        	aLengthMenu : [5,10,20,50],   
	        	stripeClasses: ["odd", "even"],  
	        	orderMulti: true,  
	        	renderer: "bootstrap", 
	        	pagingType: "full_numbers"
	        });
		});
		
		function checkRecruit(id){
			window.location.href = "<%=basePath%>recruit/checkRecruit.action?" + "id=" + id;
		}
		
		function deleteRecruit(id){
			$.ajax({  
				type:"POST",
        		url:"<%=basePath%>recruit/deleteRecruit.action",
        		dataType:"json",
        		data:{
       				"id":id
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
