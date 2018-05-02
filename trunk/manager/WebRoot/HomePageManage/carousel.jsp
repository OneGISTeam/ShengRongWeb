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
	<link href="<%=basePath%>Plugins/croppic/croppic.css" rel="stylesheet"/>
	
	<!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <style>
    	.cropppic {
		    width: 640px;
		    height: 250px;
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
					轮播消息管理<small>Carousel Manage</small>
				</h1>
				<ol class="breadcrumb">
				  <li><a href="#">河南晟荣</a></li>
				  <li class="active">轮播消息</li>
				</ol> 
			</div>
			<div id="page-inner">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
	                           	 轮播消息第一条
	                        </div>
	                        <div class="panel-body">
								<div class="row">
									<div class="col-lg-6">
										<div id="cropContainerMinimal" class="cropppic">
										</div>
										<p class="help-block">请上传轮播消息图片，图片的大小不要超过16M，尺寸比例应尽量符合1280px*500px，如不符合可以进行尺寸裁剪</p>
									</div >
									<div class="col-lg-6">
										<form role="form">
			                                <div class="form-group">
			                                    <label>轮播消息标题</label>
			                                    <input class="form-control">
			                                    <p class="help-block">请输入轮播消息的标题，不要超过XX个字</p>
			                                </div>
		                                    <div class="form-group">
		                                        <label>轮播消息内容</label>
		                                        <textarea class="form-control" rows="3"></textarea>
		                                        <p class="help-block">请输入轮播消息的详细内容，不要超过XX个字</p>
		                                    </div>
			                             </form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
	                          	 轮播消息第二条
	                        </div>
	                        <div class="panel-body">
								<div class="row">
									<div class="col-lg-6">
										<div id="cropContainerMinimal" class="cropppic">
										</div>
										<p class="help-block">请上传轮播消息图片，图片的大小不要超过16M，尺寸比例应尽量符合1280px*500px，如不符合可以进行尺寸裁剪</p>
									</div >
									<div class="col-lg-6">
										<form role="form">
			                                <div class="form-group">
			                                    <label>轮播消息标题</label>
			                                    <input class="form-control">
			                                    <p class="help-block">请输入轮播消息的标题，不要超过XX个字</p>
			                                </div>
		                                    <div class="form-group">
		                                        <label>轮播消息内容</label>
		                                        <textarea class="form-control" rows="3"></textarea>
		                                        <p class="help-block">请输入轮播消息的详细内容，不要超过XX个字</p>
		                                    </div>
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
	
	<script src="<%=basePath%>Plugins/jquery/jquery-1.10.2.js"></script>
	<script src="<%=basePath%>Plugins/jquery/jquery.metisMenu.js"></script>
	<script src="<%=basePath%>Plugins/bootstrap/bootstrap.min.js"></script>
	<script src="<%=basePath%>scripts.js"></script>
	<script src="<%=basePath%>Plugins/croppic/croppic.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$(window).resize(function(){
				updateCarouselDiv();	
			});
			updateCarouselDiv();
			
			var croppicContaineroutputMinimal = {
					//uploadUrl:'img_save_to_file.php',
					cropData:{
						"dummyData":1,
						"dummyData2":"asdas"
					},
					//cropUrl:'img_crop_to_file.php',
					//customUploadButtonId:'cropContainerHeaderButton',
					modal:false,
					processInline:true,
					loaderHtml:'<div class="loader bubblingG"><span id="bubblingG_1"></span><span id="bubblingG_2"></span><span id="bubblingG_3"></span></div> ',
					onBeforeImgUpload: function(){ console.log('onBeforeImgUpload') },
					onAfterImgUpload: function(){ console.log('onAfterImgUpload') },
					onImgDrag: function(){ console.log('onImgDrag') },
					onImgZoom: function(){ console.log('onImgZoom') },
					onBeforeImgCrop: function(){ console.log('onBeforeImgCrop') },
					onAfterImgCrop:function(){ console.log('onAfterImgCrop') },
					onReset:function(){ console.log('onReset') },
					onError:function(errormessage){ console.log('onError:'+errormessage) }
			};
			var cropContaineroutput = new Croppic('cropContainerMinimal', croppicContaineroutputMinimal);
		});
		
		function updateCarouselDiv(){
			var croppics = $(".cropppic");
			for(var i = 0; i<croppics.length;i++){
				var div_colo_6s = $(".col-lg-6");
				var width = $(div_colo_6s[0]).width();
				var height = width*25.0/64.0;
				$(croppics[i]).width(width + "px");
				$(croppics[i]).height(height + "px");
			}
		}
	</script>
</body>
</html>
