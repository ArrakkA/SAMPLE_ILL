<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/header.jsp" ></jsp:include>

<script>
$(document).ready(function(){
	
	$(".testdiv1").on('click', function(){
	
		$('.testdiv1').addClass('on');
		$('.page1').show();
		$('.page2').hide();
		$('.page3').hide();
	})
	
	$(".testdiv2").on('click', function(){
	
		$('.testdiv2').addClass('on');
		$('.page2').show();
		$('.page1').hide();
		$('.page3').hide();
		
	})
	
	$(".testdiv3").on('click', function(){
	
		$('.testdiv3').addClass('on');
		$('.page3').show();
		$('.page2').hide();
		$('.page1').hide();
	})
	
	$('.test').addClass('blue');
	
	
	
})




</script>

<style>
.blue{
	color:blue
}


.on{

	color:red

}

</style>


</head>
<body>
<jsp:include page="./include/navbar.jsp" ></jsp:include>

<button id ="find_mistake">테스트용도 입니다요</button>
 
<input type="checkbox" name="U_checkAgreement1" id="U_checkAgreement1" value="" />


<button class="testdiv1 test">1번버튼</button>
<button class="testdiv2 test">2번버튼</button>
<button class="testdiv3 test">3번버튼</button>



<div class ="page1"> 
	<div>나 페이지</div>
	<div>요네가신이됩니다.</div>
</div>

<div class ="page2"> 
	<div>나 페이지</div>
	<div>네가신이됩니다.</div>
 </div>
<div class ="page3"> 
	<div>나 페이지</div>
	<div>요가신이됩니다.</div>
</div>

<div onclick=""></div>


</body>
</html>