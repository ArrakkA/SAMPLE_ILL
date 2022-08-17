<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/header.jsp" ></jsp:include>

<script>
$(document).ready(function(){
	
	let today = new Date();
	const thisMonth = today.getMonth()+1;
	
	$('.testdiv1').html((thisMonth +1) + "월");
	
	$('.testdiv1').on('click', function(){
		$('.popup').css("display","flex");
		
	})
	$('.popup-close').on('click', function(){
		$('.popup').css("display","none");
	})
	
	
	
})

</script>

<style>
.blue{
	color:blue
}


.on{

	color:red

}
.popup { /* 팝업이 열렸을 때, 팝업창 주변 전체를 어둡게 합니다 */
  display: none;
  position:fixed;
  width: 100%;
  height: 100%;
  top:0;
  left:0;
  background:rgba(0,0,0,0.5);
}
.popup-inner {  /* 열렸을 때 팝업창 크기와 색상을 지정합니다. */
  position:absolute;
  width: 50%;
  height: 50%;
  top:50%;
  left:50%;
  transform:translate(-50%, -50%);
  padding : 10px;
  background:#fff;
}
.popup-close{ /* 팝업창 내 닫기 버튼의 위치를 지정합니다. */
  position: absolute;
  display: block;
  top:10px;
  right: 10px;
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
	<div>요네가신이됩니다.</div>
</div>
<div class ="page2"> 
	<div>네가신이됩니다.</div>
 </div>
<div class ="page3"> 
	<div>요가신이됩니다.</div>
</div>

<div onclick=""></div>

<div class="popup">  <!-- 표출되는 팝업 입니다. -->
   	<div class="popup-inner">
    	<div class="popup-contents">
     	<a class="popup-close" href="#">X</a> <!-- 팝업 닫기 버튼입니다 -->
     	팝업 내용
     	</div>
   	</div>
</div>



</body>
</html>