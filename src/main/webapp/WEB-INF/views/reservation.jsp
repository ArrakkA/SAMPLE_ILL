<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html>

<html>
<head>
<jsp:include page="./include/header.jsp" ></jsp:include>

<script>
$( document ).ready(function() {
	
	const date = new Date();
	const vYear = 2022;
	const vMonth = 7;
	
		$("#year-month").html(vYear+"년 "+vMonth+"월");
	
	
});


</script>


</head>
<body>
<jsp:include page="./include/navbar.jsp" ></jsp:include>

	<div>
		<div>
			<div>
				<div class="calendar">
		        	<div class="header">
			            <div id="year-month"></div>
			            <div class="nav">
			                <button class="nav-btn go-prev">&lt;</button>
			                <button class="nav-btn go-today">Today</button>
			                <button class="nav-btn go-next">&gt;</button>
			            </div>
		        	</div>
		        	<div class="main">
		            	<div class="days">
		            	    <div class="day">일</div>
			                <div class="day">월</div>
			                <div class="day">화</div>
			                <div class="day">수</div>
			                <div class="day">목</div>
			                <div class="day">금</div>
			                <div class="day">토</div>
		            	</div>
		            	<div class="dates"></div>
		        	</div>
		    	</div>
			</div>
		</div>
	</div>

<jsp:include page="./include/script.jsp" ></jsp:include>
</body>
</html>