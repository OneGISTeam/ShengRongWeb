<%@ page language="java" import="java.util.*,com.shengrong.hibernate.*,java.text.SimpleDateFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"Portal/";
Recruit recruit =(Recruit)request.getAttribute("recruit"); 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head lang="zh-CN">    
    <title>河南晟荣建筑工业科技有限公司</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="河南晟荣,晟荣,建筑工业科技">
	<meta http-equiv="description" content="河南晟荣建筑工业科技有限公司网站">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="<%=basePath%>Plugins/bootstrap/bootstrap1.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath%>Plugins/validform/css/validform.css" rel="stylesheet"/>
	<link rel="stylesheet" href="<%=basePath%>Plugins/FontAwesome/font-awesome.css" />
	<link rel="stylesheet" href="<%=basePath%>Plugins/assets/form-elements.css" />
	<link rel="stylesheet" href="<%=basePath%>Plugins/assets/style.css" />
	<link href="<%=basePath%>Portal/style.css" rel="stylesheet" type='text/css'/>
	<script src="<%=basePath%>Plugins/jquery/jquery-1.11.1.min.js"></script>
	<script src="<%=basePath%>Plugins/bootstrap/bootstrap.js"></script>
	
	<!---fonts-->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
    <style type="text/css">
    	.label{
    	font-size:16px;
       	color: #969696;
       	line-height:1.5em;
       
    	}
    	.need{
    	 color:red;
    	}
    	
    </style>
  </head>
  
<body>
    <jsp:include page="navbar.jsp" flush="true" />
	<!---banner--->
	<div class="banner-section">
		<div class="container">
			<h2>招贤纳士</h2>
		</div>
	</div>
	<!---banner--->
	<div class="top-content">
    	<div class="inner-bg">
        	<div class="container" style="width:80%;">
        		<div class="row">
					<div class="form-box">
						<div class="form-top">
                        	<div class="form-top-left">
                        		<h3>请填写您的信息</h3>
                            	<p>您应聘的岗位是：<%=recruit.getRecruitname() %></p>
                        	</div>
                        	<div class="form-top-right">
                        		<i class="fa fa-pencil"></i>
                        	</div>
                        </div>
                        <div class="form-bottom">
                        	<form method="post" role="form" action="<%=basePath %>Employment/saveRecruitapply.action" class="registration-form">
                        		<input type="text" name="recruitid" value="<%=recruit.getRecruitid()%>"  style="display:none">   
                        		<div class="form-group">
                        			<label class="label"><span class="need">*</span> 姓名：</label>
							        <input type="text" datatype="*" nullmsg="请填写您的姓名" name="recruitapply.applyname"  class="form-control">   
                        		</div>
            					<div class="form-group">
            						<label class="label"> 性别：</label>
						    		<select  datatype="*" name="recruitapply.applysex" class="form-control">
										<option value="1">男</option>
										<option value="0">女</option>
									</select>
            					</div>
            					<div class="form-group">
            						<label class="label"> 民族：</label>
									<input type="text" datatype="/^\s*$/|*"  name="recruitapply.applynation"  class="form-control">	
            					</div>
            					<div class="form-group">
            						<label class="label"> 籍贯：</label>
									<input type="text" datatype="/^\s*$/|*"  name="recruitapply.applynative"  class="form-control">
            					</div>
            					<div class="form-group">
            						<label class="label"><span class="need">*</span> 学历：</label>
						    			<select  name="recruitapply.applyeducation" datatype="/^\s*$/|*"  class="form-control">
											<option value="本科">本科</option>
											<option value="硕士">硕士</option>
											<option value="博士">博士</option>
											<option value="博士后">博士后</option>
											<option value="专科">专科</option>
											<option value="高中">高中</option>
											<option value="初中或以下">初中或以下</option>
										</select>
            					</div>
            					<div class="form-group">
            						<label class="label"> 邮箱：</label>
									<input type="text" datatype="/^\s*$/|*"  name="recruitapply.applyemail" errormsg="邮箱格式不正确"  class="form-control">
            					</div>
            					<div class="form-group">
            						<label class="label"> <span class="need">*</span>电话：</label>
									<input type="text" datatype="n"  name="recruitapply.applyphone"  nullmsg="请填写您的电话" errormsg="电话号码应为数字"  class="form-control">
            					</div>
            					<div class="form-group">
            						<label class="label">个人简历</label>	
            						<script id="ueditor_resume" type="text/plain"></script>
            						<input id="input_resume" name="recruitapply.applyresume" class="sr-only"/>
            					</div>
								<button type="submit" class="btn">提交</button>
							</form>		
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
	<jsp:include page="floatnavbar.jsp" flush="true"/>
	<script src="<%=basePath%>Plugins/jquery/jquery.backstretch.min.js"></script>
	<script src="<%=basePath%>Plugins/validform/js/Validform_v5.3.2_ncr_min.js"></script>
	<!-- ueditor -->
	<script type="text/javascript" charset="utf-8" src="<%=basePath%>Plugins/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>Plugins/ueditor/ueditor.all.js"> </script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>Plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript">
	var formValid = null;
	var editor_resume = null;
	$(function(){
			/* $(window).resize(function(){
				updateUEditorSize();
			}); */
			/* updateUEditorSize(); */ 
			initFormValid();
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
		
		function initUEditor(){
    		var editor_resume = UE.getEditor("ueditor_resume");
    		    editor_resume.addListener("contentChange", function(){
    			$("#input_resume").val(editor_resume.getContent());
    		});
		}
	</script>
</body>
</html>
