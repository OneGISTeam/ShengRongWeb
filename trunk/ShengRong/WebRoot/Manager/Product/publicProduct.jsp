<%@ page language="java" import="java.util.*,com.shengrong.hibernate.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
response.setCharacterEncoding("utf-8");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"Manager/";
Map<Integer, String> producttypeMap = (Map<Integer, String>)request.getAttribute("producttypeMap");
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
    <link href="<%=basePath%>Plugins/cropper/cropper.css" rel="stylesheet"/>
    <style>
		.img-container img {
	      max-width: 100%;
	      width:70%
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
					发布产品<small>Product Publish</small>
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
								发布产品
							</div>
							<div class="panel-body">
								<form id="mainform" method="post" role="form" action="<%=basePath %>product/saveProduct.action">
									<div class="panel-group" id="accordion">
										<div class="panel panel-success">
		                                    <div class="panel-heading">
		                                        <h4 class="panel-title">
		                                            <a data-toggle="collapse" data-parent="#accordion" href="#productinfo">
		                                            	<span class="fa fa-info-circle"></span>&nbsp;产品基本信息
		                                            </a>
		                                        </h4>
		                                    </div>
		                                    <div id="productinfo" class="panel-collapse in" style="height: auto;">
		                                        <div class="panel-body">
		                                        	<div class="form-group">
			                                            <label>产品名称</label>
														<input datatype="*1-128" errormsg="请不要超过128个字！" class="form-control" name="encpProduct.productname"/>
														<p class="help-block">请输入产品名称，如“背负式风力灭火机”...</p>
													</div>
													<div class="form-group">
			                                            <label>产品型号</label>
														<input datatype="*1-128" errormsg="请不要超过128个字！" class="form-control" name="encpProduct.productmodel"/>
														<p class="help-block">请输入产品型号，如“6MFB-18-43”...</p>
													</div>
													<div class="form-group">
														<label>选择产品类型（注意：类型选择时要对应正确）</label>
			                                            <select name="encpProduct.productTypeID" class="form-control">
			                                            <% 
			                                            	for(Map.Entry<Integer, String> entry : producttypeMap.entrySet()) { 
			                                            	%>
			                                            		<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			                                            	<%	
			                                            	}
			                                            %>
			                                            </select>
			                                            <p class="help-block">请选择产品类型，发布的产品将按照类型进行展示，您可以在“产品类型”页面添加或删除任何类型</p>
													</div>
													<div class="form-group">
														<label>产品描述</label>
														<script id="editor" type="text/plain"></script>
														<input name="encpProduct.des" id="input_contentdata" datatype="*" class="sr-only"/>
									            		<p class="help-block">请对该产品进行描述，支持插入图片或分享链接，您可以像使用word office一样使用它...</p>
													</div>
		                                        </div>
		                                    </div>
		                                </div>
										<div class="panel panel-success">
		                                    <div class="panel-heading">
		                                        <h4 class="panel-title">
		                                            <a data-toggle="collapse" data-parent="#accordion" href="#productparam">
		                                            	<span class="fa fa-cogs"></span>&nbsp;产品参数
		                                            </a>
		                                        </h4>
		                                    </div>
		                                    <div id="productparam" class="panel-collapse collapse" style="height: auto;">
		                                        <div class="panel-body">
		                                            <table class="table table-striped table-bordered table-hover" id="table_newstype">
														<thead>
															<tr>
																<th style="width:30%">参数名称</th>
																<th>参数值</th>
																<th style="width:7%">删除</th>
															</tr>
														</thead>
														<tbody id="param_table_tbody">
														</tbody>
													</table>
													<button onclick="showParamInputDlg();return false;" class="btn btn-default">
														<span class="fa fa-plus"></span>
													</button>
		                                        </div>
		                                    </div>
		                                </div>
		                                <div class="panel panel-success">
		                                    <div class="panel-heading">
		                                        <h4 class="panel-title">
		                                            <a data-toggle="collapse" data-parent="#accordion" href="#productpic">
		                                            	<span class="fa fa-picture-o"></span>&nbsp;产品图片
		                                            </a>
		                                        </h4>
		                                    </div>
		                                    <div id="productpic" class="panel-collapse collapse" style="height: auto;">
		                                        <div class="panel-body">
		                                            <div id="div_addpic" class="col-md-4 gallery-grid" onclick="addProductImage();">
		                                            	<img src="<%=basePath %>Images/camera.jpg" class="img-responsive" alt="图片丢失">
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
									</div>
									<div id="submit_div" class="sr-only">
									</div>
									<button type="submit" onclick="preSubmitForm();" class="btn btn-default">确认发布</button>
	                                <button type="reset" onclick="resetForm();" class="btn btn-default">内容重置</button>
								</form>
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
	
	<!-- 模态对话框 -->
	<div class="modal fade" id="param_dlg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content">
	            <div class="modal-header">
	            	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="operatorInfo_title">产品参数</h4>
	            </div>
	            <div class="modal-body" id="operatorInfo_content">
	            	<form id="paramform" role="form" action="#">
		                <div class="form-group">
		                	<label>参数名称</label>
							<input id="param_name" datatype="*1-16" errormsg="请不要超过16个字！" class="form-control"/>
							<p class="help-block">请输入产品的参数名称，如“使用温度”等...</p>
						</div>
						<div class="form-group">
		                	<label>参数值</label>
							<input id="param_value" datatype="*1-16" errormsg="请不要超过128个字！" class="form-control" name=""/>
							<p class="help-block">请输入产品的参数值，如：0℃～+55℃</p>
						</div>
					</form>
	            </div>
	            <div class="modal-footer">
	                <button onclick="submitParam()" type="button" class="btn btn-default">确定</button>
	                <button onclick="" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
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
	                <h4 class="modal-title">产品图像上传及裁剪</h4>
	            </div>
	            <div class="modal-body">
	                <div class="img-container">
	              		<img id="img_croppic" src="<%=basePath %>Images/potrait.png" alt="Picture">
	              		<input type="file" class="sr-only" id="input_file" accept="image/*">
	            	</div>
	            	<p>上传产品图像的尺寸最好是比例为574:600（宽/高）</p>
	            </div>
	            <div class="modal-footer">
	            	<button onclick="loadImage();" type="button" class="btn btn-link-1 btn-link-1-twitter">上传照片</button>
	                <button onclick="croppic();" type="button" class="btn btn-default" data-dismiss="modal">确认裁剪</button>
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
	<script src="<%=basePath%>Plugins/cropper/cropper.js"></script>
	<!-- ueditor -->
	<script type="text/javascript" charset="utf-8" src="<%=basePath%>Plugins/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>Plugins/ueditor/ueditor.all.js"> </script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>Plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript">
		var dataTable = null;	
		var ueditor = null;	
		var mainForm = null;
		var paramForm = null;
		var paramIndex = 0;
		var picIndex = 0;
		var hasMainPic =false;
		var cropper = null;
    	var cropBoxData;
        var canvasData;
		var image = document.getElementById("img_croppic");
		var productparams = [];
		var productpics = [];
		$(function(){
			//初始化表单验证信息
			mainForm = $("#mainform").Validform({
				tiptype:3,
				label:".label",
				showAllError:true
			});
			paramForm = $("#paramform").Validform({
				tiptype:3,
				label:".label",
				showAllError:true
			});
			
			initUEditor();
			initCropper();
			initFileInput();
		});
		
		function initUEditor(){
			//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    		ueditor = UE.getEditor("editor");
    		ueditor.addListener("contentChange", function(){
    			$("#input_contentdata").val(ueditor.getContent());
    		});
		}
		
		function showParamInputDlg(){
			$("#paramform").Validform().resetForm();
			$(".Validform_checktip").html("");
			$("#param_dlg").modal();
		}
		
		function submitParam(){
			if(!paramForm.check())
				return false;
			var param_name = $("#param_name").val();
			var param_value = $("#param_value").val();
			
			var tr = $("<tr id='tr_" + paramIndex + "'></tr>");
			var td_name = $("<td></td>").text(param_name);
			var td_value = $("<td></td>").text(param_value);
			var td_delete = $("<td><a type='button' class='btn btn-danger btn-sm' onclick='deleteParam(" + paramIndex + ")' ><span class='fa fa-minus'></span>&nbsp;删除</a></td>");
			$(td_name).appendTo(tr);
			$(td_value).appendTo(tr);
			$(td_delete).appendTo(tr);
			$(tr).appendTo($("#param_table_tbody"));
			
			$("#param_dlg").modal("hide");
			var param = {
				"id":paramIndex,
				"name":param_name,
				"value":param_value
			};
			productparams.push(param);
			paramIndex++;
		}
		
		function deleteParam(paramid){
			$("#tr_" + paramid).remove();
			for(var i=0; i<productparams.length; i++){
				if(productparams[i].id == paramid){
					productparams.splice(i, 1);
				}
			}
			console.log(productparams);
		}
		
		function setMainPicture(th){
			var icons = $(".mainpic-icon");
			for(var i=0; i<icons.length; i++){
				$(icons[i]).css("display", "none");
			}
			for(var i=0; i<productpics.length; i++){
				productpics[i].isMainpic = false;
			}
			var picid = $(th).parent().children(".delete-icon").children().attr("id");
			findByID(productpics,picid).isMainpic = true;
						
			$(th).parent().children(".mainpic-icon").css("display", "block");
		}
		
		function deletePicture(th){
			if($(th).parent().next().css("display") != "none"){
				alert("产品主图不可以删除");
				return;
			}
			
			var id= $(th).attr("id");
			for(var i=0; i<productpics.length; i++){
				if(productpics[i].id == id){
					productpics.splice(i, 1);
				}
			}
			
			$(th).parent().parent().remove();
		}
		
		function addProductImage(){
			$("#croppic_dlg").modal();
		}
		
		function initCropper(){
			$("#croppic_dlg").on('shown.bs.modal', function () {
		    	cropper = new Cropper(image, {
		        autoCropArea: 0.9,
		        aspectRatio: 574 / 600,
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
		
		function loadImage(){
			$("#input_file").click();
			return false;
		}
		
		function croppic(){
			var dataURL = cropper.getCroppedCanvas().toDataURL('image/jpeg');
			//$("#input_imagedata").val(dataURL);
			
			var div_container = $("<div id='div_product' class='col-md-4 gallery-grid'></div>");
			var img_product = $("<img onclick='setMainPicture(this);' src='" + dataURL + "' class='img-responsive zoom-img' alt='图片未加载' />");
			var div_deleteicon = $("<div class='delete-icon' style='position:absolute;left:20px;top:10px;'></div>");
			var a_deleteicon = $("<a id="+ picIndex +" onclick='deletePicture(this)'></a>");
			var span_deleteicon = $("<span class='fa fa-times fa-2x'></span>");
			$(span_deleteicon).appendTo(a_deleteicon);
			$(a_deleteicon).appendTo(div_deleteicon);
			var div_mainpic = $("<div class='mainpic-icon'></div>");
			var img_mainpic = $("<img style='width:40px' src='<%=basePath %>Images/main.png' /></div>");
			$(img_mainpic).appendTo(div_mainpic);
			
			var pic = {
				"id":picIndex,
				"pic":dataURL,
				"isMainpic":false
			};
			
			if(!hasMainPic){
				hasMainPic = true;
				pic.isMainpic = true;
				$(div_mainpic).css("display", "block");
			}
			
			$(img_product).appendTo(div_container);
			$(div_deleteicon).appendTo(div_container);
			$(div_mainpic).appendTo(div_container);
			
			$(div_container).insertBefore($("#div_addpic"));
			
			productpics.push(pic);
			
			picIndex++;
		}
		
		function findByID(array, id){
			for(var i=0; i<array.length; i++){
				if(array[i].id == id){
					return array[i];
				}
			}
			return null;
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
		
		function resetForm(){
			productparams = [];
			productpics = [];
			$("#param_table_tbody").children().remove();
			$("#div_addpic").parent().children().filter("#div_product").remove();
		}
		
		function preSubmitForm(){
			var submit_div = $("#submit_div");
			for(var i=0; i<productparams.length; i++){
				var param_name = $("<input value='" + productparams[i].name + "' name='encpProduct.encpProductparams[" + i + "].paramname" + "'/>");
				var param_value = $("<input value='" + productparams[i].value + "' name='encpProduct.encpProductparams[" + i + "].paramvalue" + "'/>");
				$(param_name).appendTo(submit_div);
				$(param_value).appendTo(submit_div);
			}
			
			for(var i=0; i<productpics.length; i++){
				var pic_pic = $("<input value='" + productpics[i].pic + "' name='encpProduct.encpProductpics[" + i + "].encpPic" + "'/>");
				var pic_ismain = $("<input value='" + productpics[i].isMainpic + "' name='encpProduct.encpProductpics[" + i + "].mainpic" + "'/>");
				$(pic_pic).appendTo(submit_div);
				$(pic_ismain).appendTo(submit_div);
			}
		}
	</script>
</body>
</html>
