<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
	html {
		margin:0;
		padding:0;
    	background : url(./banner.jpg);
    	background-attachment : fixed;
    	background-repeat : no-repeat;
    	background-size : cover;
    	background-position: center center;
    	}
    .register_page {
    	width : 600px;
    	height : 435px;
    	margin : 140px auto;	
    	letter-spacing : 1px;
    	opacity: 0.9;
    	border-radius: 2%;
    	box-shadow: 6px 6px 40px #525f5d, -6px -6px 40px #525f5d;
    	background-color: rgb(226, 224, 225);
    }
    .register_page h2 {
    	margin: 15px 25px;
    	font-style : italic;
        color : #625f5f;
        letter-spacing : 3px;
    	
    }
    .form_group {
    	width: 100%;
    	margin-left:25px;
    	height: 75px;
    }
    .r_input {
    	width: 70%;
    	height : 30px;
        border : 2px solid #7c8586;
        border-radius : 2%;
        font-size : 1em;
        padding-left : 6px;
    }
    #create {
    	width: 70%;
        height: 30px;
        font-size: 1em;
        color: #fff;
        font-weight: bold;
        border: 4px solid rgb(49, 71, 89);
        background-color :rgb(21, 40, 56);
        cursor : pointer;
    }
    .tips {
    	font-size : 0.9em;
    	letter-spacing : 0;
    	margin:0;
    	padding: 4px 0;
    	color : rgb(240, 3, 3);
    	font-weight: 600;
    }
</style>
</head>
<body>


	<div class="register_page">
		<br><h2>增加门店</h2>
		<form method="post" action="m_insert" onsubmit="">
			<div class="form_group">
				<input onchange="" type="text" id="new_m_name" class="r_input" name="new_m_name" placeholder="请输入门店名称" />
				<p id="check_user" class="tips"></p>
			</div>
			<div class="form_group">
				<input onchange="" type="text" id="new_m_address" class="r_input" name="new_m_address" placeholder="请输入门店地址" />
				<p id="check_email" class="tips"></p>
			</div>
			<div class="form_group">
				<input onchange="" type="text" id="new_m_phone" class="r_input" name="new_m_phone" placeholder="请输入门店电话号码" />
				<p id="check_pwd" class="tips"></p>
			</div>
			<div class="form_group">
				<input type="submit" id="create" value="确认"/>
			</div>
		</form>
</html>