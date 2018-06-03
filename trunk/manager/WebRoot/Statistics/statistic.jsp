<%@ page language="java" import="java.util.*,com.shengrong.manager.model.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
AmountInfo amountInfo = (AmountInfo)request.getAttribute("amountInfo");
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
  </head>
  
<body>
	<div id="wrapper">
		
		<!-- 添加navbar，动态链接方式，需要jsp重新编译 -->
		<jsp:include page="../navbar.jsp" flush="true"/>
		
		<div id="page-wrapper">
			<div class="header"> 
				<h1 class="page-header">
					网站统计工具<small>Web Statistic Tool</small>
				</h1>
				<ol class="breadcrumb">
				  <li><a href="#">河南晟荣</a></li>
				  <li class="active">公司首页</li>
				</ol> 
			</div>
			<div id="page-inner">
				<div class="row">
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-primary">
	                        <div class="panel-heading">
	                            <div class="row">
	                                <div class="col-xs-3">
	                                    <i class="fa fa-globe fa-5x"></i>
	                                </div>
	                                <div class="col-xs-9 text-right">
	                                    <div class="huge"><%=amountInfo.getNewsCount().toString() %></div>
	                                    <div>新闻数量</div>
	                                </div>
	                            </div>
	                        </div>
	                        <a href="<%=basePath %>news/queryNewses.action">
	                            <div class="panel-footer">
	                                <span class="pull-left">查看详情</span>
	                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	                                <div class="clearfix"></div>
	                            </div>
	                        </a>
	                    </div>
					</div>
					<div class="col-lg-3 col-md-6">
	                    <div class="panel panel-green">
	                        <div class="panel-heading">
	                            <div class="row">
	                                <div class="col-xs-3">
	                                    <i class="fa fa-cloud fa-5x"></i>
	                                </div>
	                                <div class="col-xs-9 text-right">
	                                    <div class="huge">XXX</div>
	                                    <div>产品数量</div>
	                                </div>
	                            </div>
	                        </div>
	                        <a href="#">
	                            <div class="panel-footer">
	                                <span class="pull-left">查看详情</span>
	                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	                                <div class="clearfix"></div>
	                            </div>
	                        </a>
	                    </div>
	                </div>
	                <div class="col-lg-3 col-md-6">
	                    <div class="panel panel-yellow">
	                        <div class="panel-heading">
	                            <div class="row">
	                                <div class="col-xs-3">
	                                    <i class="fa fa-tasks fa-5x"></i>
	                                </div>
	                                <div class="col-xs-9 text-right">
	                                    <div class="huge"><%=amountInfo.getDatumCount().toString() %></div>
	                                    <div>资料数量</div>
	                                </div>
	                            </div>
	                        </div>
	                        <a href="<%=basePath %>datum/queryDatums.action">
	                            <div class="panel-footer">
	                                <span class="pull-left">查看详情</span>
	                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	                                <div class="clearfix"></div>
	                            </div>
	                        </a>
	                    </div>
	                </div>
	                <div class="col-lg-3 col-md-6">
	                    <div class="panel panel-red">
	                        <div class="panel-heading">
	                            <div class="row">
	                                <div class="col-xs-3">
	                                    <i class="fa fa-users fa-5x"></i>
	                                </div>
	                                <div class="col-xs-9 text-right">
	                                    <div class="huge"><%=amountInfo.getMemberCount().toString() %></div>
	                                    <div>成员数量</div>
	                                </div>
	                            </div>
	                        </div>
	                        <a href="<%=basePath %>aboutus/aboutmember.action">
	                            <div class="panel-footer">
	                                <span class="pull-left">查看详情</span>
	                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	                                <div class="clearfix"></div>
	                            </div>
	                        </a>
	                    </div>
	                </div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
	                        	服务器内存占有率监视
	                        </div>
	                        <div class="panel-body">
	                            <div class="flot-chart">
	                            	<label>当内存占有率百分比（%）</label>
	                                <div style="height:300px" class="flot-chart-content" id="flot-line-chart-moving"></div>
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
	
	<script src="<%=basePath%>Plugins/jquery/jquery-1.10.2.js"></script>
	<script src="<%=basePath%>Plugins/jquery/jquery.metisMenu.js"></script>
	<script src="<%=basePath%>Plugins/bootstrap/bootstrap.min.js"></script>
	<script src="<%=basePath%>scripts.js"></script>
	<!-- flot -->
	<script src="<%=basePath%>Plugins/flot/excanvas.min.js"></script>
	<script src="<%=basePath%>Plugins/flot/jquery.flot.js"></script>
	<script src="<%=basePath%>Plugins/flot/jquery.flot.resize.js"></script>
	<script src="<%=basePath%>Plugins/flot-tooltip/jquery.flot.tooltip.min.js"></script>
	<script type="text/javascript">
		var memoryRatio = [];
		var _MAX_COUNT = 200;
		var movingPlot;
		var seriesdata = [];
		$(function(){

			initFlotLineChartMoving();
			
		});
		
		function initMemoryRatiao(){
			for(var i=0; i<_MAX_COUNT; i++){
				memoryRatio.push(0.0);
				seriesdata.push([
					i,
					0.0
				]);
			}
		}
		
		function initFlotLineChartMoving(){
			initMemoryRatiao();
			var container = $("#flot-line-chart-moving");
			
		    series = [{
		        data: seriesdata,
		        lines: {
		            fill: true
		        }
		    }];
		    
		    
		    movingPlot = $.plot(container, series, {
		        grid: {
		            borderWidth: 1,
		            minBorderMargin: 20,
		            labelMargin: 10,
		            backgroundColor: {
		                colors: ["#fff", "#e4f4f4"]
		            },
		            margin: {
		                top: 8,
		                bottom: 20,
		                left: 20
		            },
		            markings: function(axes) {
		                var markings = [];
		                var xaxis = axes.xaxis;
		                for (var x = Math.floor(xaxis.min); x < xaxis.max; x += xaxis.tickSize * 2) {
		                    markings.push({
		                        xaxis: {
		                            from: x,
		                            to: x + xaxis.tickSize
		                        },
		                        color: "rgba(232, 232, 255, 0.2)"
		                    });
		                }
		                return markings;
		            }
		        },
		        xaxis: {
		            tickFormatter: function() {
		                return "";
		            }
		        },
		        yaxis: {
		            min: 0,
		            max: 110
		        },
		        legend: {
		            show: true
		        }
		    });
		    
		    setInterval(function updateRandom() {
		    	getRandomData();
		    	
		    }, 1000);
		}
		
		function getRandomData() {
			$.ajax({
				url: "<%=basePath%>statistic/systemPerformance.action",
				method: "GET",
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function(data) {
					var json = JSON.parse(data);
					memoryRatio = memoryRatio.slice(1);
					seriesdata.splice(0,seriesdata.length);
					for(var i=0; i<memoryRatio.length; i++){
						var item = [
							i,
							memoryRatio[i]
						];
						seriesdata.push(item);
					}
					memoryRatio.push(json.memoryRatio);
					seriesdata.push([
						_MAX_COUNT - 1,
						json.memoryRatio
					]);
					
					series[0].data = seriesdata;
					movingPlot.setData(series);
			    	movingPlot.draw();
				}
			});
	    }
	</script>
</body>
</html>
