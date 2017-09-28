<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Like Status</title>
</head>
<body style="font-family:arial">
	<a href="/"><button>Bright Ideas</button></a>
	<form id="logoutForm" method="POST" action="/logout">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="submit" value="Logout" />
	</form>

	<fieldset style="width: 500px;">
	<legend><h3><a href="/users/${post.user.id}">${post.user.alias}</a> says:</h3></legend>
		<c:out value="${post.idea}"/>
	</fieldset><br>
	<h3>This Post was liked by:</h3>
	<table style="width: 300px" border="1">
			<tr>
				<th>Alias</th>
				<th>Name</th>
			</tr>
			<c:forEach items="${post.users}" var="p">
			<tr>
				<td><b><c:out value="${p.alias}"/></b></td>
				<td><b><c:out value="${p.name}"/></b></td>
			</tr>
			</c:forEach>
		</table>
</body>
</html>