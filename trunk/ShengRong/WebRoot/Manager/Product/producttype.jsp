<%@ page language="java" import="java.util.*,com.shengrong.hibernate.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
response.setCharacterEncoding("utf-8");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"Manager/";
List<Producttype> producttypeList = (List<Producttype>)request.getAttribute("producttypeList");
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
					产品类型管理<small>ProductType Manage</small>
				</h1>
				<ol class="breadcrumb">
				  <li><a href="#">河南晟荣</a></li>
				  <li class="active">产品</li>
				</ol> 
			</div>
			<div id="page-inner">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								添加产品类型
							</div>
							<div class="panel-body">
								<form method="post" role="form" action="<%=basePath %>product/saveProducttype.action">
									<div class="form-group">
										<label>产品类型</label>
										<input datatype="*1-16" errormsg="请不要超过16个字！" class="form-control" name="producttype.name"/>
										<p class="help-block">请输入产品类型，如“灭火剂”、“军用灭火器”...</p>
									</div>
									<div class="form-group">
										<label>类型描述</label>
										<textarea name="producttype.des" datatype="*1-128" errormsg="请不要超过128个字！" class="form-control" rows="5"></textarea>
										<p class="help-block">请对产品类型进行简要描述</p>
									</div>
									<button type="submit" class="btn btn-default">确认增加</button>
                                    <button type="reset" class="btn btn-default">内容重置</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				
				<!-- table -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								所有产品类型列表
							</div>
							<div class="panel-body">
								<table class="table table-striped table-bordered table-hover" id="table_newstype">
									<thead>
										<tr>
											<th>标识号</th>
											<th>产品类型</th>
											<th>产品类型描述</th>
											<th>删除</th>
										</tr>
									</thead>
									<tbody>
										<% 
											for(int i=0; i<producttypeList.size();i++){
												if(i%2==0){
												%>
													<tr class="odd gradeA">
		                                            	<td class="center"><%=producttypeList.get(i).getTypeid() %></td>
			                                            <td class="center"><%=producttypeList.get(i).getName() %></td>
			                                            <td class="center"><%=producttypeList.get(i).getDes() %></td>
			                                            <td class="center">
			                                            	<a type="button" class="btn btn-danger btn-sm" onclick="deleteProducttype('<%=producttypeList.get(i).getTypeid() %>')" >
			                                            		<span class="fa fa-minus"></span>&nbsp;删除
			                                            	</a>
			                                            </td>
			                                        </tr>
												<%	
												}else{
												%>
													<tr class="even gradeA">
		                                            	<td class="center"><%=producttypeList.get(i).getTypeid() %></td>
			                                            <td class="center"><%=producttypeList.get(i).getName() %></td>
			                                            <td class="center"><%=producttypeList.get(i).getDes() %></td>
			                                            <td class="center">
			                                            	<a type="button" class="btn btn-danger btn-sm" onclick="deleteProducttype('<%=producttypeList.get(i).getTypeid() %>')" >
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
	                <button onclick="window.location.href='<%=basePath%>news/newstypes.action';" type="button" class="btn btn-default" data-dismiss="modal">确定</button>
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
		var dataTable = null;		
		$(function(){
			//初始化表单验证信息
			var form = $("form").Validform({
				tiptype:3,
				label:".label",
				showAllError:true
			});
			
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
	        
	        dataTable = $("#table_newstype").dataTable({
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
		
		
		function deleteProducttype(id){
			$.ajax({  
				type:"POST",
        		url:"<%=basePath%>product/deleteProducttype.action",
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
