<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="demo.mList" %>
<%@page import="demo.uList" %>
<%@page import="demo.GList" %>
<%@page import="demo.*" %>
<%@page import="DB.*" %>
<%@page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>供应商管理</title>
<link rel="stylesheet" href="style/style.fonts.css" />
<link rel="stylesheet" href="style/style.nav.css" />
<link rel="stylesheet" href="style/font-awesome/css/font-awesome.css" />
<link rel="stylesheet" href="style/style.animate.css" />

<link rel="stylesheet" href="style/style.charge.css" />
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
		<h2 style="text-align:center">供应商列表</h2>
		<div class="table_page" >
		
			<table cellspacing="0" id="pageTable">
			<% 
			
			int len = SupplyListData.listLen();
			int page_len = len/5;
			int judge = len % 5;
			if(judge > 0){
				page_len++;
			}
			ArrayList<SList> supply_list = SupplyListData.showSListData(1);
			%>
				<tr class="tr_title">
					<td>供应商编号</td>
					<td>供应商名称</td>
					
					<td class="dataChange"><div id="new" onclick="showInsert()"><a href="#insert"><li class="fa fa-plus-square"></li>添加</a></div></td>
				</tr>
				<%
					for(int i=0;i<supply_list.size();i++) {
						
				%>
				<%
					String para1 = supply_list.get(i).getSupply_id();
					String para2 = supply_list.get(i).getSupply_name();
				%>
				<tr class="tr_data">
					<td><%=supply_list.get(i).getSupply_id()%></td>
					<td><%=supply_list.get(i).getSupply_name() %></td>
					
					<td><a href="s_delete?del=<%=supply_list.get(i).getSupply_name()%>" class="del"><li class="fa fa-trash"></li>删除</a> <a href="#update" onclick="showUpdate(<%=supply_list.get(i).getId()%>)" class="change" onmousedown="getUpdate('<%=para1 %>','<%=para2%>')"><li class="fa fa-refresh"></li>修改</a></td>
				</tr>
				<%	
				}
				%>
			</table>
			
			<div id="insert">
				<h3 style="text-align:center">添加供应商</h3>
				<form action="s_insert" method="post">
					<input type="text" placeholder="输入供应商编号" name="get_new_sId"/>
					<input type="text" placeholder="输入供应商名称" name="get_new_sName"/>
					
					
					
					
					
					<input type="submit" class="btn" value="增加"/>
				</form>
			</div>
			<div id="update">
				<h3 style="text-align:center">修改供应商信息</h3>
				<form action="s_update" method="post">
					<input type="text" placeholder="修改供应商编号" name="get_new_sId" id="sId"/>
					<input type="text" placeholder="修改供应商名称" name="get_new_sName" id="sName"/>
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
	<script  src="script/javascript.animate.js"></script>
	<script type="text/javascript" src="script/javascript.logic.js"></script>
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
			url:"s_data",
			dataType:"json",
			contentType:"application/json;charset=utf-9",
			data:pageJson,
			success:function(data){
				//alert(data.length);
				var list = "";
				var list_title = "<tr class=\"tr_title\"><td>供应商编号</td><td>供应商名称</td><td class=\"dataChange\"><div id=\"new\" onclick=\"showInsert()\"><a href=\"#insert\"><li class=\"fa fa-plus-square\"></li>添加</a></div></td>";
				
				list += list_title;
				if(data){
					for(var j = 0;j<data.length;j++){
						
						var list_content = "<tr class=\"tr_data\"><td>"+data[j].supply_id+"</td><td>"+data[j].supply_name+"</td><td><a href=\"s_delete?del="+data[j].supply_name+"\" class=\"del\"><li class=\"fa fa-trash\"></li>删除</a> <a href=\"#update\" onclick=\"showUpdate("+data[j].id+")\" class=\"change\"><li class=\"fa fa-refresh\"></li>修改</a></td></tr>";
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
	var getUpdate = function(para1,para2){
		$("#sId").val(para1);
		$("#sName").val(para2);
		console.log(para1,para2);
	}
	</script>
</body>
</html>