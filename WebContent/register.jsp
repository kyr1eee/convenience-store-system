<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Join TDOG</title>
<link rel="stylesheet" href="style/style.nav.css" />
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
    	height : 470px;
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

	<div class="nav-bar-bottom" style="top:0"></div>
	<div class="register_page">
		<br><h2>创建您的个人账户</h2>
		<form method="post" action="saveRegister" onsubmit="return finalCheck()">
			<div class="form_group">
				<input onchange="checkUser()" type="text" id="new_user" class="r_input" name="new_user" placeholder="请输入您的用户名" />
				<p id="check_user" class="tips"></p>
			</div>
			<div class="form_group">
				<input onchange="checkEmail()" type="text" id="new_email" class="r_input" name="new_email" placeholder="请输入您的E-Mail" />
				<p id="check_email" class="tips"></p>
			</div>
			<div class="form_group">
				<input onchange="checkPwd()" type="password" id="new_pwd" class="r_input" name="new_pwd" placeholder="请输入您的密码" />
				<p id="check_pwd" class="tips"></p>
			</div>
			<div class="form_group">
				<input onchange="checkPwd()" type="password" id="r_pwd" class="r_input" name="r_pwd" placeholder="请确认您的密码" />
				<p id="check_rpwd" class="tips"></p>
			</div>
			<div class="form_group">
				<input type="submit" id="create" value="确认"/>
			</div>
		</form>
		<script>
			var new_user = document.getElementById("new_user");
			var new_email = document.getElementById("new_email");
			var new_pwd = document.getElementById("new_pwd");
			var check_user = document.getElementById("check_user");
			var check_email = document.getElementById("check_email");
			var check_pwd = document.getElementById("check_pwd");
			var create_btn = document.getElementById("create");
			var r_pwd = document.getElementById("r_pwd");
			var finalCheck = function(){
				if(checkUser() && checkEmail() && checkPwd){
					return true;
					}
				else{
					return false;
				}
				}
			
			var checkUser = function() {
				var user = new_user.value;
				var num_pattern = /\d+.*/; 
				var name_pattern = /[a-zA-Z]+\w*/ ;
				console.log("num:"+user.match(num_pattern));
				console.log("name:"+user.match(name_pattern));
				if(user == "" || user == null){
					check_user.innerHTML = "用户名不能为空";
					return false;
				}
				if(user.match(num_pattern) && user.match(num_pattern)[0] == user){
					check_user.innerHTML = "用户名不能数字开头";
					return false;
				}
				if(user.match(name_pattern)[0] == user){
					if(user.length < 6){
						check_user.innerHTML = "用户名不能小于6个字符";
						return false;
					}
					else if(user.length > 16){
						check_user.innerHTML = "用户名不能大于16个字符";
						return false;
					}
					else {
						check_user.innerHTML = "用户名正确";
						check_user.style["color"] = "rgb(12, 100, 12)";
						return user;
					}
				}
				else {
					check_user.innerHTML = "用户名含有非法字符";
					return false;
				}

			}
			var checkEmail = function() {
				var email = new_email.value;
				if(email == "" || email == null){
					check_email.innerHTML = "E-mail不能为空";
					return false;
				}
				else if(email.split('@').length == 2 && email.split('@')[1].split('.').length == 2) {
					check_email.innerHTML = "E-mail格式正确";
					check_email.style["color"] = "rgb(12, 100, 12)";
					return email;
				}
				else {
					check_email.innerHTML = "E-mail格式不正确";
					return false;
				}
			}
			var checkPwd = function() {
				var pwd = new_pwd.value;
				var rpwd = r_pwd.value;
				if(pwd == "" || pwd == null){
					check_pwd.innerHTML = "密码不能为空";
					return false;
				}
				else if(pwd.length < 6 ){
					check_pwd.innerHTML = "密码不能少于6位";
					return false;
				}
				else if(pwd.length > 16 ){
					check_pwd.innerHTML = "密码不能多于16位";
					return false;
				}
				else {
					check_pwd.style["color"] = "rgb(12, 100, 12)";
					check_pwd.innerHTML = "输入正确";
				}
				if(pwd != null) {
					if((rpwd == "" || rpwd == null)){
						check_rpwd.innerHTML = "请确认密码";
					}
					else if(rpwd !== pwd) {
						check_rpwd.innerHTML = "密码不一致";
						return false;
					}
					else if(rpwd === pwd) {
						check_rpwd.style["color"] = "rgb(12, 100, 12)";
						check_rpwd.innerHTML = "密码一致";
						return rpwd;
					}
					else {
						return false;
					}
				}
				//console.log(pwd);
					
			}
			
			create_btn.onclick = function() {
				checkUser();
				checkEmail();
				checkPwd();
			}
		
		
		
		
		
		</script>
		
	</div>
</body>
</html>