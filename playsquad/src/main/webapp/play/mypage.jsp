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
<body>


	<!--header  -->
	<jsp:include page="testHeader.jsp"></jsp:include>
	<!--header  -->

	<main>
		<div class="contents-list"
			style="height: 300px; min-width: 400px; margin-left: 200px; margin-bottom: 150px">
			<div class="text">
				<c:forEach var="i" items="${info}" varStatus="cnt">
				<img src="/web/resources/img/play/upload/profile/${i.profile_img}" style="width: 250px; height: 200px; margin-top: 30px;" /><br>
				<!--<a class="button" href="/web/play/profile.jsp">������ ����</a>-->
				<button type="button" style="background-color: #141414;"
				onclick="location.href='/web/play/viewProfile?id=${userId}'">
				ȸ������ ����</button>
				<h3 style="margin-left: 150px; margin-top: 30">${i.nickname}</h3>
				<h3 style="margin-left: 150px; margin-top: 30">����: ${i.grade} / 5.0</h3>
				<h3 style="margin-left: 150px; margin-top: 30">0 Hosted</h3>
				<h3 style="margin-left: 150px; margin-top: 30">${i.follow_cnt} Followers</h3>
				</c:forEach>	
			</div>

			
		</div>
	</main>

	<section>
		<div class="content-list" style="height: 200px; min-width: 1200px;">
			<h1>��û ������ ������</h1>
	
			<div class="slider">
			<c:forEach var="j" items="${info}" varStatus="cnt">
				<img src="/web/resources/img/play/upload/board/img1.jpg"
					style="width: 250px; height: 200px;" /> 
				<img src="/web/resources/img/play/upload/board/img2.jpg"
					style="width: 250px; height: 200px;" />
				<img src="/web/resources/img/play/upload/board/img3.jpg"
					style="width: 250px; height: 200px;" />
				<img src="/web/resources/img/play/upload/board/img4.jpg"
					style="width: 250px; height: 200px;" />
				<img src="/web/resources/img/play/upload/board/img5.jpg"
					style="width: 250px; height: 200px;" />
			</c:forEach>
			</div>
			
		</div>

		<div class="content-list" style="height: 200px; min-width: 1200px;">
			<h1>�ַ��ϴ� ����</h1>
			<div class="slider">
			<c:forEach var="k" items="${info}" varStatus="cnt">
				<a href="/web/play/gamepage.jsp"> <img
					src="/web/resources/img/play/overwatch2.jpg"
					style="width: 250px; height: 200px;" />
				</a> <a href="/web/play/gamepage2.jsp"> <img
					src="/web/resources/img/play/lostark.jpg"
					style="width: 250px; height: 200px;" />
				</a>
			</c:forEach>
			</div>
			
		</div>


		<div class="content-list" style="height: 200px; min-width: 1200px;">
			<h1>�Խ�Ʈ �ı�</h1>
			<div class="list_cmt">
				<div class="cmt_head"></div>
				<div class="cmt_body">
					<c:forEach var="r" items="${review}" varStatus="cnt">
						<img src="/web/resources/img/play/host.jpg" class="rounded-circle"
							style="width: 50px; height: 30px; margin-top: 30px;" />
						<span class="info_append"> <span class="txt_name">${r.name}</span>
							<span class="txt_bar">|</span> <span class="txt_time">${r.score}</span>
							<span class="txt_bar">|</span> <span class="txt_time">${r.regdate}</span>
						</span>
						<p class="txt_desc">${r.contents}</p>
					</c:forEach>
				</div>
				<div class="cmt_foot"></div>
			</div>
		</div>

		<!--<div class="list-group">
				
				<c:forEach items="${review}" var="i" varStatus="cnt">	
			
				<div class="title">
						<a href="/web/GuestReviewSelect?no=${i.hostreview_no}" style="color:white;">
							${i.title}<span class="badge">New</span>
						</a>
					</div>
					
					<div class="board-meta" style="font-weight: 400; font-size: 1.2rem; color: #141414;">
						<p>
							<i class="glyphicon glyphicon-time"></i>${i.regdate}
						</p>
					</div>
				
				</c:forEach>
				
				
		</div>-->


	</section>
</body>
</html>