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
<script type="text/javascript">
	$(function() {		
		window.opener.location.reload();
		$("button#btnCancel").click(function(){
			window.close();
			});
		
		$("button#btnRefresh").click(function(){
			location.reload();
			});
		

				 
	});
</script>
<title>Start Simple Web</title>



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
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/play/index.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

		
		<h3>호스트 관리페이지</h3>
		
		<h3 style="margin-bottom: 20px;">참가 중인 게스트</h3>			
		<div class="list" style="margin-bottom: 20px; margin-left:100px;">
		<c:if test="${empty squadhistory}">
        	<h4 style="color:gray">현재 참가 중인 게스트가 없습니다.</h4>
    	</c:if>
    	<c:if test="${not empty squadhistory}">
		<table border="1" bordercolor="white">
		<tbody>
		<tr>
			<td colspan="2">게스트 이름</td>
			<td>신청 날짜</td>
			<td></td>

		</tr>
		<c:forEach var="i" items="${squadhistory}" varStatus="cnt">	
			
				<tr>
					<td><img src="/web/resources/img/play/upload/profile/${i.members_profile_img}"
							class="rounded-circle" style="width: 50px; height: 50px;" /></td>
					<td>${i.members_nickname}</td>
					<td>${i.regdate}</td>
					<td>
					<button type="button" class="btn" id="btnSHNo" style="background-color: #141414;margin: auto;" 
						onclick="location.href='/web/squadHostingButtonSH?no=${i.squadboard_no}&acId=${i.members_id}'">
						<i class='fa fa-remove' style="color:red"></i>
					</button>
					</td>
				</tr>
				
				
		</c:forEach>
			</tbody>
		</table>	
		</c:if>				
		</div>
		<h3 style="margin-bottom: 20px;">수락대기 중인 게스트</h3>
		
		<div class="list" style="margin-bottom: 20px; margin-left:100px;">
		<c:if test="${empty acceptwaitting}">
        	<h4 style="color:gray">현재 수락대기 중인 게스트가 없습니다.</h4>
    	</c:if>
    	<c:if test="${not empty acceptwaitting}">
		<table border="1" bordercolor="white">
		<tbody>
		<tr>
			<td colspan="2">게스트 이름</td>
			<td>신청 날짜</td>
			<td></td>
		</tr>
		<c:forEach var="i" items="${acceptwaitting}" varStatus="cnt">	
			
				<tr>
					<td><img src="/web/resources/img/play/upload/profile/${i.members_profile_img}"
							class="rounded-circle" style="width: 50px; height: 50px;" /></td>
					<td>${i.members_nickname}</td>
					<td>${i.regdate}</td>
					<td>
					<button type="button" class="btn" id="btnAwNo" style="background-color: #141414;margin: auto;" 
						onclick="location.href='/web/squadHostingButtonAC?no=${i.squadboard_no}&acId=${i.members_id}&ac=no'">
						<i class='fa fa-remove' style="color:red"></i>
					</button>
					<button type="button" class="btn" id="btnAwYes" style="background-color: #141414;margin: auto;" 
						onclick="location.href='/web/squadHostingButtonAC?no=${i.squadboard_no}&acId=${i.members_id}&ac=yes'">
						<i class='fa fa-check' style="color:green"></i>
					</button>
					</td>
				</tr>
				
				
		</c:forEach>
			</tbody>
		</table>
		</c:if>					
		</div>
					
	<div class="row">
		<div style="float: left;">
		<button type="button" class="btn" id="btnRefresh" style="background-color: #141414;margin: auto;" >
			<i class='fa fa-refresh' style="color: white"></i>
		</button>
		</div>
		<div style="float: right;">
		<button type="button" class="btn" id="btnCancel" style="background-color: red;margin: auto;" >
			<span id="span">닫기</span>
		</button>
		</div>
	</div>		
					
				

</body>

</html>