<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/header.jsp" ></jsp:include>
<jsp:include page="./include/calendar.jsp" ></jsp:include>
</head>
<body>
<jsp:include page="./include/navbar.jsp" ></jsp:include>

		
		<div  class= "calendar">
			<div class= "head">
				<div class="year-month" id="year-month"></div>
				<div class="calenderBtn" id="cbtn">
					<button class= "c-btn toPrev">이전</button>
					<button class= "c-btn thisMonth">1</button>
					<button class= "c-btn toNext">다음</button>
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
				<div class= "dates"></div>
			</div>
		</div>
</body>
</html>