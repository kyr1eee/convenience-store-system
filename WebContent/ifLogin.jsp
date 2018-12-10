<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="DB.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>

	<% 	int ifLogin = 0;
		try{
			ifLogin = Integer.parseInt((String)request.getSession().getAttribute("ifLogin"));
		}
		catch(Exception e){
			
		}
		 
		if (ifLogin == 0) {
			%>
			
			<body onload = "re()">
	<%}
		else {
	%>
	<% %>
	<% 
		//ifLogin = 222;
		}%>
	<script>
		function re() {
			window.self.location = "404/error.html"
		}
		//re();
	</script>
</body>
</html>