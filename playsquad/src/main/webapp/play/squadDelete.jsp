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
		$("button#btnCancel").click(function(){
			window.close();
			});
		
		$("button#btnSubmit").click(function(){
			$("form#squadDelete").submit();
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
<c:set var="no" value="${param.no}"></c:set>
<c:set var="job" value="${param.job}"></c:set>
<c:set var="work" value="${param.work}"></c:set>
<c:set var="rc" value="${param.rc}"></c:set>
	
	<div class="container" style="margin-top: 15px" align="center">
		<div class="row">
			<div class="main" style="background-color:#141414">
			<%-- no : ${no} / job : ${job} / work : ${work} / rc : ${rc} --%>	
			<c:choose>
			<c:when test="${param.job=='host'}">
				<h3>정말 이 스쿼드를 <br> 삭제하시겠습니까?</h3>
			</c:when>
			<c:when test="${param.job=='guest'}">
				<c:choose>
				<c:when test="${param.rc==0}">
					<h3>정말 이 스쿼드의 참가를 <br> 취소하시겠습니까?</h3>
				</c:when>
				<c:when test="${param.rc==1}">
					<h3>정말 이 스쿼드의 대기를 <br> 취소하시겠습니까?</h3>
				</c:when>
				</c:choose>
				
			</c:when>
			</c:choose>	
				
			<form name="squadDelete" id="squadDelete" method="POST" action="/web/squadDeleteOrCancel">
				<div class="form-group" id="hiddenInput" align="center">	
					<input type="hidden" placeholder="게시판 번호"  name="no" id="no" value="${no}"/>
					<input type="hidden" placeholder="아이디" name="members_id" id="members_id" value="${userId}"/>
					<input type="hidden" placeholder="클라이언트" name="job" id="job" value="${job}"/>
					<input type="hidden" placeholder="작업" name="work" id="work" value="${work}"/>
					<input type="hidden" placeholder="모집옵션" name="rc" id="rc" value="${rc}"/>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12">
						<button type="button" class="btn btn-sm btn-info btn-block" id="btnSubmit" style="background-color: #141414;" onclick="btnActive()">
							<span>확인</span>
						</button>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12">
						<button type="button" class="btn btn-sm btn-danger btn-block" id="btnCancel" style="background-color: #141414;" onclick="btnActive()">
							<span>취소</span>
						</button>
					</div>
						
				</div>
					
					
			</form>
			</div>

		</div>
	</div>
</body>

</html>