<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bright Idea</title>
</head>
<body style="font-family: arial">
	<form id="logoutForm" method="POST" action="/logout">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="submit" value="Logout" />
	</form>
	<h1>Hi <c:out value ="${currentUser.name}"/>!</h1>
	
	<form action="/new" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="text" name="idea" placeholder="Post something witty here..."/>
		<input type="hidden" name="user_id" value="${currentUser.id}"/>
		<input type="submit" value="Idea!"/>
	</form><br>
	
	<c:forEach items="${posts}" var="p">
		
		<fieldset style="width: 500px;">
		<legend><a href="/users/${p.user.id}"><c:out value="${p.user.alias}"/></a> says:</legend>
			<c:out value="${p.idea}"/><br>
			<br>
			<c:choose>
				<c:when test="${p.user.id == currentUser.id}"><a href="/delete/${p.id}">Delete</a></c:when>
			</c:choose>
		</fieldset>
		<p><a href="/like/${currentUser.id}/${p.id}">like</a> | <a href="/likers/${p.id}"> ${p.getNumLikers()} people</a> like this.</p>
	</c:forEach>
</body>
</html>