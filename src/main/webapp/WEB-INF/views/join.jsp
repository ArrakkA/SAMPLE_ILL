<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="./include/header.jsp" ></jsp:include>
	<jsp:include page="./include/map.jsp"></jsp:include>
	
	<script>
		$(document).ready(function(){
			
			
			$.getJSON('https://api.ipify.org?format=jsonp&callback=?').then((data)=>{
		        let ip = [] ;
		        ip = data.ip;
		        
			$('#saveBtn').on('click', function(e){
				const memId = $('#m_id').val;
				const memPw = $('#m_password').val;
				const memChKPw = $('#m_password_chk').val;
				const memName = $('#m_name').val;
				const memPhoneF= $('#m_first_phone1').val;
				const memPhoneM = $('#m_mid_phone1').val;
				const memPhoneL = $('#m_last_phone1').val;
				const memAddrs1 = $('#memAddrs1').val;
				const memAddrs2 = $('#memAddrs2').val;
				const memSex = $('#m_sex').val;
				const memBirth = $('#mbirth').val;
				const mIP = ip; 
				let sParams = {};
				
				
				console.log(memId)
				
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
					sParams["pw"] = memPw;
				}
				
				if(memChKPw == ""){
					alert("비밀번호를 잘못입력하시거나 확인비밀번호를 입력해주세요")
					return;
				}else{
					
				}
				if(memName == ""){
					alert("이름을 입력해주세요")
					return;
				}else{
					sParams["name"] = memName
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
				if(memAddrs1 == ""){
					alert("우편번호 및 도로명주소를 입력해주세요")
					return;
				}else{
					sParams["hAddr1"] = memAddrs1;
				}
				if(memAddrs2 == ""){
					alert("상세주소를 입력해주세요")
				}else{
					sParams["hAddr2"] = memAddrs2;
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
					  url:'/member/join',
					  data:{
						  
						  id : sParams["id"],
						  pw : sParams["pw"],
						  name : sParams["name"],
						  sex : sParams["sex"],
						  birth : sParams["birth"],
						  phoneF : sParams["phoneF"],
						  phoneM : sParams["phoneM"],
						  phoneL : sParams["phoneL"],
						  smsChk : sParams["smsChk"],
						  hAddrs1 : sParams["hAddr1"],
						  hAddrs2 : sParams["hAddr2"],
						  mIP : mIP
						  
						  
					  },
					  dataType: 'json',
					  success: function(data){
						  alert("회원가입에 성공하셨습니다.")
					      location.href="/sample/login"
					      console.log(data)
					  },
					  error : function(data){
					      alert("오류가 발생하였습니다.")
					      console.log(data)
					  }
					});
				
			});
		});	
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
					<input type="text" id="m_id" class="idInput">
					<button id="chkIdBtn" class= "btn btn-outline-warning">중복확인</button>
				</li>
			</ul>
			<ul class="joinInfoBox">
				<li class="infoList">
					<span class="orangeRed">*</span>
					 비밀번호
				</li>
				<li>
					<input type="text" id="m_password" class="passInput">
				</li>
			</ul>
			<ul class="joinInfoBox">
				<li class="infoList">
					<span class="orangeRed">*</span>
					 비밀번호확인
				</li>
				<li>
					<input type="text" id="m_password_chk" class="idInput">
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
					<input type="text" id="m_name" style="width:200px">
				</li>
			</ul>
			<ul class="joinInfoBox">
				<li class="infolist">
					<span class="orangeRed">*</span>
					 핸드폰
				</li>
				<li>
					<input type="text" id="m_first_phone1" style="width:90px; margin-right: 5px;" >
					- 	
					<input type="text" id="m_mid_phone1" style="width:100px; margin-right: 5px;" >
					- 
					<input type="text" id="m_last_phone1" style="width:100px;" >
				</li>
			</ul>
			<ul class="joinInfoBox">
				<li class="infoList">
					<span class="orangeRed">*</span>
					 지역
				</li>
				<li>
				<input type="text" id="sample4_postcode" placeholder="우편번호">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="memAddrs1" placeholder="도로명주소">
				<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="memAddrs2" placeholder="상세주소">
				<input type="text" id="sample4_extraAddress" placeholder="참고항목">
				</li>
			</ul>
			<ul class="joinInfoBox">
				<li class="infoList">
					<span class="orangeRed">*</span>
					 성별
				</li>
				<li>
					<select name="selsex" id="m_sex" class="select-arrow">
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
			<div class="custom-control custom-checkbox mb-3">
			<input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">sns에 정보를 받으시겠습니까?</label>
            </div>
		</div>
		<div class="btnbox mb-4">
			<button id="closeBtn" class="btn btn-outline-secondary">취소</button>
			<button id="saveBtn" class="btn btn-outline-primary">확인</button>
		</div>
	</div>

<jsp:include page="./include/script.jsp" ></jsp:include>
</body>
</html>