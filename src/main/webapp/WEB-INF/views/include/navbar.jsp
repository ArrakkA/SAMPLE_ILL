<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<script>
	$(document).ready(function(){
		$('.logout').on('click', function(){
			
			$.ajax({
				type:'post'
			    ,url:'${pageContext.request.contextPath}/member/logout'
			    ,data:''
			    ,dataType:'json'
			    ,success: function(result){
			    	alert(result.status);
			    	location.href="/sample/login";
			    }
			    ,error: function(request, status, error){
			    }
			});//ajax끝
		});//click 이벤트 		
	});//ready
</script>

<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/sample/home">Greenit JSP</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/sample/home">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/sample/calendar">예약 화면</a>
        </li>
	    <c:if test="${ SessionUser == null}">
	        <li class="nav-item">
		        <a class="nav-link" href="/sample/login">로그인</a>
		    </li>
		    <li class="nav-item">
		        <a class="nav-link" href="/sample/join">회원가입</a>
		    </li>
	    </c:if>
	    <c:if test="${ SessionUser != null }">
	        <li class="nav-item">
	        	<button class="nav-link logout">로그아웃</button>
	        </li>
	        <li class="nav-item">
	        	<a class="nav-link" href="/sample/mypage">마이페이지</a>
	        </li>	
	    </c:if> 
     </ul>
    </div> 
  </div>
</nav>