<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html>

<html>
<head>
<jsp:include page="./include/header.jsp" ></jsp:include>


<script>
</script>
</head>
<body>
<jsp:include page="./include/navbar.jsp" ></jsp:include>

<button id = "test_btn">실험용 버튼</button>
<div id="test_div1">1</div>
<div id= "test_div2">2</div>
<jsp:include page="./include/script.jsp" ></jsp:include>
</body>
</html>