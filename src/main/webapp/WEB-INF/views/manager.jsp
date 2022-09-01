<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<jsp:include page="./include/header.jsp" ></jsp:include>
<script>
$(document).ready(function(){

	$('#btnSearch').on('click', function(e){
		
		console.log('click btnSearch')
		
		e.preventDefault();
		var url="${pageContext.request.contextPath}/manager/getRegisterList";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" +$('#keyword').val();
		location.href = url;
		console.log(url);
	});
	$('#btnDelete').on('click', function(){
		var chk = $('tbody>tr>td').find('input:eq(1)');
		var chkBox = $("input[name=deleteChk]:checked");
		chkBox.each(function(i){
			var tr = chkBox.parent().parent();
			var tdC = tr.children('.discrimination');
			var tdNum = tdC.children('.numBox');
			var tdType = tdC.children('.registerType');
			if(tdNum == null){		
				tr.remove();	
			}else{
				tr.hide();
				tdType.val('d');
				chkBox.prop("checked", false);
			}
		});//each문 chkbox수만큼 돌림
	});
	$('#btnAdd').on('click', function(){
		var insertTb = "";
		
		insertTb += '<tr id="tableNum">';
		insertTb += 	'<td align="center"><input type="checkbox" name="deleteChk" class="deleteChk" value="" /></td>';
		insertTb += 	'<td class="mID" align="center">hong1</td>';
		insertTb += 	'<td  class="discrimination" align="center">';
		insertTb += 		'<input class= "mName"></input>';
		insertTb += 		'<input type="hidden" class="registerType" value="i"/>';
		insertTb += 		'<input type="hidden" class="numBox" value=""/>';
		insertTb += 	'</td>';
		insertTb += '	<td class="mSex" align="center">1</td>';
		insertTb += '	<td class="mBirth" align="center">12345678</td>';
		insertTb += '</tr>';
		
		$('#registerList').prepend(insertTb);
	});
	
	$('#btnRegister').on('click', function(){
		
		console.log('click btnRegister')
		
		var infoTr = $('tbody').children();
		var paramArray = new Array();
		
		infoTr.each(function(i,row){
			
			var dcriTd = $(row).children('.discrimination');
			var tdNum= dcriTd.children('.numBox').val();
			var tdType = dcriTd.children('.registerType').val();
			var tdName = dcriTd.children('.mName').val();
			var tdID = $(row).children('.mID').text();
			var tdSex = $(row).children('.mSex').text();
			var tdBirth = $(row).children('.mBirth').text();
		 	
			paramArray.push({
				
				"ms_num" : tdNum
			   ,"ms_id"  : tdID
			   ,"ms_name" : tdName
			   ,"ms_sex" : tdSex
			   ,"ms_birth" :tdBirth
			   ,"ms_type" : tdType
			   
			});
			
		});//each문 돌리기
				
		$.ajax({ 
			
			  type:'post',
			  url:'${pageContext.request.contextPath}/manager/managedata', 
			  contentType: 'application/json',
			  data: JSON.stringify(paramArray),
			  
			  dataType: 'json',
			  success: function(result){
					  console.log(result);
			  },
			  error : function(request, status, error) {
			      alert('통신오류가 발생하였습니다.');
			  }
		});//ajax문
		
	});//btnRegister click
	
});//ready

function fn_prev(page, range, rangeSize, searchType, keyword){
	
	console.log('fn_prev')
	
	var page = ((range-2)* rangeSize) + 1;
	var range = range-1;
	
	var url = "${pageContext.request.contextPath}/manager/getRegisterList";
	url= url + "?page=" +page;
	url= url + "&range=" +range;
	url= url + "&searchType="+ searchType;
	url= url + "&keyword=" + keyword;
	location.href = url;
}//페이지 전버튼

