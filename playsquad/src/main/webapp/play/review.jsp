<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<title>후기 작성</title>

<!-- Bootstrap Core CSS -->
<link href="/web/resources/boardFront/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<!-- <link href="css/login.css" rel="stylesheet"> -->
<link href="/web/resources/boardFront/css/clean-blog.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/play/index.css">
</head>

<script>
	$(function() {
		/* form submit 코드 */
		$("button#reviewInsert").click(
				function() {
					if($("textarea#contents").val().length == 0) {
						alert('0자 이상 설명을 적어주세요');
					} else {
						$("form#GuestReviewInsert").submit();
					}
					return false;
				});
	})
</script>

<style>
#myform fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    direction: rtl; /* 이모지 순서 반전 */
    border: 0; /* 필드셋 테두리 제거 */
}
#myform fieldset legend{
    text-align: left;
}
#myform input[type=radio]{
    display: none; /* 라디오박스 감춤 */
}
#myform label{
    font-size: 2em; /* 이모지 크기 */
    color: transparent; /* 기존 이모지 컬러 제거 */
    text-shadow: 0 0 0 #fffafa; /* 새 이모지 색상 부여 */
}
#myform label:hover{
    text-shadow: 0 0 0 #f3f700; /* 마우스 호버 */
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 #f3f700; /* 마우스 호버 뒤에오는 이모지들 */
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 #f3f700; /* 마우스 클릭 체크 */
}
</style>

<body bgcolor="#141414">
	<form action="/web/GuestReviewInsert" name="GuestReviewInsert" id="GuestReviewInsert" method="post">
		<input type="hidden" name="userId" value="${userId}"> <!-- writer_id -->
		<input type="hidden" name="gamehostId" value="${gamehostId}"> 
		<input type="hidden" name="userName" value="${userName}">
	<fieldset style="display: block; color: white; border: none;">
			<div id="contentsInputItems" style="display: block;">
				<label for="contentsInput"
					style="color: white; display: inline-block;">후기 작성</label>&emsp;<span
					id="inputlength" style="color: white; display: inline-block;">
				</span><span style="color: white; display: inline-block;">/100</span>
				
				<textarea class="contentsInput" id="contents" name="contents"
					style="display: block; width: 500px; height: 110px; resize: none; border: 1px solid white; border-radius: 10px; background: transparent; padding: 10px; margin: 5px; color: white;">
후기를 작성하세요.</textarea>
			</div>
			<div>
				<button id="reviewInsert" type="submit" 
					style="border: none; background: #035AA6; color: white; margin-left: 30%;">등록</button>
			</div>

		</fieldset>
		<script>
			$("textarea#contents").focus(function() {
				$("textarea#contents").text("");
			})
			$("textarea#contents").blur(function() {
				$("textarea#contents").text("후기를 작성하세요.");
			})
			$("textarea").keyup(function() {
				$("span#inputlength").text($(this).val().length);
				if (($(this).val().length) > 100){
					alert('100글자를 초과했습니다.');
					$(this).val($(this).val().substring(0, 100));
					$("span#inputlength").text(100);
					return false;
				}
			});
		</script>
	</form>
	
	<!--<form name="myform" id="myform" method="post" action="/web/GuestReviewInsert" >
    <fieldset>
        <legend style="font-color: white">평점</legend>
        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
    </fieldset>
</form>-->
</body>
</html>