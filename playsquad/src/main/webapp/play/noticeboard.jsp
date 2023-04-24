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
<title>TogetherSquad - 공지사항</title>
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
   
</head>
<body>

<jsp:include page="testHeader.jsp"></jsp:include>


	<!-- Page Header -->
	<!-- Set your background image for this header on the line below. -->
	<header class="intro-header"
		style="background-color: #141414">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
					<div class="site-heading"
						style="margin-top: 10px; padding-top: 35px; padding-bottom: 35px">
						<h2>공지사항 게시판</h2>
						<span class="subheading"></span>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="board-field">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		<c:choose>
		<c:when test="${userAuthority == 'Admin_Permissions'}"> <%-- 권한이 있는 경우 --%>
			<div class="board-toolbar" 	style="text-align: right; margin-bottom: 0px">
				<!--<a href="/web/play/noticeboardwrite.jsp?writer_id=${param.writer_id}" class="btn btn-primary btn-sm">-->
				<a href="/web/play/noticeboardwrite.jsp" class="btn btn-primary btn-sm">
				<i class="glyphicon glyphicon-pencil" style="margin-right: 15px;" ></i>쓰기</a>
			</div>
		</c:when>
		</c:choose> 


			<div class="list-group">
				
				<c:forEach items="${notice}" var="i" varStatus="cnt">	
			
				<div class="title">
						<a href="/web/selectNoticeBoard?no=${i.noticeboard_no}" style="color:white;">
							${i.title}<span class="badge"></span>
						</a>
					</div>
					
					<div class="board-meta" style="font-weight: 400; font-size: 1.2rem; color: #141414;">
						<p>
							<i class="glyphicon glyphicon-time"></i>${i.regdate}
						</p>
					</div>
				
				</c:forEach>
				
				
			</div>
			<div class="col-md-2"></div>
			<div class="col-md-8" style="margin-top:500px">
				<ul class="pagination">
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">6</a></li>
				</ul>
			</div>			
		</div>
	</div>
</body>

</html>
