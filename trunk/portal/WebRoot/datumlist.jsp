<%@ page language="java" import="java.util.*,com.shengrong.hibernate.*,java.io.*,com.shengrong.hibernate.customization.*,java.text.SimpleDateFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
response.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String filePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/ShengRongManager/";
List<Datum> datumList = (List<Datum>)request.getAttribute("datumList");
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
	<link href="<%=basePath%>Plugins/bootstrap/bootstrap1.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath%>Portal/style.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath%>Plugins/pagination/pagination.css" rel="stylesheet"/>
	<link href="<%=basePath%>Plugins/FontAwesome/font-awesome.css" rel="stylesheet"/>
	<script src="<%=basePath%>Plugins/jquery/jquery-1.11.1.min.js"></script>
	<script src="<%=basePath%>Plugins/bootstrap/bootstrap.min.js"></script>	
	
	<!---fonts-->
	<link href='<%=basePath%>fonts.css' rel='stylesheet' type='text/css' />
  </head>
  
<body>
    <jsp:include page="navbar.jsp" flush="true" />
	<!---banner--->
	<div class="banner-section">
		<div class="container">
			<h2>资料共享</h2>
		</div>
	</div>
	<!---banner--->
	<div id="page-inner">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="table-responsive" style="width:70%;margin:0 auto">
							<table id="news_table" class="table table-hover">
                               	<thead>
	                            	<tr>
	                                	<th style="width:20%;text-align: center">资料标题</th>
	                                    <th style="width:20%;text-align: center">资料描述</th>
	                                    <th style="width:20%;text-align: center">发布日期</th>
	                                    <th style="width:20%;text-align: center">下载</th>
	                                 </tr>
	                             </thead>
	                             <tbody>
	                             <%
	                              for(int i=0; i<datumList.size(); i++){
	                              String datumDate = new SimpleDateFormat("yyyy-MM-dd").format(datumList.get(i).getDatetime());
	                              %>
	                              <tr>
	                              	<td style="width:20%;text-align: center"><%=datumList.get(i).getTitle() %></td>
	                              	<td style="width:20%;text-align: center"><%=datumList.get(i).getBrief() %></td>
	                                <td style="width:20%;text-align: center"><%=datumDate%></td>
	                                <td style="width:20%;text-align: center">
	                                 	<a type="button" class="btn btn-primary btn-sm" onclick="downloadDatum('<%=datumList.get(i).getUrl() %>')"><span class="fa fa-download"></span>&nbsp;下载</a>
	                                </td>
	                              </tr>
	                              <%} %>
	                              </tbody>
			                  </table>
						</div>
                        <!-- paging -->
                        <div id="pagination" style="text-align: center"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
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
		
		function pageTo(index, jq){
			var page = index + 1;
			var url = "<%=basePath %>" + "datum/queryDatums.action?"
				+ "&pagingInfo.currentPage=" + page + "&pagingInfo.itemPerPage=10";
			window.location.href=url;
			return false;
		}
		
		function downloadDatum(url){
			var datumurl= '<%=filePath%>'+ url; 
			 <%-- var datumurl= "<%=filePath%>"+"/Datum/temp/2018-07-13/66ce46c7-0f47-45c5-a2d1-03bbdc09c5a5.docx"; --%>
			window.open(datumurl);
		} 
	</script>
</body>
</html>
