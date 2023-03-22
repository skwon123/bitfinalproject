<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>스쿼드 만들기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/play/index.css"> --%>
<style>

button{
border: 1px solid white;
color:white;
background-color:#323232;
border-radius:10px;
height:35px;
width:60px;
}

.skin-4 .num-in {
	float: left;
	width: 80px;
	padding: 8px 0;
	border-top: 1px solid #000;
	border-bottom: 1px solid #000;
}

.skin-4 .in-num {
	width: 47px;
	float: left;
	height: 36px;
	font-size: 30px;
	text-align: center;
	outline: none;
}

.skin-4 .all-span {
	position: relative;
	float: right;
	width: 23px;
	height: 36px;
	border-left: 1px solid white;
}

.skin-4 .all-span span {
	float: left;
	width: 100%;
	height: 18px;
	position: relative;
	cursor: pointer;
}

.skin-4 .all-span span:before {
	content: '';
	position: absolute;
	left: 50%;
	margin-left: -5px;
}

.skin-4 span.minus:before {
	top: 3px;
	border-top: 5px solid #000;
	border-left: 5px solid transparent;
	border-right: 5px solid transparent;
}

.skin-4 span.minus.dis:before {
	opacity: 0.5;
}

.skin-4 span.plus:before {
	bottom: 3px;
	border-bottom: 5px solid #000;
	border-left: 5px solid transparent;
	border-right: 5px solid transparent;
	}
</style>
<script>
$(function(){
	/* form submit 코드 */	
	$("button#squadInsert").click(function(){
		
		if($("input#gamegenre_no").val().length == 0 || $("input#gamegenre_no").val() == 999){
			alert("게임을 선택하세요");
		}
		else if($("input#title").val().length == 0){
			alert("제목을 입력하세요");
		}
		else if($("input#reservedate").val().length == 0){
			alert("시작시간을 선택하세요");
		}
		else if($("input#payedstate").is(":checked") == true && $("input#price").val() < 5 ){
			alert('최소금액을 확인하거나 무료로 전환하세요');
			
		}
		/* else if($("input#thumbnail_url_saved").val().length == 0){
			alert('대표 영상 URL을 입력하거나 파일을 업로드하세요');
		} */
		else if($("textarea#contents").val().length < 10){
			alert('10자 이상 설명을 적어주세요');
		}
		else{
			
			$("form#squadBoardInsert").submit();
		}
		
		return false;
	});
})
</script>
</head>

<body bgcolor="#323232">
<form action="/web/squadBoardInsert" name="squadBoardInsert" id="squadBoardInsert" method="post" enctype="multipart/form-data">
<!-- 유저아이디 -->
<input type="hidden" name="userId" value="${userId }">
<table>
<thead>
</thead>
<tbody>
</tbody>
</table>

<!-- 게임 선택 이미지 -->
<div id="game_img_area" style="background:transparent; position:relative; align-items:center; vertical-align:middle; height: 190px; width: 160px;">
<img id="game_img" src="/web/resources/img/play/addicon.png" style="position:absolute; top:40%; left:40%; height: 30px; width: 30px;"> <br>
<p id="guideText" style="display:block; align:center; position:absolute; bottom:5%; left:27%; color:white;">게임 선택
</div>
<!-- 게임 선택 옵션 -->
<select id="gamegenre" onchange="gameImgFunc()"style="background-color:#323232;color:white;border:black;">
<option value=999>게임선택</option>
<c:forEach items="${games}" var="i" varStatus="cnt">
<option value="${i.gamegenre_no }">${i.name }</option>
</c:forEach>
<option value=0>기타</option>
</select>
<input name="gamegenre_no" id="gamegenre_no" type="hidden" value=999>
<script>
// 게임 선택시 대표이미지 변경
	function gameImgFunc() {
		var option = $("select#gamegenre").val();
		var game_img = document.getElementById("game_img");
		$("input#gamegenre_no").val(option);
		$.ajax({
			url : '/web/popularGameListAction',
			type : 'GET',
			dataType : 'json',
			data : option,
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(s) {
				console.log(s);
				if ($("input#gamegenre_no").val() != 999
						&& $("input#gamegenre_no").val() != 0) {
					for (var i = 0; i < s.length; i++) {
						var game_img = document.getElementById("game_img");
						var eachFilename = s[i].game_img;
						var eachFileNo = s[i].gamegenre_no;
						var newSrc = "/web/resources/img/play/" + eachFilename;
						console.log(eachFilename);
						if (option == eachFileNo) {
							game_img.style.position = "relative";
							game_img.style.top = "0%";
							game_img.style.left = "0%";
							game_img.style.width = "160px";
							game_img.style.height = "190px";
							game_img.src = "/web/resources/img/play/" + s[i].game_img;
							document.getElementById("guideText").style.display = "none";
						} else {
							continue;
						}
					}
				}if($("input#gamegenre_no").val() == 999){
					var game_img = document.getElementById("game_img");
					game_img.src = "/web/resources/img/play/addicon.png";
					game_img.style.top = "40%";
					game_img.style.left = "40%";
					game_img.style.width = "30px";
					game_img.style.height = "30px";
					document.getElementById("guideText").style.display = "block";
				}if($("input#gamegenre_no").val() == 0){
					var game_img = document.getElementById("game_img");
					game_img.src = "/web/resources/img/play/game-controller.png";
					game_img.style.top = "25%";
					game_img.style.left = "20%";
					game_img.style.width = "100px";
					game_img.style.height = "90px";
					document.getElementById("guideText").style.display = "none";
				}
			},
			error : function(e) {
				console.log('error');
			}
		});
	};
