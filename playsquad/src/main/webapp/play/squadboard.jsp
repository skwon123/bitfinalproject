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
	
<style type="text/css"></style>


<script type="text/javascript">
$(function() {
	
	if(($("input#attendSH").val() == 'Y') || ($("input#attendAW").val() == 'Y')){
		const fieldset = document.getElementById('btnRequest');
		fieldset.disabled = true;
	}

	
	var squadstate = $("input#squadstate").val();
	// 1분마다 새로고침
	
	// 스쿼드상태에 따른 버튼 
	switch (squadstate)
	{
	case 0:     
	
    break;
	case 1:     
		
	break;    

	case 2:     
		
	break;    

	case 3:     
		
	break;    

	case 4:     
		
	break;    
   
    default :  
      

	}
	
	//신청버튼
	$("button#btnRequest1").click(function(){
		window.open("/web/squadRequsetSelect?no=${squad.squadboard_no}&id=${userId}" , "..", "left=300, top=200, width=500, height=600");
	})
	$("button#btnRequest2").click(function(){
		
		window.open("/web/squadRequsetSelect?no=${squad.squadboard_no}&id=${userId}" , "..", "left=300, top=200, width=500, height=600");
	})
	
});
</script>



<body>
	<!--header  -->
	<jsp:include page="testHeader.jsp"></jsp:include>
	<!--header  -->

	<main>
		<div class="center"
			style="height: 300px; min-width: 400px; margin-left: 200px; margin-bottom: 100px">
			<div id="hiddenData">
				<input type="hidden" name="hostId" id="hostId" value="${squad.members_id}"/>
				<input type="hidden" name="userId" id="userId" value="${userId}"/>
				<input type="hidden" name="squadstate" id="squadstate" value="${squad.squadstate}"/>
				<input type="hidden" name="attendSH" id="attendSH" value="${attendSH}"/>
				<input type="hidden" name="attendAW" id="attendAW" value="${attendAW}"/>
			</div>
			<h2>${squad.title}</h2>
			<img src="/web/resources/img/play/upload/${squad.filename}"
				style="width: 250px; height: 200px; margin-top: 30px;" />
				
			<div class="text">
				<h3 style="margin-left: 1000px; margin-top: 10px">${squad.hostname}</h3>
				<h3 style="margin-left: 1000px; margin-top: 10px">평점 0 / 5.0(댓글수)</h3>
				<h3 style="margin-left: 1000px; margin-top: 10px">스쿼드수 0</h3>
				<div class="buttons"style="margin-left: 1000px; margin-top: 10">
					<a class="button" href="profile.jsp">호스팅 정보</a>
				</div>
			</div>
			
			<div class="text">
				
				<h3 style="margin-left: 1000px; margin-top: 10px">시작시간 ${squad.reservedate}</h3>
				<h3 style="margin-left: 1000px; margin-top: 10px">예상진행시간 ${squad.playtime}분</h3>
				<h3 style="margin-left: 1000px; margin-top: 10px">신청 인원 ${squad.user_acceptcnt}명/${squad.user_maxcnt}명</h3>
				<div class="buttons" style="margin-left: 1000px; margin-top: 10">				
				
					<!-- btnActive / btnDisabled-->
					<c:choose>
						<c:when test="${userId == null}">
							<button type="button" class="btn" id="btnOffer" style="background-color: gray;" onclick="btnDisabled()">
								<span id="spanOffer">로그인해주세여</span>
							</button>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${squad.members_id==userId}">
									<button type="button" class="btn" id="btnEdit" style="background-color: green;" onclick="btnActive()">
										<span id="spanEdit">수정</span>
									</button>
								</c:when>
								<c:otherwise>
									<fieldset id="btnRequest">
									<c:choose>
										<c:when test="${squad.recruitoption==0 && squad.payedstate==0}">
											<button type="button" class="btn" id="btnRequest1" style="background-color: green;" onclick="btnActive()">
												<span id="spanRequest">무료 참가</span>
											</button>
										</c:when>
										<c:when test="${squad.recruitoption==1 && squad.payedstate==0}">
											<button type="button" class="btn" id="btnRequest1" style="background-color: green;" onclick="btnActive()">
												<span id="spanRequest">무료 지원</span>
											</button>
										</c:when>
										<c:when test="${squad.recruitoption==0 && squad.payedstate==1}">
											<button type="button" class="btn" id="btnRequest2" style="background-color: green;" onclick="btnActive()">
												<span id="spanRequest">${squad.price} 유료 참가</span>
											</button>
										</c:when>
										<c:when test="${squad.recruitoption==1 && squad.payedstate==1}">
											<button type="button" class="btn" id="btnRequest2" style="background-color: green;" onclick="btnActive()">
												<span id="spanRequest">${squad.price} 유료 지원</span>
											</button>					
										</c:when>
									</c:choose>
									</fieldset>
								</c:otherwise>
							
							</c:choose>					
							
						</c:otherwise>
					</c:choose>
															
				</div>
			</div>
		</div>
	</main>

	<section>
		<div class="left" style="margin-bottom: 200px; margin-left:200px">
			<h3>스쿼드 설명</h3>
			<h4>${squad.contents}</h4>
		</div>
		<div class="content-list" style="height: 300px; min-width: 1200px;">
			<h5>호스트의 다른 스쿼드</h5>
			<c:forEach var="j" items="${squadList}" varStatus="cnt">

					<div class="title">
						<a href="/web/squadBoardInfoSelect?no=${j.squadboard_no}&hostid=${j.members_id}">
						<img src="/web/resources/img/play/${j.gamegenre_game_img}"
							style="width: 140px; height: 80px; margin-top: 30px;" /> 
							${j.title} 
						</a>
					</div>
					
					<div class="board-meta" style="font-weight: 400; font-size: 1.2rem; color: #141414;">
						<p>
							<i class="glyphicon glyphicon-user"></i> ${j.gamegenre_name}
							<i class="glyphicon glyphicon-time"></i> ${j.reservedate}
							<i class="glyphicon glyphicon-eye-open"></i> ${j.squadstate_statename}
						</p>
					</div>
				

			</c:forEach>
			
			<h5>게스트 후기</h5>
			<div class="list_cmt">
				<div class="cmt_head"></div>
				<div class="cmt_body">
					<c:forEach var="r" items="${reviewList}" varStatus="cnt">
						<img src="/web/resources/img/play/${r.profile_img}" class="rounded-circle"
							style="width: 50px; height: 30px; margin-top: 30px;" /> 
							<span class="info_append"> <span class="txt_name">${r.name}</span>
							<span class="txt_bar">|</span> <span class="txt_time">${r.score}</span>
							<span class="txt_bar">|</span> <span class="txt_time">${r.regdate}</span>
							<span class="txt_bar">|</span> <span class="txt_time">좋아요 버튼 / 좋아요수</span>
						</span>
						<p class="txt_desc">${r.contents} <a href="#none">신고</a></p>
					</c:forEach>
				</div>
			</div>
						
		</div>
		
	</section>
	
<footer>
	<jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>