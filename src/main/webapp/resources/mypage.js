let today = new Date();
$(document).ready(function(){
	$('#addrsBtn').click(function (){
		$('#mAddres1').attr("disabled", true);
		$('#mZip').attr("disabled", true);
	});
	$('#ms_num').change(function(){
		alert('비정상 적인 접근 방법입니다.')
		location.href = 'mypage';
	});
	$('#ms_id').change(function(){
		alert('비정상 적인 접근 방법입니다.')
		location.href = 'mypage';
	})
	$('#ms_name').change(function(){
		alert('비정상 적인 접근 방법입니다.')
		location.href = 'mypage';
	})
	getMemberReservation();
	optionMake();
	const birthSt = birth.toString();
	const mYear = birthSt.substr(0,4);
	const mMonth = birthSt.substr(4,2);
	const mDay = birthSt.substr(6,2);
	let reservationChk = false;
	$('#ms_sex').val(memSex);
	$('#birth-year').val(mYear);
	$('#birth-month').val(mMonth);
	$('#birth-month').trigger('change');
	$('#birth-day').val(mDay);
	$('#first_phone1').val(fPhone);
	$('#popup-close').on('click', function(){
		$('.popup').css("display", "none");
	});// 팝업 취소버튼

	$('.memDelBtn').click(function(){
		const deletePw = $('#delPassword').val();
		const memId = $('#ms_id').val();
		const memNum = $('#ms_num').val();
		const params = {
			pw: deletePw
			, id: memId
			, num: memNum
		}
		console.log(params);
		$.ajax({
			type: 'post'
			, url: '/member/deleteMember'
			, data: params
			, dataType: 'json'
			, success: function (result) {
				if (result.code == "0000") {
					alert('계정이 삭제되었습니다.');
					location.href = "home";
				} else if (result.code == "1111") {
					alert(result.message);
				}
			}
			, error: function (request, status, error) {
				alert('통신오류가 발생하였습니다.');
			}
		});	//ajax 종료
	});// 회원탈퇴 버튼(삭제)
	$.getJSON('http://api.ipify.org?format=jsonp&callback=?').then(function(data){
		$('#changeBtn').on('click', function(){
			const memNum = $('#ms_num').val();
			const memId = $('#ms_id').val();
			const memName = $('#ms_name').val();
			const memPhoneF = $('#first_phone1').val();
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
			const smsChk = $('#smsChk').prop("checked");

			const params = {
				"num": memNum
				, "mIP": data.ip
				, "htell": memHtell
				, "id": memId
				, "name": memName
			};
			console.log(memBirth);
			if (smsChk == true) {
				params["smsChk"] = 'Y'
			} else if (smsChk == false) {
				params["smsChk"] = 'N'
			}
			if (memPhoneF == "") {
				alert("핸드폰 앞 번호를 입력해주세요");
				return;
			} else {
				params["phoneF"] = memPhoneF;
			}
			if (memPhoneM == "") {
				alert("핸드폰 가운데 번호를 입력해주세요");
				return;
			} else if (memPhoneM.length < 4) {
				alert('핸드폰 가운데 번호 4자리 입력해주세요');
				return;
			} else {
				params["phoneM"] = memPhoneM;
			}
			if (memPhoneL == '') {
				alert("핸드폰 뒷 번호를 입력해주세요");
				return;
			} else if (memPhoneL.length < 4) {
				alert('핸드폰 뒷 번호를 4자리 입력해주세요');
				return
			} else {
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
			if (memSex == 0) {
				alert("성별을 선택해주세요");
				return;
			} else {
				params["sex"] = memSex;
			}
			if (year == "" || month == "" || day == "") {
				alert("생일을 정확히 입력해주세요");
				return;
			} else {
				params["birth"] = memBirth;
			}
			$.ajax({
				type: 'post'
				, url: '/member/update'
				, data: params
				, dataType: 'json'
				, success: function (result) {
					if (result.code == "0000") {
						alert('업데이트가 완료되었습니다.');
						location.href = "home";
					} else if (result.code == "1111") {
						alert('code 1111');
					}
				}
				, error: function (request, status, error) {
					alert('통신오류가 발생하였습니다.');
				}
			});	//ajax 종료
		});// 회원정보 수정 버튼
		$('#cancelBtn').on('click', function (){
			const pTr = $(this).parent().parent();
			const pNum = pTr.find('#pNum1').val();
			const pDay = pTr.children().find('#pDay').val();
			const pip = data.ip;
			console.log(pNum);
			console.log(pDay);
			let params = {
				"rNum":pNum
				,"ip":pip
			}
			const rYear = pDay.substr(0,4);
			const rMonth = pDay.substr(4, 2);
			const rDay = pDay.substr(6,2);
			const rDate = new Date( Number(rYear) , Number(rMonth)-1, Number(rDay)-4, today.getHours()-22);
			reservationChk = today > rDate ? false : true;
			if(reservationChk == false){
				alert('예약 취소가능 기간이 지났습니다.');
			}else if(reservationChk == true){
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
			}//if 문 chk 체크
		});//예약 취소 확정 버튼
		$('#changeReservationBtn').click(function(){
			$('#changeKey').submit();
		})// form 전송
	})// get Json
});//ready
$(document).on('click','.cancelBtn',function(){
	const bTr = $(this).parent();
	const bDay = bTr.children('.bDay').text();
	const bTime = bTr.children('.bTime').text();
	const bCos = bTr.children('.bCos').text();
	const bRound = bTr.children('.bRoundf').text();
	const bPerson = bTr.children('.bPerson').text();
	const bNum = bTr.children('.bNum').text();
	const bPrice = bTr.children('.bChargeView').text();
	const bkTime = bTr.children('.bkTime').text();
	const bListDay = bTr.children('.bListDay').text();

	$('.popup').css("display", "flex");
	$('#pDay').val(bDay);
	$('#pNum').text(bNum);
	$('#pCHT').text(bCos + "/ " + bRound +"/ " +bkTime);
	$('#pPerson').text(bPerson);
	$('#pPrice').text(bPrice);
	$('#pCos').val(bCos);
	$('#pTime').val(bTime);
	$('#pListDay').text(bListDay);
	$('#pNum1').val(bNum);

}); // 동적 버튼(팝업생성버튼)
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
					let tListDay = list.BK_DAY;
					if(tListDay >= list.NOW_DAY){
						const tYear = tListDay.substr(0,4);
						const tMonth = tListDay.substr(4, 2);
						const tDay = tListDay.substr(6,2);
						const bkTime = list.BK_TIME;
						const bHour = bkTime.substr(0,2);
						const bMinute = bkTime.substr(2,2);
						let td4 ='';
						let td7 ='';
						let td9 ='';
						let td10='';
						const tr = $("<tr></tr>");
						const td1 = $("<td class= 'bNum'>" + list.BK_RSVNO + "</td>");
						const td2 = $("<td class= 'bListDay'>" + tYear +"/"+ tMonth +"/"+ tDay +"</td>");
						const td3 = $("<td class= 'bkTime'>" + bHour +":"+ bMinute + "</td>");
						if(list.BK_COS == 'A'){
							td4 = $("<td class= 'bCosName'> 동 코스 </td>");
							td9 = $("<td class= 'bCos hiddenKey'>" + list.BK_COS + "</td>");
						}else if(list.BK_COS == 'B'){
							td4 = $("<td class= 'bCosName'> 서 코스 </td>");
							td9 = $("<td class= 'bCos hiddenKey'>" + list.BK_COS + "</td>");
						}
						const td5 = $("<td class= 'bRoundf'>" + list.BK_ROUNDF + "</td>");
						const td6 = $("<td class= 'bPerson'>" + list.BK_PERSON + "</td>");
						if(list.BK_CHARGE == 'A301'){
							td7 = $("<td class= 'bChargeView'> 17,0000 </td>");
							td10 = $("<td class= 'bCharge hiddenKey'>" + list.BK_CHARGE + "</td>");
						}else{
							td7 = $("<td class= 'bChargeView'> 20,0000 </td>");
							td10 = $("<td class= 'bCharge hiddenKey'>" + list.BK_CHARGE + "</td>");
						}
						const td8 = $("<td class='cancelBtn'><button>취소</button></td>");
						const td11 = $("<td class= 'bTime hiddenKey'>" + list.BK_TIME + "</td>");
						const td12 = $("<td class= 'bDay hiddenKey'>" + tListDay + "</td>");
						table.append(tr.append(td1, td2, td3, td4, td5, td6, td7, td8, td9 ,td10, td11, td12));
					}
				}//for 끝
			}//if문
		}
	   ,error:function(request, status, error){
			alert('통신오류가 발생했습니다.');
		}
	})// ajax 끝
}// 그 사람의 예약정보 가져오기
