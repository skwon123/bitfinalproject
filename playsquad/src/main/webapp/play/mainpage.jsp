<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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

    var index = 0;   //이미지에 접근하는 인덱스
    window.onload = function(){
        slideShow();
    }
    function slideShow() {
    var i;
    var x = document.getElementsByClassName("slide1");  //slide1에 대한 dom 참조
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";   //처음에 전부 display를 none으로 한다.
    }
    index++;
    if (index > x.length) {
        index = 1;  //인덱스가 초과되면 1로 변경
    }   
    x[index-1].style.display = "block";  //해당 인덱스는 block으로
    setTimeout(slideShow, 3000);   //함수를 3초마다 호출
 
	}
 
</script>



<body>

<!--header  -->
<jsp:include page="testHeader.jsp"></jsp:include>
    <!--header  -->



	<main>
	<div align="center" id="gif">
	
  <img class="slide1" src="/web/resources/img/play/lol.jpg"  style="max-width: auto; height: 400px; ">
  <img class="slide1" src="/web/resources/img/play/pubg.jpg" style="max-width: auto; height: 400px; ">
  <img class="slide1" src="/web/resources/img/play/lostark.jpg" style="max-width: auto; height: 400px; ">
  <img class="slide1" src="/web/resources/img/play/overwatch2.jpg" style="max-width: auto; height: 400px; ">
  
  
	</div>
	</main>
	
	<section>
		<!-- 인기스쿼드 리스트 -->
		<div class="content-list">
			<h1>인기 스쿼드</h1>
       
			<div class="prev" id="prevPopularSquad">
				<i class="fa-solid fa-angle-right prev-arrow"></i>
			</div>
			
			<div class="slider" align="center" id="sliderPopularSquad" style="height:300px;">
<!-- 				<img src="/web/resources/img/play/overwatch2.jpg" style="max-width: 15%; height: auto; "/>
             	<img src="/web/resources/img/play/lol.jpg" style="max-width: 15%; height: auto; "/>   -->
			</div>
			<div class="next" id="nextPopularSquad">
				<i class="fa-solid fa-angle-right"></i>
			</div>
		</div>
		<script type="text/javascript">
        const nextPopularSquad = document.querySelectorAll('.next#nextPopularSquad');
        const prevPopularSquad = document.querySelectorAll('.prev#prevPopularSquad');
        const sliderPopularSquad = document.querySelectorAll('.slider#sliderPopularSquad');
        for(let i =0;i<sliderPopularSquad.length;i++){
        	getImage(sliderPopularSquad[i],i+1);
            makeSlider(sliderPopularSquad[i],prevPopularSquad[i],nextPopularSquad[i]);
        }
        function makeSlider(sliderPopularSquad,prevPopularSquad,nextPopularSquad){
        	nextPopularSquad.addEventListener('click',()=>{
                const offsetX = sliderPopularSquad.offsetWidth;
                sliderPopularSquad.scrollBy(offsetX,0)
            })
            prevPopularSquad.addEventListener('click',()=>{
                const offsetX = sliderPopularSquad.offsetWidth;
                sliderPopularSquad.scrollBy(-offsetX,0)
            })
        }    
        function getImage(slider){
        	$.ajax({
 			   url:'/web/squadPopularSelectAction',
 			   type:'GET',
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
					   var time = reservedateDate.toLocaleTimeString();
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
	 					    	  <td>\${eachAcp}/\${eachMax}</td>
	 					    	  </tr>
	 					    	  </tbody>`;
	 					    slider.appendChild(div); 						   
					    }else{
					    	div.innerHTML = `<img src="\${eachFilename}">`;
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
		
		<!-- 모집중인 스쿼드 리스트 -->
		<div class="content-list">
			<h1>모집 중인 스쿼드</h1>
       
			<div class="prev" id="prevRecruit">
				<i class="fa-solid fa-angle-right prev-arrow"></i>
			</div>
			
		<div class="slider" align="center" id="sliderRecruit" style="height:300px;">
				
		</div>
			
			<div class="next" id="nextRecruit">
				<i class="fa-solid fa-angle-right"></i>
			</div>
		</div>
		<script type="text/javascript">
        const nextRecruit = document.querySelectorAll('.next#nextRecruit');
        const prevRecruit = document.querySelectorAll('.prev#prevRecruit');
        const sliderRecruit = document.querySelectorAll('.slider#sliderRecruit');

        for(let i =0;i<sliderRecruit.length;i++){
        	getImage(sliderRecruit[i],i+1);
            makeSlider(sliderRecruit[i],prevRecruit[i],nextRecruit[i]);
        }
        function makeSlider(sliderRecruit,prevRecruit,nextRecruit){
        	nextRecruit.addEventListener('click',()=>{
                const offsetX = sliderRecruit.offsetWidth;
                sliderRecruit.scrollBy(offsetX,0)
            })
            prevRecruit.addEventListener('click',()=>{
                const offsetX = sliderRecruit.offsetWidth;
                sliderRecruit.scrollBy(-offsetX,0)
            })
        }
        function getImage(slider){
        	$.ajax({
 			   url:'/web/squadstate0ListAction',
 			   type:'GET',
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
					   var time = reservedateDate.toLocaleTimeString();
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
	 					    	  <td>\${eachAcp}/\${eachMax}</td>
	 					    	  </tr>
	 					    	  </tbody>`;
	 					    slider.appendChild(div); 						   
					    }else{
					    	div.innerHTML = `<img src="\${eachFilename}">`;
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
		
		
		<!-- 인기 게임 리스트 -->
 		<div class="content-list">
			<h1>인기 게임</h1>
       
			<div class="prev" id="prevPopularGame">
				<i class="fa-solid fa-angle-right prev-arrow"></i>
			</div>
			
			<div class="slider" align="center" id="sliderPopularGame" style="height:180px;">
				
			</div>
			<div class="next" id="nextPopularGame">
				<i class="fa-solid fa-angle-right"></i>
			</div>
		</div>
		<script type="text/javascript">
        const nextPopularGame = document.querySelectorAll('.next#nextPopularGame');
        const prevPopularGame = document.querySelectorAll('.prev#prevPopularGame');
        const sliderPopularGame = document.querySelectorAll('.slider#sliderPopularGame');
        for(let i =0;i<sliderPopularGame.length;i++){
        	getImage(sliderPopularGame[i],i+1);
            makeSlider(sliderPopularGame[i],prevPopularGame[i],nextPopularGame[i]);
        }
        function makeSlider(sliderPopularGame,prevPopularGame,nextPopularGame){
        	nextPopularGame.addEventListener('click',()=>{
                const offsetX = sliderPopularGame.offsetWidth;
                sliderPopularGame.scrollBy(offsetX,0)
            })
            prevPopularGame.addEventListener('click',()=>{
                const offsetX = element.offsetWidth;
                sliderPopularGame.scrollBy(-offsetX,0)
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
 					   var ext = eachFilename.slice(-3);
 					   var imgSrc = '/web/resources/img/play/'+eachFilename;
 					   console.log(eachFilename);
 					   var div = document.createElement('div');
 					   div.className='item';
	 				   div.innerHTML = `<img src="/web/resources/img/play/\${eachFilename}"><br><table><thead></thead><tbody><tr><td><p>\${s[j].name}</p></td></tr></tbody></table>`;
	 				   slider.appendChild(div); 						    
 				   }
 			   },
 			   error:function(e){
 				   console.log('error');
 			   }
 		});
        }
      
    	</script>
	</section> 

<footer>
	<jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>