</script>

<!-- 스쿼드 제목 -->
<input type="text" id="title" name="title" placeholder="스쿼드 이름(제목)" style="background:transparent;color:white;"> <br>


<!-- ------------------------------------------------ -->

<fieldset style="display:block; color:white; border:1px dashed white;">
<legend style="color:white;">
스쿼드설정
</legend>

<div class="num-block skin-4" style="display:block">
<label for="num-in" style="color:white;display:block">인원 선택</label>
  <div class="num-in" style="display:block;margin-top:5px;;margin-bottom:5px;padding:5px;border:1px solid white;border-radius:10px">
    <input id="user_maxcnt" name="user_maxcnt" id="user_maxcnt" type="text" class="in-num" value="1" onchange="maxcntCheckFunc()"  style="background:transparent;color:white;border:none;border-radius:10px;">
    <div class="all-span" >
      <span class="plus"></span>
      <span class="minus dis"></span>
    </div>
  </div>
</div>


</fieldset>
<!-- 모집 인원 -->
<script>
/* 최대 모집인원 선택 코드 */
	$(document).ready(function() {
			$('.num-in span').click(function() {
					var $input = $(this).parents('.num-block').find('input.in-num');
					if ($(this).hasClass('minus')) {
						var count = parseFloat($input.val()) - 1;
						count = count < 1 ? 1 : count;
						if (count < 2) {
							$(this).addClass('dis');
						} else {
							$(this).removeClass('dis');
						}
						$input.val(count);
					} else {
						var count = parseFloat($input.val()) + 1
						if (count > 1) {
							$(this).parents('.num-block').find(('.minus')).removeClass('dis');
						}
						if (count <= 20) {
							$input.val(count);
						} else {
							$(this).parents('.num-block').find(('.plus')).addClass('dis');
						}
					}
					$input.change();
					return false;
				});
	});
	function maxcntCheckFunc(){
		var maxcntInput = document.getElementById("user_maxcnt").value;
		if(maxcntInput > 20){
			alert('최대 인원은 20명 입니다');
			document.getElementById("user_maxcnt").value = 20;
		}else if(maxcntInput < 1){
			alert('최소 1명은 모집해야 합니다');
			document.getElementById("user_maxcnt").value = 1;
		}
	}
</script>
<br>
<br>
<div>

<!-- 선착순 / 수락대기 -->
	<select id="recruitoption" name="recruitoption" style=" border-radius:10px; background:transparent; padding:10px; margin:5px; color:white;">
        <option value="0">선착순</option>
        <option value="1">수락대기</option>
    </select>
</div> <br>

<!-- 시작 날짜 및 시간 -->
<div>
<label for="reservedate" style="color:white;">시작시간</label> <br>
<input type="datetime-local" id="reservedate_input" name="reservedate_input" style="background:transparent;color:white;">
</div> <br>

<!-- 예상 플레이시간 -->
<div>
<label for="playtime_input" style="color:white;">플레이시간: </label>
<span id="playtime_show" style="color:white;">30분</span><br>
<span style="color:white;">30분</span><input type="range" min="30" step="30" value="30" max="360" id="playtime_input" oninput="playTimeFunction()"style="width:200px"/><span style="color:white;">6시간</span><br>
<input type="number" id="playtime" name="playtime" value="30" style="display:none">
</div> <br>
<script>
	function playTimeFunction() {
		let val = document.getElementById('playtime_input').value;
		if (val == 30) {
			console.log("30분");
			$("#playtime_show").text("30분");
		} else if (val % 60 == 0) {
			console.log((val / 60) + "시간")
			$("#playtime_show").text((val / 60) + "시간");
		} else {
			console.log(parseInt(val / 60) + "시간 30분");
			$("#playtime_show").text(parseInt(val / 60) + "시간 30분");
		}
		console.log(playtime);
		$("input#playtime").val(val);
		console.log($("input#playtime").val());
		/*  $("#playtime_output").text(playtime_output); */
	}
	$(function() {
		/* 예상플레이시간 설정시 화면에 표시 */
		var no = $("span#playtime_input").val();
		$("input#playtime").val(no);
	})
