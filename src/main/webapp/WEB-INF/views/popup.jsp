<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <jsp:include page="./include/header.jsp" ></jsp:include>
  <link rel="stylesheet" href="<c:url value='/popup.css'/>">
</head>
<body>
<table id="table1">
  <colgroup>
    <col style="width:10%"/>
    <col style="width:10%"/>
    <col style="width:20%"/>
    <col style="width:10%"/>
    <col style="width:10%"/>
    <col style="width:10%"/>
    <col style="width:10%"/>
  </colgroup>
  <thead>
  <tr align="center">
    <th>날짜</th>
    <th>시간<img class="sort" src="/images/sortimage.png"></th>
    <th>코스<img class="sort" src="/images/sortimage.png"></th>
    <th>홀</th>
    <th>인원<img class="sort" src="/images/sortimage.png"></th>
    <th>그린피 가격<img class="sort" src="/images/sortimage.png"></th>
    <th>예약</th>
  </tr>
  </thead>
  <tbody class="registerList" id="registerList">
  </tbody>
</table>
</body>
</html>
