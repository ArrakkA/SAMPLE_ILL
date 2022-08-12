<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
 <jsp:include page="./include/header.jsp" ></jsp:include>
 <script>
	 
 
 $(document).ready(function(){
	 
	 $('#loginBtn').on("click", function(e){
		 const memId = $('#mem_id').val();
		 const memPw = $('#mem_pw').val();
		 let sParams = {};
		 
		 if(memId == "") {
			 alert("아이디를 입력하세요.")
			 return;
		 } else {
			 sParams["id"] = memId;
		 }
		 if(memPw == "") {
			 alert("비밀번호를 입력하세요");
			 return;
		 } else {
			 sParams["pw"]= memPw;
		 }
		 	
		 $.ajax({
	            type:'post',
	            url:'/member/login',
	            dataType:'JSON',
	            data:sParams,
	            success: function(data) {
	                if(data.code === '0000') {
	                 
	                	alert('로그인에 성공하였습니다');
	                	location.href="/sample/home";
	                	
	                } else if(data.code === '1111'){
	                    alert('아이디 및 비밀번호가 일치하지 않습니다');
	                    
	                } else{
	                	 alert('아이디 및 비밀번호가 일치하지 않습니다');
	                }
	                	
	            },
	            error:function (data) {
	                console.log('error');
	            }
	        })
 	})
 	
 })
 </script>

 
 </head>
<body>
 <jsp:include page="./include/navbar.jsp" ></jsp:include>
 


		<div class ="container">
			<div class = "col-lg-4"></div>
			<div class = "col-lg-4">
				<div class= "jumbotron" style="padding-top: 20px">
						<h3 style="text-align:center">로그인 화면</h3>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="아이디" id="mem_id" maxlenght="20">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="비밀번호" id="mem_pw" maxlenght="20">
						</div>
						<button id="loginBtn" class="btn btn-primary">로그인</button>
				</div>
			</div>
		</div>


</body>
</html>