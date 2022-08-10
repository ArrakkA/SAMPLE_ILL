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
    
</body>
		
		
		
</body>
</html>