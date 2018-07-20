<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"Portal/";
/* String name = (String)session.getAttribute("name");
String password = (String)session.getAttribute("password"); */
%>
<!---footer--->
<div class="footer-section">
	<div class="container">
		<div class="footer-grids">
			<div class="col-md-6 footer-grid">
				<h4>联系我们</h4>
				<h5>Contact Us</h5>
				<hr/>
				<p>
					郑州|公司总机：0371-88888888&nbsp;&nbsp;人事专线：0371-99999999<br>
					公司邮箱：shengrong@163.com
				</p>
			</div>
			<div class="col-md-2 footer-grid">
				<h4></h4>
				<h5>关于我们</h5>
				<ul>
					<li><a href="#">关于晟荣</a></li>
					<li><a href="#">关于团队</a></li>
				</ul>
			</div>
			<div class="col-md-2 footer-grid">
				<h4></h4>
				<h5>产品中心</h5>
				<ul>
					<li><a href="#">咖啡机</a></li>
					<li><a href="#">消防器材</a></li>
				</ul>
			</div>
			<div class="col-md-2 footer-grid">
				<h4></h4>
				<h5>新闻前线</h5>
				<ul>
					<li><a href="#">公司新闻</a></li>
					<li><a href="#">行业动态</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!--copy-->
<div class="copy-section">
	<div class="container">
		<p>Copyright &copy; 2018.河南晟荣建筑工业科技有限公司版权所有</p>
	</div>
</div>