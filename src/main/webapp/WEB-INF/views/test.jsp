<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/header.jsp" ></jsp:include>
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

<script>
$(document).ready(function(){
	let today = new Date();
	const thisMonth = today.getMonth()+1;
	let pwTest = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	let testPw = $('.testPw').val();
	
	$('.testdiv1').html((thisMonth +1) + "월");
	
	$('.testdiv1').on('click', function(){
		$('.popup').css("display","flex");
		
	})
	$('.popup-close').on('click', function(){
		$('.popup').css("display","none");
	})
	
	$('.testdiv2').on('click',function(){
		const result = pwTest.test(testPw);
		console.log(result);
		console.log(testPw);
	})
})
function buttonClick(i){
	console.log('buttonClick'+ i);
}


</script>


</head>
<body>
<jsp:include page="./include/navbar.jsp" ></jsp:include>

<button id ="find_mistake">테스트용도 입니다요</button>
 
<input type="checkbox" name="U_checkAgreement1" id="U_checkAgreement1" value="${sessionScope.SessionUser.MS_BIRTH}" />


<button class="testdiv1 test">1번버튼</button>
<button class="testdiv2 test"> checkbox 버튼</button>
<button class="testdiv3 test">3번버튼</button>




<div>
	<input type="checkbox" id="smsChk"> sms수신에 동의 하시겠습니까?
</div>


<div class ="page1"> 
	<div>요네가신이됩니다.</div>
</div>
<div class ="page2"> 
	<div>네가신이됩니다.</div>
 </div>
<div class ="page3"> 
	<div>요가신이됩니다.</div>
</div>
<div>
	<input type="text" class="testPw"id="testPw"> 제발좀 되봅시다 패스워드 규칙
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
<div class="row text-center py-3 mt-3">
	<div class="col-8 mx-auto d-none d-lg-block">
		<div class="nav-wrapper position-relative end-0">
			<ul class="nav nav-pills nav-fill p-1" role="tablist">
				<li class="nav-item">
					<a class="nav-link mb-0 px-0 py-1 active" data-bs-toggle="tab" role="tab" aria-controls="pos1" aria-selected="true"
					   onclick='buttonClick(1)'>
						POS-1
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link mb-0 px-0 py-1" data-bs-toggle="tab" href="#" role="tab" aria-controls="pos2" aria-selected="false" onclick="buttonClick(2)">
						POS-2
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link mb-0 px-0 py-1" data-bs-toggle="tab" href="#" role="tab" aria-controls="pos3" aria-selected="false">
						POS-3
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link mb-0 px-0 py-1" data-bs-toggle="tab" href="#" role="tab" aria-controls="pos4" aria-selected="false">
						POS-4
					</a>
				</li>
			</ul>
		</div>
	</div>
</div>


</body>
</html>