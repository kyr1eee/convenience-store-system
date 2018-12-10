<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="demo.mList" %>
<%@page import="demo.uList" %>
<%@page import="DB.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />  
<title>地图导航</title>
<link rel="stylesheet" href="style/style.fonts.css" />
<link rel="stylesheet" href="style/style.nav.css" />
<link rel="stylesheet" href="style/font-awesome/css/font-awesome.css" />
<link rel="stylesheet" href="style/style.animate.css" />
<script type="text/javascript" src="http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=mr5DYlRg2yZGvSU8ScQI2RZWt5RYFlcs"></script>

<style type="text/css">
html{height:100%}  
 body{height:100%;margin:0px;padding:0px}
	#myMap {
		width : 100%;
		height : 500px;
		position:fixed;
		top:68px;
		bottom:40px;
		left:0;
		right:0;
	}
	.search {
		position : fixed;
		top:567px;
		bottom : 4px;
		background : transparent;
		border : 1px solid #fff;
		border-radius:3%;
		display : block;
		width:33%;
	}
	#car {
		left:0;
	}
	#walk {
		right:0;
	}
	#bus {
		left : 33.5%;
	}
	.btn {
		
		display: block;
    	width: 300px;
    	height: 30px;
    	margin: 15px auto;
    	border: 2px solid #45252500;
	}
	.search p {
	    font-size: 4em;
	    line-height: 100px;
	    padding-top: 30px;
	    margin: 0;
	    text-align: center;
	    font-weight: 999;
	    color: #fff;
	    transition : all 0.6s;
	    cursor : pointer;
	}
	.search p:hover {
		transform : scale(1.1);
		color : #dcdcdc;
	
	}
	#carHide,#busHide,#walkHide{
		margin : 0 auto;
		display:none;
		
	}
	#carBtn,#busBtn,#walkBtn {
		background : transparent;
		background: transparent;
	    color: #fffdfd;
	    font-weight: 700;
	    font-size: 1.3em;
	    line-height: 20px;
	    transition : all 0.5s;
	}
	#carBtn:hover,#busBtn:hover,#walkBtn:hover {
		transform : scale(1.2);
		color : #dcdcdc;
	}
	#car-results,#bus-results,#walk-results {
		position: fixed;
	    top: 68px;
	    height: 500px;
	    overflow: scroll;
	    left: 0;
	    width: 500px;
	    display:none;
	}
</style>

</head>
<body>
<jsp:include page="ifLogin.jsp"></jsp:include>
	<audio src="audio/MANISH - 煌めく瞬間に捕われて.mp3" autoplay = "autoplay" loop="true"></audio>
	<div class="bg"></div>
	<div class="nav-bar-bottom"></div>
	<div class="nav-bar-top">
		<div class="nav_right">
			<p class="date"></p>
			<p class="who"><%=request.getSession().getAttribute("user") %></p>
		</div>
		<div class="nav_left">
			<img src="img/doglogo.jpg" id="logo"/>
			<h1>TDOG</h1>
		</div>
		<div id = "nav_func">	
			<ul id="myNav">
				<li>成员</li>
				<li>商品</li>
				<li>地图</li>
				<li>系统</li>
			</ul>
			<div id = "nav_down">
				<ul id="member_nav">
					<li><a href="store_charge.jsp">门店管理</a></li>
					<li><a href="member_charge.jsp">用户管理</a></li>
					<li><a href="vip_charge.jsp">会员管理</a></li>
					
				</ul>
				<ul id="goods_nav">
					<li><a href="goods_charge.jsp">商品管理</a></li>
					<li><a href="supply_charge.jsp">供应商管理</a></li>
					
				</ul>
				<ul id="sale_nav">
					<li><a href="map.jsp">地图导航</a></li>
					
				</ul>
				<ul id="system_nav">
					<li><a href="login.jsp">退出登录</a></li>
				</ul>
				
			</div>
		</div>
	</div>
	<div id="myMap"></div>
	<div id="car" class="search">
		<p id="carType">驾车</p>
		<div id="carHide">
			<input type = "text" placeholder="请输入起始点" id="carStart" class="btn"/>
			<input type = "text" placeholder="请输入终点" id="carEnd" class="btn"/>
			<input type="submit" value="确认" id="carBtn" class="btn"/>
		</div>
		<div id="car-results">
		
		</div>
	</div>
	<div id="bus" class="search">
		<p id="busType">公交/地铁</p>
		<div id="busHide">
			<input type = "text" placeholder="请输入起始点" id="busStart" class="btn"/>
			<input type = "text" placeholder="请输入终点" id="busEnd" class="btn"/>
			<input type="submit" value="确认" id="busBtn" class="btn"/>
		</div>
		<div id="bus-results">
		
		</div>
	</div>
	<div id="walk" class="search">
		<p id="walkType">步行</p>
		<div id="walkHide">
			<input type = "text" placeholder="请输入起始点" id="walkStart" class="btn"/>
			<input type = "text" placeholder="请输入终点" id="walkEnd" class="btn"/>
			<input type="submit" value="确认" id="walkBtn" class="btn"/>
		</div>
		<div id="walk-results">
		
		</div>
	</div>
	
	<script src="script/jQuery.min.js"></script>
	<script  src="script/javascript.animate.js"></script>
	

