<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/header.jsp" ></jsp:include>
<jsp:include page="./include/calScript.jsp"></jsp:include>
</head>
<body>
<jsp:include page="./include/navbar.jsp" ></jsp:include>

	<!-- 캘린더 입니다 -->
    <table align="center" id="calendar">
        <tr>
            <td><font size=1%; color="#B3B6B3"><label onclick="beforem()" id="before" ></label></font></td>
            <td colspan="5" align="center" id="yearmonth"></td>
            <td><font size=1%; color="#B3B6B3"><label onclick="nextm()" id="next"></label></font></td>
        </tr>
        <thead>
        	 <tr>
	            <td align="center"><div style ="color: red">SUN</div></td>
	            <td align="center"> MON</td>
	            <td align="center"> TUE </td>
	            <td align="center"> WEN </td>
	            <td align="center"> THR </td>
	            <td align="center"> FRI </td>
	            <td align="center"><div style ="color: blue">SAT</div></td>
        	</tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <!-- 예약정보 테이블 -->
    <table class= "table table-striped table-sm mainTable">
		<colgroup>
			<col style="width:10%"/>
			<col style="width:10%"/>
			<col style="width:20%"/>
			<col style="width:10%"/>
			<col style="width:10%"/>
			<col style="width:10%"/>
			<col style="width:10%"/>
		</colgroup>
		<thead>
			<tr align="center">
				<th>날짜</th>
				<th>시간</th>
				<th>코스</th>
				<th>홀</th>
				<th>인원</th>
				<th>그린피 가격</th>
				<th>예약</th>
			</tr>
		</thead>
		<tbody class="registerList" id="registerList">
		</tbody>
	</table>
	
	<!-- 팝업 입니다. -->
	<div class="popup">  
   	<div class="popup-inner">
    	<div class="popContent"></div>
     	<div class= "buttonBox">
     		<button class="popup-close">닫기</button>
     		<button class="bkBtn">예약하기</button>
     	</div>
   	</div>
</div>

    
    
</body>
		
		
		
</html>