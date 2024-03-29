$(document).ready(function(){
	let chkBtn = 0;

	$('#addrsBtn').click(function (){
		$('#mAddres1').attr("disabled", true);
		$('#mZip').attr("disabled", true);
	});
	$.getJSON('http://api.ipify.org?format=jsonp&callback=?').then(function(data){
		$('#saveBtn').on('click', function(){
			const memId = $('#ms_id').val();
			const memPw = $('#ms_password').val();
			const memChkPw = $('#ms_passwordChk').val();
			const memName = $('#ms_name').val();
			const memPhoneF =$('#first_phone1').val();
			const memPhoneM = $('#mid_phone1').val();
			const memPhoneL = $('#last_phone1').val();
			const memAddrrs1 = $('#mAddres1').val();
			const memAddrrs2 = $('#mAddres2').val();
			const memSex = $('#ms_sex').val();
			const memZip = $('#mZip').val();
			const memHtell = $('#home_tel').val();
			const year = $('#birth-year').val();
			const month = $('#birth-month').val();
			const day = $('#birth-day').val();
			const memBirth = year + month + day;
			const pwTest = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{10,}$/;
			const smsChk = $('#smsChk').prop("checked");
			let params = {};
			console.log(smsChk);
			if(smsChk){
				params["smsChk"] = 'Y'
			}else{
				params["smsChk"] = 'N'
			}
			params["mIP"]= data.ip;
			params["htell"]= memHtell;
			
			if(memId == ""){
				alert("아이디를 입력해주세요");
				return;
			}else{
				params["id"] = memId;
			}
			if(memPw == ""){
				alert("비밀번호를 확인해 주세요");
				return;
			}else if(!pwTest.test(memPw)){
				alert("비밀번호 규칙이 맞지않습니다.");
				return;
			}
			if(memChkPw == ""){
				alert("비밀번호확인을 정확히 입력해주세요");
				return;
			}else if(memChkPw != memPw){
				alert('비밀번호확인이 비밀번호와 일치하지 않습니다.')
				return;
			}else{				
				params["pw"] = memChkPw;
			}
			if(memName == ""){
				alert("이름을 입력해주세요");
				return;
			}else{
				params["name"] = memName;
			}
			if(memPhoneF == ''){
				alert("핸드폰 앞 번호를 입력해주세요");
				return;
			}else{
				params["phoneF"] = memPhoneF;
			}
			if(memPhoneM == ''){
				alert("핸드폰 가운데 번호를 입력해주세요");
				return;
			}else if(memPhoneM.length < 4){
				alert('핸드폰 가운데 번호 4자리 입력해주세요');
				return;
			}else {
				params["phoneM"] = memPhoneM;
			}
			if(memPhoneL == ''){
				alert("핸드폰 뒷 번호를 입력해주세요");
				return;
			}else if(memPhoneL.length < 4) {
				alert('핸드폰 뒷 번호를 4자리 입력해주세요');
				return;
			} else{
				params["phoneL"] = memPhoneL;
			}
			if(memAddrrs2 == ""){
				alert("상세 주소를 입력해주세요");
				return;
			}else if(memAddrrs1 == "") {
				alert("우편번호 찾기를 눌러주세요");
				return;
			}else {
				params["hAddrs1"] = memAddrrs1;
				params["hAddrs2"] = memAddrrs2;
				params["hZip"] = memZip;
			}
			if(memSex == ''){
				alert("성별을 선택해주세요");
				return;
			}else{
				params["sex"] = memSex;
			}
			if(year =="" || month == "" || day == ""){
				alert("생일을 정확히 입력해주세요");
				return;
			}else{
				params["birth"] = memBirth;
			}
			console.log(params);
			if(chkBtn == 0){
				alert('중복 확인버튼을 눌러주세요');
			}else if(chkBtn == 1){
				$.ajax({
					  type:'post'
					 ,url:'/member/join'
					 ,data: params
					 ,dataType: 'json'
					 ,success: function(result){
						  if(result.code == "0000"){
							  alert('회원가입 되었습니다 환영합니다!');
							  location.href="login";
						  }else if(result.code == "8888"){
							  alert('code 8888');
						  }else if(result.code == "1111"){
							  alert('다시한번 아이디 중복확인을 해주세요 ')
						  }
					 }
					 ,error : function(request, status, error) {
						 alert('통신오류가 발생하였습니다.');
					 }
				});	//ajax 종료
			}
		 });//jquery btn save
	});//get json
	$('#ms_id').change(function (){
		chkBtn = 0;
	});
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
	optionMake();
});	//ready
