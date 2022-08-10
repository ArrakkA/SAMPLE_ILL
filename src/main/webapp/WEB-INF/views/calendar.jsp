<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/header.jsp" ></jsp:include>
<jsp:include page="./include/calScript.jsp" ></jsp:include>
</head>
<body onload="build();">
<jsp:include page="./include/navbar.jsp" ></jsp:include>



    <table align="center" id="calendar">
        <tr>
            <td><font size=1%; color="#B3B6B3"><label onclick="beforem()" id="before" ></label></font></td>
            <td colspan="5" align="center" id="yearmonth"></td>
            <td><font size=1%; color="#B3B6B3"><label onclick="nextm()" id="next"></label></font></td>
        </tr>
        <tr>
            <td align="center"><div style ="color: red">SUN</div></td>
            <td align="center"> MON</td>
            <td align="center"> TUE </td>
            <td align="center"> WEN </td>
            <td align="center"> THR </td>
            <td align="center"> FRI </td>
            <td align="center"><div style ="color: blue">SAT</div></td>
        </tr>
    </table>
    
    <table class= "table table-striped table-sm mainTable">
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
							<th>시간</th>
							<th>코스</th>
							<th>홀</th>
							<th>인원</th>
							<th>그린피 가격</th>
							<th>예약</th>
						</tr>
					</thead>
					<tbody class="registerList" id="registerList">
						<c:choose>
							<c:when test="${empty reservationList}">
								<tr><td colspan="5" align="center">예약이 꽉차있습니다.</td></tr>
							</c:when>
							<c:when test="${!empty reservationList}">
								<c:forEach var ="list" items="${reservationList}">
									<tr id="tableNum">
										<td class="bDay" align="center"><c:out value ="${list.BK_DAY}"/></td>
										<td class="bTime" align="center"><c:out value ="${list.BK_TIME}"/></td>
										<td class="bCos" align="center"><c:out value ="${list.BK_COS}"/></td>
										<td class="bRoundf"align="center"><c:out value ="${list.BK_ROUNDF}"/></td>
										<td class="bPerson" align="center"><c:out value="${list.BK_PERSON}"/></td>
										<td class="bCharge" align="center"><c:out value="${list.BKCHARGE}"/></td>
										<td><button class="reservationBtn">예약</button></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				 </table>
	 		</div>
    
    
    
    
</body>
		
		
		
</html>