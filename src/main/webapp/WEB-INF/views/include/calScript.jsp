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
	let today = new Date(); // 오늘 날짜
	let date = new Date();
		
	
	$(document).ready(function() {
	today = new Date();
	build();
	getDbReservation(today);
	});
	
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
        var tbcal = document.getElementById("calendar");// 테이블 달력을 만들 테이블
        const thisMonth = today.getMonth()+1;
        const yearId = today.getFullYear().toString();
        const monthId = thisMonth.toString();
       
        if(thisMonth <10){
     	   var testId = "0"+ monthId;  
        }else{
     	   var testId = monthId;   
        }// 달이 10이하일시 0 붙이기
       
        const ymId = yearId + testId;
        
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
            	const sunDay = "<div style='color:red' class='registerDay' onclick ='getDbReservation("+ ymId + j +")' id='" +ymId + j +"'>" + i +"</div>";
                cell.innerHTML = sunDay;//일요일에 색
            }
            if (cnt % 7 == 0) {// 1주일이 7일 이므로 토요일 계산
            	 const satDay = "<div style='color: blue' class=' registerDay' onclick ='getDbReservation("+ ymId + j +")' id='"+ymId + j +"'>" + i+ "</div>";				
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
	function goDbDate(today){
    	
		const yearId =today.getFullYear().toString();
		const thisMonth =today.getMonth()+1;
        const monthId =thisMonth.toString();
        
        if(thisMonth <10){
      	   var testId ="0"+ monthId;
      	   
         }else{
      	   var testId =monthId;
         }
        const ymId =yearId + testId;
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
							  
							  if(business == '2'){
								  $('[id='+ solar + ']').addClass('blue');
							  }else if(business == '3' || business == '4'){
								  $('[id='+ solar + ']').addClass('red');
							  }
						  };  
				  }else{
					  alert(result.message);
				  }
			  }
			  ,error : function(result){
			      alert('통신오류가 발생하였습니다.');
			  }
		}); //ajax 끝
	} //goDbDay 끝 

	function getDbReservation(date){
		
		$('.registerList').empty();
		
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
							    var list = rows[i];
								
								const tr = $("<tr></tr>");
								const td1 = $("<td class= 'bDay'>" + list.BK_DAY + "</td>");
								const td2 = $("<td class= 'bTime'>" + list.BK_TIME + "</td>");
								const td3 = $("<td class= 'bCos'>" + list.BK_COS + "</td>");
								const td4 = $("<td class= 'bRoundf'>" + list.BK_ROUNDF + "</td>");
								const td5 = $("<td class= 'bPerson'>" + list.BK_PERSON + "</td>");
								const td6 = $("<td class= 'bCharge'>" + list.BK_CHARGE + "</td>");
								const td7 = $("<td class='bkBtn'><button>예약</button></td>");
									
								tbody.append(tr.append(td1, td2, td3, td4, td5, td6, td7));	
								
							}//for문 끝
				  		}else{
				  			alert(result.message);
				  		}
		  			}
			   ,error : function(result) {
					      alert('통신오류가 발생하였습니다.');
					}
		});//ajax 끝
		
	}//goDbReservation
	
	$(document).on('click',".bkBtn",function(){
				  
		   const bTr = $(this).parent();
		   const bDay = bTr.children('.bDay').text();
		   const bTime = bTr.children('.bTime').text();
		   const bCos = bTr.children('.bCos').text();
		     
		   console.log(bDay);
		   console.log(bTime);
		   console.log(bCos);

	   }); // 동적 버튼생성
		 
		
		
 
    
</script>
    