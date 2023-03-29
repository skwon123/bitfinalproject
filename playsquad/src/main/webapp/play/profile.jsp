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
	<script type="text/javascript"></script>

<script>

function previewImage() {
	  const preview = document.getElementById('preview');
	  const file = document.getElementById('profileimg').files[0];
	  const reader = new FileReader();

	  reader.onloadend = function() {
	    preview.src = reader.result;
	  }

	  if (file) {
	    reader.readAsDataURL(file);
	  } else {
	    preview.src = "";
	  }
	}
</script>



<script type="text/javascript">
$(function () {

	//포로필 업데이트
	$("button#sendButton").click(function() {
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

<form action="/web/updateProfile" method="POST" enctype="multipart/form-data">
	
	<div align="center">
    <table>
        <tr>
        <th width="150">변경 전</th>
        <th width="150">변경 후</th>
        </tr>
    
    	<tr>    
         <th><img src="/web/resources/img/play/upload/profile/${view.profile_img}" style="width:300px; height::150px"/></th>
         
         <th>
         <img id="preview" src="" style="width:300px; height::auto">
         <br><img id="preview" src="" style="width:300px; height::auto">
         </tr>        	          
        
        <tr>
        <th></th>
        
        <th align="center">
        <input type="file" name="profileimg" id="profileimg"  onchange="previewImage()" style="width:300px; height::150px"/>
        </th>
        </tr>    
            
    </table>
   </div> 

<!--   <input type="file" id="imageFile" name="imageFile" onchange="previewImage()"> -->
<!--   <img id="preview" src="" alt="Preview Image"> -->


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
				id="aboutme" name="aboutme"  placeholder="   자기소개">${view.aboutme}
	
				
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
            <div class="form-group" align="center" style="magin-top:40px">
                <button id="sendButton" type="button" class="btn btn-sm btn-info btn-block" style="font-size: 1.2rem; width:300px; height: 20px">확인</button>
            </div>
        </div>

</form>

</body>
</html>