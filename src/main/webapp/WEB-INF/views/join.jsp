<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="./include/header.jsp" ></jsp:include>
	<script>
		$(document).ready(function(){
			$('#saveBtn').on('click' function(e){
				const memId
				const memPw
				const memChKPw
				const memName
				const memPhoneF
				const memPhoneM
				const memPhoneL
				const memAdrrs
				const memSex
				const memBirth
				let sParams = {};
				
				if(memId == ""){
					alert("아이디를 입력해주세요")
					return;
				}else{
					sParams["id"] = memId;
				}
				
				if(memPw == ""){
					alert("비밀번호를 입력해주세요")
					return;
				}else{
					sParams["pw"] = memId;
				}
				
				if(memChKPw == ""){
					alert("비밀번호를 한번더 입력해주세요")
					return;
				}else{
					
				}
				
				if(memPhoneF == ""){
					alert("핸드폰 앞 번호를 입력해주세요")
					return;
				}else{
					sParams["phoneF"] = memPhoneF;
				}
				
				if(memPhoneF == ""){
					alert("핸드폰 가운데 번호를 입력해주세요")
					return;
				}else{
					sParams["phoneM"] = memPhoneM;
				}
				
				if(memPhoneF == ""){
					alert("핸드폰 뒷 번호를 입력해주세요")
					return;
				}else{
					sParams["phoneL"] = memPhoneL;
				}
				
				if(memAdrrs == ""){
					alert("주소를 입력해주세요")
					return;
				}else{
					sParams["addr1"] = memAddrs;
				}
				if(memSex == "선택"){
					alert("성별을 선택해주세요")
					return;
				}else{
					sParams["sex"] = memSex;
				}
				if(memBirth==""){
					alert("생일을 입력해주세요")
					return;
				}else{
					sParams["birth"] = memBirth;
				}
				
				
				
				
				
				$.ajax({

					  type:'post',
					  url:'요청할 url',
					  data:{서버로 전송할 데이터},
					  dataType: 'json',
					  success: {
					      location.href="/sample/home"
					  },
					  error : function(xhr,status,error) {
					      //오류 발생 시 처리
					  },
					  complete:function(data,textStatus) {
					      //작업 완료 후 처리
					  }
					});
				
			})
		});
	</script>
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
		<div class="joinGrayBg col-xs-8">
			<ul class="joinInfoBox">
				<li class="infoList">
					<span class="orangeRed">*</span>
					 아이디
				</li>
				<li>
					<input type="text" class="ms_id" class="idInput">
					<button id="chkIdBtn" class= "btn btn-outline-warning">중복확인</button>
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
					<input type="text" id="homeaddr0" style="width:700px">
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
					<input type="text" id="mbirth" placeholder=" YYYYmmdd " style"width:400px">
				</li>
			</ul>
		</div>
		<div class="btnbox">
			<button id="closeBtn" class="btn btn-outline-secondary">취소</button>
			<button id="saveBtn" class="btn btn-outline-primary">확인</button>
		</div>
	</div>

<jsp:include page="./include/script.jsp" ></jsp:include>
</body>
</html>