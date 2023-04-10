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


<script>
   $(function() {
      /* form submit 코드 */
      $("button#reviewInsert").click(
            function() {
               if($("textarea#contents").val().length == 0) {
                  alert('1자 이상 적어주세요');
               } else {
                  $("form#GuestReviewInsert").submit();
               }
               return false;
            });
      console.log();
   })
   
   function setScore(value) {
        document.getElementById('score').value = value;
}
</script>

<body bgcolor="#141414">
   <form action="/web/GuestReviewInsert" name="GuestReviewInsert" id="GuestReviewInsert" method="post">
      <input type="hidden" name="host_id" id="host_id" value="${host_id}"> 
 
  <fieldset style="margin-top:30px">
        <legend style="font-color: white;">평점</legend>
        <select name="score" style="background-color: #141414">
           <option value="5">⭐⭐⭐⭐⭐</option>
           <option value="4">⭐⭐⭐⭐</option>
           <option value="3">⭐⭐⭐</option>
           <option value="2">⭐⭐</option>
           <option value="1">⭐</option>
        
        </select>
        
<!--         <input type="radio" name="score" value="5" id="rate1" onclick="setScore(this.value)"><label for="rate1">⭐⭐⭐⭐⭐5</label> -->
<!--         <input type="radio" name="score" value="4" id="rate2" onclick="setScore(this.value)"><label for="rate2">⭐⭐⭐⭐4</label> -->
<!--         <input type="radio" name="score" value="3" id="rate3" onclick="setScore(this.value)"><label for="rate3">⭐⭐⭐3</label> -->
<!--         <input type="radio" name="score" value="2" id="rate4" onclick="setScore(this.value)"><label for="rate4">⭐⭐2</label> -->
<!--         <input type="radio" name="score" value="1" id="rate5" onclick="setScore(this.value)"><label for="rate5">⭐1</label> -->
    
   </fieldset>
   <fieldset style="display: block; color: white; border: none;">
         <div id="contentsInputItems" style="display: block; margin-top: 20px" align="center">
            <label for="contentsInput"
               style="color: white; display: inline-block;">후기 작성</label>&emsp;<span
               id="inputlength" style="color: white; display: inline-block;">
            </span><span style="color: white; display: inline-block;">/100</span>
            
            <textarea class="contentsInput" id="contents" name="contents"
               style="display: block; width: 500px; height: 110px; resize: none; border: 1px solid white; border-radius: 10px; background: transparent; padding: 10px; margin: 5px; color: white;">
후기를 작성하세요.</textarea>
         </div>
         <div align="center" style="margin-top:10px">
            <button id="reviewInsert" type="button" 
               style="border: none; background: #035AA6; height:50px; width:100px; color: white; font-size:15px;">등 록</button>
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
 
</body>
</html>