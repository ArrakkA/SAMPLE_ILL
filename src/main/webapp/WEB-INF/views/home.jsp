<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
 <jsp:include page="./include/header.jsp" ></jsp:include>
 
 </head>
<body>
 <jsp:include page="./include/navbar.jsp" ></jsp:include>
 


<div class ="container">
	<div class = "col-lg-4"></div>
	<div class = "col-lg-4">
		<div class= "jumbotron" style="padding-top: 20px">
			<form method="post" action="loginAction.jsp">
				<h3 style="text-align:center">로그인 화면</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholer="아이디" name="MS_ID" maxlenght="20">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholer="비밀번호" name="MS_PASSWORD" maxlenght="20">
				</div>
				<input type="submit" class="btn btn-primary">
			</form>
		</div>
	</div>
</div>


<jsp:include page="./include/script.jsp" ></jsp:include>
</body>
</html>