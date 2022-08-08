<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ page import = "javax.servlet.http.HttpSession" %>    
<%

	HttpSession session = request.getSession(false);
	String member = session.getAttribute("SessionId");   
	
%>    
<script>


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
          <a class="nav-link" href="/sample/reservation">예약 화면</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Pricing</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled">Disabled</a>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <c:if test="${member == null}"/>
        <a class="nav-link" href="/sample/login">로그인</a>
        <a class="nav-link" href="/sample/join">회원가입</a>
        <c:if test="${member != null }"/>
        <a class="nav-link" href="/sample/logout">로그아웃</a>
        <a class="nav-link" href="/sample/mypage">마이페이지</a>
      </form>
    </div> 
  </div>
</nav>