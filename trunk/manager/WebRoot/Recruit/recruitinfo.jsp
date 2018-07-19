<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
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
	<link href="<%=basePath%>Plugins/FontAwesome/font-awesome.css" rel="stylesheet"/>
	<link href="<%=basePath%>styles.css" rel="stylesheet"/>
	<!-- Google Fonts-->
    <link href='<%=basePath%>fonts.css' rel='stylesheet' type='text/css' />
    <link href="<%=basePath%>Plugins/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" />
  	<link href="<%=basePath%>Plugins/validform/css/validform.css" rel="stylesheet"/>
  </head>
  
<body>
	<div id="wrapper">
		
		<!-- 添加navbar，动态链接方式，需要jsp重新编译 -->
		<jsp:include page="../navbar.jsp" flush="true"/>
		
		<div id="page-wrapper">
			<div class="header"> 
				<h1 class="page-header">
					发布招聘信息<small>Publish Recruit Infomation</small>
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
								发布新的招聘信息
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-12">
										<form method="post" role="form" action="#">
											<div class="form-group">
	                        					<label>招聘岗位</label>
	                        					<input type="text" class="form-control" datatype="*1-32" errormsg="招聘岗位不能为空，且不要超过32个字！" name=""/>
	                        					<p class="help-block">请输入招聘的岗位名称，如销售经理，请不要超过32个字</p>
	                        				</div>
	                        				<div class="form-group">
	                        					<label>年龄要求</label>
	                        					<input type="text" class="form-control" datatype="*1-16" errormsg="招聘年龄不能为空，且不要超过16个字！" name=""/>
	                        					<p class="help-block">请输入招聘的年龄要求，如30岁以下，请不要超过16个字</p>
	                        				</div>
	                        				<div class="form-group">
	                        					<label>工作地点</label>
	                        					<input type="text" class="form-control" datatype="*1-16" errormsg="工作地点不能为空，且不要超过16个字！" name=""/>
	                        					<p class="help-block">请输入该岗位的常年工作地点，如郑州，请不要超过16个字</p>
	                        				</div>
	                        				<div class="form-group">
	                        					<label>薪资报酬</label>
	                        					<input type="text" class="form-control" datatype="*1-16" errormsg="薪资报酬不能为空，且不要超过16个字！" name=""/>
	                        					<p class="help-block">请输入该岗位的薪资报酬，如1W、见面详谈等，请不要超过16个字</p>
	                        				</div>
	                        				<div class="form-group">
	                        					<label>招聘人数</label>
	                        					<input type="text" class="form-control" datatype="*1-16" errormsg="招聘人数不能为空，且不要超过16个字！" name=""/>
	                        					<p class="help-block">请输入该岗位需要招聘的人数，如3人、不限等，请不要超过16个字</p>
	                        				</div>
	                        				<div class="form-group">
												<label>截止日期</label>											
												<input datatype="*" errormsg="您还没有选择时间！" id="input_deadline" name="" type='text' class="form-control" />  
									            <p class="help-block">请选择该招聘的截止日期</p>
											</div>
											<div class="form-group">
												<label>岗位职责</label>											
												<script id="ueditor_duty" type="text/plain"></script>
												<input name="" id="input_duty" datatype="*" class="sr-only"/>
									            <p class="help-block">请对该岗位的职责进行简要阐述</p>
											</div>
											<div class="form-group">
												<label>任职要求</label>											
												<script id="ueditor_requirement" type="text/plain"></script>
												<input name="" id="input_requirement" datatype="*" class="sr-only"/>
									            <p class="help-block">请输入对该岗位的任职要求，如能吃苦、热爱销售行业等</p>
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
	                <button onclick="window.location.href='<%=basePath%>datum/datum.action';" type="button" class="btn btn-default" data-dismiss="modal">确定</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<script src="<%=basePath%>Plugins/jquery/jquery-1.10.2.js"></script>
	<script src="<%=basePath%>Plugins/jquery/ajaxfileupload.js"></script>
	<script src="<%=basePath%>Plugins/jquery/jquery.metisMenu.js"></script>
	<script src="<%=basePath%>Plugins/bootstrap/bootstrap.min.js"></script>
	<script src="<%=basePath%>scripts.js"></script>
	<script src="<%=basePath%>Plugins/validform/js/Validform_v5.3.2_ncr_min.js"></script>
	<script src="<%=basePath%>Plugins/datetimepicker/moment-with-locales.min.js"></script>
	<script src="<%=basePath%>Plugins/datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<!-- ueditor -->
	<script type="text/javascript" charset="utf-8" src="<%=basePath%>Plugins/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>Plugins/ueditor/ueditor.all.js"> </script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>Plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript">
		var formValid = null;
		var editor_duty = null;
		var editor_requirement = null;
		$(function(){
			//初始化表单验证信息
			formValid = $("form").Validform({
				tiptype:3,
				label:".label",
				showAllError:true
			});
			
			initDatetimePicker();
			initUEditor();
		});
		
		function initDatetimePicker(){
			$("#input_deadline").datetimepicker({
				format: 'YYYY-MM-DD',
				locale: moment.locale('zh-cn')
			});
		}
		
		function initUEditor(){
			//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    		editor_duty = UE.getEditor("ueditor_duty");
    		editor_duty.addListener("contentChange", function(){
    			$("#input_duty").val(ueditor.getContent());
    		});
    		
    		editor_requirement = UE.getEditor("ueditor_requirement");
    		editor_requirement.addListener("contentChange", function(){
    			$("#input_requirement").val(ueditor.getContent());
    		});
		}
		
		
	</script>
</body>
</html>
