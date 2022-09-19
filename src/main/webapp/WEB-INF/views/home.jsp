<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/header.jsp" ></jsp:include>
<link rel="stylesheet" href="<c:url value='/home.css'/>">
<script type="text/javascript" src="/home.js"></script>
</head>
<body>
<jsp:include page="./include/navbar.jsp" ></jsp:include>
<jsp:include page="./include/sidebarMenu.jsp" ></jsp:include>
</body>
</html>