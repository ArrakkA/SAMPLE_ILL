<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/header.jsp" ></jsp:include>

<script>
$(document).ready(function(){
	$('#find_mistake').on('click', function(){
		
		var testCnt = $('.testdiv').attr('val');
		
		
		
		console.log(testCnt);
				
		
		
	})
})

</script>


</head>
<body>
<jsp:include page="./include/navbar.jsp" ></jsp:include>

<button id ="find_mistake">테스트용도 입니다요</button>
 
<input type="checkbox" name="U_checkAgreement1" id="U_checkAgreement1" value="" />


<div class ="testdiv" val="name"> 요네가신이됩니다. </div>


</body>
</html>