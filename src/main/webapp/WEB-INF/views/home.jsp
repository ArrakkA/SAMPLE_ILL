<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
 <jsp:include page="./include/header.jsp" ></jsp:include>
 <script>
	 $('#login').on("click", function(e){
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
		 	MemDAO dao = new MemDAO();
		 	int result = memDAO.login(mem.getMsId(), mem.getMsPasswaord());
		 	
		 	
			 $.ajax({
				 type:'post',
				 url:'',
				 datatype:'JSON',
				 data{},
				 success: function(data, textStatus) {
					 if(){
						 
					 }else {
						 
					 }
				 },
				 error:function(data, textStatus){
					 alert('에러가 났습니다.')
				 }
				 
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
					<form method="post" action="loginAction.jsp">
						<h3 style="text-align:center">로그인 화면</h3>
						<div class="form-group">
							<input type="text" class="form-control" placeholer="아이디" name="mem_id" maxlenght="20">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholer="비밀번호" name="mem_pw" maxlenght="20">
						</div>
						<input type="submit" id="login" class="btn btn-primary">
					</form>
				</div>
			</div>
		</div>


<jsp:include page="./include/script.jsp" ></jsp:include>
</body>
</html>