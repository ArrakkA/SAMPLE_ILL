<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/header.jsp" ></jsp:include>
	<link rel="stylesheet" href="<c:url value='/login.css'/>">
	<script type="text/javascript" src="/login.js"></script>
 </head>
<body>
 <jsp:include page="./include/navbar.jsp" ></jsp:include>
</body>
<div class="login-page">
	<div class="form">
		<div class="login-form">
			<input type="text" id="mem_id" placeholder="username"/>
			<input type="password" id="mem_pw" placeholder="password"/>
			<button id="loginBtn">login</button>
			<p class="message">아직 회원이 아니신가요? <a href="sample/join">회원가입 하세요</a></p>
		</div>
	</div>
</div>
</html>