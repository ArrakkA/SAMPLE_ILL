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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/navbar.css'/>">
<!-- 로딩바 -->
<div id = "Progress_Loading" style="z-index: 9999">
  <img id="Progress_Img" src="<c:url value='/images/po.gif'/>"/>
</div>
<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/sample/home">Greenit JSP</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/list/getRegisterList">ManagerList</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/sample/calendar">예약 화면</a>
        </li>
      </ul>
      <c:if test="${ SessionUser == null}">
      <ul class="navbar-nav me-auto ">
        <li class="nav-item">
          <a class="nav-link loginBtn " href="/sample/login">
            <span>로그인</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link signUpBtn mb-lg-0" href="/sample/join">
            <span>회원가입</span>
          </a>
        </li>
        </c:if>
      </ul>
      <c:if test="${ SessionUser != null }">
        <ul class="navbar-nav">
          <li class="nav-item">
            <button class="nav-link logout logoutBtn">로그아웃</button>
          </li>
          <li class="nav-item">
            <a class="nav-link mypageBtn" href="/sample/mypage">마이페이지</a>
          </li>
        </ul>
      </c:if>
    </div>
  </div>
</nav>