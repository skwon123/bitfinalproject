<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
	<html lang="UTF-8">
	<head>
	<meta charset="UTF-8">
	<meta name="viewport"
		content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>TogetherSquad</title>
	
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
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"></script>

<style type="text/css">
a{
  text-decoration:none; color:inherit; cursor: pointer;
}
 .right_area .icon{
    display: flex;
    align-items: center;
    justify-content: center;
    width: calc(100vw * (45 / 1920));
    height: calc(100vw * (45 / 1920));

    border-radius: 50%;
    border: none;
    background-color: #141414;
}

.icon.heart img{
    width: calc(100vw * (24 / 1920));
    height: calc(100vw * (24 / 1920));

}

.icon.heart.fas{
  color:red
}
.heart{
    transform-origin: center;
}
.heart.active img{
    animation: animateHeart .3s linear forwards;
}

</style>


<script type="text/javascript">
$(function() {
	
	
	window.onload=checkTime();
		function checkTime() {
		var state = $("input#squadstate").val();
		if(state == 0 || state == 1){
			var intervalId = setInterval(function(){
				
				var sysdate = new Date();
				var newSquadboardNo = $("input#newSquadboardNo").val();
				console.log(newSquadboardNo);
				console.log(typeof(newSquadboardNo));
				$.ajax({
		 			   url:'/web/squadBoardAjaxSelect',
		 			   type:'GET',
		 			   data: {newSquadboardNo: newSquadboardNo},
		 			   dataType:'text',
		 			   contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		 			   success:function(s){
		 				   //var reservedate = new Date(s[])
		 				   console.log(s);
		 				   var reservedate = new Date(s);
		 				   if (reservedate < sysdate){	 					   
		 					 //console.log(reservedate < sysdate);
		 					 
		 					 clearInterval(intervalId);
		 					 $("button#squadstateB").click();
		 				   }
		 			   },
		 			   error:function(e){
		 				   console.log('error');
		 				   }
		 			   });
			},3000);
		}
	
	};
	window.onload=chagneButtonStateFunction();
	function chagneButtonStateFunction() {
		var state = $("input#squadstate").val();
		console.log(state);
		const buttonSS= document.getElementById('btnSquadState');
		const spanSS= document.getElementById('spanSquadState');
		// 스쿼드상태에 따른 버튼 
		switch (state)
		{
		case "0"://모집중
			if(($("input#attendSH").val() == 'Y') || ($("input#attendAW").val() == 'Y')){
				const fieldset = document.getElementById('btnRequest');
				console.log('btnRequest disabled');
				fieldset.disabled = true;
			}else{
			console.log('btn ready');	
			//신청버튼
			$("button#btnRequest1").click(function(){
				window.open("/web/squadRequsetSelect?no=${squad.squadboard_no}&id=${userId}" , "..", "left=300, top=200, width=500, height=600");
			})
			$("button#btnRequest2").click(function(){
				window.open("/web/squadRequsetSelect?no=${squad.squadboard_no}&id=${userId}" , "..", "left=300, top=200, width=500, height=600");
			})
			break;    
			}
		case "1"://모집완료 버튼비활성화
			spanSS.textContent="모집완료";
			break;    
	
		case "2"://진행중 버튼비활성화
			spanSS.textContent="진행중";
			buttonSS.style.backgroundColor = 'orange';
			break;    

		case "3"://종료 버튼비활성화    
			spanSS.textContent="종료";
			buttonSS.style.backgroundColor = 'red';
			break;    

		case "4"://취소 버튼비활성화     
			spanSS.textContent="취소";
			buttonSS.style.backgroundColor = 'red';
			break;    
	   
	    default :  
	    	spanSS.textContent="오류";
	    	buttonSS.style.backgroundColor = 'gray';
	    	break;
		}
	}
		
		
	//heart 좋아요 클릭시! 하트 뿅
	window.onload=likeBtnEffect();
	function likeBtnEffect(){
	    var $likeBtn =$('.icon.heart');

	        $likeBtn.click(function(){
	        $likeBtn.toggleClass('active');

	        if($likeBtn.hasClass('active')){          
	           $(this).find('img').attr({
	        	   'src': '/web/resources/img/play/heartFull.png',
	        	   'alt': '좋아요 완료'
	                });
	          
	          
	         }else{
	            $(this).find('i').removeClass('fas').addClass('far')
	           $(this).find('img').attr({
	        	   'src': '/web/resources/img/play/heartBlank.png',
	        	   'alt': '좋아요'
	           });
	         }
	        
	        var reviewId = $(this).closest('table').data('review-id'); // 후기 ID
	        var url = '/like/' + reviewId; // 좋아요 요청 URL

	        
	        
	     });
	}

	
});
</script>