function fn_pagination(page, range, rangeSize, searchType, keyword){
	
	console.log('fn_pagination')
	
	var url = "${pageContext.request.contextPath}/manager/getRegisterList";
	url= url + "?page=" +page;
	url= url + "&range=" +range;
	url = url + "&searchType=" + searchType;
	url = url + "&keyword=" + keyword;
	location.href = url;
}//페이지 표시

function fn_next(page, range, rangeSize, searchType, keyword){

	console.log('fn_next')
	
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	
	var url = "${pageContext.request.contextPath}/manager/getRegisterList";
	url= url + "?page=" + page;
	url= url + "&range=" + range;
	url= url + "&searchType="+ searchType;
	url= url + "&keyword=" + keyword;
	location.href = url;
	
}//페이지 다음버튼
</script>

</head>
<body>
<jsp:include page="./include/navbar.jsp" ></jsp:include>
	<div class="container">
			<div class="table-responsive" style="padding-top: 10px">
				<h2>회원 목록 조회</h2>
				
				<div class="form-group row justify-content-center">
	 			<div class="w100 p-r10">
	 				<select class="form-control form-control-sm" name="searchType" id="searchType">
	 					<option value="name">이름</option>
	 					<option value="id">ID</option>
	 					<option value="sex">성별</option>
	 					<option value="birth">생일</option>
	 				</select>
		 		</div>
		 		<div class="w300 p-r10" style="margin-right: 5px">
		 			<input type="text" class=" form-control form-control-sm" name="keyword" id="keyword" value="${pagination.keyword}" style="margin-right: 5px">
		 			<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
		 		</div>
		 	</div>
				
				<table class= "table table-striped table-sm mainTable">
					<colgroup>
						<col style="width:10%"/>
						<col style="width:auto"/>
						<col style="width:40%"/>
						<col style="width:10%"/>
						<col style="width:10%"/>
					</colgroup>
					
					<thead>
						<tr align="center">
							<th>체크</th>
							<th>ID</th>
							<th>이름</th>
							<th>성별</th>
							<th>생년월일</th>
						</tr>
					</thead>
					<tbody class="registerList" id="registerList">
						<c:choose>
							<c:when test="${empty registerList}">
								<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
							</c:when>
							<c:when test="${!empty registerList}">
								<c:forEach var ="list" items="${registerList}">
									<tr id="tableNum">
									<td align="center"><input type="checkbox" name="deleteChk" class="deleteChk" value=""/></td>
									
										<td  class="mID" align="center"><c:out value ="${list.ms_id}"/></td>
										<td  align="center" class="discrimination">
											<input class="mName" value="<c:out value="${list.ms_name}"/>"/>
											<input type="hidden" class="numBox" value = "${list.ms_num}"/>
											<input type="hidden" class="registerType" value="u"/>
										</td>
											<td class="mSex" align="center"><c:out value="${list.ms_sex}"/></td>
											<td class="mBirth" align="center"><c:out value="${list.ms_birth}"/></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				 </table>
	 		</div>
	 		<div>
	 			<button class= "btn btn-sm btn-primary" id="btnDelete">삭제</button>
	 			<button class= "btn btn-sm btn-primary" id="btnAdd">추가</button>
	 			<button class= "btn btn-sm btn-primary" id="btnRegister">등록</button>
	 		</div>
		 	<div id = "paginationBox">
	 			<ul class="pagination">
	 				<c:if test= "${pagination.prev}">
	 					<li class="page-item"><a class="page-link" href="#" 
	 					onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${search.searchType }', '${search.keyword }' )">
	 					Previous</a></li>
	 				</c:if>
	 				<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
	 					<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
	 					<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${search.searchType }', '${search.keyword }')"> ${idx} </a></li>
	 				</c:forEach>
	 				<c:if test="${pagination.next}">
	 					<li class="page-item"><a class="page-link" href="#" 
	 					onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${search.searchType }', '${search.keyword }' )">
	 					Next</a></li>
	 				</c:if>
	 			</ul>
	 		</div>
	   </div>
	   
	   <div class = "popup">
	   
	   
	   </div>
	   
	   
	   
	   
</body>
</html>