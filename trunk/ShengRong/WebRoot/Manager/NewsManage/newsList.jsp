<%@ page language="java" import="java.util.*,com.shengrong.hibernate.*,java.io.*,com.shengrong.hibernate.customization.*,java.text.SimpleDateFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
response.setCharacterEncoding("utf-8");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"Manager/";
List<News> newsList = (List<News>)request.getAttribute("newsList");
List<Newstype> newstypeList = (List<Newstype>)request.getAttribute("newstypeList");
int currentNewstype = (Integer)request.getAttribute("currentNewstype");
Long totalCount = (Long)request.getAttribute("totalCount");
PagingInfo pagingInfo = (PagingInfo)request.getAttribute("pagingInfo");
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
    <link href="<%=basePath%>Plugins/pagination/pagination.css" rel="stylesheet"/>
  </head>
  
<body>
	<div id="wrapper">
		
		<!-- 添加navbar，动态链接方式，需要jsp重新编译 -->
		<jsp:include page="../navbar.jsp" flush="true"/>
				
		<div id="page-wrapper">
			<div class="header"> 
				<h1 class="page-header">
					新闻列表<small>News List</small>
				</h1>
				<ol class="breadcrumb">
				  <li><a href="#">河南晟荣</a></li>
				  <li class="active">新闻</li>
				</ol> 
			</div>
			<div id="page-inner">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								已发布新的新闻
							</div>
							<div class="panel-body">
								<ul class="nav nav-tabs">
									<% 
										for(int i=0; i<newstypeList.size(); i++){
											if(newstypeList.get(i).getTypeid() == currentNewstype){
											%>
												<li class="active"><a onclick="queryType(<%=newstypeList.get(i).getTypeid() %>)" data-toggle="tab"><%=newstypeList.get(i).getName() %></a>
			                                	</li>
											<%
											}else{
											%>
												<li><a onclick="queryType(<%=newstypeList.get(i).getTypeid() %>)" data-toggle="tab"><%=newstypeList.get(i).getName() %></a>
			                                	</li>
											<%	
											}
										%>
										
										<%	
										}
									%> 
	                            </ul>
	                            <div class="tab-content">
                           			<div class="tab-pane fade active in">
	                                	<div class="table-responsive">
	                                		<table id="news_table" class="table table-hover">
	                                			<thead>
			                                        <tr>
			                                        	<th>标识</th>
			                                        	<th>新闻图片</th>
			                                            <th>新闻标题</th>
			                                            <th>新闻日期</th>
			                                            <th>发布者</th>
			                                            <th>发布时间</th>
			                                            <th>头条</th>
			                                            <th>编辑</th>
			                                            <th>删除</th>
			                                        </tr>
			                                    </thead>
			                                    <tbody>
                                      					<%
                                      						for(int i=0; i<newsList.size();i++){
                                      							InputStream is = newsList.get(i).getImage().getBinaryStream();
																byte[] b = new byte[is.available()];
																is.read(b, 0, b.length);
																String imageString = new String(b); 

																String newsDate = new SimpleDateFormat("yyyy-MM-dd").format(newsList.get(i).getNewsdate());
                                      						%>
                                      							<tr>
					                                            <td><%=newsList.get(i).getNewsid() %></td>
					                                            <td><img style="width:128px;height:50px" src="<%=imageString %>"/></td>
					                                            <td><%=newsList.get(i).getTitle() %></td>
					                                            <td><%=newsDate %></td>
					                                            <%
					                                            	if(newsList.get(i).getManager() != null){
					                                            	%>
					                                            		<td><%=newsList.get(i).getManager().getName() %></td>	
					                                            	<%
					                                            	}else{
					                                            	%>
					                                            		<td>未知</td>
					                                            	<%
					                                            	}
					                                            %>
					                                            <td><%=newsList.get(i).getPublishdatetime().toString() %></td>
					                                            <%
					                                            	if(newsList.get(i).getIsheadline()){
					                                            	%>
					                                            		<td>是</td>
					                                            	<%	
					                                            	}else{
					                                            	%>
					                                            		<td>否</td>
					                                            	<%
					                                            	} 
					                                            %>
					                                            <td>
					                                            	<a type="button" class="btn btn-success btn-sm" onclick="editNews(<%=newsList.get(i).getNewsid() %>)" >
					                                            		<span class="fa fa-edit"></span>&nbsp;编辑
					                                            	</a>
					                                            </td>
					                                            <td>
					                                            	<a type="button" class="btn btn-danger btn-sm" onclick="deleteNews(<%=newsList.get(i).getNewsid() %>)" >
					                                            		<span class="fa fa-minus"></span>&nbsp;删除
					                                            	</a>
					                                            </td>
					                                        </tr>
                                      						<%
                                      						} 
                                      					%>
                                      				</tbody>
	                                		</table>
	                                	</div>
	                                	<!-- paging -->
	                                	<div id="pagination" style="text-align: center">
        								</div>
	                                </div>
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
	                <button onclick="window.location.href='<%=basePath%>news/queryNewses.action';" type="button" class="btn btn-default" data-dismiss="modal">确定</button>
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
	<script src="<%=basePath%>Plugins/pagination/jquery.pagination.js"></script>
	<script type="text/javascript">
		var dataTable = null;
		$(function(){
			//初始化表单验证信息
			var form = $("form").Validform({
				tiptype:3,
				label:".label",
				showAllError:true
			});
			
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
			window.location.href= "<%=basePath %>" + "news/queryNewses.action?currentNewstype=" + typeid;
		};
		
		function pageTo(index, jq){
			var page = index + 1;
			var url = "<%=basePath %>" + "news/queryNewses.action?currentNewstype=<%=currentNewstype %>"
				+ "&pagingInfo.currentPage=" + page + "&pagingInfo.itemPerPage=10";
			window.location.href=url;
			return false;
		}
		
		function editNews(newsid){
			window.location.href = "<%=basePath %>" + "news/updateNewsPage.action?newsid=" + newsid;
		}
		
		function deleteNews(newsid){
			$.ajax({  
				type:"POST",
        		url:"<%=basePath%>news/deleteNews.action",
        		dataType:"json",
        		data:{
       				"newsid":newsid
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
		}
		
	</script>
</body>
</html>
