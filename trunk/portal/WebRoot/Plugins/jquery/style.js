/**
 * Created by xfr011 on 2015/7/29.
 */
$(function(){
    var ble=true;
    var menuTime=["50","100","150","200","250","300","350"];
    var menuTimes=["10","20","30","40","50","60","70"];
    $(".sq_menu").on("click",function(){
        var navLength=$(".sq_meun_nav .sq_nav_1").length;
        if(ble){
            $(".sq_meun_back").animate({"left":"0"},500);
            for(var i=0;i<navLength;i++){
                $(".nav"+i).delay(menuTime[i]).animate({"marginLeft":"0"},"slow");
            }
            ble=false;
        }else{
            $(".sq_meun_back").delay(100).animate({"left":"-50%"},500);
            for(var ii=0;ii<navLength;ii++){
                $(".nav"+ii).delay(menuTimes[ii]).animate({marginLeft:"-155%"},100);
            }
            ble=true;
        }
    });

    var nav=$(".sq_meun_nav").find(".sq_nav_1");
    nav.hover(function() {
        $(this).children(".sq_nav_park").css("opacity","1");
    },function(){
        $(this).children(".sq_nav_park").css("opacity","0");
    });
});