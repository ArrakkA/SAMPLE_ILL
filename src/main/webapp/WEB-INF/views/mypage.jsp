<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/header.jsp" ></jsp:include>
<jsp:include page="./include/map.jsp"></jsp:include>
<link rel="stylesheet" href="<c:url value='/mypage.css'/>">
<script type="text/javascript" src="/mypage.js"></script>
<script>
	const memSex = ${sessionScope.SessionUser.MS_SEX};
	const birth = ${sessionScope.SessionUser.MS_BIRTH};
	const fPhone = '${sessionScope.SessionUser.MS_FIRST_PHONE1}';
</script>
</head>
<body>
<jsp:include page="./include/navbar.jsp" ></jsp:include>
<div class="tabList">
	<a class="menuOn tab" id="tab1" href="javascript:changeContent(1)">예약확인 및 취소</a>
	<a class="tab" id="tab2" href="javascript:changeContent(2)">회원정보 수정</a>
</div>
<div class="content" id="content1">
	<table class="memReservationTable">
		<colgroup>
			<col style="width:20%"/>
			<col style="width:10%"/>
			<col style="width:10%"/>
			<col style="width:10%"/>
			<col style="width:10%"/>
			<col style="width:10%"/>
			<col style="width:10%"/>
			<col style="width:10%"/>
		</colgroup>
		<thead>
			<tr align="center">
				<th>예약번호</th>
				<th>날짜</th>
				<th>시간</th>
				<th>코스</th>
				<th>홀</th>
				<th>인원</th>
				<th>그린피 가격</th>
				<th>예약</th>
			</tr>
		</thead>
		<tbody class="memberReservationList"></tbody>
	</table>
</div >
<div  class="content" id="content2" style="display:none">
	<div id="wrap">
		<div class="contents">
			<div class="subtitle subBottom"></div>
			<span class="title">회원정보 수정</span>
			<span class="titleDes"></span>
		</div>
		<div class="subLine"></div>
		<div class="joinGrayBg col-xs-8">
			<ul class="joinInfoBox">
				<li class="infoList">
					<span class="orangeRed">*</span>
					 회원번호
				</li>
				<li>
					<input type="text" id="ms_num" class="Input" value="${sessionScope.SessionUser.MS_NUM}" disabled>
				</li>
			</ul>
			<ul class="joinInfoBox">
				<li class="infoList">
					<span class="orangeRed">*</span>
					 아이디
				</li>
				<li>
					<input type="text" id="ms_id" class="idInput" value="${sessionScope.SessionUser.MS_ID}" disabled>
				</li>
			</ul>
			<ul class="joinInfoBox">
				<li class="infolist">
					<span class="orangeRed">*</span>
					이 름
				</li>
				<li>
					<input type="text" id="ms_name" style="width:150px" value="${sessionScope.SessionUser.MS_NAME}" disabled>
				</li>
			</ul>
			<ul class="joinInfoBox">
				<li class="infolist">
					<span class="orangeRed">*</span>
					 핸드폰
				</li>
				<li>
					<select id="first_phone1" class="select-arrow" value="${sessionScope.SessionUser.MS_FIRST_PHONE1}" style="width:90px; margin-right: 5px">
						<option value>선택</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="012">012</option>
						<option value="013">013</option>
						<option value="014">014</option>
						<option value="015">015</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
					- 	
					<input type="text" id="mid_phone1" value="${sessionScope.SessionUser.MS_MID_PHONE1}" style="width:100px; margin-right: 5px;" >
					- 
					<input type="text" id="last_phone1" value="${sessionScope.SessionUser.MS_LAST_PHONE1}" style="width:100px;" >
				</li>
			</ul>
			<ul class="joinInfoBox">
				<li class="infolist">
					<span class="orangeRed">*</span>
					 집전화
				</li>
				<li>
					<input type="text" id="home_tel" value="${sessionScope.SessionUser.MS_HOMETEL}" style="width:300px; margin-right: 5px;" >
				</li>
			</ul>
			<ul class="joinInfoBox">
				<li class="infoList">
					<span class="orangeRed">*</span>
					 지역
				</li>
				<li>
					<input type="text" id="mZip" value="${sessionScope.SessionUser.MS_HOMEZIP}" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="mAddres1" value="${sessionScope.SessionUser.MS_HOMEADDR1}" placeholder="주소"><br>
					<input type="text" id="mAddres2" value="${sessionScope.SessionUser.MS_HOMEADDR2}" placeholder="상세주소">
					<input type="text" id="sample6_extraAddress" placeholder="참고항목">
				</li>
			</ul>
			<ul class="joinInfoBox">
				<li class="infoList">
					<span class="orangeRed">*</span>
					 성별
				</li>
				<li>
					<select name="selsex" id="ms_sex" class="select-arrow" value="${sessionScope.SessionUser.MS_SEX}">
						<option>선택</option>
						<option value="1">남</option>
						<option value="2">여</option>
					</select>
				</li>
			</ul>
			<ul class="joinInfoBox">
				<li class="infoList">
					<span class="orangeRed">*</span>
					 생년월일
				</li>
				<li class="info" id="info__birth">
					<select class="box" id="birth-year">
				    	<option disabled selected>출생 연도</option>
				  	</select>
				  	<select class="box" id="birth-month">
				    	<option disabled selected>월</option>
				  	</select>
				  	<select class="box" id="birth-day">
				    	<option disabled selected>일</option>
				  	</select>
				</li>
			</ul>
		</div>
		<div class="btnbox">
			<button id="changeBtn" class="btn btn-outline-primary">회원정보 수정</button>
			<a class="btn btn-outline-primary" id="tab3" href="javascript:changeContent(3)">회원 탈퇴</a>
		</div>
	</div>
</div>
<div  class="content" id="content3" style="display:none">
	<div>
		<ul>
			<li>
				<div>회원탈퇴 하시려면 비밀번호를 입력해주세요</div>
				<input type="password" id="delPassword" class="delpassInput">
				<button class="memDelBtn">삭제</button>
			</li>
		</ul>
	</div>
</div>

<!-- 팝업 입니다. -->
<div class="popup">
	<div class="popup-inner">
		<div class="popContent">
			<ul class="popuplist">
				<li>
					<span>예약자</span>
					<span id="pName">${sessionScope.SessionUser.MS_NAME}</span>
				</li>
				<li>
					<span>예약 번호</span>
					<span id="pNum"></span>
				</li>
				<li>
					<span>핸드폰</span>
					<span id="pPhone">${sessionScope.SessionUser.MS_FIRST_PHONE1}-${sessionScope.SessionUser.MS_MID_PHONE1}-${sessionScope.SessionUser.MS_LAST_PHONE1}</span>
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
					<span id="pPhoneF">${sessionScope.SessionUser.MS_FIRST_PHONE1}</span>
					<span id="pPhoneM">${sessionScope.SessionUser.MS_MID_PHONE1}</span>
					<span id="pPhoneL">${sessionScope.SessionUser.MS_LAST_PHONE1}</span>
				</li>
			</ul>
		</div>
		<div class= "buttonBox">
			<button id="popup-close">닫기</button>
			<button id="deleteBtn"> 취소 </button>
		</div>
	</div>
</div>

</body>
</html>