<script type="text/javascript">
	//点击事件
	$("#carBtn").click(function() {
		var start = $("#carStart").val();
		var end = $("#carEnd").val();
		driving.search(start,end);
		setTimeout(function(){
			$("#car-results").css("display","block");
			$("#car-results").addClass("slideInRight");
		},1000);
		
		});
	$("#busBtn").click(function() {
		var start = $("#busStart").val();
		var end = $("#busEnd").val();
		transit.search(start,end);
		setTimeout(function(){
			$("#bus-results").css("display","block");
			$("#bus-results").addClass("slideInRight");
		},1000);
		
		});
	$("#walkBtn").click(function() {
		var start = $("#walkStart").val();
		var end = $("#walkEnd").val();
		walk.search(start,end);
		setTimeout(function(){
			$("#walk-results").css("display","block");
			$("#bus-results").addClass("slideInRight");
		},1000);
		
	});
	$("#carType").click(function(){
		$("#carType").css("display","none");
		$("#carHide").css("display","block");
		$("#carHide").addClass("animated slideInUp");
	});
	$("#busType").click(function(){
		$("#busType").css("display","none");
		$("#busHide").css("display","block");
		$("#busHide").addClass("animated slideInUp");
	});
	$("#walkType").click(function(){
		$("#walkType").css("display","none");
		$("#walkHide").css("display","block");
		$("#walkHide").addClass("animated slideInUp");
	});
	// 百度地图API功能
	var map = new BMap.Map("myMap");
	var mapStyle={  style : "midnight" }  ;
	var point = new BMap.Point(116.331398,39.897445);
	map.setMapStyle(mapStyle);
	var opts = {offset: new BMap.Size(1340, 160)};
	map.addControl(new BMap.NavigationControl(opts)); 
	map.addControl(new BMap.CopyrightControl()); 
	map.addControl(new BMap.MapTypeControl()); 
	map.setCurrentCity("广州");
	map.centerAndZoom(new BMap.Point(116.404, 39.915), 12);
	//全景控件
	
	var stCtrl = new BMap.PanoramaControl();  
	stCtrl.setOffset(new BMap.Size(40, 150));  
	map.addControl(stCtrl);
	//驾车控件
	var driving = new BMap.DrivingRoute(map, {    
    renderOptions: {    
        map: map,
        panel : "car-results",
        autoViewport: true    
    }    
	}); 
	//driving.search("中关村", "天安门");
	//步行控件
	 var walk = new BMap.WalkingRoute(map, {    
        renderOptions: {map: map, panel: "walk-results"}    
    }); 
	//公交控件
	var transit = new BMap.TransitRoute(map, {    
    renderOptions: {map: map, panel: "bus-results"}    
	});
	//浏览器定位
	
	
	map.centerAndZoom(point,12);
	
	var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			var mk = new BMap.Marker(r.point);
			map.addOverlay(mk);
			map.panTo(r.point);
			//alert('您的位置：'+r.point.lng+','+r.point.lat);
		}
		else {
			//alert('failed'+this.getStatus());
		}        
	});
	//点聚合
	var MAX = 10;
	var markers = [];
	var pt = null;
	var i = 0;
	for (var i = 0; i < MAX; i++) {
	    pt = new BMap.Point(Math.random() * 40 + 85, Math.random() * 30 + 21);
	    markers.push(new BMap.Marker(pt));
	}
	//最简单的用法，生成一个marker数组，然后调用markerClusterer类即可。
	var markerClusterer = new BMapLib.MarkerClusterer(map, {markers:markers});
	
	//transit.search("广州南", "广州东");
</script>
</body>
</html>