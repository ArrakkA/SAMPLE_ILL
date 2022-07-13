<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="./include/header.jsp" ></jsp:include>
</head>
<body>
	<jsp:include page="./include/navbar.jsp" ></jsp:include>

<div = id="wrap">
	<div class="contents">
		<div class="subtitle subBottom"></div>
		<span class="title">간편회원가입</span>
		<span class="titleDes"></span>
	</div>
	<div class="subLine"></div>
	<div class="joinTitle titleTop">간편회원가입</div>
	<div class="joinGrayBg">
		<ul class="joinInfoBox">
			<li class="infoList">
				<span class="orangeRed">*</span>
				 아이디
			</li>
			<li>
				<input type="text" class="ms_id" class="idInput">
				<div>중복확인</div>
			</li>
		</ul>
		<ul class="joinInfoBox">
			<li class="infoList">
				<span class="orangeRed">*</span>
				 비밀번호
			</li>
			<li>
				<input type="text" class="ms_password" class="passInput">
			</li>
		</ul>
		<ul class="joinInfoBox">
			<li class="infoList">
				<span class="orangeRed">*</span>
				 비밀번호확인
			</li>
			<li>
				<input type="text" class="ms_id" class="idInput">
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
				<input type="text" id="name" style="width:318px">
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
			<li class="infoList">
				<span class="orangeRed">*</span>
				 지역
			</li>
			<li>
				<input type="text id="homeaddr0" style="width:700px">
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
					<option value="01">남</option>
					<option value="02">여</option>
				</select>
			</li>
		</ul>
		<ul class="joinInfoBox">
			<li class="infoList">
				<span class="orangeRed">*</span>
				 생년월일
			</li>
			<li>
				<select name="selsex" id="ms_birth1" class="select-arrow">
					<option value>선택</option>
				</select>
				<select name="selsex" id="ms_birth2" class="select-arrow">
					<option value>선택</option>
				</select>
				<select name="selsex" id="ms_birth3" class="select-arrow">
					<option value>선택</option>
				</select>
			</li>
		</ul>
	</div>
	<div class="btnbox">
		<a>취소</a>
		<a>완료</a>
	</div>
</div>

<jsp:include page="./include/script.jsp" ></jsp:include>
</body>
</html>