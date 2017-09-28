<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login and Registration</title>
</head>
<body style="font-family:arial">
	<c:if test="${logoutMessage != null}">
        <c:out value="${logoutMessage}"></c:out>
    </c:if>
    <h1>Login</h1>
    <c:if test="${errorMessage != null}">
        <c:out value="${errorMessage}"></c:out>
    </c:if>
    <form method="POST" action="/login">
        <p>
            <input type="text" id="username" name="username" placeholder="Email"/>
        </p>
        <p>
            <input type="password" id="password" name="password" placeholder="Password"/>
        </p>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Login!"/>
    </form>
    
    <h1>Register!</h1>
    
    <p><form:errors path="user.*"/></p>
    
    <form:form method="POST" action="/registration" modelAttribute="user">
        <p>
            <form:input path="name" placeholder="Name"/>
        </p>
        <p>
            <form:input path="alias" placeholder="Alias"/>
        </p>
        <p>
            <form:input path="email" placeholder="Email"/>
        </p>
        <p>
            <form:password path="password" placeholder="Password"/>
        </p>
        <p>
            <form:password path="passwordConfirm" placeholder="Password Confirmation"/>
        </p>
        <input type="submit" value="Register!"/>
    </form:form>
</body>
</html>