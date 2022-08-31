<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/header.jsp" ></jsp:include>
<jsp:include page="./include/map.jsp"></jsp:include>
<script type="text/javascript" src="/join.js"></script>
<script type="text/javascript" src="/optionMake.js"></script>
<link rel="stylesheet" href="<c:url value='/join.css'/>">
</head>
<body>
  <jsp:include page="./include/navbar.jsp" ></jsp:include>

	<div id="wrap">
		<div id="header" class="joinHeader">
			<h3>
				<a href="/sample/home">
				GreenIT 간편 회원 가입
				</a>
			</h3>
		</div>

		<div class="joinGrayBg col-xs- form">
			<div id="container" class="main">
				<div class="join_content">
					<ul class="joinInfoBox">
						<li class="infoList">
							<span class="orangeRed">*</span>
							아이디
						</li>
						<li class="ps_box">
							<input type="text" id="ms_id" class="idInput int">
							<button id="chkIdBtn" class= "btn btn-outline-warning">중복확인</button>
						</li>
					</ul>
					<ul class="joinInfoBox">
						<li class="infoList">
							<span class="orangeRed">*</span>
							비밀번호
						</li>
						<li class="ps_box">
							<input type="password" id="ms_password" class="passInput int">
						</li>
					</ul>
					<ul class="joinInfoBox">
						<li class="infoList">
							<span class="orangeRed">*</span>
							비밀번호확인
						</li>
						<li>
							<input type="password" id="ms_passwordChk" class="passInput int">
						</li>
						<li>
							<div class= "pwDanger">패스워드 생성규칙- 영문(대,소문자),숫자,특수문자 혼합 10자리 이상</div>
						</li>
					</ul>
					<ul class="joinInfoBox">
						<li class="infolist">
							<span class="orangeRed">*</span>
							이 름
						</li>
						<li>
							<input type="text" id="ms_name" style="width:318px" class="int">
						</li>
					</ul>
					<ul class="joinInfoBox">
						<li class="infolist">
							<span class="orangeRed">*</span>
							핸드폰
						</li>
						<li>
							<select id="first_phone1" class="select-arrow" style="width:90px; margin-right: 5px">
								<option value>선택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="011">012</option>
								<option value="011">013</option>
								<option value="011">015</option>
								<option value="011">016</option>
								<option value="011">017</option>
								<option value="011">018</option>
								<option value="011">019</option>
							</select>
							-
							<input type="text" id="mid_phone1" style="width:100px; margin-right: 5px;" maxlength="4" >
							-
							<input type="text" id="last_phone1" style="width:100px;" maxlength="4" >
						</li>
					</ul>
					<ul class="joinInfoBox">
						<li class="infolist">
							집전화
						</li>
						<li>
							<input type="text" id="home_tel" style="width:300px; margin-right: 5px;" maxlength="10" >
						</li>
					</ul>
					<ul class="joinInfoBox">
						<li class="infoList">
							<span class="orangeRed">*</span>
							지역
						</li>
						<li>
							<input type="text" id="mZip" placeholder="우편번호">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="mAddres1" placeholder="주소"><br>
							<input type="text" id="mAddres2" placeholder="상세주소">
							<input type="text" id="sample4_extraAddress" placeholder="참고항목">
						</li>
					</ul>
					<ul class="joinInfoBox">
						<li class="infoList">
							<span class="orangeRed">*</span>
							성별
						</li>
						<li>
							<select name="selsex" id="ms_sex" class="select-arrow">
								<option value="0">선택</option>
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
					<ul>
						<li>
							<div>
								<input type="checkbox" id="smsChk" value="Y"> sms 수신에 동의하시겠습니까?
							</div>
						</li>
					</ul>
				</div>
				<div class="btnbox">
					<button id="closeBtn" class="btn btn-outline-secondary">취소</button>
					<button id="saveBtn" class="btn btn-outline-primary">확인</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>