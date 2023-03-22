<%@page import="com.bit.web.play.vo.membersBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!-- 줄바꿈 -->
<%@ taglib prefix="fn" uri= "http://java.sun.com/jsp/jstl/functions" %>
<%
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
<!-- 줄바꿈 -->

<!DOCTYPE html>
	<html lang="UTF-8">
	<head>
	<meta charset="UTF-8">
	<meta name="viewport"
		content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>TogetherSquad</title>
	
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
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"></script>

<script type="text/javascript">


    //이미지 미리보기
    $(document).ready(function () {
        $("#profile_img").on("change", handleImgFileSelect);

//         //포로필 업데이트
//         $("#sendButton").click(function () {
//             if ($("input[name='nickname']").val().length != 0
//                 || $("input#genre1").val().length != 0
//                 || $("input#genre2").val().length != 0
//                 || $("input#tel").val().length != 0
//                 || $("input#email").val().length != 0
//                 || $("input#aboutme").val().length != 0
//             ) {
//                 return false;

// 		{if($("[type='password']").val().length==0|| $("textarea").val().length==0){
// 			 alert('password or textarea Check!');
// 			 $("[type='password']").val('');
// 			 $("textarea").val('');
// 			 return false;
//             }

//             $("form").submit();
        });


    function handleImgFileSelect(e) {
        let files = e.target.files;
        let filesArr = Array.prototype.slice.call(files);

        let reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;

        filesArr.forEach(function (f) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }

            let reader = new FileReader();
            reader.onload = function (e) {
                $("#img").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
</script>



<script type="text/javascript">
$(function () {

	//포로필 업데이트
	$("a#sendButton").click(function() {
		if($("input#nickname").val().length == 0
		
        ) {
            alert('닉네임을 입력해주세요');
            return false;
        }
        $("form").submit();
	});
});


</script>



</head>
<body>
<jsp:include page="testHeader.jsp"></jsp:include>

<form action="updateProfile" method="post" enctype="multipart/form-data">
	
	
    <main>
        <div class="profile1" align="center">
            <img name="profile_img" style="max-width: 12%; height: auto; margin-top:70px; background-color: #141414;"/>
            <div>
                <label for="profile_img"></label>
                <input type="hidden" name="profile_img" id="profile_img" value="${view.profile_img}" />
                <input type="file" name="profileimg" id="profileimg" size="50"/>

			</div>            
            </div>
    </main>
    
<%--     ${view } --%>
 
        <div class="profile" style="font-style: white; border:1; border-color=white">
        
        <div>
		<input type="hidden" value="${view.members_id}"  name="members_id" id="members_id" />
		</div>
        
            <p>
                <br>
            <div class="form-group" align="center">
                <input type="text" value="${view.nickname}"  style="background-color: #141414; margin-top:10px; width:300px; height: 50px"
                       id="nickname" name="nickname"/>
			<!-- readonly="readonly" //값 변경 못하게 -->
            </div>


            <div class="form-group" align="center">
                <input type="text" value="${view.tel}" readonly="readonly" style="background-color: #141414; margin-top:10px; width:300px; height: 50px"
                       name="tel" id="tel" placeholder="  휴대전화"/>
            </div>

            <div class="form-group" align="center">
                <input type="email" value='<c:out value="${view.email}"/>'  style="background-color: #141414; margin-top:10px; width:300px; height: 50px"
                       name="email" id="email" placeholder="  이메일"/>
            </div>
            <div class="form-group" align="center" style="font-style: white;">
                <select id="genre1" name="genre1"
                        style="background-color: #141414; margin-top: 10px; width: 300px; height: 50px; font-style: white;vertical-align: middle; font-size: 0.4cm;">
                    <option selected="selected">&nbsp;선택해주세요 </option>
                    <option value="">----------------------</option>
                    <c:choose>
						<c:when test="${view.genre1 eq '롤'}">
							<option value="롤" selected>ㆍ리그오브레전드</option>
						</c:when>
						<c:otherwise>
							<option value="롤">ㆍ리그오브레전드</option>
						</c:otherwise>
					</c:choose>
                    <c:choose>
						<c:when test="${view.genre1 eq '배그' }">
							<option value="배그" selected>ㆍ배틀그라운드</option>
						</c:when>
						<c:otherwise>
							<option value="배그" >ㆍ배틀그라운드</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${view.genre1 eq '카트라이더' }">
							<option value="카트라이더" selected>ㆍ카트라이더</option>
						</c:when>
						<c:otherwise>
							<option value="카트라이더" >ㆍ카트라이더</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${view.genre1 eq '오버워치' }">
							<option value="오버워치" selected>ㆍ오버워치</option>
						</c:when>
						<c:otherwise>
							<option value="오버워치" >ㆍ오버워치</option>
						</c:otherwise>
					</c:choose>
                </select>
             </div>   
                
            <div class="form-group" align="center" style="font-style: white;">
                <select id="genre2" name="genre2"
                        style="background-color: #141414; margin-top: 10px; width: 300px; height: 50px; font-style: white;vertical-align: middle; font-size: 0.4cm;">
                    <option selected="selected">&nbsp;선택해주세요 </option>
                    <option value="">----------------------</option>
                    <c:choose>
						<c:when test="${view.genre2 eq '롤'}">
							<option value="롤" selected>ㆍ리그오브레전드</option>
						</c:when>
						<c:otherwise>
							<option value="롤">ㆍ리그오브레전드</option>
						</c:otherwise>
					</c:choose>
                    <c:choose>
						<c:when test="${view.genre2 eq '배그' }">
							<option value="배그" selected>ㆍ배틀그라운드</option>
						</c:when>
						<c:otherwise>
							<option value="배그" >ㆍ배틀그라운드</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${view.genre2 eq '카트라이더' }">
							<option value="카트라이더" selected>ㆍ카트라이더</option>
						</c:when>
						<c:otherwise>
							<option value="카트라이더" >ㆍ카트라이더</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${view.genre2 eq '오버워치' }">
							<option value="오버워치" selected>ㆍ오버워치</option>
						</c:when>
						<c:otherwise>
							<option value="오버워치" >ㆍ오버워치</option>
						</c:otherwise>
					</c:choose>
                </select>
                
              </div>  
                
                <div class="form-group" align="center">
                
      
				<textarea  style="background-color: #141414; margin-top:10px; width:300px; height: 400px" 
				id="aboutme" name="aboutme" placeholder="   자기소개">
				
				</textarea> 
                
                </div>
                
                
            <div class="form-group" align="center">
                <input type="password" style="background-color: #141414; margin-top:10px; width:300px; height: 50px"
                       id="password1" name="password1" placeholder="  비밀번호"/>
            </div>
            <div class="content-list" align="center">
                <input type="password" style="background-color: #141414; margin-top:10px; width:300px; height: 50px"
                       id="password2" name="password2" placeholder="  비밀번호 변경"/>
                <input type="hidden" name="password" id="password" value="" class="form-control"/>
            </div>
            <div class="form-group" align="center">
                <a id="sendButton" href="#" class="btn btn-sm btn-info btn-block" style="font-size: 1.2rem; width:300px; height: 30px">확인</a>
            </div>
        </div>

</form>

</body>
</html>