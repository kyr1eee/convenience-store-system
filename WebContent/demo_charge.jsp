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
<title>Zzzzzzzzzzz</title>
<link rel="stylesheet" href="style/style.nav.css" />
<link rel="stylesheet" href="style/style.charge.css" />
<link rel="stylesheet" href="style/font-awesome.css" />
<style>
	
	#list {
		opacity : 0.9;
		transition : all 0.6s;
	}
	#list h2{
		font-size:2em;
		font-style : italic;
        color : #50ced4;
        letter-spacing : 3px;
        margin-top : 70px;
	}
	.del {
		margin: 0px 0px;
	    background: #de5b34;
	    width: 58px;
	    height: 20px;
	    text-align: center;
	    font-weight: 600;
	    letter-spacing: 3px;
	    border: 1px solid #000;
	    padding-left: 3px;
	    cursor: pointer;
	}
	.change {
		margin: 0px 0px;
	    background: #81d540;
	    width: 58px;
	    height: 20px;
	    text-align: center;
	    font-weight: 600;
	    letter-spacing: 3px;
	    border: 1px solid #000;
	    padding-left: 3px;
	    cursor: pointer;
	}
	
	.table_page {
		width: 563px;
    	margin: 30px auto;
	}
	.table_page table {
		width :100%;
		text-align: center;
		border:none;
		
	}
	.tr_data{
		background-color:#fff;
		
	}
	td {
		width: 150px;
		height : 40px;
    	border: 1px solid #479dbe;
    	overflow: visible;
	}
	a {
		text-decoration: none;
	}
	.tr_title {
		background-color : #23d7e0;
		height: 60px;
    	font-weight: 600;
	}
	#update ,#getId,#insert{
		display : none;
	}
	#update,#insert {
		width : 100%;
		letter-spacing : 3px;
		margin-top : 60px;
	}
	#update h3,#insert h3{
		color :#fff;
		font-weight : 600;
		font-style : italic;
	}
	#update input,#insert input {
		display : block;
		width : 100%;
		height : 30px;
        border : 2px solid #7c8586;
        border-radius : 2%;
        font-size : 1em;
        margin-top : 15px;
	}
	.btn {
		height: 30px;
        font-size: 1em;
        color: #fff;
        font-weight: bold;
        border: 4px solid rgb(49, 71, 89);
        background-color :rgb(21, 40, 56);
        cursor : pointer;
	}
	#new {
		margin: 0px 0px;
	    background: #d7da33;
	    width: 107px;
	    height: 38px;
	    display: block;
	    text-align: center;
	    font-weight: 600;
	    letter-spacing: 3px;
	    border: 1px solid #000;
	    padding-top: 10px;
	    cursor: pointer;
		float : right;
	}
	
</style>

</head>
<body>

	<div class="nav-bar-top">
		<div class="nav_left">
			<h1>天狗管理系统</h1>
		</div>
		<div id = "nav_func">	
			<ul id="myNav">
				<li>成员</li>
				<li>商品</li>
				<li>销售</li>
				<li>系统</li>
			</ul>
			<div id = "nav_down">
				<ul id="member_nav">
					<li>门店管理</li>
					<li>用户管理</li>
					<li>会员管理</li>
					
				</ul>
				<ul id="goods_nav">
					<li>商品管理</li>
					<li>供应商管理</li>
					<li>采购管理</li>
					<li>入库管理</li>
				</ul>
				<ul id="sale_nav">
					<li>销售报表</li>
					<li>销售策略</li>
				</ul>
				<ul id="system_nav">
					<li>系统管理</li>
				</ul>
				
			</div>
		</div>
	</div>
	
	<!-- 门店管理模块 -->
	<div id="list">
		<h2 style="text-align:center">门店列表</h2>
		<div class="table_page">
		<% 
			
			ArrayList<mList> l = mListData.showMListData();
		%>
			<table cellspacing="0">
				<tr class="tr_title">
					<td>门店编号</td>
					<td>门店名称</td>
					<td>门店地址</td>
					<td>联系方式</td>
					<td class="dataChange">操作</td>
				</tr>
				<%
					for(int i=0;i<l.size();i++) {
						
				%>
				<tr class="tr_data">
					<td><%=l.get(i).getM_id() %></td>
					<td><%=l.get(i).getM_name() %></td>
					<td><%=l.get(i).getM_address() %></td>
					<td><%=l.get(i).getM_phone() %></td>
					<td><a href="m_delete?del=<%=l.get(i).getM_name() %>" class="del">删除</a> <a href="#update" onclick="showUpdate(<%=l.get(i).getM_id()%>)" class="change">修改</a></td>
				</tr>
				<%	
				}
				%>
			</table>
			<div id="new" onclick="showInsert()"><a href="#insert">增加门店</a></div>
			<div id="insert">
				<h3 style="text-align:center">增加加盟店</h3>
				<form action="m_insert" method="post">
					<input type="text" placeholder="输入门店名称" name="get_new_mName"/>
					<input type="text" placeholder="输入门店地址" name="get_new_mAddress"/>
					<input type="text" placeholder="输入门店号码" name="get_new_mPhone"/>
					<input type="text" name="m_id" id="getIad" value=""/>
					
					
					
					<input type="submit" class="btn" value="增加"/>
				</form>
			</div>
			<div id="update">
				<h3 style="text-align:center">修改门店信息</h3>
				<form action="m_update" method="post">
					<input type="text" placeholder="修改门店名称" name="get_new_mName"/>
					<input type="text" placeholder="修改门店地址" name="get_new_mAddress"/>
					<input type="text" placeholder="修改门店号码" name="get_new_mPhone"/>
					<input type="text" name="m_id" id="getId" value=""/>
					<input type="submit" class="btn" value="修改"/>
				</form>
			</div>
			
		</div>
	</div>
	
	
	
	
	<script  src="script/javascript.animate.js"></script>
	<script src="script/javascript.logic.js"></script>
	<script>
	//模块显示
	var ifMode = false; //判断当前是否有模块显示
	var showMList = function() {
		if(ifMode == false) {
			var mList = document.getElementById("m_list");
			mList.style["display"] = "block";
			ifMode = true;
		}
	}
	var showUList = function() {
			var uList = document.getElementById("user_list");
			uList.style["display"] = "block";
	}
	//门店管理
	
	var test = function () {
		var m_id = document.getElementById("getId");
		m_id.innerHTML = "testttttttttttttt";
	}
	//end
	

	
	</script>
</body>
</html>