<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page isELIgnored="false" %>
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
 
<style>

</style>
<script>
$(function(){
	
});
	
</script>



<body>

<!--header  -->
<jsp:include page="testHeader.jsp"></jsp:include>
    <!--header  -->

	<main>
	<input id="ggno" type="hidden" value="${info[0].gamegenre_no }"/>
		<table style="margin-left:50px;">
		<thead></thead>
		<tbody>
			<tr>
				<td rowspan="3"><img src="/web/resources/img/play/${info[0].game_img}" style="height:250px;width:400px;">
				</td>
			</tr>
			<tr>
				<td>
					<h1>&emsp;${list[1].gamegenre_name }</h1>
				</td>
			</tr>
			<tr>
				<td>
 					<h4>&emsp;&emsp;&emsp;누적 ${info[0].squad_cnt} 개의 스쿼드</h4>
				</td>
			</tr>
		</tbody>
		</table>
	</main>
	
	<section>
	
		<!-- 인기 호스트 리스트 -->
		<div class="content-list" style="margin-top:50px;margin-right:1.8%;margin-left:1.8%;">
			<h1>인기 호스트</h1>
       
			<div class="prev" id="prevPopularHost">
				<i class="fa-solid fa-angle-right prev-arrow"></i>
			</div>
			
			<div class="slider" align="center" id="sliderPopularHost" style="height:180px;">
<!-- 				<img src="/web/resources/img/play/overwatch2.jpg" style="max-width: 15%; height: auto; "/>
             	<img src="/web/resources/img/play/lol.jpg" style="max-width: 15%; height: auto; "/>   -->
			</div>
			<div class="next" id="nextPopularHost">
				<i class="fa-solid fa-angle-right"></i>
			</div>
		</div>
		<script type="text/javascript">
        const nextPopularHost = document.querySelectorAll('.next#nextPopularHost');
        const prevPopularHost = document.querySelectorAll('.prev#prevPopularHost');
        const sliderPopularHost = document.querySelectorAll('.slider#sliderPopularHost');
        for(let i =0;i<sliderPopularHost.length;i++){
        	getImage(sliderPopularHost[i],i+1);
            makeSlider(sliderPopularHost[i],prevPopularHost[i],nextPopularHost[i]);
        }
        function makeSlider(sliderPopularHost,prevPopularHost,nextPopularHost){
        	nextPopularHost.addEventListener('click',()=>{
                const offsetX = sliderPopularHost.offsetWidth;
                sliderPopularHost.scrollBy(offsetX,0)
            })
            prevPopularHost.addEventListener('click',()=>{
                const offsetX = sliderPopularHost.offsetWidth;
                sliderPopularHost.scrollBy(-offsetX,0)
            })
        }    
        function getImage(slider){
        	$.ajax({
 			   url:'/web/hostListForEachGameSelect',
 			   type:'GET',
 			   data: {ggno: parseInt($("input#ggno").val())},
 			   dataType:'json',
 			   contentType:'application/x-www-form-urlencoded; charset=UTF-8',
 			   success:function(s){
 				   console.log(s);
 				   for (var j=0; j < s.length; j++){
					   var eachFilename = s[j].profile_img;
					   var eachNickname = s[j].nickname;
 					   var eachHostId = s[j].members_id;
					   var eachReviewCnt = s[j].review_cnt;
					   var eachGrade = s[j].grade;
					   var imgSrc = '/web/resources/img/play/upload/'+eachFilename;
					   var div = document.createElement('div');
					   var divStyle = div.style;
					   div.className = 'item';
					   divStyle.height = '180px';
					   divStyle.width = '120px';
					   divStyle.background = 'transparent';
					   div.innerHTML = `<a href="/web/GuestReviewSelect?id=\${eachHostId}"><table style="text-align:center; width:120px; height:180px;">
	 					    	  <tbody>
	 					    	  <tr><td><img src="/web/resources/img/play/upload/profile/\${eachFilename}" style="width:100px; height:100px; border-radius:50%;"></td></tr>
	 					    	  <tr><td style="text-align:center;"><b>\${eachNickname}</b></td></tr>
	 					    	  <tr><td style="color:gray;text-align:center;">\${eachGrade}/5.0 \&nbsp;(\${eachReviewCnt})</td></tr>
	 					    	  
	 					    	  </tbody></table></a>`;
	 					    slider.appendChild(div); 
 				   }
 			   },
 			   error:function(e){
 				   console.log('error');
 			   }
 		});
        }
    	</script>
    	
    	
		<!-- 인기스쿼드 리스트 -->
		<div class="content-list" style="margin-right:1.8%;margin-left:1.8%;">
			<h1>모집 중인 스쿼드</h1>
			<c:forEach var="i" items="${list}" varStatus="cnt">
			
			<div id="eachItems" style="width:250px;height:300px;display:inline-block;">
				<a href="/web/squadBoardInfoSelect?no=${i.squadboard_no}&hostId=${i.members_id}">
	 					    <img src="/web/resources/img/play/upload/board/${i.filename}" style="width:250px;height:150px;"></a>
	 					    	<table style="text-align:center; width:250px;">
	 					    	  <thead>
	 					    	  </thead>
	 					    	  <tbody>
	 					    	  <tr><td rowspan="4"><img src="/web/resources/img/play/upload/profile/${i.members_profile_img}" style="width:60px; height:60px; border-radius:50%;"></td></tr>
	 					    	  <tr><td style="text-align:left;"><b>${i.title}</b></td></tr>
	 					    	  <tr><td style="color:gray;text-align:left;">${i.hostname}</td></tr>
	 					    	  <tr><td style="color:gray;text-align:left;">${i.gamegenre_name}</td></tr>
	 					    	  <tr>
	 					    	  <td>${fn:substring(i.reservedate, 0, 10)}<br>${fn:substring(i.reservedate, 11, 16)}</td>
	 					    	  <td>${i.user_acceptcnt}/${i.user_maxcnt}</td>
	 					    	  </tr>
	 					    	  </tbody>
	 					    	  </table>
			</div>
			</c:forEach>
		</div>	
		
		
	</section> 

<footer>
	<jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>