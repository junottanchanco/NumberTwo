<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Profile</title>
</head>
<body style="font-family: arial; font-size: 20px;">

	<a href="/"><button>Bright Ideas</button></a>
	<form id="logoutForm" method="POST" action="/logout">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="submit" value="Logout" />
	</form>
	<fieldset style="width: 300px">
	<legend><b><c:out value="${user.name}"/></b></legend>
	Alias: <b><c:out value="${user.alias}"/></b><br>
	Email: <b><c:out value="${user.email}"/></b>
	</fieldset><br>
	Total number of Posts: ${user.posts.size()}<br>
	Total number of likes: ${user.getNumlikes()}
</body>
</html>