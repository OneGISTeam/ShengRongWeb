<%@ page language="java" import="java.util.*,com.shengrong.hibernate.*,java.io.*,com.shengrong.hibernate.customization.*,java.text.SimpleDateFormat,com.shengrong.portal.tools.*" pageEncoding="utf-8" %>
<%
String path = request.getContextPath();
response.setCharacterEncoding("utf-8");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"Portal/";
List<News> newsList = (List<News>)request.getAttribute("newsList");
List<Newstype> newstypeList = (List<Newstype>)request.getAttribute("newstypeList");
int currentNewstype = (Integer)request.getAttribute("currentNewstype");
Long totalCount = (Long)request.getAttribute("totalCount");
PagingInfo pagingInfo = (PagingInfo)request.getAttribute("pagingInfo");
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
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="<%=basePath%>Plugins/bootstrap/bootstrap1.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath%>Portal/style.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath%>Portal/news.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath%>Plugins/pagination/pagination.css" rel="stylesheet"/>
	<script src="<%=basePath%>Plugins/jquery/jquery-1.11.1.min.js"></script>
	<script src="<%=basePath%>Plugins/bootstrap/bootstrap.min.js"></script>
	
	<!---fonts-->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
  </head>
  
<body>
	<!---header--->
	<jsp:include page="navbar.jsp" flush="true" />
	<!-- /header -->
	<!---banner--->
	<div class="banner-section">
			<div class="container">
				<h2>新闻前线</h2>
			</div>
	</div>
	<!---banner--->
	<!---banner--->
	<div class="content">
		<div class="properties-section">
			<div class="container">
					<ul  class="nav nav-tabs">
						<% 
						for(int i=0; i<newstypeList.size(); i++){
					    	if(newstypeList.get(i).getTypeid() == currentNewstype){
						%>
							<li class="active">
								<a onclick="queryType(<%=newstypeList.get(i).getTypeid() %>)" data-toggle="tab"><%=newstypeList.get(i).getName() %></a>
			           	    </li>
							<%
					    	}else{
							%>
							<li>
								<a onclick="queryType(<%=newstypeList.get(i).getTypeid() %>)" data-toggle="tab"><%=newstypeList.get(i).getName() %></a>
			            	</li>
					    		<%}%>
						<%}%> 
					</ul>
				    <div class="tab-content">
					   <div role="tabpanel" class="tab-pane fade in active">
					 
					     <%
                            for(int i=0; i<newsList.size(); i++){
                            InputStream is = newsList.get(i).getImage().getBinaryStream();
							byte[] b = new byte[is.available()];
							is.read(b, 0, b.length);
						    String imageString = new String(b);
							String newsDate = new SimpleDateFormat("yyyy-MM-dd").format(newsList.get(i).getNewsdate());
							String contentPlainText = HtmlFilterTool.toPlainText(newsList.get(i).getContent());
                         %>
                           <div class="forsale-grids" onclick="openNews(<%=newsList.get(i).getNewsid()%>)">
							<div class="forsale1">
								<div class="forsale-left">
									<img src="<%=imageString%>" class="news_img">
								</div>
								<div class="forsale-right">
								    <h5><%=newsList.get(i).getTitle()%></h5>
								    <div class="news-content" >
								          <p><%=contentPlainText%></p>
                                    </div>
                                </div>
							   <div class="clearfix"></div> 
								<ul>
								 	<li><%=newsDate%></li>
								  <%
					                if(newsList.get(i).getManager()!= null){
					              %>
					                <li><%=newsList.get(i).getManager().getName()%></li>	
					              <%
					                }else{
					              %>
					                <li>未知</li>
					              <%}%>
					                <li><%=newsList.get(i).getKeywords()%></li>			
								 </ul>  
							 </div>
						</div>	
					      <%} %> 
						 
					     <div id="pagination" style="text-align: center"></div>
					   </div>	

		       </div>
	       </div>
      </div>
    </div>	
	<!-- 添加pannel，动态链接方式，需要jsp重新编译 -->
	<jsp:include page="footer.jsp" flush="true" />
	<jsp:include page="floatnavbar.jsp" flush="true"/>
	<script src="<%=basePath%>Plugins/pagination/jquery.pagination.js"></script>
	
	<script type="text/javascript">
	$(function(){
	var paginationOpt = {
				callback: pageTo,
				prev_text: "« 上一页",
				next_text: "下一页 »",
				items_per_page: 10,
				num_edge_entries: 2,
				num_display_entries: 5,
				current_page: <%=pagingInfo.getCurrentPage()%> - 1
			};

			$("#pagination").pagination(<%=totalCount%>, paginationOpt);
		});
		
		function queryType(typeid){
			window.location.href= "<%=basePath %>News/" + "queryNewses.action?currentNewstype=" + typeid;
		};
		
		function pageTo(index, jq){
			var page = index + 1;
			var url = "<%=basePath %>News/" + "queryNewses.action?currentNewstype=<%=currentNewstype %>"
				+ "&pagingInfo.currentPage=" + page + "&pagingInfo.itemPerPage=10";
			window.location.href=url;
			return false;
		}
		
		function openNews(newsid){
			window.location.href = "<%=basePath%>News/openNews.action?newsid=" + newsid;
		}
	</script>
</body>
</html>