<body>
	<!--header  -->
	<jsp:include page="testHeader.jsp"></jsp:include>
	<!--header  -->
	<div id="hiddenData">
				<input type="hidden" name="hostId" id="hostId" value="${squad.members_id}"/>
				<input type="hidden" name="userId" id="userId" value="${userId}"/>
				<input type="hidden" name="squadstate" id="squadstate" value="${squad.squadstate}"/>
				<input type="hidden" name="attendSH" id="attendSH" value="${attendSH}"/>
				<input type="hidden" name="attendAW" id="attendAW" value="${attendAW}"/>
				<input type="hidden" name="newSquadboardNo" id="newSquadboardNo" value="${squad.squadboard_no }"/>
				<input type="hidden" name="squadstateI" id="squadstateI" value="${squad.squadboard_no }"/>
				<button type="button" name ="squadstateB" id="squadstateB" onclick="location.href='/web/SquadStateUpdate?no=${squad.squadboard_no}&hostId=${squad.members_id}' " style="display: none;">상태 수정 버튼</button>
	</div><br>
	<div style="margin-right:10%;margin-left:10%;">
	<c:set var="reservedate" value="${squad.reservedate}"/>
	<c:set var="month" value="${fn:substring(reservedate, 5, 7) }"/>
	<c:set var="monthcheck" value="${fn:substring(reservedate, 5, 6)}"/>
	<c:set var="day" value="${fn:substring(reservedate, 8, 10)}"/>
	<c:set var="hour" value="${fn:substring(reservedate, 11, 13)}"/>
	<c:set var="minute" value="${fn:substring(reservedate, 14, 16)}"/>
	<c:choose>
		<c:when test="${monthcheck eq '0'}">
			<c:set var="month" value="${fn:substring(reservedate, 6, 7) }"/>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${hour le 12}">
			<c:set var="ampm" value="오전"/>
		</c:when>
		<c:otherwise>
			<c:set var="ampm" value="오후"/>
			<c:set var="hour" value="${hour - 12}"/>
		</c:otherwise>
	</c:choose>
	<table width="75%" height="750px"  style="margin-left:auto; margin-right:auto; border-left: none; border-right: none; border-bottom: none">
		<thead></thead>
		<tbody align="center">
		<tr style="height:80px;"><td colspan="3" style="text-align:left; padding-left:20px;padding-top:45px;"><h1>${squad.title}</h1></td></tr>
		<tr><td rowspan="5" height="450px"><img src="/web/resources/img/play/upload/board/${squad.filename}" style="width:750px; height:480px; border-radius:7%;margin-top:10px;align-content:center;" /></td></tr>
		<tr style="height:300px;">
		<td style="width:200px;">
		<a href="/web/GuestReviewSelect?id=${squad.members_id}">
		<img src="/web/resources/img/play/upload/profile/${squad.members_profile_img}" style="display:inline-block;width: 150px; height: 150px; border-radius:50%;" />
		</a>
		</td>
		<td>
		<h2 style="">${squad.hostname}</h2><br>
		<span style="font-size:24px;"><b>${squad.members_grade}</b></span> <span style="color:gray; font-size:18px;">/5.0 </span> <span style="color:gray; font-size:16px;">(${squad.members_review_cnt})</span><br>
		<span style="font-size:24px;">${squadCnt}</span><span style="color:#ffffffb3; font-size:17px;"> 개의 스쿼드</span><br>
		</td>
		
		</tr>
		<tr style="height:60px;">
		<td>
		<h3 style="margin-left: 20px; margin-top: 20px; text-align:left; color:#ffffffb3;">시작시간</h3>
		</td>
		<td>
		<h3 style="margin-left: 20px; margin-top: 20px; text-align:left; color:#ffffffb3;">예상진행시간</h3>
		</td>
		</tr>
		<tr style="height:100px;">
		<td>
		<div style="display: flex; align-items: center; justify-content: center; width: 180px; height: 90px; background-color: #424242; border-radius: 8px;">
			<div style="text-align: center;">
    			<span style="color: #fff; font-size: 18px;">${month }월 ${day }일</span>
    			<h2 style="color: #f4ae23; font-size: 22px;">${ampm} ${hour}시 ${minute}분</h2>
  			</div>
		</div>
		</td>
		<td>
		<h2 style="">${squad.playtime} 분</h2>
		</td>
		</tr>
		<tr style="height:80px;">
		<td>
		<h4 style="color:#ffffffb3;">신청 인원</h4>
		<h3 style="font-size: 22px;">${squad.user_acceptcnt} / ${squad.user_maxcnt} 명</h3>
		</td>
		
		<td>
		<div class="buttons">				
				
					<!-- btnActive / btnDisabled-->
					<c:choose>
						<c:when test="${userId == null}">
							<button type="button" class="btn" id="btnOffer" disabled='disabled' style="background-color: gray;margin: auto;" >
								<span id="spanOffer">로그인해주세요</span>
							</button>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${squad.members_id==userId}">
									<button type="button" class="btn" id="btnEdit" style="background-color: green;" onclick="location.href='/web/mysquadInfoSelect?hostId=${userId}'">
										<span id="spanEdit">수정</span>
									</button>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${squad.squadstate==0}">
											<fieldset id="btnRequest" style="border:none;">
											<c:choose>
												<c:when test="${squad.recruitoption==0 && squad.payedstate==0}">
													<button type="button" class="btn" id="btnRequest1" style="background-color: green;" >
														<span id="spanRequest">무료 참가</span>
													</button>
												</c:when>
												<c:when test="${squad.recruitoption==1 && squad.payedstate==0}">
													<button type="button" class="btn" id="btnRequest1" style="background-color: green;" >
														<span id="spanRequest">무료 지원</span>
													</button>
												</c:when>
												<c:when test="${squad.recruitoption==0 && squad.payedstate==1}">
													<button type="button" class="btn" id="btnRequest2" style="background-color: green;" >
														<span id="spanRequest">${squad.price} 유료 참가</span>
													</button>
												</c:when>
												<c:when test="${squad.recruitoption==1 && squad.payedstate==1}">
													<button type="button" class="btn" id="btnRequest2" style="background-color: green;" >
														<span id="spanRequest">${squad.price} 유료 지원</span>
													</button>					
												</c:when>
											</c:choose>
											</fieldset>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn" id="btnSquadState" disabled='disabled' style="color: white; background-color: green;" >
												<span id="spanSquadState"></span>
											</button>
										</c:otherwise>
									</c:choose>
									
								</c:otherwise>
							
							</c:choose>					
							
						</c:otherwise>
					</c:choose>
															
				</div>
		</td>
		</tr>
		<tr><td colspan="3" height="9">
		<h3 style="margin-left: 30px; margin-top: 10px; text-align:left;">스쿼드 설명</h3><br>
		<h4 style="margin-left:20px; margin-right:10px; text-align:left;">${squad.contents}</h4><br>
		</td></tr>
		</tbody>
	</table>
	</div>
	<br><br>
	
	<div style="width:70%;margin-left:auto; margin-right:auto; margin-top:30px;">
		<h2>호스트의 다른 스쿼드</h2><br>
	<div class="content-list" style="width:70%">
		<c:forEach var="j" items="${squadList}" varStatus="cnt">
			<c:set var="month" value="${fn:substring(j.reservedate, 5, 7)}" />
				<c:set var="monthcheck" value="${fn:substring(j.reservedate, 5, 6)}" />
				<c:set var="day" value="${fn:substring(j.reservedate, 8, 10)}" />
				<c:choose>
					<c:when test="${monthcheck eq '0'}">
						<c:set var="month" value="${fn:substring(j.reservedate, 6, 7)}" />
					</c:when>
				</c:choose> 
				<c:set var="hour" value="${fn:substring(j.reservedate, 11, 13)}" />
				<c:set var="minute" value="${fn:substring(j.reservedate, 14, 16)}" />
				<c:choose>
					<c:when test="${hour le 12}">
						<c:set var="ampm" value="오전" />
					</c:when>
					<c:otherwise>
						<c:set var="ampm" value="오후" />
						<c:set var="hour" value="${hour - 12}" />
					</c:otherwise>
				</c:choose>
			<c:choose>
			<c:when test="${cnt.index % 4 == 0}">
			<table>
				<tr>
			</c:when>
			</c:choose>
			<td>
				<table style="margin-rightt:25px; width:350px;">
					<tbody align="center">
						<tr>
							<td rowspan="5">
							<a href="/web/squadBoardInfoSelect?no=${j.squadboard_no}&hostId=${j.members_id}">
									<img src="/web/resources/img/play/upload/board/${j.filename}" style="width: 200px; height: 120px;" />
							</a></td>
						</tr>
						<tr >
							<td style="width:200px;"><b>${j.title}</b></td>
						</tr>
						<tr>
							<td style="color:gray; font-size:13px;">${j.gamegenre_name}</td>
						</tr>
						<tr>
							<td style="color:#ffffffb3;">${month}월 ${day}일<br>${apmm} ${hour}시 ${minute}분</td>
						</tr>
						<tr>
							<td id="otherSquadStatus" style="${j.squadstate_statename eq '모집중'?'color:lightgreen;'
							:j.squadstate_statename eq '모집완료'?'color:#ffffffb3;'
							:j.squadstate_statename eq '진행중'?'color:orange;'
							:j.squadstate_statename eq '스쿼드진행중'?'color:orange;'
							:j.squadstate_statename eq '종료'?'color:gray;'
							:j.squadstate_statename eq '취소'?'color:red;'
							:''}">${j.squadstate_statename}</td>
							
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

		<h2 style="margin-top:30px;">게스트 후기</h2><br>
		<c:forEach var="r" items="${reviewList}" varStatus="cnt">
			<c:set var="month" value="${fn:substring(r.regdate, 5, 7)}" />
				<c:set var="monthcheck" value="${fn:substring(r.regdate, 5, 6)}" />
				<c:set var="day" value="${fn:substring(r.regdate, 8, 10)}" />
				<c:choose>
					<c:when test="${monthcheck eq '0'}">
						<c:set var="month" value="${fn:substring(r.regdate, 6, 7)}" />
					</c:when>
				</c:choose> 
				<c:set var="hour" value="${fn:substring(r.regdate, 11, 13)}" />
				<c:set var="minute" value="${fn:substring(r.regdate, 14, 16)}" />
				<c:choose>
					<c:when test="${hour le 12}">
						<c:set var="ampm" value="오전" />
					</c:when>
					<c:otherwise>
						<c:set var="ampm" value="오후" />
						<c:set var="hour" value="${hour - 12}" />
					</c:otherwise>
				</c:choose>
					<table  style="margin-top:30px;">

						<tbody>
							<tr>
								<td rowspan="3"style="width:130px;padding:5px;" rowspan="3" align="center">
								<img src="/web/resources/img/play/upload/profile/${r.profile_img}"
									class="rounded-circle" style="margin-top:10px;width: 50px; height: 50px;" /></td>
							</tr>
							<tr style="height:20px;">
								<td style="width:400px; height:21px;font-size:14px;color:#ffffffb3;" colspan="2">${r.name}</td>
								<td style="width:30px"></td>
								<td style="width:20px"></td>
								<td style="width:30px; text-align:center;"rowspan="2">
								<c:choose>
								<c:when test="${userId != null}">
								<a href="javascript:;" class="icon heart"> 
								<img style="width:30px" src="/web/resources/img/play/heartBlank.png" alt="좋아요">
								</a>
								</c:when>
								</c:choose> 
		
								</td>
							</tr>
							<tr style="">
								<td style="height:24px;">
									<small style="width:150px;font-size:20px;color:orange;" class="text-muted ${r.score}"></small>
								</td>
								<td align="right" style="width:180px;font-size:13px;color:#ffffffb3;"> ${month}월 ${day}일 ${ampm} ${hour}시 ${minute}분</td>
							</tr>
							<tr></tr>
							<tr style="margin-bottom:10px;">
								<td></td>
								<td style="width:300px; height:40px;margin-top:10px;margin-bottom:10px;" colspan="3">${r.contents}<br></td>
								<td></td>
								<td style="text-align:center;width:50px;margin-left: 20px;"><a href="#none">신고</a></td>
							</tr>
						</tbody>
			</table>
		</c:forEach>


	</div>
	</div>
	<script type="text/javascript">
		$(".1").html("&#9733; &#9734; &#9734; &#9734; &#9734;");
		$(".2").html("&#9733; &#9733; &#9734; &#9734; &#9734;");
		$(".3").html("&#9733; &#9733; &#9733; &#9734; &#9734;");
		$(".4").html("&#9733; &#9733; &#9733; &#9733; &#9734;");
		$(".5").html("&#9733; &#9733; &#9733; &#9733; &#9733;"); 
	</script>

	<footer>
	<jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>