


var showNavDown = function() {
    var nav_down = document.getElementById("nav_down");
    nav_down.style["visibility"] = "visible";
    nav_down.style["transition"] = "all 0.8s";
    nav_down.style["transform"] = "translateY(42%)";

}
var hideNavDown = function() {
    var nav_down = document.getElementById("nav_down");
    nav_down.style["transition"] = "";
    nav_down.style["transform"] = "translateY(0%)";
    nav_down.style["visibility"] = "hidden";


}

var myNav = document.getElementById("myNav");

var getTime = function() {
    var date = new Date();
    var day = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
    var str=""
    if(date.getSeconds() < 10) {
        str = "<a href=\"index.jsp\"><li class=\"fa fa-home\" style=\"color:#fff\"></li></a>"+" "+day[date.getDay()]+"  "+date.getHours()+":"+date.getMinutes()+":0"+date.getSeconds();
    }
    else {
        str = "<a href=\"index.jsp\"><li class=\"fa fa-home\" style=\"color:#fff\"></li></a>"+" "+day[date.getDay()]+"  "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
    }

    var dateClass = document.getElementsByClassName("date")[0];
    dateClass.innerHTML = str;
}
setInterval(getTime,1000);

$(document).ready(function() {
	//背景动画
    var index = 0;
    var imgArr = ["ka.jpg","lu.jpg","horse.jpg","bao.jpg","tiger.png","cat.jpg","dog.jpg"];
    var changeImg = function(){

        //var index = Math.floor(Math.random()*imgArr.length);
        //var body = document.getElementsByTagName("body")[0];
        var bg = document.getElementsByClassName("bg")[0];
        bg.style["background-image"] = "url('./img/"+imgArr[index]+"')";
        $(".bg").addClass("animated pulse");
        setTimeout(clearAnimate,2000);
        //console.log("This is index:"+index);
        //console.log("This is img name : " +imgArr[index] );
        if(index < imgArr.length - 1){
            index++;
        }
        else {
            index=0;
        }


    }
    var clearAnimate = function () {
        $(".bg").removeClass("animated pulse");

        //console.log("This is removed");
    }

    setInterval(changeImg,4333);
    
    //下拉动画
    $("#myNav").on("mouseover" , function () {
    	//$("#nav_down").removeClass("animated slideOutDown");
    	//$("#nav_down").addClass("animated pulse");
    	showNavDown();
    });
        

    
    $(".nav-bar-top").on("mouseleave", function() {
    	//$("#nav_down").removeClass("animated slideInDown");
    	//$("#nav_down").addClass("animated slideOutDown");
        hideNavDown();
        console.log("ok");
        
    });


});


