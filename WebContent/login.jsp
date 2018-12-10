<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎登陆</title>
<link rel="stylesheet" href="style/style.fonts.css" />
<link rel="stylesheet" href="style/style.nav.css" />
<link rel="stylesheet" href="style/font-awesome/css/font-awesome.css" />
<link rel="stylesheet" href="style/style.animate.css" />
<link rel="stylesheet" href="style/style.register.css" />
<link rel="stylesheet" href="style/style.login.css" />
</head>
<body>


<div class="nav-bar-bottom" ></div>
<div id="login">
<!-- 
	<video width="" height="" autoplay="" loop="" preload="auto" muted="">
      <source src="img/bg.mp4" type="video/mp4">
    </video>
    
    -->
    
    <audio src="audio/MANISH - 煌めく瞬間に捕われて.mp3" autoplay = "autoplay" loop="true"></audio>
	<div id="login_button">
    	<h2 style="font-family:VT323">TDOG</h2>
    	<form action = "login" method="post" onsubmit="return true;">
    		<div class="dog"><input type="text" id="user" name="user" placeholder="请输入用户名" /></div>
    		<div class="dog"><input type="password" id="pwd" name="pwd" placeholder="请输入密码"/></div>
    		<div class="dog">
    			<input type="submit" id="btn" value="登 陆"/>
    		</div>
    	</form>
    	<div class="dog"><li id="register">免费注册</li></div>
    </div>
</div>

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
	</div>
<script src="script/jQuery.min.js"></script>
<script src="script/javascript.filter.js"></script>

<script>
	$("#register").on('click',function() {
		$("#login").addClass("animated hinge");
		setTimeout(function() {
			$(".register_page").css("visibility","visible");
			$(".register_page").addClass("animated jackInTheBox");	
		},1500);
		
		
		
	});
</script>
</body>
</html>