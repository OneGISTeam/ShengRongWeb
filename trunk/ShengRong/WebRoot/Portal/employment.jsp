<%@ page language="java" import="java.util.*,java.util.*,com.shengrong.hibernate.*,java.text.SimpleDateFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"Portal/";
List<Recruit> recruitList =(List<Recruit>)request.getAttribute("recruitList");
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
	<link href="<%=basePath%>Portal/style.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath%>Portal/employment.css" rel="stylesheet" type='text/css'/>
	<link rel="stylesheet" href="<%=basePath%>Plugins/FontAwesome/font-awesome.css" />
	<link href='<%=basePath%>fonts.css' rel='stylesheet' type='text/css' />
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
			<h2>招聘信息</h2>
		</div>
	</div>
	<!---banner--->
	  <div class="case-container">
            <div class="case-index-title"></div>
            <div class="case-index-content">
                <ul class="clearfix">
                    <% for(int i=0; i<recruitList.size(); i++){
                        String imageString ="Images/employment/"+"img00"+ (i+1)+ ".png";
                        String deadline = new SimpleDateFormat("yyyy.MM.dd").format(recruitList.get(i).getDeadline());
                     %> 
                    <li class="case-example-item">
                        <!-- <a href="#"> -->
                            <img src="<%=basePath%><%=imageString%>" alt="" class="case-pad">
                            <div class="case-item-info">
                                <div class="case-info-title"><%=recruitList.get(i).getRecruitname()%></div>
                                <div class="case-info-content">
                                    <p>截止日期：<%=deadline%></p>
                                    <table>
                                    	<thead>
                                    		<tr>
                                    			<td><i class="fa fa-info-circle"></i> <%=recruitList.get(i).getAge()%> </th>
                                    			<td><i class="fa fa-map-marker"></i> <%=recruitList.get(i).getWorkplace()%> </th>
                                    			<td><i class="fa fa-jpy"></i> <%=recruitList.get(i).getPayment()%> </th>
                                    			<td><i class="fa fa-user"></i> <%=recruitList.get(i).getRecruitnumber()%> </th>
                                    		</tr>
                                    	</thead>
                                    </table>
                                </div>
                                <div class="case-info-text">
                                	<h5 style="line-height:2.5em"><i class="fa fa-hand-o-right"></i> 岗位职责 </h5>
                                	<%=recruitList.get(i).getDuty()%>
                                    <h5 style="line-height:2.5em"><i class="fa fa-hand-o-right"></i> 任职要求 </h5>
                                    <%=recruitList.get(i).getRequirement()%> 
                               </div>
                               <a type="button" class="btn btn-info" onclick="openRecruitapply(<%=recruitList.get(i).getRecruitid() %>)" style="margin:20px auto;">立即申请</a> 
                            </div>
                       <!--  </a> -->
                    </li>
                    <%} %>
                </ul>
            </div>
        </div>
	<jsp:include page="footer.jsp" flush="true"/>
	<jsp:include page="floatnavbar.jsp" flush="true"/>
	<script type="text/javascript">
	     function openRecruitapply(recruitid){
			window.open("<%=basePath%>openRecruitapply.action?recruitid=" + recruitid);
		}
	</script>
	

</body>
</html>
