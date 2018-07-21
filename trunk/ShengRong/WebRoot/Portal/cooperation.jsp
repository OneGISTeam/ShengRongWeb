<%@ page language="java" import="java.util.*,com.shengrong.hibernate.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"Portal/";
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
	<link href="<%=basePath%>Plugins/bootstrap/bootstrap.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath%>Portal/style.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath%>Plugins/validform/css/validform.css" rel="stylesheet"/>
	<script src="<%=basePath%>Plugins/jquery/jquery-1.11.1.min.js"></script>
	<script src="<%=basePath%>Plugins/bootstrap/bootstrap.js"></script>
	
	<!---fonts-->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
  </head>
  
<body>
    <jsp:include page="navbar.jsp" flush="true" />
	<!---banner--->
	<div class="banner-section">
		<div class="container">
			<h2>加入我们</h2>
		</div>
	</div>
	<!---banner--->
	<div class="content">
			<div class="contact-section">
				<div class="container">
					<div class="contact-grids">
						<div class="col-md-8 contact-grid">
							<h5>我们将在24小时内回复您</h5>
							<p></p>
							<form method="post" role="form" action="<%=basePath%>Joinus/saveCoopreation.action">
								<ul>
									<li style="list-style:none;">
										<input type="text" datatype="/^\s*$/|*" placeholder="姓名" name="joinus.name">
								    </li>
								    <li style="list-style:none;"> 
										<input type="text" datatype="*" placeholder="公司 " name="joinus.company" nullmsg="请填写公司名称">
								    </li>
									<li style="list-style:none;">
										<input type="email"  datatype="e" placeholder="邮箱" name="joinus.email" nullmsg="请填写邮箱" errormsg="邮箱格式不正确">
									</li>
									<li style="list-style:none;">
										<input type="text" datatype="/^\s*$/|n"  placeholder="电话" name="joinus.phone" errormsg="电话号码应为数字">
									</li>
									<li style="list-style:none;">
										<textarea type="text" datatype="*" placeholder="您的需求和评论" name="joinus.comment"  nullmsg="请填写您的需求"></textarea>
									</li>
								</ul>
								<input type="submit" value="提交" >
							</form>
						</div>
						<div class="col-md-4 contact-grid1">
							<ul>
								<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i> 电话 : 0041-456-3692</li>
								<li><i class="glyphicon glyphicon-phone" aria-hidden="true"></i> 手机 : 0200-123-4567</li>
								<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i> 邮箱 : info@example.com</li>
								<li><i class="glyphicon glyphicon-print" aria-hidden="true"></i> 传真 : 0091-789-456100</li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="footer.jsp" flush="true"/>
	<jsp:include page="floatnavbar.jsp" flush="true"/>
	<script src="<%=basePath%>Plugins/validform/js/Validform_v5.3.2_ncr_min.js"></script>
	<script type="text/javascript">
		$(function(){
			//初始化表单验证信息
			var form = $("form").Validform({
				tiptype:3,
				label:".label",
				showAllError:true
			});
			ajaxPost:true
		});
	</script>

</body>
</html>
