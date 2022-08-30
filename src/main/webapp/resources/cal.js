	let today = new Date(); // 오늘 날짜
	let date = new Date();
	let dayDate;
	$(document).ready(function() {
	let nowYear = (today.getFullYear()).toString();
	let nowMonth = (today.getMonth()+1).toString();
	const nowDay = (today.getDate()).toString();
	build();//달력만듬

	$('.popup-close').on('click', function(){
		$('.popup').css("display", "none");
	}); //팝업 취소 버튼
	$(".head-month").text(nowMonth+ "-" + nowYear);
	$('.head-day').text(nowDay);
	});

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
	   reservationCnt(ymId);
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
						const table = $("#calendar")
						  for(i=0; i<rows.length; i++){
							  const business = rows[i].CL_BUSINESS;
							  const solar = rows[i].CL_SOLAR;
							  const nowDay = rows[i].NOW_DAY;
							  if(business == '2'){
								  $('[id='+ solar + ']').addClass('blue');
							  }else if(business == '3' || business == '4'){
								  $('[id='+ solar + ']').addClass('red');
							  }
							  if(solar < nowDay){
								  $('[id='+ solar + ']').prop("onclick", null).off('click');
								  $('[id='+ solar + ']').addClass('gray');
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
		let td9 = '';
		let td3 = '';
		const tr = $("<tr></tr>");
		const td1 = $("<td class= 'bListDay'>" + tYear +"/"+ tMonth +"/"+ tDay +"</td>");
		const td2 = $("<td class= 'bTime'>" + list.BK_TIME + "</td>");
		if(list.BK_COS == 'A'){
			td3 = $("<td class= 'bCosName'> 동 코스 </td>");
			td9 = $("<td class= 'bCos hiddenKey'>" + list.BK_COS + "</td>");
		}else if(list.BK_COS == 'B'){
			td3 = $("<td class= 'bCos'> 서 코스 </td>");
			td9 = $("<td class= 'bCos hiddenKey'>" + list.BK_COS + "</td>");
		}
		const td4 = $("<td class= 'bRoundf'>" + list.BK_ROUNDF + "</td>");
		const td5 = $("<td class= 'bPerson'>" + list.BK_PERSON + "</td>");
		const td6 = $("<td class= 'bCharge'>" + list.BK_CHARGE + "</td>");
		const td7 = $("<td class='popBtn'> 예약</td>");
		const td8 = $("<td class= 'bDay' style='display: none'>" + tListDay + "</td>");

		tbody.append(tr.append(td1, td2, td3, td4, td5, td6, td7, td8, td9));
	} //table 중복때문에 만듬
	$(document).on('click','.popBtn',function(){

		const bTr = $(this).parent();
		const bDay = bTr.children('.bDay').text();
		const bTime = bTr.children('.bTime').text();
		const bCos = bTr.children('.bCos').text();
		const bRoundf = bTr.children('.bRoundf').text();
		const bPerson = bTr.children('.bPerson').text();
		const blistDay = bTr.children('.bListDay').text();
		const bCosName = bTr.children('.bCosName').text();
		$('.popup').css("display", "flex");

		$('#pDay').text(bDay);
		$('#pCHT').text( bCosName + "/ " + bRoundf +"/ " +bTime);
		$('#pPerson').text(bPerson);
		$('#pCos').text(bCos);
		$('#pTime').text(bTime);
		$('#pListDay').text(blistDay);
	}); // 동적 버튼(팝업생성버튼)
	function reservationCnt(ymId){
		const params ={
			'YMId':ymId
		}
		$.ajax({
			type:'post'
			,url:'/reservation/reservationCnt'
			,data:params
			,dataType:'json'
			,success:function(result){
				if(result.code == "0000"){
					const rows = result.data;
					for(i=0; i<rows.length; i++){
						const realI = (i+1).toString();
						(i < 9)? j ="0"+ realI : j = realI;
						const list = rows[i];
						const cntNum = Number(list.ReservationCnt);
						const realDate = ymId + j

						if( realDate > list.NOW_DAY){
							if( cntNum >= 40) {
								$('[id=' + realDate + ']').append("<div class='leftSeat greenDay'>"+ cntNum +"</div>")
							} else if( cntNum < 40 && cntNum > 20){
								$('[id=' + realDate + ']').append("<div class='leftSeat yellowDay'>"+ cntNum +"</div>")
							}else if( cntNum < 20){
								$('[id=' + realDate + ']').append("<div class='leftSeat redDay'>"+ cntNum +"</div>")
							}
						}
					}
				}
			}
			,error : function(request, status, error) {
				alert('통신오류가 발생하였습니다.');
			}
		})// ajax 끝
	}// 예약 횟수 구현
	$(document).ready(function(){
		$.getJSON('http://api.ipify.org?format=jsonp&callback=?').then(function(data){
			 $('.bkBtn').on('click',function(){
			 const pTr = $(this).parent().parent();
			 const pDay = pTr.find('#pDay').text();
			 const pCos = pTr.find('#pCos').text();
			 const pTime = pTr.find('#pTime').text();
			 const pip = data.ip;
			 console.log(pDay);
			 console.log(pCos);
			 console.log(pTime);
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
			   });//ajax끝
			})//bkBtn
		})//getJson
		$('.cosA').click(function (){
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
						}//for문 끝
					}else{
						alert(result.message);
					}
				}
				,error : function(request, status, error) {
					alert('통신오류가 발생하였습니다.');
				}
			});//ajax 끝
		})
		$('.cosB').click(function(){
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
		})
		$('.all').click(function (){
			getDbReservation(dayDate);
		})
	})//ready
	