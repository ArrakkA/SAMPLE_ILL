<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <script>
 
     	$(document).ready(function(){
     		
     		let date = new Date();
     	    
         	
         	const cYear = date.getFullYear();
         	const cMonth = date.getMonth();       
         	
         	const prevLastDay = new Date(cYear, cMonth, 0);
         	const thisLastDay = new Date(cYear, cMonth+1 , 0);
         
         	
         	
         	
         	let pMonthLastDate = prevLastDay.getDate();
         	let tMonthLastDate = thisLastDay.getDate();
         	
         	
         	console.log(pMonthLastDate);
         	console.log(tMonthLastDate);
         	
         	
         	function MakeCalendar(){
         		
         		
         			for (let i = 0; i < 5; i++) {
         				$('.calendarBody').append("<tr>");
         				  for (let i = 1; i < 8; i++) {
         					$('.calendarBody').append("<td><div>"+i+"</div></td>");
         				  }
         				 $('.calendarBody').append("</tr>");
         			}
         		         
         	};
         	
         
         	MakeCalendar();
         	
         	
         	
         	
         	
         		
         		
         	
         	
         		
         		
         		
         		
         	
         	
         	
     		$(".yearMonth").html(cYear +'년 '+ (cMonth+1) + '월'); 
     		
     		
     		
     		
     	})
     	
    </script>