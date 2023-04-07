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
<body>

<script>
function showPopup(){
    var openWin = window.open("/web/play/review.jsp", "a", "width=600, height=400, left=200, top=100");
    openWin.window.onload = function() {
        openWin.document.getElementById("host_id").value = document.getElementById("host_id").value;
    };
}


</script>

	<!--header  -->
	<jsp:include page="testHeader.jsp"></jsp:include>
	<!--header  -->

	<main>
	
		<div class="contents-list"
			style="height: 300px; min-width: 400px; margin-left: 200px; margin-bottom: 150px">
			<div class="text">
				<c:forEach var="i" items="${info}" varStatus="cnt">
				<input type="hidden" class="hiddenInput" name="host_id" id="host_id" value="${i.members_id}"> 
				<img src="/web/resources/img/play/upload/profile/${i.profile_img}" style="width: 250px; height: 200px; margin-top: 30px;" /><br>
				<button type="button" style="background-color: #141414;"
				onclick="location.href='/web/play/viewProfile?id=${userId}'">
				회원정보 수정</button>
					<button class="btn" id="reviewwrite" style="background-color: #141414;" onclick="showPopup();">
					<i class="fa-sharp fa-solid fa-pen" ></i><span>후기 작성</span>							
				</button>
				<h3 style="margin-left: 150px; margin-top: 30">${i.nickname}</h3>
				<h3 style="margin-left: 150px; margin-top: 30">평점: ${i.grade} / 5.0</h3>
				<h3 style="margin-left: 150px; margin-top: 30">0 Hosted</h3>
				<h3 style="margin-left: 150px; margin-top: 30">${i.follow_cnt} Followers</h3>
				</c:forEach>	
			</div>
			
			
		</div>
	</main>
<!-- 구현안됨 -->
	<section>
				<!-- 모집중인 스쿼드 리스트 -->
		<!-- 모집중인 스쿼드 리스트 -->
		<div class="content-list">
			<h1>신청 가능한 스쿼드</h1>
       
			<div class="prev" id="prevRegister">
				<i class="fa-solid fa-angle-right prev-arrow"></i>
			</div>
			
		<div class="slider" align="center" id="sliderRegister" style="height:300px;margin-right:1.8%;margin-left:1.8%;">
				
		</div>
			
			<div class="next" id="nextRegister">
				<i class="fa-solid fa-angle-right"></i>
			</div>
		</div>
		<script type="text/javascript">
        const nextRegister = document.querySelectorAll('.next#nextRegister');
        const prevRegister = document.querySelectorAll('.prev#prevRegister');
        const sliderRegister = document.querySelectorAll('.slider#sliderRegister');
        for(let i =0;i<sliderRegister.length;i++){
        	getImage(sliderRegister[i],i+1);
            makeSlider(sliderRegister[i],prevRegister[i],nextRegister[i]);
        }
        function makeSlider(sliderRegister,prevRegister,nextRegister){
        	nextRegister.addEventListener('click',()=>{
                const offsetX = sliderRegister.offsetWidth;
                sliderRegister.scrollBy(offsetX,0)
            })
            prevRegister.addEventListener('click',()=>{
                const offsetX = sliderRegister.offsetWidth;
                sliderRegister.scrollBy(-offsetX,0)
            })
        }
        function getImage(slider){
        	var userIdInput = document.getElementById('host_id').value;
        	$.ajax({
        		url:'/web/registerSquadInfoSelect',
                type:'GET',
                data: {
                	   "userId": userIdInput
                	},
                dataType:'json',
                contentType:'application/x-www-form-urlencoded; charset=UTF-8',
 			   success:function(s){
 				   console.log(s);
 				   for (var j=0; j < s.length; j++){
 					   var eachFilename = s[j].filename;
 					   var eachSquadboardNo = s[j].squadboard_no;
					   var eachHostId = s[j].members_id;
 					   var ext = eachFilename.slice(-3);
 					   var imgSrc = '/web/resources/img/play/upload/'+eachFilename;
					   var eachProfile = s[j].members_profile_img;
					   var eachTitle = s[j].title;
					   var eachWriter = s[j].hostname;
					   var eachGenre = s[j].gamegenre_name;
					   var eachMax = s[j].user_maxcnt;
					   var eachAcp = s[j].user_acceptcnt;
					   var reservedateString = s[j].reservedate;
					   var reservedateDate = new Date(reservedateString);
					   var date = reservedateDate.toLocaleDateString();
					   var time = reservedateDate.toLocaleTimeString([], { hour12: true, hour: '2-digit', minute: '2-digit' });
 					   var div = document.createElement('div');
 					   div.className='item';
 					   if(ext == 'jpg' || ext == 'png' || ext == 'gif'){
	 					    div.innerHTML = `<a href="/web/squadBoardInfoSelect?no=\${eachSquadboardNo}&hostId=\${eachHostId}">
	 					    <img src="/web/resources/img/play/upload/board/\${eachFilename}"></a><br>
	 					    	<table style="text-align:center; width:250px;">
	 					    	  <thead>
	 					    	  </thead>
	 					    	  <tbody>
	 					    	  <tr><td rowspan="4"><img src="/web/resources/img/play/upload/profile/\${eachProfile}" style="width:60px; height:60px; border-radius:50%;"></td></tr>
	 					    	  <tr><td style="text-align:left;"><b>\${eachTitle}</b></td></tr>
	 					    	  <tr><td style="color:gray;text-align:left;">\${eachWriter}</td></tr>
	 					    	  <tr><td style="color:gray;text-align:left;">\${eachGenre}</td></tr>
	 					    	  <tr>
	 					    	  <td>\${date}<br>\${time}</td>
	 					    	  <td>모집인원<br>\${eachAcp}/\${eachMax}</td>
	 					    	  </tr>
	 					    	  </tbody>`;
	 					    slider.appendChild(div); 						   
					    }else{
					    	div.innerHTML = `<a href="/web/squadBoardInfoSelect?no=\${eachSquadboardNo}&hostId=\${eachHostId}">
					    	<img src="\${eachFilename}"></a><br>
	 					    	<table style="text-align:center; width:250px;">
	 					    	  <thead>
	 					    	  </thead>
	 					    	  <tbody>
	 					    	  <tr><td rowspan="4"><img src="/web/resources/img/play/upload/profile/\${eachProfile}" style="width:60px; height:60px; border-radius:50%;"></td></tr>
	 					    	  <tr><td style="text-align:left;"><b>\${eachTitle}</b></td></tr>
	 					    	  <tr><td style="color:gray;text-align:left;">\${eachWriter}</td></tr>
	 					    	  <tr><td style="color:gray;text-align:left;">\${eachGenre}</td></tr>
	 					    	  <tr>
	 					    	  <td>\${date}<br>\${time}</td>
	 					    	  <td>모집인원<br>\${eachAcp}/\${eachMax}</td>
	 					    	  </tr>
	 					    	  </tbody>`;
	 					    slider.appendChild(div);
					    }
 				   }
 			   },
 			   error:function(e){
 				   console.log('error');
 			   }
 		});
        }
    	</script>
