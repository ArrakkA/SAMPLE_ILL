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
					const td1 = $("<td class= 'bDay'>" + list.BK_DAY + "</td>");
					const td2 = $("<td class= 'bTime'>" + list.BK_TIME + "</td>");
					const td3 = $("<td class= 'bCos'>" + list.BK_COS + "</td>");
					const td4 = $("<td class= 'bRoundf'>" + list.BK_ROUNDF + "</td>");
					const td5 = $("<td class= 'bPerson'>" + list.BK_PERSON + "</td>");
					const td6 = $("<td class= 'bCharge'>" + list.BK_CHARGE + "</td>");
					const td7 = $("<td class='cancelBtn'><button>예약 취소</button></td>");
					
					table.append(tr.append(td1, td2, td3, td4, td5, td6, td7));	

				}//for 끝
			}//if문
		}
	   ,error:function(request, status, error){
			alert('통신오류가 발생했습니다.');
		}
	})// ajax 끝 
}// 그 사람의 예약정보 가져오기
function getMemberInfo(){
	
	$.ajax({
		type:'post'
	   ,url:'/member/getMemberInfo'
	   ,data:''
	   ,dataType:'json'
	   ,success:function(result){
	
			if(result.code=="0000"){
				const data = result.data;
				const birth = data.MS_BIRTH;
				const year = birth.substr(0,4);
				const month = birth.substr(4,2);
				const day   = birth.substr(7,2);
				
				$('#ms_id').text(data.MS_ID);
				$('#ms_name').text(data.MS_NAME);
				$('#first_phone1').text(data.MS_FIRST_PHONE1);
				$('#mid_phone1').text(data.MS_MID_PHONE1);
				$('#last_phone1').text(data.MS_LAST_PHONE1);
				$('#home_tel').text(data.MS_HOMETEL);
				$('#mZip').text(data.MS_HOMEZIP);
				$('#mAddres1').text(data.MS_HOMEADDR1);
				$('#mAddres2').text(data.MS_HOMEADDR2);
				$('#ms_sex').val(data.MS_SEX);
				$('#birth-year').text(year);
				$('#birth-month').text(month);
				$('#birth-day').text(day);
			}
		}
	   ,error:function(request, status, error){
			alert('통신오류가 발생했습니다.');
		}
	});//ajax 
	
}// 회원 정보 가져오기







$(document).ready(function(){
	
	getMemberReservation();
	optionMake();
	getMemberInfo();
})

$(document).on('clcik', '.cancelBtn',function(){
	
})//예약취소 동적버튼 클릭시

function optionMake(){
	let yearOptionMake = false;
	let monthOptionMake = false;
	let dayOptionMake = false;
	
	$('#birth-year').focus(function(){
		if(yearOptionMake == false){
			yearOptionMake = true;
			
			for(i=1940; i<=2022; i++){
				const op= $("<option>" + i + "</option>");
				$('#birth-year').append(op);
			}
		}
	})//년도 option
	$('#birth-month').focus(function(){
		if(monthOptionMake == false){
			monthOptionMake = true;
			for(i=1; i<=12; i++){
				const op= $("<option>" + i + "</option>");
				$('#birth-month').append(op);
			}
		}
	})// 월 option
	$('#birth-day').focus(function(){
		if(dayOptionMake == false){
			dayOptionMake = true;
			for(i=1; i<=31; i++){
				const op= $("<option>" + i + "</option>");
				$('#birth-day').append(op);
			}
		}
	})// 일 option
	
}// option 만들기

