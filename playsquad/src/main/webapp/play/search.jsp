<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>mypage</title>
<link rel="stylesheet"
   href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
   integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
   crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/play/index.css">


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
<title>�Խù� ���</title>

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
		    <option selected="selected" value="empty">�����ϼ���</option>
		   
	        <option value="hostname">ȣ��Ʈ</option>
		    <option value="title">������</option>

		</select>
		
		<input type="text" name="data" id="data" class="inputText" size="30" style="background:#141414;"/>
		<span class="button" id="search"><a href="#">�˻�</a></span>
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
					
			</colgroup>
			<thead>
			

			<tr>
				<th scope="col" class="fir">����</th>   
				<th scope="col">�г���</th>
				<th scope="col">������</th>
				<th scope="col">���ӽð�</th>
				<th scope="col">�ð�</th>

			</tr>
			</thead>

	<tbody>

		<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.gamegenre_name}</td>
				<td>${list.hostname}</td>
				<td>${list.contents}</td>
				<td>${list.playtime}</td>
				<td>${list.reservedateT}</td>		
			</tr>
		</c:forEach>

		
	</tbody>

</table>
</div>




	
	




</body>
</html>