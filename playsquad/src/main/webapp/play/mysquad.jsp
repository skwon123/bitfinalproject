<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="kr">
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

<body>
	<jsp:include page="testHeader.jsp"></jsp:include>
	<main>		
			<div class="left" style="margin-bottom: 200px; margin-left:200px">
			<h1>내 스쿼드</h1>
				<div class="buttons">
				<button class="btn" style="background-color: #141414;">
					<i class="fa-solid fa-people-arrows"></i><span>참여</span>
				</button>
				<button class="btn" style="background-color: #141414;">
					<i class="fa-solid fa-person"></i><span>호스팅</span>
				</button>
				<button class="btn" style="background-color: #141414;">
					<i class="fa-solid fa-gear"></i><span>설정</span>
				</button>

			</div>
			</div>
		
	

	</main>
	<section>

		<div class="left" style="margin-bottom: 200px; margin-left:200px">
			<h1>참가 중인 스쿼드</h1>
			
		</div>

		<div class="left" style="margin-bottom: 200px; margin-left:200px">
			<h1>예약 스쿼드</h1>
			<div align="center">	
			<table style="width:100%">
				<tr>
					<th scope="col">시작 시간</th>
					<th scope="col">스쿼드 제목</th>
					<th scope="col">호스트</th>
					<th scope="col">메세지</th>
					<th scope="col">상태</th>
					<th scope="col">처리</th>
				</tr>
			</table>
			</div>
		</div>
		
		<div class="left" style="margin-bottom: 200px; margin-left:200px">
			<h1>지난 스쿼드</h1>
			<table style="width: 100%">
				<tr>
					<th scope="col">시작 시간</th>
					<th scope="col">타입</th>
					<th scope="col">스쿼드 제목</th>
					<th scope="col">상태</th>
					<th scope="col">게스트 후기</th>
				</tr>
			</table>
		</div>
	</section>


	<script type="text/javascript">
        const next = document.querySelectorAll('.next');
        const prev = document.querySelectorAll('.prev');
        const slider = document.querySelectorAll('.slider')

        for(let i =0;i<slider.length;i++){
            getMovies(slider[i],i+1);
            makeSlider(slider[i],prev[i],next[i]);
        }
        function makeSlider(element,prev,next){
            next.addEventListener('click',()=>{
                const offsetX = element.offsetWidth;
                element.scrollBy(offsetX,0)
            })
            prev.addEventListener('click',()=>{
                const offsetX = element.offsetWidth;
                element.scrollBy(-offsetX,0)
            })
        }
        function getMovies(element,page){
            fetch(`https://yts.mx/api/v2/list_movies.json?limit=20&sort_by=rating&page=${page}`)
                .then(data=>data.json())
                .then(data=>{
                    const movies = data.data.movies;
                    movies.forEach(movie=>{
                        const div = document.createElement('div');
                        div.className='item';
                        div.innerHTML = `<img src="${movie.medium_cover_image}" alt="">`;
                        element.appendChild(div);
                    })
                })
        }
    </script>


</body>
</html>