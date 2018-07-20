<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"Portal/";
%>
<style type="text/css">
.cndns-right{
     margin:0;padding:0;list-style-type:none;
	 /* font:12px/180% Arial, Helvetica, sans-serif ,"新宋体"; */
}
.cndns-right a,img{
	border:0;
	text-decoration:none;
	}

.cndns-right p{
	margin:0px;
	padding:0px;
	line-height:20px;
	}
.cndns-right i{
	margin:0px;
	padding:0px;
	font-style:normal
	}
.cndns-right a{
	color:#333333;
	text-decoration:none;
	}
.cndns-right a:hover{
	color:#ff5a00;
	text-decoration:none;
	}
.cndns-right .clear{
	clear:both;
	font-size:0px;
	line-height:0;
	height:0;
	}  

@font-face {
	font-family: 'icomoon';
    src:url('Plugins/nav-fonts/icomoon.eot?qradjf');
    src:url('Plugins/nav-fonts/icomoon.eot?qradjf#iefix') format('embedded-opentype'),
        url('Plugins/nav-fonts/icomoon.ttf?qradjf') format('truetype'),
        url('Plugins/nav-fonts/icomoon.woff?qradjf') format('woff'),
        url('Plugins/nav-fonts/icomoon.svg?qradjf#icomoon') format('svg');
    font-weight: normal;
    font-style: normal;
}
.demo-icon{
  font-family:"icomoon";
  font-style:normal;
  font-weight:normal;
  speak:none;
  display:inline-block;
  text-decoration:inherit;
  text-align:center;
  font-variant:normal;
  text-transform:none;
  font-size:24px;
  -webkit-font-smoothing:antialiased;
  -moz-osx-font-smoothing:grayscale;
  line-height:24px;
  color:#999; 
}

/*new right*/
.cndns-right{position:fixed;right:1px;top:50%;margin-top:100px;z-index:100}
.cndns-right-meau{position:relative;}
.cndns-right-btn{width:48px;height:48px;border:1px solid #ddd;text-align:center;display:block;margin-bottom:6px;position:relative;background-color:#fff}
.cndns-right-btn span{color:#848484;font-size:26px;line-height:48px;}
.cndns-right-btn sup{display:block;min-width:24px;height:24px;text-align:center;line-height:24px;color:#fff;border-radius: 50%;background-color:#ff6800;position:absolute;left:-12px;top:-12px;}
.cndns-right-btn p{color:#ff6800;font-size:14px;line-height:18px;padding-top:5px;display:none;}
.cndns-right-meau:hover .cndns-right-btn span{display:none}
.cndns-right-meau:hover .cndns-right-btn p{display:block;}
.meau-car .cndns-right-btn {border-color:#ff6800;margin-bottom:20px;}
.meau-car.cndns-right-meau:hover .cndns-right-btn{background-color:#ff6800}
.meau-car.cndns-right-meau:hover .cndns-right-btn span{color:#fff;display:block;}
.meau-car .cndns-right-btn span{color:#ff6800;}
.meau-sev .cndns-right-btn{border-color:#ff6800;background:url(images/02index-banner-8.gif) no-repeat #ff6800 center;} 
.meau-sev .cndns-right-btn p{color:#fff}
.meau-sev .cndns-right-btn span{color:#fff}
.meau-top .cndns-right-btn span{font-size:12px;line-height:12px;padding-top:10px;display:block}
.meau-top .cndns-right-btn i{display:block;color:#999}
.meau-top.cndns-right-meau:hover .cndns-right-btn{background-color:#ff6800}
.meau-top.cndns-right-meau:hover .cndns-right-btn span{display:block;color:#fff} 
.meau-top.cndns-right-meau:hover .cndns-right-btn i{color:#fff;}
.cndns-right-box{position:absolute;top:-15px;right:48px;padding-right:25px;display:none;}
.cndns-right-box .box-border{border:1px solid #ccc;border-top:4px solid #ff6800;padding:10px;background-color:#fff;-webkit-box-shadow: 0 3px 8px rgba(0,0,0,.15);-moz-box-shadow: 0 3px 8px rgba(0,0,0,.15);box-shadow: 0 3px 8px rgba(0,0,0,.15);position:relative}
.cndns-right-box .box-border .arrow-right{display:block;width:13px;height:16px;background:url(Images/float-navbar/arrow.png) no-repeat;position:absolute;right:-13px;top:26px;}
/*.cndns-right -box .box-border .sev-t span{font-size:42px;float:left;display:block;line-height:56px;margin-right:20px;color:#d3d3d3} */
.cndns-right-box .box-border .sev-t p{float:left;color:#ff6800;font-size:20px;line-height:1.2em;}
.cndns-right-box .box-border .sev-t p i{display:block;font-size:12px;color:#aaa;}
.meau-sev .cndns-right-box .box-border{width:430px;}
.meau-contact .cndns-right-box .box-border{width:180px;height:70px}
.cndns-right-meau:hover .cndns-right-box{display:block}
.meau-code .cndns-right-box{top:inherit;bottom:-35px;}
.meau-code .cndns-right-box .box-border{width:180px;text-align:center;border-top:1px solid #ccc;}
.meau-code .cndns-right-box .box-border i{display:block;color:#f66e06;font-size:16px;line-height:16px;}
.meau-code .cndns-right-box .box-border .arrow-right{top:inherit;bottom:50px;}
.meau-sev .cndns-right-btn .demo-icon{display:none;}
.meau-sev:hover .cndns-right-btn{background:#ff6800}
.meau-zs .cndns-right-btn{background-color:#ff6800;color:#fff;margin-top:80px;border-color:#ff6800}
.meau-zs .cndns-right-btn span{color:#fff}
.meau-zs .cndns-right-btn p{color:#fff}
</style>
<div class="cndns-right">
	<div class="cndns-right-meau meau-contact">
        <a href="javascript:" class="cndns-right-btn">
            <span class="demo-icon">&#xe902;</span>
            <p>客服<br />热线</p>
        </a>
        <div class="cndns-right-box">
            <div class="box-border">
                <div class="sev-t">
                   <%--  <span class="demo-icon">&#xe902;</span> --%>
                    <p>0371-55558888<br/><i>24小时客服服务热线</i></p>
                    <div class="clear"></div>
                </div>
                <span class="arrow-right"></span>
            </div>
        </div>
    </div>
    <div class="cndns-right-meau meau-code">
        <a href="javascript:" class="cndns-right-btn">
            <span class="demo-icon">&#xe903;</span>
            <p>
                关注<br />
                微信
            </p>
        </a>
        <div class="cndns-right-box">
            <div class="box-border">
                <div class="sev-t">
                    <img src="<%=basePath%>Images/float-navbar/02index-2.jpg" />
                    <i>关注官方微信</i>
                </div>
                <span class="arrow-right"></span>
            </div>
        </div>
    </div>
    <div class="cndns-right-meau meau-top" id="top-back">
        <a href="javascript:" class="cndns-right-btn" onclick="topBack()">
            <span class="demo-icon">&#xe904;</span>
            <i>顶部</i>
        </a>
    </div>

</div>

<script type="text/javascript">
//置顶图标显示
$('#top-back').hide()
$(window).scroll(function(){
	 if($(this).scrollTop() > 350){
		$("#top-back").fadeIn();
	 }
	 else{
		$("#top-back").fadeOut();
	 }
  })	
//置顶事件
function topBack(){
  $('body,html').animate({scrollTop:0},300);
}
</script>


