<%@ page language="java" import="java.util.*, com.shengrong.hibernate.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
response.setCharacterEncoding("utf-8");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"Manager/";
List<Newstype> newstypeList = (List<Newstype>)request.getAttribute("newstypeList");
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
    <link href='<%=basePath%>fonts.css' rel='stylesheet' type='text/css' />
    <link href="<%=basePath%>Plugins/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <style>
    	.cropppic {
		    position:relative; /* or fixed or absolute */
		    border:1px solid #ccc;
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
					新闻管理<small>News Manage</small>
				</h1>
				<ol class="breadcrumb">
				  <li><a href="#">河南晟荣</a></li>
				  <li class="active">新闻</li>
				</ol> 
			</div>
			<div id="page-inner">
				<!-- form -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								发布新的新闻
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-12">
										<form id="form_news" method="post" role="form" action="<%=basePath %>news/saveNews.action">
											<div class="form-group">
												<label>新闻标题</label>
												<input datatype="*1-16" errormsg="请不要超过16个字！" class="form-control" name="encpNews.title"/>
												<p class="help-block">请输入新闻标题，不要超过16个字...</p>
											</div>
											<div class="form-group">
												<label>新闻时间</label>											
												<input datatype="*" errormsg="您还没有选择新闻时间！" id="input_date" name="encpNews.encpNewsDate" type='text' class="form-control" />  
									            <p class="help-block">请选择该新闻的日期，注意并不是发布这条新闻的日期，而是新闻本身的日期，新闻发布时间由系统自动获取</p>
											</div>
											<div class="form-group">
												<label>新闻关键词</label>
												<div class="input-group">
													<span class="input-group-btn">
														<button class="btn btn-default" type="button" onclick="addSeperator()">
															添加“/”分隔符
														</button>
													</span>
													<input onchange="replaceKeywordsData(this.value);" id="input_kewords" class="form-control"/>
												</div><!-- /input-group -->
												<p class="help-block">请输入新闻关键词，点击添加分隔符按钮增加“/”分隔符</p>
												<input name="encpNews.keywords" id="input_keywordsdata" datatype="*1-16" errormsg="请设置至少一个关键词，但不要超过128个字！" class="sr-only"/>
											</div>
											<div class="form-group">
												<label>是否发布成头条</label>
	                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="encpNews.isheadline" value="true" checked="checked">是的，发布成头条
                                                </label>
	                                            </div>
	                                            <div class="radio">
	                                                <label>
	                                                    <input type="radio" name="encpNews.isheadline" value="false">不，不要发布成头条
	                                                </label>
	                                            </div>
	                                            <p class="help-block">默认为发布成头条</p>
											</div>
											<div class="form-group">
												<label>选择新闻类型（注意：类型选择时要对应正确）</label>
	                                            <select name="encpNews.encpNewstypeID" class="form-control">
	                                            <% 
	                                            	for(int i=0; i<newstypeList.size(); i++){
	                                            	%>
	                                            		<option value="<%=newstypeList.get(i).getTypeid() %>"><%=newstypeList.get(i).getName() %></option>
	                                            	<%	
	                                            	}
	                                            %>
	                                            </select>
	                                            <p class="help-block">请选择新闻类型，发布的新闻将按照类型进行展示，您可以在“新闻类型”页面添加或删除任何类型</p>
											</div>
											<div id="form_group_img" class="form-group">
												<label>上传新闻图片</label>
												<img id="img_news" class="cropppic" src="<%=basePath %>Images/login-bg.jpg" />
												<input type="file" class="sr-only" id="input_file" name="image" accept="image/*">
												<input datatype="*" errormsg="请添加一张图片" name="encpNews.encpImage" type="text" class="sr-only" id="input_imagedata"/>
												<p class="help-block">发一张代表新闻内容的图片，图片大小不要超过16M，<a onclick="loadImage()">点击此处添加图片</a></p>
											</div>
											<div class="form-group" id="news_content">
												<label>填写新闻内容</label>											
												<script id="editor" type="text/plain"></script>
												<input name="encpNews.content" id="input_contentdata" datatype="*" class="sr-only"/>
									            <p class="help-block">请填写新闻内容，支持插入图片或分享链接，您可以像使用word office一样使用它...</p>
											</div>
											<button type="submit" onclick="submitNews();" class="btn btn-default">确认发布</button>
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
	                <button onclick="window.location.href='<%=basePath%>homepage/introductions.action';" type="button" class="btn btn-default" data-dismiss="modal">确定</button>
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
	<script type="text/javascript">
		var formValid = null; 
		var cropper = null;
		var ueditor = null;
		$(function(){
			$(window).resize(function(){
				updateCroppicSize();	
				updateUEditorSize();
			});
			updateCroppicSize();
			updateUEditorSize();
			initFormValid();
			initDatetimePicker();
			initCroppic();
			initFileInput();
			initUEditor();
		});
		
		function initFormValid(){
			//初始化表单验证信息
			formValid = $("form").Validform({
				tiptype:3,
				label:".label",
				showAllError:true
			});
		}
		
		function initDatetimePicker(){
			$("#input_date").datetimepicker({
				format: 'YYYY-MM-DD',
				locale: moment.locale('zh-cn')
			});
		}
		
		function addSeperator(){
			if($("#input_kewords").val() == null ||
				$("#input_kewords").val() == ""){
				return;
			}
			var keywords = $("#input_kewords").val();
			$("#input_kewords").val(keywords + "/");
		}
		
		function initCroppic(){
			var $image = $("#img_news");
			var options = {
				viewMode: 3,
				dragMode: 'move',
		        autoCropArea: 1,
		        restore: false,
		        modal: false,
		        guides: false,
		        highlight: false,
		        cropBoxMovable: false,
		        cropBoxResizable: false,
		        toggleDragModeOnDblclick: false,
			};
			cropper = new Cropper($image[0], options);
		}
		
		function updateCroppicSize(){
			var croppics = $(".cropppic");
			for(var i = 0; i<croppics.length;i++){
				var div_colo_6s = $("#form_group_img");
				var width = $(div_colo_6s[0]).width()*0.95;
				var height = width*25.0/64.0;
				$(croppics[i]).width(width + "px");
				$(croppics[i]).height(height + "px");
			};
		}
		
		function replaceKeywordsData(v){
			$("#input_keywordsdata").val(v);
			formValid.check(false, "#input_keywordsdata");
		}
		
		function loadImage(){
			$("#input_file").click();
			return false;
		}
		
		/**
		*	给所有的Input[type=file]添加监听事件
		**/
		function initFileInput(){
			var fileInput = $("input[type=file]");
			$(fileInput).bind('input propertychange', function(){
				cropper.replace(window.URL.createObjectURL(this.files[0]));
			});
		}
		
		function initUEditor(){
			//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    		ueditor = UE.getEditor("editor");
    		ueditor.addListener("contentChange", function(){
    			$("#input_contentdata").val(ueditor.getContent());
    		});
		}
		
		function updateUEditorSize(){
			var div_colo_6s = $("#news_content");
			var width = $(div_colo_6s[0]).width()*1.0;
			var height = width*25.0/64.0;
			$("#editor").width(width + "px");
			$("#editor").height(height + "px");
		}
		
		function submitNews(){
			var dataURL = cropper.getCroppedCanvas().toDataURL('image/jpeg');
			$("#input_imagedata").val(dataURL);
			formValid.check(false, "#input_imagedata");
			if(formValid.check())
				$("#form_news").submit();
			else
				return false;
		}
	</script>
</body>
</html>
