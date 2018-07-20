<%@ page language="java" import="java.util.*,com.shengrong.hibernate.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"Manager/";
Map<Integer, List<Teamprocess>> tps = (Map<Integer, List<Teamprocess>>)request.getAttribute("catalogTeamprocesses");
String tpsjson = (String)request.getAttribute("catalogJSON");
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
    <link href="<%=basePath%>Plugins/cropper/cropper.css" rel="stylesheet"/>
    <link href="<%=basePath%>Plugins/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link href="<%=basePath%>Plugins/validform/css/validform.css" rel="stylesheet"/>
    <style>
    	.cropppic {
		    position:relative; /* or fixed or absolute */
		    border:1px solid #ccc;
		}
		#container{
			height:30%;
			width:100%
		}
		.preview{
			width:100%;
			height:300px
		}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=cbZBSnBB0OtXxG4Zh1LWGOFTXvqbXmdO"></script>
  </head>
  
<body>
	<div id="wrapper">
		
		<!-- 添加navbar，动态链接方式，需要jsp重新编译 -->
		<jsp:include page="../navbar.jsp" flush="true"/>
		
		<div id="page-wrapper">
			<div class="header"> 
				<h1 class="page-header">
					团队足迹管理<small>Team Process Manage</small>
				</h1>
				<ol class="breadcrumb">
				  <li><a href="#">河南晟荣</a></li>
				  <li class="active">团队足迹</li>
				</ol> 
			</div>
			<div id="page-inner">
				<!-- form -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								增加团队足迹
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-12">
										<form method="post" role="form" action="<%=basePath %>homepage/saveTeamprocess.action">
											<div class="form-group">
												<label>足迹位置</label>
												<input datatype="*1-16" errormsg="足迹名称不能为空，且不要超过16个字！" class="form-control" name="encpTeamProcess.location"/>
												<p class="help-block">请输入足迹的位置，为了前台页面美观，请尽可能不要超过16个字</p>
											</div>
											<div class="form-group">
												<label>足迹地理坐标</label>						
												<div class="input-group">
													<span class="input-group-btn">
														<button class="btn btn-default" type="button" onclick="showGeolocationDialog()">
															<i class="fa fa-location-arrow"></i>点击获取地理位置
														</button>
													</span>
													<input id="input_pos" class="form-control" disabled/>
												</div><!-- /input-group -->
												<input datatype="*" errormsg="您还没有选择地理坐标！" name="encpTeamProcess.encpPos" type="text" class="sr-only" id="input_posdata"/>
												<p class="help-block">请点击按钮获取足迹的地理坐标</p>
											</div>
											<div class="form-group">
												<label>足迹时间戳</label>											
												<input datatype="*" errormsg="您还没有选择足迹时间！" id="input_date" name="encpTeamProcess.encpDatetime" type='text' class="form-control" />  
									            <p class="help-block">请选择该足迹的时间</p>
											</div>
											<div class="form-group">
												<label>足迹简要描述</label>
												<textarea datatype="*1-128" errormsg="足迹描述不能为空，且不要超过128个字！" name="encpTeamProcess.brief" class="form-control" rows="3"></textarea>
												<p class="help-block">对团队的里程碑事件进行简要描述，请尽可能不要超过128个字</p>
											</div>
											<div id="form_group_img" class="form-group">
												<label>上传足迹图片</label>
												<img id="img_teamprocess" class="cropppic" src="<%=basePath %>Images/login-bg.jpg" />
												<input type="file" class="sr-only" id="input_file" name="image" accept="image/*">
												<input name="encpTeamProcess.encpImage" type="text" class="sr-only" id="input_imagedata"/>
												<p class="help-block">发一张代表团队里程碑事件的图片，图片大小不要超过16M，<a onclick="loadImage()">点击此处添加图片</a></p>
											</div>
											<button type="submit" onclick="preSubmit()" class="btn btn-default">保存结果</button>
						                    <button onclick="resetImage()" type="reset" class="btn btn-default">内容重置</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- process preview -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								团队足迹预览
							</div>
							<div class="panel-body">
								<ul class="nav nav-tabs">
									<% 
										int index = 0;
										for(int key:tps.keySet()){
											if(index == tps.size() - 1)
											{
											%>
												<li class="active"><a href="#tab_<%=key %>" data-toggle="tab"><%=key %></a>
	                               				</li>
											<%
											}else{
											%>
												<li><a href="#tab_<%=key %>" data-toggle="tab"><%=key %></a>
	                               				</li>
											<%
											}
											index++;
										}
									%>
									
								</ul>
								<div class="tab-content">
									<%
										int contentIndex = 0;
										for(int key:tps.keySet()){
											if(contentIndex == tps.size() - 1)
											{
											%>
												<div class="tab-pane fade active in" id="tab_<%=key %>">
				                                    <h4><%=key %>年的我们</h4>
				                                    <div id="preview_<%=key %>" class="preview"></div>
				                                </div>
											<%
											}else{
											%>
												<div class="tab-pane fade" id="tab_<%=key %>">
				                                    <h4><%=key %>年的我们</h4>
				                                    <div id="preview_<%=key %>" class="preview"></div>
				                                </div>
											<%	
											}
											contentIndex++;
										} 
									%>
									
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
	<div class="modal fade" id="geolocation_dlg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content">
	            <div class="modal-header">
	            	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="geolocation_title">选取地理坐标</h4>
	            </div>
	            <div class="modal-body" id="geolocation_content">
	           		<div id="dlgwarninginfo" style="display:none" class="alert alert-danger">
						<strong>您还没有设置地理位置！</strong>请点击地图设置地理位置。
					</div>
	            	<div class="form-group">
	            		<label>点击地图选择地理坐标</label>
	            		<p id="geoinfo" class="help-block">您当前选择的坐标位置：未设置</p>
	            	</div>
	            	<div class="form-group">
	            		<label>输入城市名称进行搜索：</label>
	            		<div class="input-group">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" onclick="geoLocate()">
									<i class="fa fa-location-arrow"></i>定位
								</button>
							</span>
							<input id="geoLocate_cityName" type="text" class="form-control" placeholder="输入城市名称，如北京、上海...">
						</div><!-- /input-group -->
	                </div><hr/>
	                <div id="container">
	                </div>
	            </div>
	            <div class="modal-footer">
	                <button onclick="submitGeolocation()" type="button" class="btn btn-default">确定</button>
	            </div>
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
	                <button onclick="window.location.href='<%=basePath%>homepage/teamprocesses.action';" type="button" class="btn btn-default" data-dismiss="modal">确定</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<script src="<%=basePath%>Plugins/jquery/jquery-1.10.2.js"></script>
	<script src="<%=basePath%>Plugins/jquery/jquery.metisMenu.js"></script>
	<script src="<%=basePath%>Plugins/bootstrap/bootstrap.min.js"></script>
	<script src="<%=basePath%>scripts.js"></script>
	<script src="<%=basePath%>Plugins/cropper/cropper.js"></script>
	<script src="<%=basePath%>Plugins/datetimepicker/moment-with-locales.min.js"></script>
	<script src="<%=basePath%>Plugins/datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<script src="<%=basePath%>Plugins/validform/js/Validform_v5.3.2_ncr_min.js"></script>
	<script type="text/javascript">
		var map = null;
		var geolocation = null;
		var cropper = null;
		//var previews = [];
		var infowindows = [];
		var formvalidator = null;
		$(function(){
			$(window).resize(function(){
				updateCroppicSize();	
			});
			updateCroppicSize();
			initBaiduMap();
			initFileInput();
			initCropper();
			
			initPreviewMaps();
			
			initDatetimePicker();
			
			//初始化表单验证信息
			formvalidator = $("form").Validform({
				tiptype:3,
				label:".label",
				showAllError:true
			});
		});
		
		function initDatetimePicker(){
			$("#input_date").datetimepicker({
				format: 'YYYY-MM-DD',
				locale: moment.locale('zh-cn')
			});
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
		
		/**
		*	给所有的Input[type=file]添加监听事件
		**/
		function initFileInput(){
			var fileInput = $("input[type=file]");
			$(fileInput).bind('input propertychange', function(){
				cropper.replace(window.URL.createObjectURL(this.files[0]));
			});
		}
		
		function initCropper(){
			var $image = $("#img_teamprocess");
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
		
		function loadImage(){
			$("#input_file").click();
			return false;
		}
		
		function resetImage(){
			var url = "<%=basePath %>Images/login-bg.jpg";
			cropper.replace(url);
		}
		
		function showGeolocationDialog(){
			$("#geolocation_dlg").modal();
		}
		
		function initBaiduMap(){
			map = new BMap.Map("container");
			var point = new BMap.Point(116.331398,39.897445);
			map.centerAndZoom(point, 15);
			map.enableScrollWheelZoom(true);
			
			map.addEventListener("click",function(e){
				geolocation = e.point;
				map.clearOverlays();
				var marker = new BMap.Marker(e.point);  // 创建标注
				map.addOverlay(marker);               // 将标注添加到地图中
				marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
				$("#geoinfo").html("您当前选择的地理坐标是：" + e.point.lng + e.point.lat);
			});
			
			function myFun(result){
				var cityName = result.name;
				map.setCenter(cityName);
			}
			var myCity = new BMap.LocalCity();
			myCity.get(myFun);
		}
		
		function geoLocate(){
			var city = $("#geoLocate_cityName").val();
			if(city != ""){
				map.centerAndZoom(city,11);      // 用城市名设置地图中心点
			}
		}
		
		function submitGeolocation(){
			if(geolocation == null){
				$("#dlgwarninginfo").css("display","block");
				var hideWarning = function(){
					$("#dlgwarninginfo").css("display", "none");
				};
				setTimeout(hideWarning,3000);
			}else{
				var pos = geolocation.lng + "," + geolocation.lat;
				$("#input_pos").val(pos);
				$("#input_posdata").val(pos);
				formvalidator.check(false, "#input_posdata");
				$("#geolocation_dlg").modal("hide");
			}
		}
		
		function preSubmit(){
			var dataURL = cropper.getCroppedCanvas().toDataURL('image/jpeg');
			$("#input_imagedata").val(dataURL);
			
			/*var inputPos = $("#input_pos").val();
			var inputDate = $("#input_date").val();
			if(inputPos==null || inputDate==null ||
				inputPos == "" || inputDate == null){
				alert("信息不完整！请检查地理坐标和时间戳！");
				return false;
			}
			return false;*/
		}
		
		function getInfoWindow(id){
			for(var i=0; i<infowindows.length;i++){
				if(infowindows[i].id == id){
					return infowindows[i];
				}
			}
			return null;
		}
		
		/**
		* 对团队进程的地图展示进行预览
		*/
		function initPreviewMaps(){
			var json = JSON.parse('<%=tpsjson%>');			
			
			for(var i=0; i<json.length;i++){
				var preMap = new BMap.Map("preview_" + json[i].year);
				var point = new BMap.Point(116.331398,39.897445);
				preMap.centerAndZoom(point, 5);
				preMap.enableScrollWheelZoom(true);
				
				var curvePts = new Array();
				
				//添加信息提示
				for(var j=0; j<json[i].teamprocess.length;j++){
					var tp = json[i].teamprocess[j];

					var sContent = 
					"<h4 style='margin:0 0 5px 0;padding:0.2em 0'>"+ tp.location +"</h4>" + 
					"<img style='float:right;margin:4px' id='img_" + tp.id + "' src='"+ tp.image +"' width='192' height='75'/>" + 
					"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+ tp.brief +"</p>" + 
					"</div>";

					var infopos = new BMap.Point(tp.pos.split(",")[0], tp.pos.split(",")[1]);
					curvePts.push(infopos);
					
					var infoWindow = new BMap.InfoWindow(sContent); 
					
					var marker = new BMap.Marker(infopos);
					marker.id = tp.id;
					marker.location = tp.location;
					marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
					//创建右键菜单
					var markerMenu=new BMap.ContextMenu();
					
					markerMenu.addItem(new BMap.MenuItem("删除该足迹", removeTeamprocess));
					preMap.addOverlay(marker);
					marker.addContextMenu(markerMenu);
					
					var opts = {
					  position : infopos,    // 指定文本标注所在的地理位置
					  offset   : new BMap.Size(10, -30)    //设置文本偏移量
					};
					var label = new BMap.Label(tp.location, opts);  // 创建文本标注对象
					label.setStyle({
						 color : "red",
						 fontSize : "12px",
						 height : "20px",
						 lineHeight : "20px",
						 fontFamily:"微软雅黑"
					 });
					preMap.addOverlay(label);  
					
					var param = {
						id:tp.id,
						wnd:infoWindow
					};
					infowindows.push(param);
					
					marker.addEventListener("click", function(){
						var infowindow = getInfoWindow(this.id);
						this.openInfoWindow(infowindow.wnd);
						document.getElementById("img_" + this.id ).onload = function (){
							infoWindow.redraw();   //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
						};
					});
				}
				
				preMap.setViewport(curvePts);
				
				//添加连线				
				var sy = new BMap.Symbol(BMap_Symbol_SHAPE_BACKWARD_OPEN_ARROW, {
				    scale: 0.6,//图标缩放大小
				    strokeColor:'#fff',//设置矢量图标的线填充颜色
				    strokeWeight: '2',//设置线宽
				});
				var icons = new BMap.IconSequence(sy, '10', '30');
				var polyline =new BMap.Polyline(curvePts, {
				   enableEditing: false,//是否启用线编辑，默认为false
				   enableClicking: false,//是否响应点击事件，默认为true
				   icons:[icons],
				   strokeWeight:'8',//折线的宽度，以像素为单位
				   strokeOpacity: 0.8,//折线的透明度，取值范围0 - 1
				   strokeColor:"#18a45b" //折线颜色
				});
				if(curvePts.length >= 2)
					preMap.addOverlay(polyline);
					
			};
		};
		
		//e（如果自己有传参数的话表示自己传过来的参数  ee表示覆盖物（有经纬度）marker表示绑定的marker
		function removeTeamprocess(e, ee, marker){
			if(window.confirm("删除是不可恢复的，你确认要删除" + marker.location +"吗？")){
				$.ajax({  
					type:"POST",
	        		url:"<%=basePath%>homepage/deleteTeamprocess.action",
	        		dataType:"json",
	        		data:{
	       				"id":marker.id
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
			}else
				return;
		}
		
	</script>
</body>
</html>
