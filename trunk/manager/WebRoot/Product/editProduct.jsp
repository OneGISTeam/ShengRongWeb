<%@ page language="java" import="java.util.*,com.shengrong.hibernate.*,java.io.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
response.setCharacterEncoding("utf-8");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Map<Integer, String> producttypeMap = (Map<Integer, String>)request.getAttribute("producttypeMap");
Product product = (Product)request.getAttribute("currentProduct");
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
														<input value="<%=product.getProductname() %>" datatype="*1-128" errormsg="请不要超过128个字！" class="form-control" name="encpProduct.productname"/>
														<p class="help-block">请输入产品名称，如“背负式风力灭火机”...</p>
													</div>
													<div class="form-group">
			                                            <label>产品型号</label>
														<input value="<%=product.getProductmodel() %>" datatype="*1-128" errormsg="请不要超过128个字！" class="form-control" name="encpProduct.productmodel"/>
														<p class="help-block">请输入产品型号，如“6MFB-18-43”...</p>
													</div>
													<div class="form-group">
														<label>选择新闻类型（注意：类型选择时要对应正确）</label>
			                                            <select name="encpProduct.productTypeID" class="form-control">
			                                            <% 
			                                            	for(Map.Entry<Integer, String> entry : producttypeMap.entrySet()) { 
			                                            		if(product.getProducttype().getTypeid().equals(entry.getKey())){
			                                            		%>
			                                            		<option selected value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			                                            		<%
			                                            		}else{
			                                            		%>
			                                            		<option value="<%=entry.getKey() %>"><%=entry.getValue() %></option>
			                                            		<%
			                                            		}
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
															</tr>
														</thead>
														<tbody id="param_table_tbody">
															<%
																Set<Productparam> params = product.getProductparams();
																Iterator<Productparam> iter_param = params.iterator();
																while(iter_param.hasNext()){
																	Productparam param = iter_param.next();
																%>
																<tr id="tr_<%=param.getParamid() %>">
																	<td><%=param.getParamname() %></td>
																	<td><%=param.getParamvalue() %></td>
																</tr>
																<%
																}
															%>
														</tbody>
													</table>										
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
		                                        	<% 
			                                        	Set<Productpic> pics = product.getProductpics();
			                                        	Iterator<Productpic> iter_pics = pics.iterator();
			                                        	while(iter_pics.hasNext()){
			                                        		Productpic pic = iter_pics.next();
			                                        		InputStream is =pic.getPic().getBinaryStream();
															byte[] b = new byte[is.available()];
															is.read(b, 0, b.length);
															String imageString = new String(b);
															boolean isMain = pic.getMainpic();
														%>
															<div id='div_product' class='col-md-4 gallery-grid'>
																<img src="<%=imageString %>" class="img-responsive zoom-img" alt="图片未加载"/>
																<%
																	if(isMain){
																	%>
																		<div class="mainpic-icon" style="display:block">
																			<img style="width:40px"  src="<%=basePath %>Images/main.png"/>
																		</div>
																	<%
																	}else{
																	%>
																		<div class="mainpic-icon">
																			<img style="width:40px"  src="<%=basePath %>Images/main.png"/>
																		</div>
																	<%
																	}
																%>
															</div>	
														<%
			                                        	}
			                                        %>  
		                                        </div>
		                                    </div>
		                                </div>
									</div>
									<div id="submit_div" class="sr-only">
									</div>
	                                <button type="reset" onclick="window.location.href='<%=basePath %>product/products.action'" class="btn btn-default">返回</button>
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
		var ueditor = null;	
		$(function(){
			
			initUEditor();
			
		});
		
		function initUEditor(){
			//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    		ueditor = UE.getEditor("editor");
    		ueditor.addListener("contentChange", function(){
    			$("#input_contentdata").val(ueditor.getContent());
    		});
    		ueditor.addListener("ready", function(){
    			ueditor.setContent('<%=product.getDes() %>');
    		});
		}
	</script>
</body>
</html>
