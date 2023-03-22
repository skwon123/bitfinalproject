<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>결제하기</title>
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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
$(function(){
	$("input#creditcard").onchange = function(){
	if($("input#creditcard").is(":checked") == true){
		$("input#yes1").is(":checked");
		$("input#yes2").is(":checked");
		$("input#yes3").is(":checked");
		$("input#yes4").is(":checked");
	}else if(document.getElementById("creditcard").is(":unchecked" == false)){
		document.getElementById("yes1").is(":unchecked") == false;
		document.getElementById("yes2").is(":unchecked") == false;
		document.getElementById("yes3").is(":unchecked") == false;
		document.getElementById("yes4").is(":unchecked") == false;
	}
};
});
function showPopup() {
	/*if($("input#yes1").is(":checked") == true){		
		window.open("payprocess.jsp", "a", "width=400, height=400, left=200, top=100"); 
	}*/
	if($("input#creditcard").is(":checked") == true && $("input#yes1").is(":checked") == true && $("input#yes2").is(":checked") == true && $("input#yes3").is(":checked") == true && $("input#yes4").is(":checked") == true){
		window.open("payprocess.jsp", "a", "width=400, height=400, left=200, top=100"); 
	}else{
		return false;
	}
}



</script>


<body>

	<!--header  -->
	<jsp:include page="testHeader.jsp"></jsp:include>
	<!--header  -->



	<div style="margin-top: 150px; margin-left: 400px; font-size: 1cm;">
		코인 충전하기<br> <a style="font-size: 0.3cm;"> 코인은 유료 스쿼드 신청에 필요한
			Togethersquad 내 재화입니다. </a>
	</div>

	<table border="1" bordercolor="white" width="1200" height="300"
		style="margin-left: 350px; border-left: none; border-right: none; border-bottom: none">
		<tr align="center">

			<!--로그인한 계정 이미지 -->

			<td style="color: white; border: none; width: 150px; height: 150px;">
				<img src="/web/resources/img/play/coin.jpg"
				style="max-width: 80%; height: auto; margin-top: 15px; margin-left: 0px;" />
			</td>

			<!-- 세로줄 -->
			<td rowspan=12
				style="color: white; border-top: none; border-right: none; border-bottom: none; width: 5px;">
				<!-- 			<a style="color:white; border-top: none; border-right:none; border-bottom: none; "></a> -->
			</td>

			<!-- 양쪽 화살표 -->
			<td rowspan=5 style="border: none;">
				<img align="left" src="/web/resources/img/play/coin.jpg" style="max-width: 80%; height: auto; margin-top: 15px; margin-left: 0px;" />
				<input type="radio" name="coinoption" value="10coin" id="10coin" style="margin-left: 40px; transform: scale(1.4)"> 10 코인 <br> <br> 
				<!--<img align="center-left" src="/web/resources/img/play/coin.jpg" style="max-width: 80%; height: auto; margin-top: 15px; margin-left: 0px;" />-->
				<input type="radio" name="coinoption" value="50coin" id="50coin" style="margin-left: 40px; transform: scale(1.4)"> 50 코인 <br> <br>
				<!--<img align="center-left" src="/web/resources/img/play/coin.jpg" style="max-width: 80%; height: auto; margin-top: 15px; margin-left: 0px;" />-->
				<input type="radio" name="coinoption" value="100coin" id="100coin" style="margin-left: 40px; transform: scale(1.4)"> 100 코인 <br> <br>
			</td>
				


			<!-- 		<td rowspan=5 style="color:white; border-top: none; border-right:none; border-bottom: none; "> -->
			<!-- 			<a style="border:1; width:100px; height:1200px"></a> -->
			<!-- 		</td> -->

		</tr>
		<!--의미없는 칸 만든거 -->
		<tr>
			<td style="border: none; width: 50px; height: 50px;"></td>
		</tr>

		<tr align="center">
			<td style="border: none; font-size: 0.5cm">충전 계정 이메일</td>
		</tr>

		<!--의미없는 칸 만든거 -->
		<tr>
			<td style="border: none; height: 15px;"></td>
		</tr>

		<!--내가 가입한 이메일 -->
		<tr align="center">
			<td style="border: none; width: 150px; font-size: 0.4cm;">
				bitcom@naver.com <!-- <a style="border:1 width:0px; height:1200px"></a> -->
			</td>

			<!--의미없는 칸 만든거 -->
		<tr>
			<td style="border: none; height: 8px;"></td>
		</tr>


		<!--가로줄 -->
		<tr>
			<td
				style="border-left: none; border-right: none; border-bottom: none; width: 150px;"></td>
		</tr>

		<!--의미없는 칸 만든거 -->
		<tr>
			<td style="border: none; height: 15px;"></td>

			<td colspan=2
				style="color: white; width: 1200px; border-left: none; border-right: none; border-bottom: none;">
			</td>
		</tr>

		<tr>
			<td style="border: none; font-size: 0.5cm"></td>



			<td style="border: none; font-size: 0.5cm">결제수단
			<!--<select name="category" id="category" class="form-control" style="background-color: #141414">
					<option value="${paymentmethod}">&nbsp;+ 수단 선택</option>
					<option value="creditcard">신용카드</option>
			</select>-->
				<input type="checkbox" name="paymethod" value="creditcard" id="creditcard" style="margin-left: 40px; transform: scale(1.4)"> 신용카드 <br> <br>
			</td>
		<tr>
		</tr>


		<tr style="border: none; height: 250px">
			<td style="border: none;"></td>
			
			<!-- 결제 체크박스 -->
			<td style="border: none; font-size: 0.35cm;">
			
				<input type="checkbox" name="agreecheck" value="yes1" id="yes1" style="margin-left: 40px; transform: scale(1.4)"> 전체 항목에 동의합니다. <br> <br> 
				<input type="checkbox" name="agreecheck" value="yes2" id="yes2" style="margin-left: 40px; transform: scale(1.4)"> 결제를 진행하는 본인의 명의로 결제합니다. <br> <br> 
				<input type="checkbox" name="agreecheck" value="yes3" id="yes3" style="margin-left: 40px; transform: scale(1.4)"> 이용약관 및 환불정책에 동의합니다. <br> <br> 
				<input type="checkbox" name="agreecheck" value="yes4" id="yes4" style="margin-left: 40px; transform: scale(1.4)"> 결제대행사 결제정보위탁에 동의합니다. <br> <br>
				<br>
				
				
			</td>
		</tr>
		

		<tr style="border: none;">
			<td style="border: none;"></td>
			<td align="center" colspan=4 style="border: none;"><a
				href="#" id="payment"
				class="btn btn-sm btn-info btn-block" style="font-size: 1.2rem" onclick="showPopup();">결제하기</a></td>
		</tr>
	</table>
</body>
</html>