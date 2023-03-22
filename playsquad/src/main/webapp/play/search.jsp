<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SquadBoard</title>
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/play/index.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">

</head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
        
</script>

<head>
<title>게시물 목록</title>

<script>
$(function(){
	 $("span#search a").click(function(){
		if($("#query").val().length==0|| $("#data").val().length==0){
			alert('query or data Check!');
			$("select#query").prop("selectedIndex",0);
			$("input#data").val('');
			return false;
		}
		$("form").submit();
	 }) 
 });
</script>


</head>
<body>

	<jsp:include page="testHeader.jsp"></jsp:include>

<form action="listPageSearch" method="get">
	<div align="center" style="margin:200px; color:black; background:#141414;">
		<select id="query" name="query" >
		    <option selected="selected" value="empty">선택하세요</option>
		   
	        <option value="hostname">호스트</option>
		    <option value="title">컨텐츠</option>

		</select>
		
		<input type="text" name="data" id="data" class="inputText" size="30" />
		<span class="button" id="search"><a href="#">검색</a></span>
	</div>

	
		<table class="bbsWrite mgb35">
			<caption></caption>
			<colgroup style="margin:200px;">
				<col width="30" />
				<col width="100" />
				<col width="100" />
				<col width="100" />
				<col width="100" />
				<col width="100" />		
			</colgroup>
		</table><!-- formend -->
		</form>

		<table class="bbsList">
			<colgroup>
				<col width="120" />
				<col width="120" />
				<col width="120" />
				<col width="120" />
				<col width="120" />
					
			</colgroup>
			<thead>
			

			<tr>
				<th scope="col" class="fir">게임</th>   
				<th scope="col">닉네임</th>
				<th scope="col">컨텐츠</th>
				<th scope="col">게임시간</th>
				<th scope="col">시간</th>

			</tr>
			</thead>

	<tbody>

		<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.gamegenre_no}</td>
				<td>${list.hostname}</td>
				<td>${list.contents}</td>
				<td>${list.playtime}</td>
				<td>${list.regdate}</td>		
			</tr>
		</c:forEach>

		
	</tbody>

</table>





	
	




</body>
</html>