</script>

<!-- 유료, 무료 / 참가비 -->
<div>
<label for="price" style="color:white;">참가비</label> <br>
<input type="number" min="0" step="5" max="1000" placeholder="0" value="0" id="price_input" name="price_input" disabled>
<input type="hidden" id="price" name="price">
</div> <br>
<input type="checkbox" id="payedstate" name="payedstate"><span style="color:white;">유료</span> <br>
<script>
	document.getElementById('payedstate').onchange = function() {
		if ($("input#payedstate").is(":checked") == true) {
			console.log('유료');
			$("input#price_input").val('');
			$("input#price_input").prop('disabled', false);
		} else if ($("input#payedstate").is(":checked") == false) {
			console.log('무료');
			$("input#price_input").val('');
			$("input#price_input").prop('disabled', true);
		}
	};
	$(function() {
		var price = $("input#price_input").val();
		$("input#price").val(price);
	});
</script>

<!-- ------------------------------------------------ -->

<!-- 썸네일 -->
<h4 style="color:white;">대표영상 / 썸네일</h4>
<button type="button" id="thumbnail_file">+ 파일</button><br>
<input type="file" id="thumbnail_file" name="thumbnail_file" style="display:none"><br>
<button type="button" id="thumbnail_url">+ URL</button><br>
<!-- <span>입력한 주소</span> -->
<div id="modal" class="modal" style="display:none; position:fixed; z-index:1; left:0; top:0; width:100%; height:100%; overflow:auto; background-color:rgba(0,0,0,0.3);">
	<div id="modal_content" class="modal" style="background-color:#323232; margin:15%auto; padding:20px; border:1px solid #888; width:50%; text-align:center; box-shadow:2px 2px 2px 2px black, 0 0 25px grey;">
		<span style="color:white;">URL: <input type="text" id="thumbnail_url_input" style="color:white; background-color:#707070">
		<button type="button" id="url_input_btn">입력</button>
		<button type="button" id="modal_close">닫기</button> </span>
	</div>
</div>
<input type="text" id="filename" name="filename" style="display:none">
<script>
	/* 버튼 - 파일업로드 연동 */
	$("button#thumbnail_file").click(function() {
		$("input#thumbnail_file").click();
	});

	/* 모달창 코드 */
	var btn = document.getElementById("thumbnail_url");
	var modal = document.getElementById('modal');
	var close = document.getElementById('modal_close');
	btn.onclick = function() {
		modal.style.display = "block";
	}
	close.onclick = function() {
		/* $("input#thumbnail_url_input").val(''); */
		modal.style.display = "none";
	}
	window.onclick = function(event) {
		if (event.target == modal) {
			$("input#thumbnail_url_input").val('');
			/* modal.style.display = "none"; */
			close.click();
		}
	}

	$("button#url_input_btn").click(function() {
		if ($("input#thumbnail_url_input").val().length == 0) {
			alert('url이 입력되지 않았습니다');
		} else {
			$("input#filename").val($("input#thumbnail_url_input").val());
			console.log($("input#filename").val());
			$("button#modal_close").click();
		}
	});
</script>

<!-- 스쿼드 설명 글 -->
<div>
<span style="color:white;">스쿼드 설명<button type="button" id="tagsBtn">+ 태그</button> <input type="text" style="display:none" id="tags" name="tags" value="defaultTag"><br></span>
<span>
<textarea id="contents" name="contents" style="width:500px; height:300px; resize:none; border:1px solid white; border-radius:10px; background:transparent; padding:10px; margin:5px; color:white;">
스쿼드 목적, 준비사항 등 스쿼드에 대해 자세히 설명해주세요(10자이상)</textarea>
</span>
<br>
<span id="inputlength" style="color:white;"> </span><span style="color:white;">/500</span>
</div>
<script>
	$("textarea#contents").focus(function() {
		$("textarea#contents").text("");
	})
	$("textarea#contents").blur(function() {
		$("textarea#contents").text("스쿼드 목적, 준비사항 등 스쿼드에 대해 자세히 설명해주세요(10자이상)");
	})
	$("textarea").keyup(function() {
		$("span#inputlength").text($(this).val().length);
		if (($(this).val().length) > 500) {
			alert('500글자 초과');
			$(this).val($(this).val().substring(0, 500));
			$("span#inputlength").text(500);
			return false;
		}
	});
</script>

<!-- form.submit 버튼 -->
<button id="squadInsert" type="submit">등록</button>
</form>
</body>
</html>