<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/header.jsp" ></jsp:include>
<script>
$(document).ready(function(){
	

	$.getJSON('https://api.ipify.org?format=jsonp&callback=?').then((data)=>{
		let ip = [] ;
        ip = data.ip;
        
        const mIP = ip;
        
        $('#testBtn').on('click', function(){
        	
        	console.log(mIP)
        	
        });
	});
	
});


</script>
</head>
<body>
<jsp:include page="./include/navbar.jsp" ></jsp:include>

<button id ="testBtn">테스트용 확인버튼입니다</button>
   

<jsp:include page="./include/script.jsp" ></jsp:include>
</body>
</html>