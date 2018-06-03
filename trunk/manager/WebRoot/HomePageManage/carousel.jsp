<%@ page language="java" import="java.util.*,com.shengrong.hibernate.*,com.shengrong.system.*,java.io.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

//获取后台的carousels参数
List<Carousel> carousels = (ArrayList<Carousel>)request.getAttribute("carousels");
CarouselSetting carouselSetting = (CarouselSetting)request.getAttribute("carouselSetting");
int iDisplayCount = carouselSetting.getDisplayCount();
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
				<%
					int iCarouselCount = carousels.size();
					int iEmptyCarouselCount = iDisplayCount - iCarouselCount;
					
					for(int i=0; i<iCarouselCount; i++){
						InputStream is = carousels.get(i).getImage().getBinaryStream();
						byte[] b = new byte[is.available()];
						is.read(b, 0, b.length);
						String imageString = new String(b); 
					%>
						<div class="row">
							<div class="col-lg-12">
								<div class="panel panel-default">
									<div class="panel-heading">
			                           	 轮播消息第<%=i+1 %>条
			                        </div>
			                        <div class="panel-body">
										<div class="row">
											<div class="col-lg-7">
												<p class="help-block">请上传轮播消息图片，图片的大小不要超过16M，尺寸比例应尽量符合1280px*500px，如不符合可以进行尺寸裁剪</p>
												<div>
												    <img class="cropppic" id="img_<%=i+1 %>" src="<%=imageString %>">
													<input index="<%=i+1 %>" type="file" class="sr-only" id="input_file_<%=i+1 %>" name="image" accept="image/*">
													<input type="text" class="sr-only" id="input_id_<%=i+1 %>" value="<%=carousels.get(i).getCarouselid() %>"/>
													<div id="div_warning_<%=i+1%>" style="display:none" class="alert alert-danger">
														<strong>警告！</strong>填写信息不完整，请认真核对！
													</div>
												</div>
											</div >
											<div class="col-lg-5">
												<form>
					                            	<div class="form-group"> 	
					                                    <label>轮播消息标题</label>
					                                    <input id="input_title_<%=i+1 %>" datatype="*1-16" errormsg="轮播消息标题不要超过16个字！" class="form-control" value="<%=carousels.get(i).getTitle() %>">
					                                    <p class="help-block">请输入轮播消息的标题，不要超过16个字</p>
					                                </div>
				                                    <div class="form-group">
				                                        <label>轮播消息内容</label>
				                                        <textarea id="textarea_content_<%=i+1 %>" datatype="*60-128" errormsg="轮播消息内容最好在60-128个字之间！" class="form-control" rows="3"><%=carousels.get(i).getContent() %></textarea>
				                                        <p class="help-block">请输入轮播消息的详细内容，不要超过128个字</p>            
				                                	</div>
				                                	<button type="button" class="btn btn-default" onclick="uploadImage(<%=i+1 %>)">上传照片</button>
						                            <button type="submit" class="btn btn-default" onclick="saveCarousel(<%=i+1 %>)">保存结果</button>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					<%
					}
					
					if(iEmptyCarouselCount > 0){
						for(int i=0; i<iEmptyCarouselCount; i++){
						%>
							<div class="row">
								<div class="col-lg-12">
									<div class="panel panel-default">
										<div class="panel-heading">
				                           	 轮播消息第<%=iCarouselCount+i+1 %>条
				                        </div>
				                        <div class="panel-body">
											<div class="row">
												<div class="col-lg-7">
													<p class="help-block">请上传轮播消息图片，图片的大小不要超过16M，尺寸比例应尽量符合1280px*500px，如不符合可以进行尺寸裁剪</p>
													<div>
													    <img class="cropppic" id="img_<%=iCarouselCount+i+1 %>" src="<%=basePath %>Images/login-bg.jpg">
														<input index="<%=iCarouselCount+i+1 %>" type="file" class="sr-only" id="input_file_<%=iCarouselCount+i+1 %>" name="image" accept="image/*">
														<input type="text" class="sr-only" id="input_id_<%=iCarouselCount+i+1 %>"/>
														<div id="div_warning_<%=iCarouselCount+i+1%>" style="display:none" class="alert alert-danger">
															<strong>警告！</strong>填写信息不完整，请认真核对！
														</div>
													</div>
												</div >
												<div class="col-lg-5">
													<form>
						                            	<div class="form-group"> 	
						                                    <label>轮播消息标题</label>
						                                    <input id="input_title_<%=iCarouselCount+i+1 %>" datatype="*1-16" errormsg="轮播消息标题不要超过16个字！" class="form-control">
						                                	<p class="help-block">请输入轮播消息的标题，不要超过16个字</p>
						                                </div>
					                                    <div class="form-group">
					                                        <label>轮播消息内容</label>
					                                        <textarea id="textarea_content_<%=iCarouselCount+i+1 %>" datatype="*60-128" errormsg="轮播消息内容最好在60-128个字之间！" class="form-control" rows="3"></textarea>            
					                                		<p class="help-block">请输入轮播消息的详细内容，不要超过128个字</p>
					                                	</div>
					                                	<button type="button" class="btn btn-default" onclick="uploadImage(<%=iCarouselCount+i+1 %>)">上传照片</button>
							                            <button type="submit" class="btn btn-default" onclick="saveCarousel(<%=iCarouselCount+i+1 %>)">保存结果</button>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						<%
						}
					}
				%>
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
	                <button onclick="window.location.href='<%=basePath%>homepage/carousels.action';" type="button" class="btn btn-default" data-dismiss="modal">确定</button>
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
	<script type="text/javascript">
		var croppers = [];
		var validForms = [];
		$(function(){
			$(window).resize(function(){
				updateCarouselImageSize();	
			});
			updateCarouselImageSize();
				
			//创建多个裁剪窗口
			var images = $("img[class=cropppic]");
			for(var i=0; i<images.length; i++){
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
				croppers.push(new Cropper(images[i], options));
			}
			initFileInput();
			
			//初始化表单验证信息
			var forms = $("form");
			for(var i=0; i<forms.length;i++){
				var formValid = $(forms[i]).Validform({
					tiptype:3,
					label:".label",
					showAllError:true,
					callback:function(form){
						//仅仅作表单验证，不要提交，使用自定义的ajax提交表单
						return false;
					}
				});
				validForms.push(formValid);
			}
		});
		
		/**
		*	给所有的Input[type=file]添加监听事件
		**/
		function initFileInput(){
			var fileInputs = $("input[type=file]");
			for(var i=0; i<fileInputs.length; i++){
				$(fileInputs[i]).bind('input propertychange', function(){
					var index = $(this).attr("index");
					croppers[index-1].replace(window.URL.createObjectURL(this.files[0]));
				});
			}
		}
		
		/**
		*	更新轮播照片的尺寸
		**/
		function updateCarouselImageSize(){
			var croppics = $(".cropppic");
			for(var i = 0; i<croppics.length;i++){
				var div_colo_6s = $(".col-lg-7");
				var width = $(div_colo_6s[0]).width()*0.95;
				var height = width*25.0/64.0;
				$(croppics[i]).width(width + "px");
				$(croppics[i]).height(height + "px");
			};
		}
		
		/**
		*	从客户端加载照片
		*	@param index 轮播消息的索引号
		**/
		function uploadImage(index){
			$("#input_file_" + index).click();
		}
		
		
		/**
		*	对轮播消息的结果进行保存
		*	@param index 轮播消息的索引号
		**/
		function saveCarousel(index){
			if(validForms[index-1].check() == false)
				return;
			
			var carouselid = $("#input_id_" + index).val();
			var carouselTitle = $("#input_title_" + index).val();
			var carouselContent = $("#textarea_content_" + index).val();
			var dataURL = croppers[index-1].getCroppedCanvas().toDataURL('image/jpeg');
			
			if(carouselTitle == null || carouselContent == null || dataURL == null
				|| carouselTitle == "" || carouselContent == "" || dataURL == ""){
				$("#div_warning_" + index).css("display", "block");
				var hideWarning = function(){
					$("#div_warning_" + index).css("display", "none");
				};
				setTimeout(hideWarning,3000);
				return;
			}
			
			var submitData = {
				"id": carouselid,
				"title": carouselTitle,
				"content":carouselContent,
				"data":dataURL
			};
			
			$.ajax({
				type:"post",
				url:"<%=basePath%>/homepage/saveOrUpdateCarousel.action",
				data:submitData,
				dataType:"json",
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
