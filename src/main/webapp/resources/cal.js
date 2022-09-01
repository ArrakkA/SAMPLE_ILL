
let today = new Date(); // 오늘 날짜
let date = new Date();
let dayDate;
let nowYear = (date.getFullYear()).toString();
let nowMonth = (date.getMonth()+1).toString();
let nowDay = (date.getDate()).toString();
let nowDate = nowYear + nowMonth + nowDay;
$(document).ready(function() {
		build();//달력만듬
	$('.popup-close').on('click', function(){
		$('.popup').css("display", "none");
	}); //팝업 취소 버튼
	$(".head-month").text(nowMonth+ "-" + nowYear);
	$('.head-day').text(nowDay);
	});
	function beforem() //이전 달을 today에 값을 저장
	{
		today = new Date(today.getFullYear(), today.getMonth() - 1);
		build(); //만들기
	}
	function nextm()  //다음 달을 today에 저장
	{
		today = new Date(today.getFullYear(), today.getMonth() + 1);
		build(); //만들기
	}
    function build()
    {
        const nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
        const lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //현재 달의 마지막 날
        const tbcal = document.getElementById("dates");// 테이블 달력을 만들 테이블
        const thisMonth = today.getMonth()+1;
        const yearId = today.getFullYear().toString();
        const monthId = thisMonth.toString();
		$('#dates').empty();
        if(thisMonth <10){
     	   var testId = "0"+ monthId;  
        }else{
     	   var testId = monthId;   
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
        while (tbcal.rows.length > 2) 
        {
            tbcal.deleteRow(tbcal.rows.length - 1);
        }
        var row = null;
        row = tbcal.insertRow();
        var cnt = 0;
        // 1일 시작칸 찾기
        for (i = 0; i < nMonth.getDay(); i++) 
        {
            cell = row.insertCell();
            cnt = cnt + 1;
        }
        // 달력 출력
        for (i = 1; i <= lastDate.getDate(); i++) // 1일부터 마지막 일까지
        { 
        	if(i<10){
        		j = "0"+i; //yyyymmdd찾기용도
        	}else{
        		j = i;
        	}
        	const tdDay =  "<div class='registerDay' onclick ='getDbReservation("+ ymId + j +")' id='"+ymId + j +"'>" + i + "</div>";
            cell = row.insertCell();
            cell.innerHTML = tdDay;
            cnt = cnt + 1;

            if (cnt % 7 == 1) {//일요일 계산
            	const sunDay = "<div class='registerDay' onclick ='getDbReservation("+ ymId + j +")' id='" +ymId + j +"'>" + i +"</div>";
                cell.innerHTML = sunDay;//일요일에 색
            }
            if (cnt % 7 == 0) {// 1주일이 7일 이므로 토요일 계산
            	 const satDay = "<div class=' registerDay' onclick ='getDbReservation("+ ymId + j +")' id='"+ymId + j +"'>" + i+ "</div>";
                cell.innerHTML = satDay;
                row = calendar.insertRow();// 줄 추가
            }
            if(today.getFullYear() == date.getFullYear() && today.getMonth()==date.getMonth() && i==date.getDate()) 
            {
                cell.bgColor = "#BCF1B1";
				//오늘날짜배경색
            }
        } //for 달력만들기
       goDbDate(ymId);
    }//달력 build() 끝
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
				  if(result.code == "0000") {
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

						  if(business == '2'){
							  $('[id='+ solar + ']').addClass('blue');
						  }else if(business == '3' || business == '4'){
							  $('[id='+ solar + ']').addClass('red');
						  }
						  if(solar < nowD || bk > nowBk){
							  $('[id='+ solar + ']').prop("onclick", null).off('click');
							  $('[id='+ solar + ']').addClass('gray');
						  }
						  if( solar >= nowD && bk < nowBk){
							  if( cntNum >= 40) {
								  $('[id=' + solar + ']').append("<div class='leftSeat greenDay'>"+ cntNum +"</div>")
							  } else if( cntNum < 40 && cntNum >= 20){
								  $('[id=' + solar + ']').append("<div class='leftSeat yellowDay'>"+ cntNum +"</div>")
							  }else if( cntNum < 20 && cntNum >0){
								  $('[id=' + solar + ']').append("<div class='leftSeat redDay'>"+ cntNum +"</div>")
							  }else if(cntNum == 0){
								  $('[id='+ solar + ']').prop("onclick", null).off('click');
								  $('[id=' + solar + ']').append("<div class='leftSeat redDay'>"+ cntNum +"</div>")
								  $('[id=' + solar + ']').css("color",'hsl(0,100%,50%,0.3)');
							  }
						  }
					   };
				  }else{
					  alert(result.message);
				  }

			  }
			  ,error : function(request, status, error){
			      alert('통신오류가 발생하였습니다.');
			  }
		}); //ajax 끝
	} //goDbDay 끝
	function getDbReservation(date){
		$('.registerList').empty();
		dayDate = date;
		const dateId = date;
		const params ={
			"dateId":dateId
		}
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
			,error : function(request, status, error) {
					      alert('통신오류가 발생하였습니다.');
			}
		});//ajax 끝
	}//goDbReservation
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

		$('.popup').css("display", "flex");
		$('#pDay').text(bDay);
		$('#pCHT').text( bCosName + "/ " + bRoundf +"/ " +bkTime);
		$('#pPerson').text(bPerson);
		$('#pCos').text(bCos);
		$('#pPrice').text(bPrice);
		$('#pTime').text(bTime);
		$('#pListDay').text(bListDay);

	}); // 동적 버튼(팝업생성버튼)
	$(document).ready(function(){
		$.getJSON('http://api.ipify.org?format=jsonp&callback=?').then(function(data){
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
						console.log(result.message)
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
				console.log(params);
				$.ajax({
					type:'post'
					,url:'/reservation/changeReservation'
					,data:params
					,dataType:'json'
					,success:function(result){
						if(result.code == "0000"){
							console.log(result.message)
							alert('예약이 성공했습니다.');
							location.href = "sample/home";
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
			$('.cosA').click(function (){
				if(dayDate == null){
					alert("날짜를 선택해주세요");
					return;
				}else{
					$('.tab').removeClass('menuOn');
					$('.cosA').addClass('menuOn');
					const params ={
						"dateId": dayDate
					}
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
									if(list.BK_COS == 'A') {
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
			})
			$('.cosB').click(function(){
				if(dayDate == null){
					alert("날짜를 선택해주세요");
					return;
				}else{
					$('.tab').removeClass('menuOn');
					$('.cosB').addClass('menuOn');
					const params ={
						"dateId": dayDate
					}
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
									if(list.BK_COS == 'B') {
										tableMade(list,tbody);
									}
								}//for문 끝
							}else{
								alert(result.message);
							}
						}
						,error : function(request, status, error) {
							alert('통신오류가 발생하였습니다.');
						}
					});//ajax 끝
				}
			})
			$('.all').click(function (){
				if(dayDate == null){
					alert("날짜를 선택해주세요");
					return;
				}else {
					$('.tab').removeClass('menuOn');
					$('.all').addClass('menuOn');
					getDbReservation(dayDate);
				}
			})
	})//ready
	