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
<title>用户管理</title>
<link rel="stylesheet" href="style/style.fonts.css" />
<link rel="stylesheet" href="style/style.nav.css" />
<link rel="stylesheet" href="style/style.charge.css" />
<link rel="stylesheet" href="style/font-awesome/css/font-awesome.css" />
<link rel="stylesheet" href="style/style.animate.css" />
<link  rel="stylesheet" href="style/searchPage.css" />
<style>
	
	
</style>

</head>
<body>
<jsp:include page="ifLogin.jsp"></jsp:include>
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
	<div id="list" class="animated slideInUp">
		<h2 style="text-align:center">用户列表</h2>
		<div class="table_page" >
		
			<table cellspacing="0" id="pageTable">
			<% 
			
			int  len = uListData.listLen();
			
			//int t= len / 3;
			//int pageCount = (t==0)?1:(t+1);
			int page_len = len/5;
			int judge = len % 5;
			if(judge > 0){
				page_len++;
			}
			ArrayList<uList> user_list = uListData.showUListData(1);
			%>
				<tr class="tr_title">
					<td>用户编号</td>
					<td>用户名称</td>
					<td>用户性别</td>
					<td>联系方式</td>
					<td class="dataChange"><div id="new" onclick="showInsert()"><a href="#insert"><li class="fa fa-plus-square"></li>添加</a></div></td>
				</tr>
				<%
					for(int i=0;i<user_list.size();i++) {
						
				%>
				<%
				String para1 = user_list.get(i).getUid();
				String para2 = user_list.get(i).getName();
				String para3 = user_list.get(i).getSex();
				String para4 = user_list.get(i).getPhone();
				%>
				<tr class="tr_data">
					<td><%=user_list.get(i).getUid() %></td>
					<td><%=user_list.get(i).getName() %></td>
					<td><%=user_list.get(i).getSex() %></td>
					<td><%=user_list.get(i).getPhone() %></td>
					<td><a href="u_delete?del=<%=user_list.get(i).getName() %>" class="del"><li class="fa fa-trash"></li>删除</a> 
					<a href="#update" onclick="showUpdate(<%=user_list.get(i).getId()%>)" class="change" onmousedown="getUpdate('<%=para1 %>','<%=para2 %>','<%=para3 %>','<%=para4 %>')"><li class="fa fa-refresh"></li>修改</a></td>
				</tr>
				<%	
				}
				%>
			</table>
			
			<div id="insert">
				<h3 style="text-align:center">添加用户</h3>
				<form action="u_insert" method="post">
					<input type="text" placeholder="输入用户编号" name="get_new_uId"/>
					<input type="text" placeholder="输入用户名称" name="get_new_uName"/>
					<input type="text" placeholder="输入用户性别" name="get_new_uSex"/>
					<input type="text" placeholder="输入联系方式" name="get_new_uPhone"/>
					
					
					
					
					<input type="submit" class="btn" value="增加"/>
					<div class="exitInsert">
						<span class="exitBtn">退出</span>
					</div>
				</form>
			</div>
			<div id="update">
				<h3 style="text-align:center">修改用户信息</h3>
				<form action="u_update" method="post">
					<input type="text" placeholder="修改用户编号" name="get_new_uId" id="p1"/>
					<input type="text" placeholder="修改用户名称" name="get_new_uName" id="p2"/>
					<input type="text" placeholder="修改用户性别" name="get_new_uSex" id="p3"/>
					<input type="text" placeholder="修改联系方式" name="get_new_uPhone" id="p4"/>
					<input type="hidden" name="m_id" id="getId" value=""/>
					<input type="submit" class="btn" value="修改"/>
				</form>
			</div>
			
		</div>
	</div>
	<ol class="page">
			<% 
			if(true){
				String prev = "<li><a  rel = \"prev\">Prev</a></li>";
				String next = "<li><a  rel = \"next\">Next</a></li>";
				
				
				%>
				
				
				<% for(int j=0;j<page_len;j++){
					
					
					
					%>
					<li><a ><%=j+1 %></a></li>
				<%
				}%>
				
				
			<% }
			%>
			
			</ol>
	
	<script src="script/jQuery.min.js"></script>
	<script type="text/javascript" src="script/javascript.logic.js"></script>
	<script  src="script/javascript.animate.js"></script>
	<script>
	var pageNum = "";
	var ol = document.getElementsByClassName("page")[0];
	var getPage = function(){
		
		var a = ol.getElementsByTagName("a");
		
		for(var i = 0;i < a.length;i++){
			
			a[i].onmouseover = function() {
				pageNum = this.innerHTML;
				//a[i].style.color = "#fff";
				//a[i].style.background = "rgb(88,88,88)";
				//pageJson.pageJson = pageNum;
				//alert(pageNum+"aaaa");
				//alert(pageNum);
				console.log(i);
				//pageJson.pageJson = pageNum;
				//console.log(pageJson);
				
				
			}
	}
		var pageJson = { page : pageNum};
		console.log("我是AJAX",pageJson);
		$.ajax({
			type:"get",
			url:"u_data",
			dataType:"json",
			contentType:"application/json;charset=utf-9",
			data:pageJson,
			success:function(data){
				//alert(data.length);
				var list = "";
				var list_title = "<tr class=\"tr_title\"><td>用户编号</td><td>用户名称</td><td>用户性别</td><td>联系方式</td><td class=\"dataChange\"><div id=\"new\" onclick=\"showInsert()\"><a href=\"#insert\"><li class=\"fa fa-plus-square\"></li>添加</a></div></td></tr>";
				list += list_title;
				if(data){
					for(var j = 0;j<data.length;j++){
						
						var list_content = "<tr class=\"tr_data\"><td>"+data[j].uid+"</td><td>"+data[j].name+"</td><td>"+data[j].sex+"</td><td>"+data[j].phone+"</td><td>"+"<a href=\"u_delete?del="+data[j].name+"\" class=\"del\"><li class=\"fa fa-trash\"></li>删除</a> <a href=\"#update\" onclick=\"showUpdate("+data[j].id+")\" class=\"change\"><li class=\"fa fa-refresh\"></li>修改</a></td></tr>";
						list += list_content;
					}
					document.getElementById("pageTable").innerHTML = list;
				}
				
				
			},
			error:function(){
				//alert("链接失败");
			}
		});		
	}
	
	
	
	//console.log(pageJson.pageJson);
	
	getPage();
	ol.onmouseover = function() {
		getPage();
		
	}
	var getUpdate = function(para1,para2,para3,para4) {
		$("#p1").val(para1);
		$("#p2").val(para2);
		$("#p3").val(para3);
		$("#p4").val(para4);
	}
	
	</script>
</body>
</html>