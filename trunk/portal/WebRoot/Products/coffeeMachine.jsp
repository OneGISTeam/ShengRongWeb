<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	
	<link href="<%=basePath%>Plugins/jquery/animate.min.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath%>Plugins/jquery/jquery.fullPage.css" rel="stylesheet" type='text/css'/>
	<link href="<%=basePath%>Plugins/jquery/style.css" rel="stylesheet" type='text/css'/>
	
	<!---fonts-->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
  </head>
  
  <body>

    <div id="fullpage">
        <div class="section">
            <!--<div class="bg" style="z-index:3"><img src="images/index/1zhezhao.png"></div>-->
            <!--菜单按钮-->
            <!-- <div class="sq_menu_container">
                <div class="sq_menu">
                    <div class="sq_m_span">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                    <div class="sq_m_meun">
                        MEUN
                    </div>
                </div>
                <div class="sq_meun_back"></div>
                <div class="sq_meun_nav">
                    <div class="sq_nav_1 nav0">
                        <span class="sq_nav_park"></span>
                        <span class="sq_nav_left">Home page</span>
                    </div>
                    <div class="sq_nav_1 nav1">
                        <span class="sq_nav_park"></span>
                        <span class="sq_nav_left">What we do</span>
                    </div>
                    <div class="sq_nav_1 nav2">
                        <span class="sq_nav_park"></span>
                        <span class="sq_nav_left">Our work</span>
                    </div>
                    <div class="sq_nav_1 nav3">
                        <span class="sq_nav_park"></span>
                        <span class="sq_nav_left">About us</span>
                    </div>
                    <div class="sq_nav_1 nav4">
                        <span class="sq_nav_park"></span>
                        <span class="sq_nav_left">Contact us</span>
                    </div>
                    <div class="sq_nav_1 nav5">
                        <span class="sq_nav_park"></span>
                        <span class="sq_nav_left">Information</span>
                    </div>
                    <div class="sq_nav_1 nav6">
                        <span class="sq_nav_park"></span>
                        <span class="sq_nav_left">TEL:400-868-288</span>
                    </div>
                </div>
            </div>
            QQ-电话
            <div class="sq_concat">
                <div class="sq_concat_back">
                    <div class="sq_phone"><img src="images/index/phone.png" alt="联系电话"></div>
                    <div class="sq_qq"><img src="images/index/qq.png" alt="联系QQ"></div>
                    <div class="sq_weixin"><img src="images/index/weixin.png" alt="微信"></div>
                </div>
            </div> -->
            
            <div class="sq_center sq_position"><img src="<%=basePath%>Images/Products/index/er.png"></div>
            <div class="sq_center_1 sq_position"><img src="<%=basePath%>Images/Products/index/zuiwai.png"></div>
            <div class="sq_center_2"><img src="<%=basePath%>Images/Products/images/index/nei.png"></div>

            <!--从这里开始-->
            <div class="sq_start">从这里开始</div>
            <div class="sq_mouse">
                <img src="<%=basePath%>Images/Products/index/shubiao.png">
                <div class="sq_m_small"></div>
            </div>
           <div class="bg">
               <img src="<%=basePath%>Images/Products/index/FirstScreen.jpg" alt="第一屏">
           </div>
        </div>

        <div class="section">
           <!--<div class="bg" style="z-index:3"><img src="images/index/2zhezhao.png"></div>-->
           <div class="sq_tow_screen">
               <p>我们以客户品牌宣传为导向专注于品牌创意设计，分析互联网发展趋势，结合企业品牌的行业特性，为您提供更精准的策划方案和视觉策划方案</p>
           </div>
            <div class="sq_tow_msg" style="z-index: 6">
                <ul>
                    <li class="sq_li1">
                        <div class="sq_img">
                            <img src="<%=basePath%>Images/Products/index/book.png" alt="视觉设计">
                            <p class="sq_img_s1">品牌视觉设计</p>
                            <p>Brand visual design</p>
                        </div>
                    </li>
                    <li class="sq_li2">
                        <div class="sq_img">
                            <img src="<%=basePath%>Images/Products/index/pc.png" alt="网站建设">
                            <p class="sq_img_s1">品牌网站建设</p>
                            <p>Brand website construction</p>
                        </div>
                    </li>
                    <li class="sq_li3">
                        <div class="sq_img">
                            <img src="<%=basePath%>Images/Products/index/ipod.png" alt="商务设计">
                            <p class="sq_img_s1">电子商务设计</p>
                            <p>Electronic commerce design</p>
                        </div>
                    </li>
                    <li class="sq_li4">
                        <div class="sq_img">
                            <img src="<%=basePath%>Images/Products/index/Aphone.png" alt="移动应用设计">
                            <p class="sq_img_s1">移动应用设计</p>
                            <p>Mobile application design</p>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="sq_zw"><img src="<%=basePath%>Images/Products/index/zhewen.png"></div>
            <div class="bg">
                <img src="<%=basePath%>Images/Products/index/FirstScreen2.jpg" alt="第二屏">
            </div>
        </div>
        <div class="section">
            <!--<div class="bg" style="z-index:3"><img src="images/index/2zhehzoa.jpg.png"></div>-->
            <div class="sq_three">
                WORK
                <div class="sq_three_s1">
                    <span class="sq_three_s1_span"></span>
                    <span class="sq_three_s1_span1"></span>
                </div>
            </div>

            <div class="sq_three_s2" style="z-index: 6">
                <ul>
                    <li>
                        <div class="sq_three_img">
                            <div class="sq_three_re" style="position: relative;">
                                <img src="<%=basePath%>Images/Products/index/an1.jpg" alt="美宅装饰">
                                <div class="sq_z_back"></div>
                                <span class="sq_z_left"><img src="<%=basePath%>Images/Products/index/zoom_1.png"></span>
                                <span class="sq_z_right"><img src="<%=basePath%>Images/Products/index/zoom_2.png"></span>
                            </div>
                            <div class="sq_three_top">
                                <span>Meizhai Decorc</span>
                                <span style="font-size: 18px;">美宅装饰</span>
                            </div>
                            <div class="sq_three_top" style="color:#787878">2015.05.18</div>
                            <div class="sq_three_top sq_solid" style="width:270px;background: #959595;height: 2px;"></div>
                        </div>
                    </li>
                    <li>
                        <div class="sq_three_img">
                            <div class="sq_three_re" style="position: relative;">
                                <img src="<%=basePath%>Images/Products/index/an2.jpg" alt="化羽国际">
                                <div class="sq_z_back"></div>
                                <span class="sq_z_left"><img src="<%=basePath%>Images/Products/index/zoom_1.png"></span>
                                <span class="sq_z_right"><img src="<%=basePath%>Images/Products/index/zoom_2.png"></span>
                            </div>

                            <div class="sq_three_top">
                                <span>International plume</span>
                                <span style="font-size: 18px;">化羽国际</span>
                            </div>
                            <div class="sq_three_top" style="color:#787878">2015.05.18</div>
                            <div class="sq_three_top sq_solid" style="width:270px;background: #959595;height: 2px;"></div>
                        </div>
                    </li>

                    <li>
                        <div class="sq_three_img">
                            <div class="sq_three_re" style="position: relative;">
                                <img src="<%=basePath%>Images/Products/index/an3.jpg" alt="丰园餐饮">
                                <div class="sq_z_back"></div>
                                <span class="sq_z_left"><img src="<%=basePath%>Images/Products/index/zoom_1.png"></span>
                                <span class="sq_z_right"><img src="<%=basePath%>Images/Products/index/zoom_2.png"></span>
                            </div>

                            <div class="sq_three_top">
                                <span>Feng Garden Restaurant</span>
                                <span style="font-size: 18px;">丰园餐饮</span>
                            </div>
                            <div class="sq_three_top" style="color:#787878">2015.05.18</div>
                            <div class="sq_three_top sq_solid" style="width:270px;background: #959595;height: 2px;"></div>
                        </div>
                    </li>

                    <li>
                        <div class="sq_three_img">
                            <div class="sq_three_re" style="position: relative;">
                                <img src="<%=basePath%>Images/Products/index/an4.jpg" alt="西部传媒">
                                <div class="sq_z_back"></div>
                                <span class="sq_z_left"><img src="<%=basePath%>Images/Products/index/zoom_1.png"></span>
                                <span class="sq_z_right"><img src="<%=basePath%>Images/Products/index/zoom_2.png"></span>
                            </div>

                            <div class="sq_three_top">
                                <span>Western media</span>
                                <span style="font-size: 18px;">西部传媒</span>
                            </div>
                            <div class="sq_three_top" style="color:#787878">2015.05.18</div>
                            <div class="sq_three_top sq_solid" style="width:270px;background: #959595;height: 2px;"></div>
                        </div>
                    </li>

                </ul>
            </div>
            <div class="sq_three_s3">
                <div class="sq_three_all">ALL</div>
            </div>
            <div class="bg">
                <img src="<%=basePath%>Images/Products/index/FirstScreen3.jpg" alt="第三屏">
            </div>
        </div>
        <div class="section">
            <div class="bg" style="z-index:3"><img src="<%=basePath%>Images/Products/index/2zhehzoa.jpg"></div>
            <div class="sq_four">
                <img src="<%=basePath%>Images/Products/index/ready.png">
            </div>
            <div class="sq_four_all">We are ready,you?</div>
            <div class="sq_four2"><img src="<%=basePath%>Images/Products/index/go.png"></div>
            <div class="bg">
                <img src="<%=basePath%>Images/Products/index/FirstScreen4.jpg" alt="第四屏">
            </div>
        </div>
    </div>

    <script src="<%=basePath%>Plugins/jquery/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>Plugins/jquery/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>Plugins/jquery/jquery.fullPage.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>Plugins/jquery/style.js"></script>
    <script type="text/javascript">
        $(function(){
            $('#fullpage').fullpage({
                'verticalCentered': false,
                anchors: ['page1', 'page2', 'page3', 'page4'],
                'navigation': true,                //是否显示导航栏
                'navigationPosition': 'left'  //导航栏的位置
            });


            var back=$(".sq_concat_back").find("div");
            var img=["../Images/Products/index/phone_1.png","images/index/qq_1.png","../Images/Products/index/weixin_1.png"];
            var imgs=["../Images/Products/index/phone.png","../Images/Products/index/qq.png","images/index/weixin.png"];
            back.hover(function(){
                $(this).children("img").attr("src",img[back.index(this)]);
            },function(){
                $(this).children("img").attr("src",imgs[back.index(this)]);
            });

            var sq_img=$(".sq_three_s2 ul").find("li");
            sq_img.hover(function(){
                $(this).children("div").children(".sq_three_re").children(".sq_z_back").css({ "opacity":"0.7"});
                $(this).children("div").children(".sq_solid").css("background","#3CAF5A");
                $(this).children("div").children(".sq_three_re").children(".sq_z_left").animate({
                    "opacity":"1",
                    "left":"38%"
                },500);
                $(this).children("div").children(".sq_three_re").children(".sq_z_right").animate({
                    "opacity":"1",
                    "right":"45%"
                },500);
            },function(){
                $(this).children("div").children(".sq_three_re").children(".sq_z_back").css("opacity","0");
                $(this).children("div").children(".sq_solid").css("background","#959595");
                $(this).children("div").children(".sq_three_re").children(".sq_z_left").animate({
                    "opacity":"0",
                    "left":"0"
                },500);
                $(this).children("div").children(".sq_three_re").children(".sq_z_right").animate({
                    "opacity":"0",
                    "right":"0"
                },500);
            });
        });
    </script>
</body>
</html>
