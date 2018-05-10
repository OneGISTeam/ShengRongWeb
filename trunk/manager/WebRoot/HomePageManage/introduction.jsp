<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
response.setCharacterEncoding("utf-8");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
  </head>
  
<body>
	<div id="wrapper">
		
		<!-- 添加navbar，动态链接方式，需要jsp重新编译 -->
		<jsp:include page="../navbar.jsp" flush="true"/>
				
		<div id="page-wrapper">
			<div class="header"> 
				<h1 class="page-header">
					公司简介管理<small>Introduction Manage</small>
				</h1>
				<ol class="breadcrumb">
				  <li><a href="#">河南晟荣</a></li>
				  <li class="active">公司简介</li>
				</ol> 
			</div>
			<div id="page-inner">
				<!-- form -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								增加新的公司简介
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-12">
										<form method="post" role="form" action="<%=basePath %>homepage/saveIntroduction.action">
											<div class="form-group">
												<textarea name="content" datatype="*500-10000" errormsg="公司简介内容太少会影响页面美观，建议至少500个字！" class="form-control" rows="5"></textarea>
												<p class="help-block">请输入公司简介</p>
											</div>
											<button type="submit" class="btn btn-default">确认增加</button>
	                                        <button type="reset" class="btn btn-default">内容重置</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- records -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								所有历史记录
							</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover" id="dataTables-records">
										<thead>
											<tr>
												<th style="width:5%">编号</th>
												<th>内容</th>
												<th style="width:9%">发布时间</th>
												<th style="width:8%">发布者</th>
												<th style="width:5%">操作</th>
											</tr>
										</thead>
									</table>
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
	                <button onclick="window.location.href='<%=basePath%>homepage/introductions.action';" type="button" class="btn btn-default" data-dismiss="modal">确定</button>
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
	       
	        dataTable = $("#dataTables-records").dataTable({
	        	language: lang,
	        	autoWidth: false,
	        	"order": [[ 0, 'desc' ], [ 1, 'asc' ], [ 2, 'asc' ], [ 3, 'asc' ]],
	        	//serverSide: true,  
            	//searching: false,  
            	bPaginate: true,
            	deferRender: true,
            	bStateSave: false,
	        	aLengthMenu : [5,10,20,50],   
	        	stripeClasses: ["odd", "even"],  
	        	orderMulti: true,  
	        	renderer: "bootstrap", 
	        	pagingType: "full_numbers", 
	        	ajax:function(data, callback, settings){
	        		var paging_length=this.fnSettings()._iDisplayLength;    
        			var page_start=this.fnSettings()._iDisplayStart;
        			var page=(page_start / paging_length); 
	        		$.ajax({  
						type:"POST",
		        		url:"<%=basePath%>homepage/pagingQueryIntroduction.action",
		        		dataType:"json",
		        		data:{
	        				"currentPage":page + 1,
	        				"itemPerPage":paging_length + 1
		        		},
		        		success:function(result){
		        			var returnData = {}; 
		        			returnData.draw = JSON.parse(result).draw;
		        			returnData.recordsTotal = JSON.parse(result).recordsTotal;
		        			returnData.recordsFiltered = JSON.parse(result).recordsFiltered;
		        			returnData.data = JSON.parse(result).data;
		        			callback(returnData);
		        		}
		        	});
	        	},
	        	columns:[
	        		{"data":"id"},
	        		{"data":"content"},
	        		{"data":"time"},
	        		{"data":"name"},
	        		{"data":null}
	        	],
	        	columnDefs:[{
	                targets: 4,
	                render: function (data, type, row, meta) {
	                    return '<a type="button" class="btn btn-danger btn-block" onclick=deleteRecord(' + data.id + ') >删除</a>';
	                }
	            },
	                { "orderable": false, "targets": 4 },
	            ]
	        });
	        

	        $("#dataTables-records").on( "page.dt", function () {
	        	var paging_length=dataTable.fnSettings()._iDisplayLength;//当前每页显示多少    
        		var page_start=dataTable.fnSettings()._iDisplayStart;//当前页开始    
        		var page=(page_start / paging_length); //得到页数值  比页码小1
        		//alert(page);
   				//$("#dataTables-records").DataTable().ajax.reload(); 
			});
		});
		
		function deleteRecord(id){
        	$.ajax({  
				type:"POST",
        		url:"<%=basePath%>homepage/deleteIntroduction.action",
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
        	return false;
        }
	</script>
</body>
</html>
