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
  	<link href="<%=basePath%>Plugins/validform/css/validform.css" rel="stylesheet"/>
  </head>
  
<body>
	<div id="wrapper">
		
		<!-- 添加navbar，动态链接方式，需要jsp重新编译 -->
		<jsp:include page="../navbar.jsp" flush="true"/>
		
		<div id="page-wrapper">
			<div class="header"> 
				<h1 class="page-header">
					公司资料管理<small>Company Datum Manage</small>
				</h1>
				<ol class="breadcrumb">
				  <li><a href="#">河南晟荣</a></li>
				  <li class="active">资料管理</li>
				</ol> 
			</div>
			<div id="page-inner">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								上传新的资料
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-12">
										<form onsubmit="return false;" id="datum_upload_form" method="post" role="form" enctype="multipart/form-data">
											<div class="form-group">
												<label>资料的标题</label>
												<input datatype="*1-16" errormsg="标题不能为空，且不要超过16个字！" class="form-control" name="datum.title"/>
												<p class="help-block">请输入资料的标题，不要超过16个字</p>
											</div>
											<div class="form-group">
												<label>资料关键词</label>
												<div class="input-group">
													<span class="input-group-btn">
														<button class="btn btn-default" type="button" onclick="addSeperator()">
															添加“/”分隔符
														</button>
													</span>
													<input onchange="replaceKeywordsData(this.value);" id="input_kewords" class="form-control"/>
												</div><!-- /input-group -->
												<p class="help-block">请输入新闻关键词，点击添加分隔符按钮增加“/”分隔符</p>
												<input name="datum.keywords" id="input_keywordsdata" datatype="*1-16" errormsg="请设置至少一个关键词，但不要超过128个字！" class="sr-only"/>
											</div>
											<div class="form-group">
												<label>资料的简要描述</label>											
												<textarea name="datum.brief" datatype="*1-128" errormsg="描述信息不要超过128个字！" class="form-control" rows="5"></textarea>
									            <p class="help-block">请对资料进行简要的描述，不要超过128个字</p>
											</div>
											<div class="form-group">
												<label>上传资料</label>	
												<input name="uploadData" id="upload" datatype="*" type="file" errormsg="请选择要上传的资料！" >
												<p class="help-block">点击浏览按钮上传资料，资料大小不要超过1G(1024M)</p>
											</div>
											<div class="progress progress-striped active" style="display:none">
		                                        <div id="progressbar" class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
		                                            <span class="sr-only">0%完成</span>
		                                        </div>
		                                    </div>
											<button type="submit" class="btn btn-default">确认增加</button>
	                                        <button onclick="reset();" type="reset" class="btn btn-default">内容重置</button>
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
	<script type="text/javascript">
		var formValid = null;
		$(function(){
			//初始化表单验证信息
			formValid = $("form").Validform({
				tiptype:3,
				label:".label",
				showAllError:true
			});
			
			$("#datum_upload_form").submit(function(){
				if(!formValid.check()){
					return;
				}
				progressListen();
				var params = decodeURIComponent($("#datum_upload_form").serialize(), true);
				var url = "<%=basePath%>" + "datum/saveDatum.action?" + encodeURI(encodeURI(params));
				//console.log(url);
				$.ajaxFileUpload({
					url: url,
					secureuri : false,
					fileElementId:"upload",
					dataType: "json",
					success: function (data, status){
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
					error: function (XMLHttpRequest, textStatus, errorThrown){
						$("#operatorInfo_title").html("错误信息");
						$("#operatorInfo_content").html(errorThrown);
						$("#operatorInfo_dlg").modal();
					}
				});
				return false;
			});
		});
		
		function progressListen(){
			//显示进度条
			$("#progressbar").parent("div").css({"display":"block"});
			var url = "<%=basePath%>" + "datum/saveDatumProgress.action";
			$.ajax({
				url: url,
				method: "GET",
				timeout: 120000, 
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function(data) { 
					var json = JSON.parse(data);
					if(null != json) {
						if(json.isComplete == true){
							$("#progressbar").css({"width":"100%"});
							clearTimeout(progressListen); 	
							clearProgressSession();
							//console.log("isComplete");
						}else{
							var width = json.current * 100.0 / json.length + "%";
							$("#progressbar").css({"width": width});     
                            setTimeout(progressListen, 500);        
						}
					}
				}
			});
		}
		
		function reset(){
			
		}
		
		function clearProgressSession(){
			var url = "<%=basePath%>" + "datum/clearProgressSession.action";
			$.ajax({  
	            url : url,   
	            method : "GET",   
	            timeout : 120000,     
	            contentType : "application/json; charset=utf-8",  
	            dataType : "json",  
	            success : function(data) {  
	   
	            }  
	        });  
		}
		
		function replaceKeywordsData(v){
			$("#input_keywordsdata").val(v);
			formValid.check(false, "#input_keywordsdata");
		}
		
		function addSeperator(){
			if($("#input_kewords").val() == null ||
				$("#input_kewords").val() == ""){
				return;
			}
			var keywords = $("#input_kewords").val();
			$("#input_kewords").val(keywords + "/");
		}
	</script>
</body>
</html>
