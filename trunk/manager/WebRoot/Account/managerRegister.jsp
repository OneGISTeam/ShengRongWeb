<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <title>河南晟荣建筑工业科技有限公司-管理员注册页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="description" content="河南晟荣建筑工业科技有限公司-管理员注册页面">
	
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500" />
	<link rel="stylesheet" href="<%=basePath%>Plugins/bootstrap/bootstrap.css" />
	<link rel="stylesheet" href="<%=basePath%>Plugins/FontAwesome/font-awesome.css" />
	<link rel="stylesheet" href="<%=basePath%>Account/form-elements.css" />
	<link rel="stylesheet" href="<%=basePath%>Account/style.css" />
	<link href="<%=basePath%>Plugins/validform/css/validform.css" rel="stylesheet"/>
	<link href="<%=basePath%>Plugins/cropper/cropper.css" rel="stylesheet"/>
	<style>
	.img-container img {
      max-width: 100%;
    }
	.friend-grid img:hover {
	    border-radius: 50%;
	    border: 6px solid#2DA9E1;
		 transform: scale(1.05);
	    -webkit-transform: scale(1.05);
	    -moz-transform: scale(1.05);
	    -o-transform: scale(1.05);
	    -ms-transform: scale(1.05);
	    cursor:pointer
	}
	.friend-grid img {
		width:120px;
		height:120px;
	    border-radius: 50%;
	    border: 6px solid#fff;
		transition: 0.5s all;
	    -webkit-transition: 0.5s all;
	    -moz-transition: 0.5s all;
	    -o-transition: 0.5s all;
	    -ms-transition: 0.5s all;
	}
	</style>
  </head>
  
<body>
	<!-- Top content -->
	<div class="top-content">
		<div class="inner-bg">
			<div class="container">
    			<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text">
						<h1><strong>普通管理员注册</strong></h1>
						<h4>
							河南晟荣建筑工业科技有限公司
						</h4>
						<div class="description">
							<p>
	                          	请按照信息提示进行普通管理员的注册，注册完成后需要等待超级管理员通过申请
							</p>
						</div>
                     </div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
	                  	<div class="form-top">
	                  		<div class="form-top-left">
	                  			<h3>普通管理员注册</h3>
	                      		<p>请填写管理员的名称、密码、头像等信息:</p>
	                  		</div>
	                  		<div class="form-top-right">
	                  			<i class="fa fa-user"></i>
	                  		</div>
	                    </div>
	                 	<div class="form-bottom">
							<form action="adminReg.action" method="post" class="login-form">
			                	<div class="form-group">
			                		<div class="friend-grid" style="text-align:center">
										<img onclick="showCroppicDlg();" id="img_preview" title="点击上传头像" src="<%=basePath %>Images/potrait.png"/>
										<input type="file" class="sr-only" id="input_file" accept="image/*">
										<input datatype="*" name="imagedata" type="text" class="sr-only" id="input_imagedata"/>
										<p>点击图片上传头像，要求尺寸比例1:1</p>
									</div>
			                	</div>
			                	<div class="form-group">
			                 		<label class="sr-only" for="mastername">姓名</label>
			                    	<input type="text" datatype="s2-16" errormsg="姓名至少2个字符,最多16个字符！" name="editManager.name" placeholder="账号..." class="form-username form-control">
			                    </div>
			                    <div class="form-group">
			                    	<label class="sr-only" for="password">密码</label>
			                    	<input type="password" datatype="*6-15" errormsg="密码范围在6~15位之间,不能使用空格！" name="editManager.password" placeholder="密码..." class="form-password form-control">
			                    </div>
			                    <div class="form-group">
			                    	<label class="sr-only" for="repassword">确认密码</label>
			                    	<input type="password" datatype="*" recheck="editManager.password" errormsg="您两次输入的账号密码不一致！" placeholder="重新输入密码..." class="form-password form-control">
			                    </div>
			                    <div class="form-group">
			                    	<label for="sex">性别</label>
				                	<select name="sex" class="form-control">
				                    	<option value="1">男性</option>
				                    	<option value="0">女性</option>
				                    </select>
			                    </div>
			                	<button type="submit" class="btn">注册</button>
							</form>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 social-login">
						<h3>返回系统登录页面</h3>
						<div class="social-login-buttons">
							<a class="btn btn-link-1 btn-link-1-twitter" href="<%=basePath %>enter.action">
                        		<i class="fa fa-sign-in"></i> 返回登录
                        	</a>
						</div>
					</div>
				</div>
    		</div>
    	</div>
    </div>
    
    
    <!-- 模态对话框 -->
	<div class="modal fade" id="croppic_dlg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content">
	            <div class="modal-header">
	            	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title">头像上产及裁剪</h4>
	            </div>
	            <div class="modal-body">
	                <div class="img-container">
	              		<img id="img_croppic" src="<%=basePath %>Images/potrait.png" alt="Picture">
	            	</div>
	            </div>
	            <div class="modal-footer">
	            	<button onclick="loadImage()" type="button" class="btn btn-link-1 btn-link-1-twitter">上传照片</button>
	                <button onclick="croppic();" type="button" class="btn btn-default" data-dismiss="modal">确认裁剪</button>
	            </div>
	        </div>
	    </div>
	</div>
    <script src="<%=basePath%>Plugins/jquery/jquery-1.10.2.js"></script>
    <script src="<%=basePath%>Plugins/bootstrap/bootstrap.min.js"></script>
    <script src="<%=basePath%>Plugins/jquery/jquery.backstretch.min.js"></script>
    <script src="<%=basePath%>Account/scripts.js"></script>
    <script src="<%=basePath%>Plugins/validform/js/Validform_v5.3.2_ncr_min.js"></script>
    <script src="<%=basePath%>Plugins/cropper/cropper.js"></script>
    <script type="text/javascript">
    	var cropper = null;
    	var cropBoxData;
        var canvasData;
    	var image = document.getElementById("img_croppic");
    	var form;
    	$(function(){
    		$.backstretch("./Images/manager-bg.jpg");
    		//初始化表单验证信息
			form = $("form").Validform({
				tiptype:3,
				label:".label",
				showAllError:true
			});
			
			
			initFileInput();
			initCropper();
    	});
    	
    	
    	/**
		*	给所有的Input[type=file]添加监听事件
		**/
		function initFileInput(){
			var fileInput = $("input[type=file]");
			$(fileInput).bind('input propertychange', function(){
				cropper.replace(window.URL.createObjectURL(this.files[0]));
			});
		}
		
		function loadImage(){
			$("#input_file").click();
			return false;
		}
		
		function initCropper(){
			$("#croppic_dlg").on('shown.bs.modal', function () {
		    	cropper = new Cropper(image, {
		        autoCropArea: 0.5,
		        aspectRatio: 300 / 300,
		        cropBoxResizable: false,
		        ready: function () {
		        	cropper.setCropBoxData(cropBoxData).setCanvasData(canvasData);
		        	}
		      	});
			}).on('hidden.bs.modal', function () {
		        cropBoxData = cropper.getCropBoxData();
		        canvasData = cropper.getCanvasData();
		        cropper.destroy();
		    });
		}
		
		function showCroppicDlg(){
			$("#croppic_dlg").modal();
		}
		
		function croppic(){
			var dataURL = cropper.getCroppedCanvas().toDataURL('image/jpeg');
			$("#input_imagedata").val(dataURL);
			$("#img_preview").attr("src", dataURL);
			form.check();
		}
    </script>
</body>
</html>
