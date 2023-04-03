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
$(function() {
		
	});

</script>
<body>
	<jsp:include page="testHeader.jsp"></jsp:include>
	<main>		
			
	

	</main>
	<section>

		<div class="list" style="margin-bottom: 20px; margin-left:250px;">
		<h1 style="margin-bottom: 20px;">참가 중인 스쿼드</h1>
		<c:if test="${empty GSquadList}">
        	<h4 style="color:gray">현재 참가 중인 스쿼드가 없습니다.</h4>
    	</c:if>
		<c:forEach var="i" items="${GSquadList}" varStatus="cnt">
			
			<c:choose>
			<c:when test="${cnt.index % 4 == 0}">
			<table>
				<tr>
			</c:when>
			</c:choose>
			<td>
				<table border="1" bordercolor="white">
					<tbody>
						<tr>
							<td colspan="2">${i.title}</td>
						</tr>
						<tr>
							<td rowspan="5">
							<a href="/web/squadBoardInfoSelect?no=${i.squadboard_no}&hostId=${i.members_id}">
									<img src="/web/resources/img/play/${i.gamegenre_game_img}" style="width: 200px; height: 120px;" />
							</a>
							</td>
						</tr>
						<tr>
							<td>${i.hostname}</td>
						</tr>
						<tr>
							<td>${i.gamegenre_name}</td>
						</tr>
						<tr>
							<td>${i.reservedate}</td>
						</tr>
						<tr>
							<td>
							<c:choose>
							<c:when test="${i.recruitoption=='0'}">
							선착순
							</c:when>
							<c:when test="${i.recruitoption=='1'}">
							모집제
							</c:when>
							</c:choose>
							${i.user_acceptcnt}/${i.user_maxcnt}
							</td>
						</tr>
						<tr>
						<td colspan="2">
						<div align="right" >
							<c:choose>
							<c:when test="${i.squadstate== 0 || i.squadstate== 1}">
							<button type="button" class="btn" id="btnDeleteGuest" style="background-color: red;margin: auto; " 
								onclick="window.open('/web/play/squadDelete.jsp?no=${i.squadboard_no}&job=guest&rc=${i.recruitoption}' , '..', 'left=300, top=200, width=600, height=500')"> 
								<span id="span">취소</span>
							</button>
							</c:when>
							<c:when test="${i.squadstate== 2}">
							<button type="button" class="btn" id="btnPlaying" style="background-color: green;margin: auto; ">
								<span id="span">진행중</span>
							</button>
							</c:when>
							</c:choose>
							
						</div>
						</td>
						</tr>
					</tbody>
				</table>
			</td>
			<c:choose>
				<c:when test="${cnt.index % 4 == 3 || cnt.last}">
					</tr>
				</table>
				</c:when>
			</c:choose>
		</c:forEach>
		</div>
		
		<div class="list" style="margin-bottom: 20px; margin-left:250px;">
		<h1 style="margin-bottom: 20px;">호스팅 중인 스쿼드</h1>
		<c:if test="${empty HSquadList}">
        	<h4 style="color:gray">현재 호스팅 중인 스쿼드가 없습니다.</h4>
    	</c:if>
		<c:forEach var="i" items="${HSquadList}" varStatus="cnt">
			
			<c:choose>
			<c:when test="${cnt.index % 4 == 0}">
			<table>
				<tr>
			</c:when>
			</c:choose>
			<td>
				<table border="1" bordercolor="white">
					<tbody>
						<tr>
							<td colspan="2">${i.title}</td>
						</tr>
						<tr>
							<td rowspan="5">
							<a href="/web/squadBoardInfoSelect?no=${i.squadboard_no}&hostId=${i.members_id}">
									<img src="/web/resources/img/play/${i.gamegenre_game_img}" style="width: 200px; height: 120px;" />
							</a></td>
						</tr>
						<tr>
							<td>${i.hostname}</td>
						</tr>
						<tr>
							<td>${i.gamegenre_name}</td>
						</tr>
						<tr>
							<td>${i.reservedate}</td>
						</tr>
						<tr>
							<td>
							<c:choose>
							<c:when test="${i.recruitoption==0}">
							선착순
							</c:when>
							<c:when test="${i.recruitoption==1}">
							모집제
							</c:when>
							</c:choose>
							${i.user_acceptcnt}/${i.user_maxcnt}
							</td>
						</tr>
						
						<tr>
						<td colspan="2">
						
						<div align="right" >
							<c:choose>
							<c:when test="${i.squadstate== 0 || i.squadstate== 1}">
							<button type="button" class="btn" id="btnAcceptGuest" style="background-color: cyan;margin: auto;" 
								onclick="window.open('/web/squadHostingSelect?no=${i.squadboard_no}' , '..', 'left=300, top=200, width=600, height=500')">
								<span id="span">대기목록</span>
							</button>
							
							<button type="button" class="btn" id="btnModify" style="background-color: gray;margin: auto; " >
								<span id="span">수정</span>
							</button>
							
							<button type="button" class="btn" id="btnDeleteHost" style="background-color: red;margin: auto;"  
								onclick="window.open('/web/play/squadDelete.jsp?no=${i.squadboard_no}&job=host&rc=2&work=delete' , '..', 'left=300, top=200, width=600, height=500')">
								<span id="span">삭제</span>
							</button>
							
							</c:when>
							<c:when test="${i.squadstate== 2}">
							<button type="button" class="btn" id="btnDeleteHost" style="background-color: red;margin: auto;" 
								onclick="window.open('/web/play/squadDelete.jsp?no=${i.squadboard_no}&job=host&rc=2&work=end' , '..', 'left=300, top=200, width=600, height=500')">
								<span id="span">종료</span>
							</button>
							
							</c:when>
							</c:choose>
							
						</div>
						</td>
						</tr>
					</tbody>
				</table>
			</td>
			<c:choose>
				<c:when test="${cnt.index % 4 == 3 || cnt.last}">
					</tr>
				</table>
				</c:when>
			</c:choose>
		</c:forEach>
		</div>

		<div class="list" style="margin-bottom: 20px; margin-left:250px;">
		<h1 style="margin-bottom: 20px;">지난 참가한 스쿼드</h1>
		<c:if test="${empty GHistoryList}">
        	<h4 style="color:gray">참가하신 스쿼드가 없습니다.</h4>
    	</c:if>
		<c:if test="${not empty GHistoryList}">
		<table border="1" bordercolor="white">
		<tbody>
		<tr>
			<td>스쿼드 제목</td>
			<td>게임 이름</td>
			<td>호스트 이름</td>
			<td>시작 날짜</td>
			<td>스쿼드 상태</td>
		</tr>
		<c:forEach var="i" items="${GHistoryList}" varStatus="cnt">	
			
				<tr>
					<td><a href="/web/squadBoardInfoSelect?no=${i.squadboard_no}&hostId=${i.members_id}">${i.title}</td></a>
					<td>${i.gamegenre_name}</td>
					<td>${i.hostname}</td>
					<td>${i.reservedate}</td>
					<td>${i.squadstate_statename}</td>
				</tr>
				
				
		</c:forEach>
			</tbody>
		</table>
		</c:if>						
		</div>
				
		<div class="list" style="margin-bottom: 20px; margin-left:250px;">
		<h1 style="margin-bottom: 20px;">지난 호스팅한 스쿼드</h1>
		<c:if test="${empty HHistoryList}">
        	<h4 style="color:gray">호스팅하신 스쿼드가 없습니다.</h4>
    	</c:if>
    	<c:if test="${not empty HHistoryList}">
		<table border="1" bordercolor="white">
		<tbody>
		<tr>
			<td>스쿼드 제목</td>
			<td>게임 이름</td>
			<td>호스트 이름</td>
			<td>시작 날짜</td>
			<td>스쿼드 상태</td>
		</tr>
		<c:forEach var="i" items="${HHistoryList}" varStatus="cnt">	
				<tr>
					<td><a href="/web/squadBoardInfoSelect?no=${i.squadboard_no}&hostId=${i.members_id}">${i.title}</td></a>
					<td>${i.gamegenre_name}</td>
					<td>본인</td>
					<td>${i.reservedate}</td>
					<td>${i.squadstate_statename}</td>
				</tr>
					
		</c:forEach>
		</tbody>
		</table>	
		</c:if>			
		</div>
		
			
	</section>	

</body>
</html>