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
	<div align="center" style="margin:100px; color:black; ">
		<select id="query" name="query" style="background:#141414;">
		    <option selected="selected" value="empty" disabled >선택하세요</option>  <!-- disabled option에서 값 고정 -->
		   
	        <option value="hostname">호스트</option>
		    <option value="name">게임</option>

		</select>
		
		<input type="text" name="data" id="data" class="inputText" size="30" style="background:#141414;"/>
		<span class="button" id="search"><a href="#">검색</a></span>
	</div>
		</form>
	
	<div align="center" style="margin">
	
		<table class="bbsList" >

			<colgroup>
				<col width="150" />
				<col width="150" />
				<col width="150" />
				<col width="150" />
				<col width="150" />
				<col width="150" />
					
			</colgroup>
			<thead>
			

			<tr>
				<th scope="col"></th>
				<th scope="col">제목</th>
				<th scope="col" class="fir">게임</th>   
				<th scope="col">닉네임</th>
				<th scope="col">게임시간</th>
				<th scope="col">시간</th>

			</tr>
			</thead>

	<tbody>

		<c:forEach items="${list}" var="list">
			<tr>
			
				<td>
				<a href="/web/squadBoardInfoSelect?no=${list.squadboard_no}&hostId=${list.members_id}">
					<img src="/web/resources/img/play/upload/board/${list.filename}" style="width:100px; height::auto;"/>
				</a>
				</td>
				<td>${list.title}</td>
				<td>${list.gamegenre_name}</td>
				<td>${list.hostname}</td>
				<td>${list.playtime}</td>
				<td>${list.reservedateT}</td>		
			</tr>
		</c:forEach>

		
	</tbody>

</table>




					<div class="paging">
						<a href="listPageSearch?page=1"><img src="/web/resources/img/play/button/btn_first.gif" alt="처음페이지" /></a>
						<c:choose>
						     <c:when test="${pageBean.currentBlock > 1 }">
						     <a href="listPageSearch?page=${pageBean.startPage-1 }"><img src="/web/resources/img/play/button/btn_prev.gif" alt="이전" /></a>
						     </c:when>
						     <c:otherwise>
						     <a href="#"><img src="/web/resources/img/play/button/btn_prev.gif" alt="이전" /></a>
						     </c:otherwise>
						</c:choose>
						<c:choose>
						   <c:when test="${pageBean.currentPage>1 }">
						      <a href="listPageSearch?page=${pageBean.currentPage-1 }"> [Before]</a>
						   </c:when>
						   <c:otherwise>
						   [Before]	
						   </c:otherwise>
						</c:choose>						
											
						<span>
						    <c:forEach var="i" begin="${pageBean.startPage}" end="${pageBean.endPage }">
						      <c:choose>
						        <c:when test="${pageBean.currentPage == i }">
						        	<a href="#"><font size="5" color="red">[${i}]</font></a>
						        </c:when>
						        <c:otherwise>
						         <a href="listPageSearch?page=${i}">[${i}]</a>
						        </c:otherwise>
						      </c:choose>						
							</c:forEach>
						</span>
						<c:choose>
						   <c:when test="${pageBean.currentPage< pageBean.totalPage }">
						      <a href="listPageSearch?page=${pageBean.currentPage+1 }"> [Next]</a>
						   </c:when>
						   <c:otherwise>
						   [Next]	
						   </c:otherwise>
						</c:choose>	
						<c:choose>
						   <c:when test="${pageBean.totalPage > pageBean.endPage }">
						   <a href="listPageSearch?page=${pageBean.endPage+1}"><img src="/web/resources/img/play/button/btn_next.gif" alt="다음" /></a>
						   </c:when>
						   <c:otherwise>
						   <a href="#"><img src="/web/resources/img/button/play/btn_next.gif" alt="다음" /></a>
						   </c:otherwise>
						</c:choose> 						
						 <a href="listPageSearch?page=${pageBean.totalPage}"><img src="/web/resources/img/play/button/btn_last.gif" alt="마지막페이지" /></a>

					</div>


	</div>
	




</body>
</html>