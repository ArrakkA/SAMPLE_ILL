<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
<style>

table
    {
    	margin-top : 30px;
        border:1px solid #BDBDBD;
        text-align:center;
        width:30%;
    }
    
.blue{

	color:blue
}
.red{
	
	color:red
}
.gray{

	color:#808080
	
}
</style>


  
<script> //달력만들기



    var today = new Date(); // 오늘 날짜
    var date = new Date();
 
    function beforem() //이전 달을 today에 값을 저장
    { 
        today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
        build(); //만들기
    }
    
    function nextm()  //다음 달을 today에 저장
    {
        today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
        build(); //만들기
    }
    
    function build()
    {
        var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
        var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //현재 달의 마지막 날
        var tbcal = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
        var yearmonth = document.getElementById("yearmonth");//  년도와 월 출력할곳
        
        const thisMonth = today.getMonth()+1;
        
        console.log(thisMonth);
        
        const yearId = today.getFullYear().toString();
        const monthId = thisMonth.toString();
        
        if(thisMonth <10){
     	   var testId = "0"+ monthId;
     	   console.log('10보다 작음');
     	   
        }else{
     	   var testId = monthId;
     	   console.log('10보다 큼');
        }
         
        console.log(testId);      
     
        const yMId = yearId + testId;
        
        console.log(yMId);
        
        	
        yearmonth.innerHTML = yearId + "년 "+ monthId + "월"; //년도와 월 출력
        
  	
        
        
        
        if(thisMonth==12) //  눌렀을 때 월이 넘어가는 곳
        {
            before.innerHTML=(thisMonth -1)+"월";
            next.innerHTML="1월";

        }
        else if(today.getMonth()+1==1) //  1월 일 때
        {
	        before.innerHTML="12월";
	        next.innerHTML=(thisMonth +1)+"월";
        }
        else //   12월 일 때
        {
            before.innerHTML=(thisMonth -1)+"월";
            next.innerHTML=(thisMonth +1)+"월";
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
        	
        	const tdDay =  "<div class='registerDay' onclick ='goDbDate("+ yMId + j +")' id='"+yMId + j +"'>" + i + "</div>";
            cell = row.insertCell();
            cell.innerHTML = tdDay;
            cnt = cnt + 1;
            
            
            
            if (cnt % 7 == 1) {//일요일 계산
            	const sunDay = "<div style='color:red' class='registerDay' onclick ='goDbDate("+ yMId + j +")' id='" +yMId + j +"'>" + i +"</div>";
            	
                cell.innerHTML = sunDay;//일요일에 색
            }
            if (cnt % 7 == 0) {// 1주일이 7일 이므로 토요일 계산
            	 const satDay = "<div style='color: blue' class=' registerDay' onclick ='goDbDate("+ yMId + j +")' id='"+yMId + j +"'>" + i+ "</div>"	;				
                cell.innerHTML = satDay;
                row = calendar.insertRow();// 줄 추가
            }
            if(today.getFullYear() == date.getFullYear() && today.getMonth()==date.getMonth() && i==date.getDate()) 
            {
                cell.bgColor = "#BCF1B1"; //오늘날짜배경색
            }
        } //for 달력만들기
        
       goDbDate(today);
        
    }//달력 build() 끝
    
	function goDbDate(day){
		
		$('.registerList').empty();
		
		const today = new Date();
		const yearId = today.getFullYear().toString();
		const thisMonth = today.getMonth()+1;
        const monthId = thisMonth.toString();
        
        if(thisMonth <10){
      	   var testId = "0"+ monthId;
      	   
         }else{
      	   var testId = monthId;
         }
        
        
        const yMId = yearId + testId;
        
		const params = {};
		
		 const dateId = day;
		 params["dateId"] = dateId;
		 params["yMId"] = yMId;
		 
		 
		 $.ajax({ 
				
			  type:'post'
			  ,url:'/reservation/getCalendarInfo'
			  ,data:params
			  ,dataType: 'json'
			  ,success: function(result){
				  
					  
						  for(i=0; i<result.calendar.length; i++){
							  const business = result.calendar[i].CL_BUSINESS;
							  const solar = result.calendar[i].CL_SOLAR;
							  
							  if(business == '2'){
								  $('[id='+ solar + ']').addClass('blue');
							  }else if(business == '3' || business == '4'){
								  $('[id='+ solar + ']').addClass('red');
							  }
							  
							 
							  
							  
						  };
						  
						  
						  
						  for(i=0; i<result.reservation.length; i++){
							  
							  var list = result.reservation[i];
							 
							  var insertTb = "";
								
								insertTb += '<tr id="reservationTable" class="table"></tr>';
								insertTb += 	'<td align="center" class="bDay">';
								insertTb +=	     list.BK_DAY;
								insertTb +=     '</td>';
								insertTb += 	'<td class="bTime" align="center">';
								insertTb +=	     list.BK_TIME;
								insertTb +=     '</td>';
								insertTb += 	'<td class="bCos" align="center">';
								insertTb +=	     list.BK_COS;
								insertTb +=     '</td>';
								insertTb += 	'<td class="bRound" align="center">';
								insertTb +=	     list.BK_ROUNDF;
								insertTb +=     '</td>';
								insertTb += 	'<td class="bPerson" align="center">';
								insertTb +=	     list.BK_PERSON;
								insertTb +=     '</td>';
								insertTb += 	'<td class="bCharge" align="center">';
								insertTb +=	     list.BK_CHARGE;
								insertTb +=     '</td>';
								insertTb += 	'<td class="bkBtn" align="center"><button>예약</button></td>';
								insertTb += '</tr>';
								
								$('.registerList').append(insertTb);
							  
						  }
						  
						  
					  
					  
					  //1. 달력에 대한 예약정보를 가져와야겠다. 별도의  ajax 호출
				       //그후 그 결과를 for 돌면서 날짜 ID로 접근하여 날짜별 상태를 변경해준다.
				      //오픈이면 놔두고 비오픈일시 disabled한다. 
				      
				     
				       
				       //result.시트로우
					  //2.그리드의 로우를 그려야 해요.
			  }
			  ,error : function(result) {
			      alert('통신오류가 발생하였습니다.');
			  }
		
		}); //ajax 끝
		 
	} //goDbDay 끝 
		 
	$(document).on('click',".bkBtn",function(){
				  
		   const bTr = $(this).parent().parent();
		   const bDay = bTr.children('.bDay').text();
		   const bTime = bTr.children('.bTime').text();
		   const bCos = bTr.children('.bCos').text();
		   
		   
		   console.log(bDay);
		   console.log(bTime);
		   console.log(bCos);
   
			   
		   
	   }); // 동적 버튼생성
		 
		
		
 
    
</script>
    