<!--  -->
		
		<div class="content-list">
			<h1>주로하는 게임</h1>  
			<div class="prev" id="prevMainGame">
				<i class="fa-solid fa-angle-right prev-arrow"></i>
			</div>
			
			<div class="slider" align="center" id="sliderMainGame" style="height:180px;margin-right:1.8%;margin-left:1.8%;">
				
			</div>
			<div class="next" id="nextMainGame">
				<i class="fa-solid fa-angle-right"></i>
			</div>
		</div>
		<script type="text/javascript">
        const nextMainGame = document.querySelectorAll('.next#nextMainGame');
        const prevMainGame = document.querySelectorAll('.prev#prevMainGame');
        const sliderMainGame = document.querySelectorAll('.slider#sliderMainGame');
        for(let i =0;i<sliderMainGame.length;i++){
        	getImage(sliderMainGame[i],i+1);
            makeSlider(sliderMainGame[i],prevMainGame[i],nextMainGame[i]);
        }
        function makeSlider(sliderMainGame,prevMainGame,nextMainGame){
        	nextMainGame.addEventListener('click',()=>{
                const offsetX = sliderMainGame.offsetWidth;
                sliderMainGame.scrollBy(offsetX,0)
            })
            prevMainGame.addEventListener('click',()=>{
                const offsetX = element.offsetWidth;
                sliderMainGame.scrollBy(-offsetX,0)
            })
        }
        function getImage(slider){
        	$.ajax({
 			   url:'/web/popularGameListAction',
 			   type:'GET',
 			   dataType:'json',
 			   contentType:'application/x-www-form-urlencoded; charset=UTF-8',
 			   success:function(s){
 				   console.log(s);
 				   for (var j=0; j < s.length; j++){
 					   var eachFilename = s[j].game_img;
 					   var eachGameGenreNo = s[j].gamegenre_no;
 					   var ext = eachFilename.slice(-3);
 					   var imgSrc = '/web/resources/img/play/'+eachFilename;
 					   console.log(eachFilename);
 					   var div = document.createElement('div');
 					   div.className='item';
	 				   div.innerHTML = `<a href="/web/popularGameInfoSelect?ggno=\${eachGameGenreNo}"> <img src="/web/resources/img/play/\${eachFilename}"><br>
	 					   	<table><thead></thead><tbody><tr><td><p><b>\${s[j].name}</b></p></td></tr></tbody></table> </a>`;
	 				   slider.appendChild(div); 						    
 				   }
 			   },
 			   error:function(e){
 				   console.log('error');
 			   }
 		});
        }      
    	</script>
<!--  -->

		<div class="content-list" style="height: 200px; min-width: 1200px;">
			<h1>게스트 후기</h1>
			<div class="list_cmt">
				<div class="cmt_head"></div>
				<div class="cmt_body">
					<c:forEach var="r" items="${review}" varStatus="cnt">
					<table border ="1" bordercolor="white">
						<tr>
							<td rowspan="3">
						<img src="/web/resources/img/play/upload/profile/noImage.jpg" class="rounded-circle"
							style="width: 50px; height: 30px; margin-top: 30px;" /></td>
						</tr>
						<tr>
							<td colspan="2">
						<span class="info_append"> <span class="txt_name">${r.name}</span> <!-- 글쓴이 이름으로 넣기 -->
							<span class="txt_bar">|</span> <span class="txt_time">${r.score}</span> 
							<span class="txt_bar">|</span> <span class="txt_time">${r.regdate}</span>
						</span>
						</td>
						</tr>
						<tr>
						<td colspan="3">
						<p class="txt_desc">${r.contents}</p>
						</td>
						</tr>
					</table>
					</c:forEach>
				</div>
				<div class="cmt_foot"></div>
			</div>
		</div>


	</section>
</body>
</html>