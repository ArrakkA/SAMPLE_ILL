<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
  </head>
<body>
<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Greenit JSP</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/sample/testDB">Features</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Pricing</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled">Disabled</a>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <a class="nav-link" href="/sample/join">회원가입</a>
        <a class="nav-link" href="/sample/login">로그인</a>
      </form>
    </div> 
  </div>
</nav>

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
				<input type="text" id="ms_name" style="width:318px">
			</li>
		</ul>
		<ul class="joinInfoBox">
			<li class="infolist">
				<span class="orangeRed">*</span>
				 핸드폰
			</li>
			<li>
				<input type="text" id="ms_first_phone1" style="width:90px; margin-right: 5px;" >
				- 	
				<input type="text" id="ms_mid_phone1" style="width:100px; margin-right: 5px;" >
				- 
				<input type="text" id="ms_last_phone1" style="width:100px;" >
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


<script src="js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
</body>
</html>