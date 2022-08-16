<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/header.jsp" ></jsp:include>
<%--<jsp:include page="./include/calScript.jsp"></jsp:include>--%>
<script>

	let mYear, mMonth;

	$(document).ready(function() {
		const date = new Date();

		mYear = date.yyyy();
		mMonth = date.mm();

		getCalendar();
	});

	function getCalendar() {
		const url = "/reservation/getCalendar";
		const params = {
			"yMId" : mYear + mMonth
		}

		$.ajax({
			type:'post'
			,url:url
			,data:params
			,dataType: 'json'
			,success: function(result){
				if(result.code == "0000") {
					const rows = result.data;
					const table = $("#calendar").children("tbody");
					table.empty();

					if(rows.length > 0) {
						const tr = $("<tr></tr>");

						for(i=7; i<14; i++) {
							const td = $("<td>" + rows[i].CL_SOLAR.substring(6, 8) + "</td>")

							td.data("date", rows[i].CL_SOLAR);
							td.on("click", function() {
								const dateId = $(this).data("date");

								getReservation(dateId);
							});
							tr.append(td);
						}

						table.append(tr)
					}
				} else {
					alert(result.message);
				}
			}
			,error : function(result) {
				alert('통신오류가 발생하였습니다.');
			}
		});
	}

	function getReservation(dateId) {
		const url = "/reservation/getReservation";
		const params = {
			"dateId" : dateId
		}

		$.ajax({
			type:'post'
			,url:url
			,data:params
			,dataType: 'json'
			,success: function(result){
				if(result.code == "0000") {
					const rows = result.data;
					const tbody = $("#registerList");
					tbody.empty();

					for (i = 0; i < rows.length; i++) {
						const tr = $("<tr></tr>");
						const td1 = $("<td>" + rows[i].BK_DAY + "</td>");
						const td2 = $("<td>" + rows[i].BK_TIME + "</td>");
						const td3 = $("<td></td>");
						const td4 = $("<td></td>");
						const td5 = $("<td></td>");
						const td6 = $("<td></td>");
						const td7 = $("<td></td>");

						tbody.append(tr.append(td1, td2, td3, td4, td5, td6, td7))
					}

					console.log(rows);
				} else {
					alert(result.message);
				}
			}
			,error : function(result) {
				alert('통신오류가 발생하였습니다.');
			}
		});

	}

	function getDateFormat(sDate) {
		return new Date(sDate.substring(0, 4) + "-" + sDate.substring(4, 6) + "-" + sDate.substring(6, 8))
	}

	function addDate(sDate, value) {
		var day = Number(sDate.substring(6, 8)) + value;

		return new Date(sDate.substring(0, 4), Number(sDate.substring(4, 6)) - 1, day);
	}

	function addMonth(sDate, value) {
		var month = Number(sDate.substring(4, 6)) + (value - 1);

		return new Date(sDate.substring(0, 4), month, 1);
	}

	function addMonth2(sDate, value) {
		var month = Number(sDate.substring(4, 6)) + (value - 1);

		return new Date(sDate.substring(0, 4), month, Number(sDate.substring(6, 8)));
	}

	Date.prototype.yyyymmddhhmm = function() {
		var mm = this.getMonth() + 1;
		var dd = this.getDate();
		var hh = this.getHours();
		var mi = this.getMinutes();

		return [this.getFullYear(), (mm>9 ? '' : '0') + mm, (dd>9 ? '' : '0') + dd, (hh>9 ? '' : '0') + hh, (mi>9 ? '' : '0') + mi].join('');
	};

	Date.prototype.yyyymmdd = function() {
		var mm = this.getMonth() + 1;
		var dd = this.getDate();

		return [this.getFullYear(), (mm>9 ? '' : '0') + mm, (dd>9 ? '' : '0') + dd].join('');
	};

	Date.prototype.yyyymm = function() {
		var mm = this.getMonth() + 1;

		return [this.getFullYear(), (mm>9 ? '' : '0') + mm].join('');
	};

	Date.prototype.yyyy = function() {
		return this.getFullYear();
	};

	Date.prototype.yy = function() {
		return this.getFullYear().toString().substring(2, 4)
	};

	Date.prototype.mm = function() {
		var mm = this.getMonth() + 1;

		return (mm>9 ? '' : '0') + mm;
	};

	Date.prototype.dd = function() {
		var dd = this.getDate();

		return (dd>9 ? '' : '0') + dd;
	};

	Date.prototype.week = function() {
		var week = ['일', '월', '화', '수', '목', '금', '토'];

		var dayOfWeek = week[this.getDay()];

		return dayOfWeek;
	};

	Date.prototype.hh = function() {
		var hh = this.getHours();

		return (hh>9 ? '' : '0') + hh;
	};

	Date.prototype.weeknum = function() {
		return this.getDay();
	};

</script>
</head>
<body>
<jsp:include page="./include/navbar.jsp" ></jsp:include>



    <table align="center" id="calendar">
        <tr>
            <td><font size=1%; color="#B3B6B3"><label onclick="beforem()" id="before" ></label></font></td>
            <td colspan="5" align="center" id="yearmonth"></td>
            <td><font size=1%; color="#B3B6B3"><label onclick="nextm()" id="next"></label></font></td>
        </tr>
        <thead>
        	 <tr>
	            <td style="align:center"><div style ="color: red">SUN</div></td>
	            <td style="align:center"> MON</td>
	            <td style="align:center"> TUE </td>
	            <td style="align:center"> WEN </td>
	            <td style="align:center"> THR </td>
	            <td style="align:center"> FRI </td>
	            <td style="align:center"><div style ="color: blue">SAT</div></td>
        	</tr>
        </thead>
		<tbody>

		</tbody>
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
					</tbody>
				 </table>
	 		</div>
    
    
    
    
</body>
		
		
		
</html>