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


<body>


	<!--header  -->
	<jsp:include page="testHeader.jsp"></jsp:include>
	<!--header  -->

	<main>
		<div class="center"
			style="height: 400px; min-width: 400px; margin-left: 200px; margin-bottom: 100px">
			<img src="${profile_img}"
				style="width: 250px; height: 200px; margin-top: 30px;" />
			<!-- <span class="rate">평점</span>-->
			<div class="text">
				<h3 style="margin-left: 450px; margin-top: 30">/ 5.0</h3>
				<h3 style="margin-left: 450px; margin-top: 30">0 Hosted</h3>
				<h3 style="margin-left: 450px; margin-top: 30">0 Followers</h3>

			</div>

			<!--             <div class= "text"> -->
			<!--             	<h1 style="margin-left: 400px; margin-top:0">별명*</h1> -->
			<!--             </div> -->

			<!--<div class="buttons">
				<span class="button"> <a href="profile.jsp"
					style="font-size: 1.2rem">프로필 수정</a>
				</span> <br> <span class="button"> <a href="#"
					style="font-size: 1.2rem">팔로우</a>
				</span> <br> <span class="button"> <a href="#"
					style="font-size: 1.2rem">스쿼드 예약</a>
				</span>

			</div>-->
			<div class="buttons">
				<!--<button class="btn" style="background-color: #141414"><a href="profile.jsp"></a>
					<i class="fa-sharp fa-solid fa-gear"></i><span>프로필 수정</span>
					
				</button>-->
				<a class="button" href="profile.jsp">프로필 수정</a>

				<button class="btn" style="background-color: #141414;">
					<i class="fa-solid fa-person"></i><span>팔로우</span>
				</button>
				<button class="btn" style="background-color: #141414;">
					<i class="fa-sharp fa-solid fa-gamepad"></i><span>스쿼드 예약</span>
				</button>
			</div>
		</div>

		<!-- 		div class="profile2" style="height: 500px; min-width: 600px;"> -->
		<!--             <img src="/web/resources/img/play/basic.jpg" style="max-width: 15%; height: auto; margin-right: 300px; margin-top:70px;"/> -->
		<!-- 		</div> -->
	</main>

	<section>
		<div class="content-list" style="height: 200px; min-width: 1200px;">
			<h5>예약 가능한 스쿼드</h5>
			<div class="slider">
				<img src="/web/resources/img/play/squad.jpg"
					style="width: 250px; height: 200px;" /> <img
					src="/web/resources/img/play/squad2.jpg"
					style="width: 250px; height: 200px;" />
			</div>

		</div>

		<div class="content-list" style="height: 200px; min-width: 1200px;">
			<h5>주로하는 게임</h5>
			<div class="slider">
				<a href="gamepage.jsp"> <img
					src="/web/resources/img/play/overwatch2.jpg"
					style="width: 250px; height: 200px;" />
				</a> <a href="gamepage1.jsp"> <img
					src="/web/resources/img/play/lol.jpg"
					style="width: 250px; height: 200px;" />
				</a> <a href="gamepage2.jsp"> <img
					src="/web/resources/img/play/battleground.jpg"
					style="width: 250px; height: 200px;" />
				</a> <a href="gamepage3.jsp"> <img
					src="/web/resources/img/play/lostark.jpg"
					style="width: 250px; height: 200px;" />
				</a>
			</div>
		</div>


		<div class="contents-list" style="height: 200px; min-width: 1200px;">
			<h5>게스트 후기</h5>
			<div class="list_cmt">
				<div class="cmt_head"></div>
				<div class="cmt_body">
					<c:forEach var="r" items="${review}" varStatus="cnt">
						<img src="/web/resources/img/play/host.jpg"
							class="rounded-circle"
							style="width: 50px; height: 30px; margin-top: 30px;" />
						<span class="info_append"> <span class="txt_name">${r.name}</span>
							<span class="txt_bar">|</span> <span class="txt_time">${r.score}</span>
							<span class="txt_bar">|</span> <span class="txt_time">${r.regdate}</span>
						</span>
						<p class="txt_desc">${r.contents}
						</p>
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