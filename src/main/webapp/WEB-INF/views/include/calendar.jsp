<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <script>
 
     	$(document).ready(function(){
     		
     		let date = new Date();
     	    
         	
         	const cYear = date.getFullYear();
         	const cMonth = date.getMonth();       
         	let yearMonth = cYear+"년 "+(cMonth+1)+"월";
         	
         	const prevLast = new Date(cYear, cMonth, 0);
         	const thisLast = new Data(cYear, cMonth+1, 0);
         	
         	const PLDate = prevLast.getDate();
         	const PLDay = prevLast.getDay();
         	
         	const TLDate = thisLast.getDate();
         	const TLDay = thisLast.getDay();
         	
         	
     		console.log(cYear)
     		
     		$('#year-month').html(yearMonth); 
     		
     		
     		
     		
     	})
     	
    </script>