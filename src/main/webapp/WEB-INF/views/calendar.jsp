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



	<div class="yearMonth"></div>
		<table class="">
			<colgroup>
			
				<col width="*">
				<col width="*">
				<col width="*">
				<col width="*">
				<col width="*">
				<col width="*">
				<col width="*">
				
			</colgroup>
			
			<thead>
			
				<tr>
					<th>SUN</th>
					<th>MON</th>
					<th>TUE</th>
					<th>WEN</th>
					<th>THR</th>
					<th>FRI</th>
					<th>SAT</th>
				</tr>
				
			</thead>
			
			<tbody class= "calendarBody">
			
			
			</tbody>
			
			
			
		</table>
		
		
		
		
</body>
</html>