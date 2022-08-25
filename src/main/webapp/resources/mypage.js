$(document).ready(function(){
	getMemberReservation();
	optionMake();
	
	const birthSt = birth.toString();
	const mYear = birthSt.substr(0,4);
	const mMonth = birthSt.substr(4,2);
	const mDay = birthSt.substr(6,2);
	
	$('#ms_sex').val(memSex);
	$('#birth-year').val(mYear);
	$('#birth-month').val(mMonth);
	$('#birth-month').trigger('change');
	$('#birth-day').val(mDay);
	$('#first_phone1').val(fPhone);
	
	$.getJSON('http://api.ipify.org?format=jsonp&callback=?').then(function(data){
		$('#changeBtn').on('click', function(){
			const memNum = $('#ms_num').val();
			const memId = $('#ms_id').val();
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
			
			if($('#birth-month').val()<10){
				month = "0" + $('#birth-month').val();
			}else{
				month = $('#birth-month').val();
			}
			if($('#birth-day').val()<10){
				day = "0" + $('#birth-month').val();
			}else{
				day = $('#birth-month').val();
			}
			const memBirth = year + month + day; 
			const smsChk = $('#smsChk').prop("checked");
			let params = {};
			
			console.log('memBirth');
			
			if(smsChk == true){
				params["smsChk"] = 'Y'
			}else if(smsChk == false){
				params["smsChk"] = 'N'
			}
			
			params["num"]=memNum;
			params["mIP"]= data.ip;
			params["htell"]= memHtell;			
			params["id"] = memId;
			params["name"] = memName;
			
			if(memPhoneF == ""){
				alert("핸드폰 앞 번호를 입력해주세요");
				return;
			}else{
				params["phoneF"] = memPhoneF;
			}
			
			if(memPhoneM == ""){
				alert("핸드폰 가운데 번호를 입력해주세요");
				return;
			}else{
				params["phoneM"] = memPhoneM;
			}
			
			if(memPhoneL == ""){
				alert("핸드폰 뒷 번호를 입력해주세요");
				return;
			}else{
				params["phoneL"] = memPhoneL;
			}
			
			if( memAddrrs2 == ""){
				alert("주소를 입력해주세요");
				return;
			}else{
				params["hAddrs1"] = memAddrrs1;
				params["hAddrs2"] = memAddrrs2;
				params["hZip"] = memZip;
			}
			if(memSex == "선택"){
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
				$.ajax({ 
						  type:'post'
						 ,url:'/member/update'
						 ,data: params
						 ,dataType: 'json'
						 ,success: function(result){
							  if(result.code == "0000"){
								  alert('업데이트가 완료되었습니다.');
							      location.href="home";
							      
							  }else if(result.code == "1111"){
								  alert('code 1111');
						  	  }
						 }
						 ,error : function(request, status, error) {
						     alert('통신오류가 발생하였습니다.');
						 }
					});	//ajax 종료	
			});//jquery btnUpdate
	});//get json
	$('.memDelBtn').click(function(){
		const deletePw = $('#delPassword').val();
		const memId = $('#ms_id').val();
		const memNum = $('#ms_num').val();
		
		const params ={
			pw : deletePw
		   ,id : memId
		   ,num : memNum
		}
		$.ajax({ 
				  type:'post'
				 ,url:'/member/deleteMember'
				 ,data: params
				 ,dataType: 'json'
				 ,success: function(result){
					  if(result.code == "0000"){
						  alert('계정이 삭제되었습니다.');
					      location.href="home";
					      
					  }else if(result.code == "1111"){
						  alert(result.message);
				  	  }
				 }
				 ,error : function(request, status, error) {
				     alert('통신오류가 발생하였습니다.');
				 }
		});	//ajax 종료	
	});// 회원탈퇴 버튼(삭제)
	$('#popup-close').on('click', function(){
		$('.popup').css("display", "none");
	});// 팝업 취소버튼

	$.getJSON('http://api.ipify.org?format=jsonp&callback=?').then(function(data){
		$('#deleteBtn').on('click', function (){
			const pTr = $(this).parent().parent();
			const pDay = pTr.find('#pDay').text();
			const pCos = pTr.find('#pCos').text();
			const pTime = pTr.find('#pTime').text();
			const pNum = pTr.find('#pNum').text();
			const pip = data.ip;

			console.log(pDay);
			console.log(pCos);
			console.log(pTime);
			console.log(pNum);

			const params = {
				"day":pDay
				,"cos":pCos
				,"time":pTime
				,"rNum":pNum
				,"ip":pip
			}
			$.ajax({
				type:'post'
				,url:'/reservation/cancelReservation'
				,data:params
				,dataType:'json'
				,success:function(result){
					if(result.code== '0000'){
						alert('성공적으로 취소되었습니다.')
						location.href = 'mypage';
					}
				}
				,error:function(request, status, error){
					alert('통신오류가 발생했습니다.');
				}
			})// ajax 끝
		});//예약 취소 확정 버튼
	})// get Json

});
function changeContent(i){
		$('[id^=tab]').removeClass('menuOn');
        $('#tab'+i).addClass('menuOn');
        $('[id^=content]').hide();
        $('#content' + i).show();
}
function getMemberReservation(){
	$.ajax({
		type:'post'
	   ,url:'/reservation/getMemberReservation'
	   ,data:''
	   ,dataType:'json'
	   ,success:function(result){
			
			if(result.code=="0000"){
				const rows = result.data;
				const table = $('.memberReservationList');
				table.empty();
				
				for(i=0; i<rows.length; i++){
					const list = rows[i];
					
					const tr = $("<tr></tr>");
					const td1 = $("<td class= 'bNum'>" + list.BK_RSVNO + "</td>");
					const td2 = $("<td class= 'bDay'>" + list.BK_DAY + "</td>");
					const td3 = $("<td class= 'bTime'>" + list.BK_TIME + "</td>");
					const td4 = $("<td class= 'bCos'>" + list.BK_COS + "</td>");
					const td5 = $("<td class= 'bRound>" + list.BK_ROUNDF + "</td>");
					const td6 = $("<td class= 'bPerson'>" + list.BK_PERSON + "</td>");
					const td7 = $("<td class= 'bCharge'>" + list.BK_CHARGE + "</td>");
					const td8 = $("<td class='cancelBtn'><button>예약 취소</button></td>");
					
					table.append(tr.append(td1, td2, td3, td4, td5, td6, td7, td8));	
				}//for 끝
			}//if문
		}
	   ,error:function(request, status, error){
			alert('통신오류가 발생했습니다.');
		}
	})// ajax 끝 
}// 그 사람의 예약정보 가져오기

$(document).on('click','.cancelBtn',function(){

	const bTr = $(this).parent();
	const bDay = bTr.children('.bDay').text();
	const bTime = bTr.children('.bTime').text();
	const bCos = bTr.children('.bCos').text();
	const bRound = bTr.children('.bRound').text();
	const bPerson = bTr.children('.bPerson').text();
	const bNum = bTr.children('.bNum').text();

	$('.popup').css("display", "flex");
	$('#pDay').text(bDay);
	$('#pNum').text(bNum);
	$('#pCHT').text(bCos + "/ " + bRound +"/ " +bTime);
	$('#pPerson').text(bPerson);
	$('#pCos').text(bCos);
	$('#pTime').text(bTime);

}); // 동적 버튼(팝업생성버튼)

function optionMake(){
	yearMake();
	monthMake();
	dayMake();

	$('#birth-month').change(function(){
		dayMake();
	})
	$('#birth-year').change(function(){
		dayMake();
	})
	function dayMake(){
		$('#birth-day').empty();
		const targetYear = $('#birth-year').val();
		const targetMonth = $('#birth-month').val();
		const lastDate = new Date(targetYear, targetMonth, 0);
		const lastDay = lastDate.getDate();
		
		for(i=1; i<=lastDay; i++){
			const op= $("<option>" + i + "</option>");
			(i < 10)? j ="0"+ i : j = i;
			op.attr('value', j);
			$('#birth-day').append(op);			
		}
	}//day 만들기
	function yearMake(){
		const today = new Date();
		const year = today.getFullYear();
		
		$('#birth-year').empty();
		for(i=year-100; i<=year; i++){
			const op= $("<option>" + i + "</option>");
			op.attr('value', i);
			$('#birth-year').append(op);
		}
	}//year 만들기
	function monthMake(){
		$('#birth-month').empty();
		for(i=1; i<=12; i++){
			const op= $("<option>" + i + "</option>");
			(i < 10)? j ="0"+ i : j = i;
			op.attr('value', j);
			$('#birth-month').append(op);
		}
		
	}//month 만들기
}// option 만들기
