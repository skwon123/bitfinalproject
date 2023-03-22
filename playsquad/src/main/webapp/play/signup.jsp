<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Start Simple Web</title>

    <jsp:include page="/header/default.jsp"></jsp:include>
    <!-- Custom Fonts -->
    <link rel="stylesheet" href="../resources/css/play/index.css">
    <script type="text/javascript">
        $(function () {
            //아이디 중복 체크
            $("span#uniqueId a").click(function () {

                let id = $("input[name='members_id']").val();
                $.ajax({
                    url: '${pageContext.request.contextPath}/ajaxFindID',
                    type: 'POST',
                    data: {id: id},
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    dataType: 'text',
                    success: function (result) {
                        if (result == 'true') {
                            $("span#sid1").html("<font style='blue'>중복</font>");
                            $("input[name='members_id']").val('');
                            $("input[name='members_id']").focus();
                        } else {
                            $("span#sid1").html("<font style='red'>가능</font>");
                        }
                    },
                    error: function () {
                        alert('error');
                    }
                });
            });

            //별명 중복 체크

            $("span#unique a").click(function () {

                let nickname = $("input[name='nickname']").val();
                $.ajax({
                    url: '${pageContext.request.contextPath}/ajaxFindNickname',
                    type: 'POST',
                    data: {nickname: nickname},
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    dataType: 'text',
                    success: function (result1) {
                        if (result1 == 'true') {
                            $("span#sid").html("<font color='red'>중복</font>");
                            $("input[name='nickname']").val('');
                            $("input[name='nickname']").focus();
                        } else {
                            $("span#sid").html("<font color='red'>가능</font>");
                        }
                    },
                    error: function () {
                        alert('error');
                    }
                });
            });

            //비밀번호 체크
            $("input#password2").blur(function () {
                if ($("input#password1").val() == $("input#password2").val() && $("input#password1").val().length > 0) {
                    $("input#password").val($("input#password1").val());
                } else {
                    $("input#password1").val('');
                    $("input#password2").val('');
                    $("input#password1").focus();
                }
            });

            // 전체 데이터 입력
            $("a#sendButton").click(function () {
                if ($("input#id").val().length == 0
                    || $("input#password1").val().length == 0
                    || $("input#password2").val().length == 0
                    || $("input#nickname").val().length == 0
                    || $("input#birth").val().length == 0
                    || $("input#tel").val().length == 0
                    || $("input#email").val().length == 0
// 				||$("input#profile_img").val().length==0
                ) {
                    alert('다 입력해주세요');
                    return false;

// 		$("input#id").focus(); //id에 초점을
// 		return false;
                }
                $("form").submit();
                //alert("dasda");
            });
        });
    </script>
</head>

<body>
<div class="container" style="margin-top: 60px" align="center">
    <div class="row">
        <div class="main" style="background-color: #141414">
            <h3>
                <a>회원가입</a>
            </h3>

            <form name="replyFrm" action="${pageContext.request.contextPath}/newMember" enctype="multi/formhipdata" method="post">
                <div class="form-group" align="center">

                    <input type="text"
                           style="background-color: #141414; margin-top: 10px; width: 300px; height: 50px"
                           name="members_id" placeholder="아이디" class="form-control" id="id"/>
                    <span class="buttonFuc" id="uniqueId"><br>
						<a href="#" id="uniqueId">중복 </a><span id="sid1"></span></span>
                </div>

                <div class="form-group" align="center">
                    <input type="password"
                           style="background-color: #141414; margin-top: 10px; width: 300px; height: 50px"
                           placeholder="비밀번호" class="form-control"
                           id="password1" name="password1"/>

                </div>

                <div class="form-group" align="center">
                    <!--<a class="pull-right" href="#">Esqueci a senha</a>-->
                    <input type="password"
                           style="background-color: #141414; margin-top: 10px; width: 300px; height: 50px"
                           placeholder="비밀번호 확인" class="form-control"
                           id="password2" name="password2"/>
                    <input type="hidden" name="password" id="password" class="form-control"/>
                </div>

                <div class="form-group" align="center">
                    <input type="date" min="2000-01-01" max="2023-12-31"
                           style="background-color: #141414; margin-top: 10px; width: 300px; height: 50px"
                           name="birth" placeholder="생년월일" class="form-control"
                           id="birth"/>
                </div>

                <div class="form-group" align="center">
                    <input type="text"
                           style="background-color: #141414; margin-top: 10px; width: 300px; height: 50px"
                           name="nickname" placeholder="별명" class="form-control"
                           id="nickname"/>
                    <span class="buttonFuc" id="unique"><br>
						<a href="#" id="unique">중복 </a><span id="sid"></span></span>
                </div>

                <div class="form-group" align="center">
                    <input type="text"
                           style="background-color: #141414; margin-top: 10px; width: 300px; height: 50px"
                           name="tel" placeholder="휴대전화" class="form-control"
                           id="tel"/>
                </div>

                <div class="form-group" align="center">
                    <select id="genre1" name="genre1"
                            style="background-color: #141414; margin-top: 0px; width: 300px; height: 50px; font-style: white;vertical-align: middle; font-size: 0.4cm;">
                        <option value="기본">선택1</option>
                        <option value="롤">리그오브레전드</option>
                        <option value="배그">배틀그라운드</option>
                        <option value="카트">카트라이더</option>
                        <option value="옵치">오버워치</option>
                    </select>

                </div>

                <div class="form-group" align="center">

                    <select id="genre2" name="genre2"
                            style="background-color: #141414; margin-top: 0px; width: 300px; height: 50px; font-style: white;vertical-align: middle; font-size: 0.4cm;">
                        <option value="기본">선택2</option>
                        <option value="롤">리그오브레전드</option>
                        <option value="배그">배틀그라운드</option>
                        <option value="카트">카트라이더</option>
                        <option value="옵치">오버워치</option>
                    </select>

                </div>


                <div class="form-group" align="center">
                    <input type="text" style="background-color: #141414; margin-top: 10px; width: 300px; height: 50px"
                           name="email" placeholder="이메일" class="form-control"
                           id="email"/>
                </div>
                <br>

                <!-- 이미지 -->
                <div>

                    <input type="hidden" name="profile_img" id="profile_img" src="../resources/img/play/basicProfile.jpg"/>

                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12" id="sendButton">
                        <a id="sendButton" href="#" class="btn btn-sm btn-info btn-block" style="background-color: #141414">회원가입</a>
                        <p><br>
                            <a href="login.jsp" class="btn btn-sm btn-info btn-bloc">취소</a>
                    </div>
                </div>

            </form>
        </div>

    </div>
</div>
</body>
</html>