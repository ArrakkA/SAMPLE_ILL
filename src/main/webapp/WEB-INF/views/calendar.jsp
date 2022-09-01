<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/header.jsp" ></jsp:include>
<link rel="stylesheet" href="<c:url value='/cal.css'/>">
<script type="text/javascript" src="/cal.js"></script>
<script>
	<%--const change = '${changeReservation}';--%>
	<%--console.log(change);--%>
</script>
<body>
<jsp:include page="./include/navbar.jsp" ></jsp:include>
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-6 text-center mb-5">
			<h2 class="heading-section">테이블 예약 정보</h2>
		</div>
	</div>
	<!-- 캘린더 입니다 -->
	<div class="row">
		<div class="col-md-12">
			<div class="elegant-calencar d-md-flex">
				<div class="wrap-header d-flex align-items-center img">
					<p id="reset">Today</p>
					<div id="header" class="p-0">
						<div class="head-info">
							<div class="head-month"></div>
							<div class="head-day"></div>
						</div>
					</div>
				</div>
				<div class="calendar-wrap">
					<div class="w-100 button-wrap">
						<div class="pre-button d-flex align-items-center justify-content-center" onclick="beforem()"><i class="fa fa-chevron-left"></i></div>
						<div class="next-button d-flex align-items-center justify-content-center" onclick="nextm()"><i class="fa fa-chevron-right"></i></div>
					</div>
			<table align="center" id="calendar">
				<tr>
					<td><span style="color: #B3B6B3; "><label  id="before"></label></span></td>
					<td colspan="5" align="center" id="yearmonth"></td>
					<td><span style="color: #B3B6B3; "><label  id="next"></label></span></td>
				</tr>
				<thead>
				<tr>
					<td><div style ="color: red">SUN</div></td>
					<td> MON</td>
					<td> TUE </td>
					<td> WEN </td>
					<td> THR </td>
					<td> FRI </td>
					<td><div style ="color: blue">SAT</div></td>
				</tr>
				</thead>
				<tbody id="dates">
				</tbody>
			</table>
		</div>
	</div>
</div>
    <!-- 예약정보 테이블 -->
    <div class="tablist">
    	<a class="tab all"> 전체 코스 </a>
    	<a class="tab cosA"> 동 코스 </a>
    	<a class="tab cosB"> 서 코스 </a>
    </div>
    <table id="table1">
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
	    			<span>예약자</span>-
	    			<span id="pName">${sessionScope.SessionUser.MS_NAME}</span>
	    		</li>
	    		<li>
	    			<span>핸드폰</span>:
	    			<span id="pPhone">${sessionScope.SessionUser.MS_FIRST_PHONE1}-${sessionScope.SessionUser.MS_MID_PHONE1}-${sessionScope.SessionUser.MS_LAST_PHONE1}</span>
	    		</li>
	    		<li>
	    			<span>예약일자</span>-
	    			<span id="pListDay"></span>
	    		</li>
	    		<li>
	    			<span>코스/홀/시간</span>-
	    			<span id="pCHT"></span>	    			
	    		</li>
	    		<li>
	    			<span>예약인원</span>-
	    			<span id="pPerson"></span>
	    		</li>
	    		<li>
	    			<span>가격</span>-
	    			<span id="pPrice"></span>
	    		</li>
	    		<li class="hiddenKey">
					<span id="pDay"></span>
	    			<span id="pTime"></span>
	    			<span id="pCos"></span>
	    		</li>
				<div class="red"> * 예약취소/변경 가능 기간은 라운딩 5일전 17시 까지 입니다 * </div>
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