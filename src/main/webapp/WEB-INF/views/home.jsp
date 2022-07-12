<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Greenit JSP</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
 </head>
<body>
<jsp:include page="./include/navbar.jsp" >


<div class ="container">
	<div class = "col-lg-4"></div>
	<div class = "col-lg-4">
		<div class= "jumbotron" style="padding-top: 20px">
			<form method="post" action="loginAction.jsp">
				<h3 style="text-align:center">로그인 화면</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholer="아이디" name="MS_ID" maxlenght="20">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholer="비밀번호" name="MS_PASSWORD" maxlenght="20">
				</div>
				<input type="submit" class="btn btn-primary">
			</form>
		</div>
	</div>
</div>


<script src="js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
</body>
</html>