
let today = new Date(); // 오늘 날짜
let date = new Date();
let dayDate;
let nowYear = (date.getFullYear()).toString();
let nowMonth = (date.getMonth()+1).toString();
let nowDay = (date.getDate()).toString();
let preemptionCnt = 0;
/** 독점기능을 취소하는 함수*/
function cancelPreemption(){
	const params={
		"id" : memberId
	}
	preemptionCnt = 0;
	$.ajax({
		type:'post'
		,url:'/reservation/cancelPreemption'
		,data:params
		,dataType:'json'
		,success:function(result){
			if(result.code=="0000"){
				console.log("cancelPreemption");
			}else if(result.code=="1111"){
				alert(result.message);
			}else{
				alert('오류입니다.');
			}
		}
		,error : function() {
			alert('통신오류가 발생하였습니다.');
		}
	});//ajax 끝
}
/**윈도우 이탈시 독점기능 제거 */
window.onbeforeunload = function () {
	if(preemptionCnt == 1){
		cancelPreemption();
		alert('지워짐');
	}
};
$(document).ready(function() {
		build();//달력만듬
	$('.popup-close').on('click', function(){
		$('#reservePopup').css("display", "none");
		if(memberId != ''){
			cancelPreemption();
		}

	}); //팝업 취소 버튼
	$(".head-month").text(nowMonth+ "-" + nowYear);
	$('.head-day').text(nowDay);
	});
	/** 이전달로 넘어감 */
	function beforeMonth() //이전 달을 today에 값을 저장
	{
		today = new Date(today.getFullYear(), today.getMonth() - 1);
		build(); //만들기
	}
	/** 다음달로 넘어감 */
	function nextMonth()
	{
		today = new Date(today.getFullYear(), today.getMonth() + 1);
		build(); //만들기
	}
	/** 달력을 만드는 함수*/
    function build()
    {
        const nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
        const lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //현재 달의 마지막 날
        const tbcalendar = document.getElementById("dates");// 테이블 달력을 만들 테이블
        const thisMonth = today.getMonth()+1;
        const yearId = today.getFullYear().toString();
        const monthId = thisMonth.toString();
		let testId;
		$('#dates').empty();
        if(thisMonth <10){
			testId = "0"+ monthId;
        }else{
     	    testId = monthId;
        }// 달이 10이하일시 0 붙이기
        const ymId = yearId + testId;
		console.log(ymId);

        $('#yearmonth').html(yearId + "년 "+ monthId + "월"); //년도와 월 출력
        if(thisMonth == 12) //  눌렀을 때 월이 넘어가는 곳
        {
            $('#before').html((thisMonth -1) + "월");
            $('#next').html("1월");
        }
        else if(today.getMonth()+1==1) //  1월 일 때
        {
        	$('#before').html("12월");
        	$('#next').html((thisMonth +1)+"월");
        }
        else //12월 일 때
        {
        	$('#before').html((thisMonth -1)+"월");
        	$('#next').html((thisMonth +1)+"월");
        }
        // 남은 테이블 줄 삭제
        while (tbcalendar.rows.length > 2) 
        {
            tbcalendar.deleteRow(tbcalendar.rows.length - 1);
        }
        let row;
        row = tbcalendar.insertRow();
        let cnt = 0;
		let cell;
        // 1일 시작칸 찾기
        for (let i = 0; i < nMonth.getDay(); i++)
        {
            cell = row.insertCell();
            cnt = cnt + 1;
        }
        // 달력 출력
		for (let i = 1; i <= lastDate.getDate(); i++) // 1일부터 마지막 일까지
		{
			let j;
			if (i < 10) {
				j = "0" + i; //yyyy-mm-dd 찾기용도
			} else {
				j = i;
			}
			const tdDay = "<div class='registerDay' onclick ='getDbReservation(" + ymId + j + ")' id='" + ymId + j + "'>" + i + "</div>";
			cell = row.insertCell();
			cell.innerHTML = tdDay;
			cnt = cnt + 1;

			if (cnt % 7 == 1) {//일요일 계산
				cell.innerHTML = "<div class='registerDay' onclick ='getDbReservation(" + ymId + j + ")' id='" + ymId + j + "'>" + i + "</div>";//일요일에 색
			}
			if (cnt % 7 == 0) {// 1주일이 7일 이므로 토요일 계산
				cell.innerHTML = "<div class=' registerDay' onclick ='getDbReservation(" + ymId + j + ")' id='" + ymId + j + "'>" + i + "</div>";
				row = calendar.insertRow();// 줄 추가
			}
			if (today.getFullYear() == date.getFullYear() && today.getMonth() == date.getMonth() && i == date.getDate()) {
				cell.bgColor = "#BCF1B1";
				//오늘날짜배경색
			}
		} //for 달력만들기
       goDbDate(ymId);
    }//달력 build() 끝
	/** DB에 있는 달력을 가져오는 함수*/
	function goDbDate(ymId){
        const params ={
				"ymId":ymId
		}
		 $.ajax({ 
			  type:'post'
			  ,url:'/reservation/getCalendar'
			  ,data:params
			  ,dataType: 'json'
			  ,success: function(result){
				  if(result.code === "0000") {
					  const rows = result.data;
					  for(let i=0; i<rows.length; i++){
						  const list = rows[i];
						  const business = list.CL_BUSINESS;
						  const solar = list.CL_SOLAR;
						  const cntNum = Number(list.ReservationCnt);
						  const nowD = list.NOW_DAY;
						  const nowT = list.NOW_TIME;
						  const bkStart = list.CL_BK_START;
						  const bkStartTime = list.CL_BK_START_TIME;
						  const bk = bkStart + bkStartTime;
						  const nowBk = nowD + nowT;
						  const $1 = $('[id='+ solar + ']');

						  if(business == '2'){
							  $1.addClass('blue');
						  }else if(business == '3' || business == '4'){
							  $1.addClass('red');
						  }
						  if(solar < nowD || bk > nowBk){
							  $1.prop("onclick", null).off('click');
							  $1.addClass('gray');
						  }
						  if( solar >= nowD && bk < nowBk){
							  if( cntNum >= 40) {
								  $1.append("<div class='leftSeat greenDay'>"+ cntNum +"</div>")
							  } else if( cntNum < 40 && cntNum >= 20){
								  $1.append("<div class='leftSeat yellowDay'>"+ cntNum +"</div>")
							  }else if( cntNum < 20 && cntNum >0){
								  $1.append("<div class='leftSeat redDay'>"+ cntNum +"</div>")
							  }else if(cntNum == 0){
								  $1.prop("onclick", null).off('click');
								  $1.append("<div class='leftSeat redDay'>"+ cntNum +"</div>")
								  $1.css("color",'hsl(0,100%,50%,0.6)');
							  }
						  }
					   }
				  }else{
					  alert(result.message);
				  }
			  }
			  ,error : function(){
			      alert('통신오류가 발생하였습니다.');
			  }
		}); //ajax 끝
	} //goDbDay 끝
	/** 해당 날짜의 예약정보를 가져오는 함수*/
	function getDbReservation(date){
		console.log(date);
		$('.registerList').empty();
		$('.sort').attr('src', "/images/sortimage.png");
		dayDate = date;
		const dateId = date;
		const params ={
			"dateId":dateId
		}
		$('#dates').find('.nowOn').removeClass('nowOn');
		$('[id='+ dayDate + ']').addClass('nowOn');
		$.ajax({
			type:'post'
			,url:'/reservation/getReservation'
			,data:params
			,dataType:'json'
			,success:function(result){
				if(result.code=="0000"){
					const rows = result.data;
					const tbody = $("#registerList");
					tbody.empty();
					for(i=0; i<rows.length; i++){
						const list = rows[i];
						tableMade(list,tbody);
					}//for문 끝
				}else{
					alert(result.message);
				}
			}
			,error : function() {
					      alert('통신오류가 발생하였습니다.');
			}
		});//ajax 끝
	}//goDbReservation
	/** list 와 body에 맞춰서 테이블을 만들어주는 함수*/
	function tableMade(list,tbody){
		const tListDay = list.BK_DAY;
		const tYear = tListDay.substr(0,4);
		const tMonth = tListDay.substr(4, 2);
		const tDay = tListDay.substr(6,2);
		const bkTime = list.BK_TIME;
		const bHour = bkTime.substr(0,2);
		const bMinute = bkTime.substr(2,2);
		let td3 = '';
		let td6 = '';
		let td9 = '';
		let td7 = '';
		let td10 = '';
		const tr = $("<tr></tr>");
		const td1 = $("<td class= 'bListDay'>" + tYear +"/"+ tMonth +"/"+ tDay +"</td>");
		const td2 = $("<td class= 'bkTime'>" + bHour +":"+ bMinute + "</td>");
		if(list.BK_COS == 'A'){
			td3 = $("<td class= 'bCosName'> 동 코스 </td>");
			td9 = $("<td class= 'bCos hiddenKey'>" + list.BK_COS + "</td>");
		}else if(list.BK_COS == 'B'){
			td3 = $("<td class= 'bCosName'> 서 코스 </td>");
			td9 = $("<td class= 'bCos hiddenKey'>" + list.BK_COS + "</td>");
		}
		const td4 = $("<td class= 'bRoundf'>" + list.BK_ROUNDF + "</td>");
		const td5 = $("<td class= 'bPerson'>" + list.BK_PERSON + "</td>");
		if(list.BK_CHARGE == 'A301'){
			td6 = $("<td class= 'bChargeView'> 17,0000 </td>");
			td10 = $("<td class= 'bCharge hiddenKey'>" + list.BK_CHARGE + "</td>");
		}else{
			td6 = $("<td class= 'bChargeView'> 20,0000 </td>");
			td10 = $("<td class= 'bCharge hiddenKey'>" + list.BK_CHARGE + "</td>");
		}
		if(reservationNumber == ''){
			td7 = $("<td class='popBtn'> 예약</td>");
		}else{
			td7 = $("<td class='popBtn'> 변경</td>");
		}
		const td8 = $("<td class= 'bDay hiddenKey'>" + tListDay + "</td>");
		const td11 = $("<td class= 'bTime hiddenKey'>" + list.BK_TIME + "</td>");
		tbody.append(tr.append(td1, td2, td3, td4, td5, td6, td7, td8, td9, td10, td11));
	} //table 중복때문에 만듬
	/** 코스 tab 선택 기능*/
	function cosSelect(cosName){
		if(dayDate == null){
			alert("날짜를 선택해주세요");
			
		}else{
			$('.sort').attr('src', "/images/sortimage.png");
			$('.tab').removeClass('menuOn');
			$('#'+ cosName).addClass('menuOn');
			const params ={
				"dateId": dayDate
			}
			if(cosName == 'All'){
				getDbReservation(dayDate);
			}else{
				$.ajax({
					type:'post'
					,url:'/reservation/getReservation'
					,data:params
					,dataType:'json'
					,success:function(result){
						if(result.code=="0000"){
							const rows = result.data;
							const tbody = $("#registerList");
							tbody.empty();
							for(let i=0; i<rows.length; i++){
								const list = rows[i];
								if(list.BK_COS == cosName) {
									tableMade(list,tbody);
								}
							}//for 끝
						}else{
							alert(result.message);
						}
					}
					,error : function(request, status, error) {
						alert('통신오류가 발생하였습니다.');
					}
				});//ajax 끝
			}
		}
	}// cosSelect 끝
	$(document).on('click','.popBtn',function(){
		const bTr = $(this).parent();
		const bDay = bTr.children('.bDay').text();
		const bTime = bTr.children('.bTime').text();
		const bCos = bTr.children('.bCos').text();
		const bRoundf = bTr.children('.bRoundf').text();
		const bPerson = bTr.children('.bPerson').text();
		const bListDay = bTr.children('.bListDay').text();
		const bCosName = bTr.children('.bCosName').text();
		const bPrice = bTr.children('.bChargeView').text();
		const bkTime = bTr.children('.bkTime').text();
		$('#reservePopup').css("display", "flex");

		if(memberId == ''){
			console.log(bCos);
			$('#pDay').text(bDay);
			$('#pCHT').text( bCosName + "/ " + bRoundf +"/ " +bkTime);
			$('#pPerson').text(bPerson);
			$('#pCos').text(bCos);
			$('#pPrice').text(bPrice);
			$('#pTime').text(bTime);
			$('#pListDay').text(bListDay);

		}else if(memberId != ''){
			preemptionCnt = 1;
			const params ={
				"id" : memberId
				,"day": bDay
				,"cos": bCos
				,"time": bTime
			}
			$.ajax({
				type:'post'
				,url:'/reservation/preemptionReservation'
				,data:params
				,dataType:'json'
				,success:function(result){
					if(result.code == "0000"){
						$('#pDay').text(bDay);
						$('#pCHT').text( bCosName + "/ " + bRoundf +"/ " +bkTime);
						$('#pPerson').text(bPerson);
						$('#pCos').text(bCos);
						$('#pPrice').text(bPrice);
						$('#pTime').text(bTime);
						$('#pListDay').text(bListDay);
						$('.viewCnt').text("현재 이 시간에 관심있는 사람은 "+ result.data.VIEW_CNT + "명입니다.");
					}else if(result.code= "1111"){
						alert('현재 예약이 불가능한 상품입니다.');
						location.href = "calendar";
					}
				}
				,error:function(request, status, error){
					alert('통신에러가 발생했습니다.');
				}
			});//ajax 끝
		}
	}); // 동적 버튼(팝업생성버튼)
	$(document).ready(function(){
		$.getJSON('http://api.ipify.org?format=jsonp&callback=?').then(function(data){
			/** 예약 버튼 */
			 $('#bkBtn').on('click',function(){
			 const pTr = $(this).parent().parent();
			 const pDay = pTr.find('#pDay').text();
			 const pCos = pTr.find('#pCos').text();
			 const pTime = pTr.find('#pTime').text();
			 const pip = data.ip;
				 const params ={
			   "day":pDay
			  ,"cos":pCos
			  ,"time":pTime
			  ,"ip":pip
			 }
			 $.ajax({
				 type:'post'
				 ,url:'/reservation/setReservation'
				 ,data:params
				 ,dataType:'json'
				 ,success:function(result){
					 if(result.code == "0000"){
						console.log(result.message);
						alert('예약이 성공했습니다.');
						location.href = "home";

					 }else if(result.code == "1111"){
					    alert("이미 예약이 된 예약정보입니다.")
					    location.href = "calendar";
					 }else if(result.code == "2222"){
					    console.log(result.message)
					    alert('로그인 해주세요');
					    location.href = "login";
					 }else{
					    alert('에러가 발생했습니다.');
					 }
			     }
				 ,error:function(request, status, error){
					   alert('통신에러가 발생했습니다.');
				 }
			   });//ajax 끝
			});//bkBtn
			/** 변경 버튼 */
			$('#changeBtn').click(function(){
				const pTr = $(this).parent().parent();
				const pDay = pTr.find('#pDay').text();
				const pCos = pTr.find('#pCos').text();
				const pTime = pTr.find('#pTime').text();
				const pip = data.ip;
				const params ={
					"day":pDay
					,"cos":pCos
					,"time":pTime
					,"ip":pip
					,"rNum":reservationNumber
				}
				$.ajax({
					type:'post'
					,url:'/reservation/changeReservation'
					,data:params
					,dataType:'json'
					,success:function(result){
						if(result.code == "0000"){
							console.log(result.message);
							alert('변경에 성공했습니다.');
							location.href = "/sample/home";

						}else if(result.code == "1111"){
							alert("이미 예약이 된 예약정보입니다.")
							location.href = "/sample/mypage";
						}else{
							alert('에러가 발생했습니다.');
						}
					}
					,error:function(request, status, error){
						alert('통신에러가 발생했습니다.');
					}
				});//ajax 끝
			});//changeBtn
		})//getJson
		/** 코스 선택 tab */
		$('#A, #B, #All').click(function(){
			const idName = this.id;
			cosSelect(idName);
		})

		/** 테이블 칼럼별로 sort 기능 함수 */
		$('#table1 th').each(function (column) {
			$(this).click(function() {
				let sortNum;
				if ($(this).is('.asc')) {	// 현재 오름차순인 경우
					$(this).removeClass('asc');
					$(this).addClass('desc');	// 내림차순으로 변경
					$(this).children().attr('src', "/images/ascimage.png");
					sortNum = -1;
				} else {	// 현재 오름차순 아닌 경우
					$(this).addClass('asc');// 오름차순으로 변경
					$(this).removeClass('desc');
					sortNum = 1;
					$(this).children().attr('src', "/images/descimage.png")
				}
				$(this).siblings().removeClass('asc');
				$(this).siblings().removeClass('desc');
				const rec = $('#table1').find('tbody>tr').get(); //get = 선택한것을 array로 가져옴
				console.log(rec);
				rec.sort(function (a, b) {
					const tdCol1 = $(a).children('td').eq(column).text().toUpperCase();
					const tdCol2 = $(b).children('td').eq(column).text().toUpperCase();
					return (tdCol1 < tdCol2)?-sortNum:(tdCol1 > tdCol2)?sortNum:0;
				});
				$.each(rec, function(index, row) {
					$('#table1 tbody').append(row);
				});
			});
		});// sort
	})//ready
	