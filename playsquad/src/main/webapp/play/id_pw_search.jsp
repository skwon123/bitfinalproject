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
		$("a#id_search").click(function(){
			var email = $("input#id_find_email").val();			
			if($("input#id_find_email").val().length>0){
			$.ajax({
				url:'/web/idSearch',
				type:'GET',			
				contentType:'application/x-www-form-urlencoded; charset=UTF-8',
				dataType:'text',
				data:{email:email},
				success:function(r){
					console.log(r);
					alert('아이디를 입력하신 이메일로 전송했습니다.');
					},
				error:function(e){
					console.log(e);
					alert('error');
					}
				});
			 }
			 else{
				 alert('이메일 주소를 입력하세요');
			 }
		   });
		
		$("a#pw_search").click(function(){
			var inputId = $("input#user_id").val();
			var keyEmail = $("input#pw_find_email").val();
			if($("input#user_id").val().length>0 || $("input#pw_find_email").val().length>0){
				$.ajax({
					url:'/web/pwSearch',
					type:'GET',			
					contentType:'application/x-www-form-urlencoded; charset=UTF-8',
					dataType:'text',
					data:{
						inputId:inputId,
						keyEmail:keyEmail},
					success:function(r){
						console.log(r);
						alert(r);
					   	},
					error:function(e){
						console.log(e)
						alert('error');
						}
				   });
			 }
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

	<div class="container" style="margin-top: 15px" align="center">
		<div class="row">
			<div class="main" style="background-color:#141414">
				
				<h3>
					<a>아이디 찾기</a>
				</h3>
				<form name="login" method="POST"
					action="web/playsquadListAction">

					<div class="form-group" align="center">
						<!--<a class="pull-right" href="#">Esqueci a senha</a>-->
						<input type="text" style="background-color: #141414; margin-top:15px; width:300px; height: 50px"  
						name="id_find_email" placeholder="이메일" class="form-control" id="id_find_email" />
					</div>
					
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12">
							<a href="" id="id_search" class="btn btn-sm btn-info btn-block" style="background-color: #141414">아이디
								찾기</a>
						</div>
					</div>
				</form>
				
				
				<h3>
					<a>비밀번호 찾기</a>
				</h3>
				<form name="login" method="POST"
					action="web/playsquadListAction">

					<div class="form-group" align="center">
						<input type="text" style="background-color: #141414; margin-top:10px; width:300px; height: 50px" 
						name="user_id" placeholder="아이디" class="form-control" id="user_id" />

					</div>
					<div class="form-group" align="center">
						<!--<a class="pull-right" href="#">Esqueci a senha</a>-->
						<input type="text" style="background-color: #141414; margin-top:15px; width:300px; height: 50px"  
						name="pw_find_email" placeholder="이메일" class="form-control" id="pw_find_email" />
					</div>
					
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12">
							<a href="" id="pw_search" class="btn btn-sm btn-info btn-block" style="background-color: #141414">비밀번호
								찾기</a>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>


	<!-- Footer -->
	<!-- 	<footer>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
				<ul class="list-inline text-center">
					<li><a href="#"> <span class="fa-stack fa-lg"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-envelope-o fa-stack-1x fa-inverse"></i>
						</span>
					</a></li>
					<li><a href="#"> <span class="fa-stack fa-lg"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-home fa-stack-1x fa-inverse"></i>
						</span>
					</a></li>
					<li><a href="#"> <span class="fa-stack fa-lg"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-github fa-stack-1x fa-inverse"></i>
						</span>
					</a></li>
				</ul>
				<p class="copyright text-muted">Copyright &copy;2016 SIST. All
					rights reserved | code by milib</p>
			</div>
		</div>
	</div>
	</footer>
 -->
</body>

</html>