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