<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="./include/header.jsp" ></jsp:include>
	<jsp:include page="./include/map.jsp"></jsp:include>
	<script>
	$(document).ready(function(){
		let chkBtn = 0;
		
		$.getJSON('http://api.ipify.org?format=jsonp&callback=?').then(function(data){
			$('#saveBtn').on('click', function(){
				
				
				const memId = $('#ms_id').val();
				const memPw = $('#ms_password').val();
				const memChKPw = $('#ms_passwordChk').val();
				const memName = $('#ms_name').val();
				const memPhoneF =$('#first_phone1').val();
				const memPhoneM = $('#mid_phone1').val();
				const memPhoneL = $('#last_phone1').val();
				const memAddrrs1 = $('#mAddres1').val();
				const memAddrrs2 = $('#mAddres2').val();
				const memSex = $('#ms_sex').val();
				const memBirth = $('#mbirth').val();
				const memZip = $('#mZip').val();
				const memSmsChk = $('#ms_passwordChk').val();
				const memHtell = $('#home_tel').val();
				
				console.log(memId)
				console.log(memPw)
				
				let params = {};
				params["smsChk"] = 'Y';
				params["mIP"]= data.ip;
				params["htell"]= memHtell;
				
				if(memId == ""){
					alert("아이디를 입력해주세요")
					return;
					
				}else{
					params["id"] = memId;
				}
				
				if(memPw == ""){
					alert("비밀번호를 입력해주세요")
					return;
				}
				if(name == ""){
					alert("이름을 입력해주세요")
				}else{
					params["name"] = memName;
				}
				
				if(memChKPw == "" && memChkPw != memPw){
					alert("비밀번호확인을 체크해주세요")
					return;
				}else{
					params["pw"] = memPw;
				}
				
				if(memPhoneF == ""){
					alert("핸드폰 앞 번호를 입력해주세요")
					return;
				}else{
					params["phoneF"] = memPhoneF;
				}
				
				if(memPhoneM == ""){
					alert("핸드폰 가운데 번호를 입력해주세요")
					return;
				}else{
					params["phoneM"] = memPhoneM;
				}
				
				if(memPhoneL == ""){
					alert("핸드폰 뒷 번호를 입력해주세요")
					return;
				}else{
					params["phoneL"] = memPhoneL;
				}
				
				if( memAddrrs2 == ""){
					alert("주소를 입력해주세요")
					return;
				}else{
					params["hAddrs1"] = memAddrrs1;
					params["hAddrs2"] = memAddrrs2;
					params["hZip"] = memZip;
				}
				if(memSex == "선택"){
					alert("성별을 선택해주세요")
					return;
				}else{
					params["sex"] = memSex;
				}
				if(memBirth==""){
					alert("생일을 입력해주세요")
					return;
				}else{
					params["birth"] = memBirth;
				}
				
				console.log(params);
				if(chkBtn == 0){
					alert('중복 확인버튼을 눌러주세요')
				}else if(chkBtn == 1){
					$.ajax({ 
							  type:'post'
							 ,url:'/member/join'
							 ,data: params
							 ,dataType: 'json'
							 ,success: function(result){
								  
								  if(result.code == "0000"){
									  alert('회원가입 되었습니다 환영합니다!');
								      location.href="/sample/login";
								  }else if(result.code == "8888"){
									  alert('code 8888');
							  	  }
							 }
							 ,error : function(request, status, error) {
							     alert('통신오류가 발생하였습니다.');
							 }
						});	//ajax 종료	
				}
			 });//jquery btnsave 
		});//get json
		
		
		$('#chkIdBtn').click(function(){
			const memId = $('#ms_id').val();
			const params ={
				"memId" : memId
			};
			
			
			if(memId == ""){
				alert("아이디를 입력해주세요");
			}else{
				$.ajax({
					type:'post'
				   ,url:'/member/chkIdOverlap'
				   ,data:params
				   ,dataType:'json'
				   ,success:function(result){
					  	if(result.code == "0000"){
					  		alert('사용가능한 아이디 입니다.');
					  		chkBtn = 1;
					  	}else if(result.code == "1111"){
					  		alert('이미 존재하는 아이디 입니다.');
					  		$('#ms_id').val('');
					  	}
				   }
				   ,error:function(request, status, error){
					   alert('통신오류가 발생하였습니다.');
				   }
				});//ajax
			}
			
		});//중복확인 버튼
		
	});	//ready
	</script>
</head>
<body>
  <jsp:include page="./include/navbar.jsp" ></jsp:include>
  
  
	<div id="wrap">
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
					<input type="password" id="ms_password" class="passInput">
				</li>
			</ul>
			<ul class="joinInfoBox">
				<li class="infoList">
					<span class="orangeRed">*</span>
					 비밀번호확인
				</li>
				<li>
					<input type="password" class="ms_passwordChk" class="idInput">
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