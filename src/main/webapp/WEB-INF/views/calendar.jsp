<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/header.jsp" ></jsp:include>
<link rel="stylesheet" href="<c:url value='/cal.css'/>">
<script type="text/javascript" src="/cal.js"></script> 
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
    <div>
    	<a class="tab all">전체 코스</a>
    	<a class="tab cosA">동 코스</a>
    	<a class="tab cosB">서 코스</a>
    </div>
    <table class= "table table-striped table-sm mainTable" id="table1">
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
    	<div class="popContent">
    		<ul class="popuplist">
	    		<li>
	    			<span>예약자</span>
	    			<span id="pName">이름</span>
	    		</li>
	    		<li>
	    			<span>핸드폰</span>
	    			<span id="pPhone"></span>
	    		</li>
	    		<li>
	    			<span>예약일자</span>
	    			<span id="pDay"></span>
	    		</li>
	    		<li>
	    			<span>코스/홀/시간</span>
	    			<span id="pCHT"></span>	    			
	    		</li>
	    		<li>
	    			<span>예약인원</span>
	    			<span id="pPerson"></span>
	    		</li>
	    		<li>
	    			<span>가격</span>
	    			<span id="pPrice"></span>
	    		</li>
	    		<li class="hiddenKey">
	    			<span id="pTime"></span>
	    			<span id="pCos"></span>
	    		</li>
    		</ul>
    	</div>
     	<div class= "buttonBox">
     		<button class="popup-close">닫기</button>
     		<button class="bkBtn">예약하기</button>
     	</div>
   	</div>
</div>

    
    
</body>
		
		
		
</html>