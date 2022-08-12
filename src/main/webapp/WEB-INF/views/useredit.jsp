<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/header.jsp" ></jsp:include>
</head>

<body>
<jsp:include page="./include/navbar.jsp" ></jsp:include>

	<div id="wrap">
		<div class="contents">
			<div class="subtitle subBottom"></div>
			<span class="title">회원정보 수정</span>
			<span class="titleDes"></span>
		</div>
		<div class="subLine"></div>
		<div class="joinTitle titleTop">회원정보 수정</div>
		<div class="joinGrayBg col-xs-8">
			<ul class="joinInfoBox">
				<li class="infoList">
					<span class="orangeRed">*</span>
					 아이디
				</li>
				<li>
					<input type="text" id="ms_id" class="idInput">
					<button id="chkIdBtn" class= "btn btn-outline-warning">중복확인</button>
				</li>
			</ul>
			<ul class="joinInfoBox">
				<li class="infoList">
					<span class="orangeRed">*</span>
					 비밀번호
				</li>
				<li>
					<input type="text" id="ms_password" class="passInput">
				</li>
			</ul>
			<ul class="joinInfoBox">
				<li class="infoList">
					<span class="orangeRed">*</span>
					 비밀번호확인
				</li>
				<li>
					<input type="text" class="ms_passwordChk" class="idInput">
				</li>
			</ul>
			<div>
				<li>패스워드 생성규칙- 영문,숫자,특수문자 혼합 10자리 이상</li>
			</div>
			<ul class="joinInfoBox">
				<li class="infolist">
					<span class="orangeRed">*</span>
					이 름
				</li>
				<li>
					<input type="text" id="ms_name" style="width:318px">
				</li>
			</ul>
			<ul class="joinInfoBox">
				<li class="infolist">
					<span class="orangeRed">*</span>
					 핸드폰
				</li>
				<li>
					<input type="text" id="first_phone1" style="width:90px; margin-right: 5px;" >
					- 	
					<input type="text" id="mid_phone1" style="width:100px; margin-right: 5px;" >
					- 
					<input type="text" id="last_phone1" style="width:100px;" >
				</li>
			</ul>
			<ul class="joinInfoBox">
				<li class="infolist">
					<span class="orangeRed">*</span>
					 집전화
				</li>
				<li>
					<input type="text" id="home_tel" style="width:300px; margin-right: 5px;" >
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
					<input type="text" id="sample6_extraAddress" placeholder="참고항목">
				</li>
			</ul>
			<ul class="joinInfoBox">
				<li class="infoList">
					<span class="orangeRed">*</span>
					 성별
				</li>
				<li>
					<select name="selsex" id="ms_sex" class="select-arrow">
						<option value>선택</option>
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
				<li>
					<input type="text" id="mbirth" placeholder=" YYYYmmdd " style"width:400px">
				</li>
			</ul>
		</div>
		<div class="btnbox">
			<button id="closeBtn" class="btn btn-outline-secondary">취소</button>
			<button id="saveBtn" class="btn btn-outline-primary">확인</button>
		</div>
	</div>



</body>
</html>