<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Permanent+Marker&family=Single+Day&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
    <style>
      body {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
        margin: 0;
    }
    .loginform {
        width: 80%; /* Set the width to your desired value */
        max-width: 400px; /* Optional: set a maximum width if needed */
    }
    .userenter-container {
        display: flex;
        justify-content: space-between;
        margin-bottom: 10px;
        font-size:15px;
    }
	
    .userid {
        margin-bottom: 10px; /* Add margin-bottom */
    }
    .userpw {
    	margin-bottom: 10px;
    }
    
    .idcheck {
    	margin-bottom: 10px;
    }
    .user a, .usersearch a {
        text-decoration: none; /* Remove underline */
        color: #000000; /* Set color to black */
    }
  	
     .footer button {
        width: 100%;
        background-color: beige; /* Set background color to beige */
        color: #000000; /* Set text color to black */
        border: 1px solid white; /* Set border to white */
        height: 60px; /* Increase height */
        
    }  
    
    .error-message {
            color: red;
        }
    </style>
    <c:set var="root" value="<%=request.getContextPath()%>"/>

    <script type="text/javascript">
        $(document).ready(function () {
            // 이전에 저장된 아이디를 쿠키에서 가져와 입력 필드에 자동으로 채워넣기
            let savedUserId = getCookie("savedUserId");
            if (savedUserId) {
                $("#login_myid").val(savedUserId);
                $("#saveid_checkbox").prop("checked", true);
            }

            // 로그인 버튼 클릭 이벤트
            $("#btnlogin").click(function (event) {
                // 기본 양식 제출 동작 방지
                event.preventDefault();

                let saveid = $("#saveid").is(":checked");
                let userid = $("#login_myid").val();
                let userpw = $("#login_pass").val();

             // 유효성 검사
                let isValid = true;

                if (userid === "") {
                    $("#userid-error").text("아이디를 입력해주세요.");
                    $("#login_myid").css("border-color", "red");
                    isValid = false;
                } else {
                    $("#userid-error").text("");
                    $("#login_myid").css("border-color", "");
                }

                if (userpw === "") {
                    $("#userpw-error").text("비밀번호를 입력해주세요.");
                    $("#login_pass").css("border-color", "red");
                    isValid = false;
                } else {
                    $("#userpw-error").text("");
                    $("#login_pass").css("border-color", "");
                }

                if (!isValid) {
                    return;
                }

                $.ajax({
                    type: "get",
                    dataType: "json",
                    url: "${root}/login/process",
                    data: { "saveid": saveid, "userid": userid, "userpw": userpw },
                    success: function (res) {
                        // 성공여부: res.success
                        if (res.success) {
                            window.location.href = "${root}";
                        } else {
                            alert("아이디 또는 비밀번호가 일치하지 않습니다.");
                        }
                    }
                });
            });
        });

        // 쿠키에서 저장된 아이디 가져오기 함수
        function getCookie(name) {
            var value = "; " + document.cookie;
            var parts = value.split("; " + name + "=");
            if (parts.length === 2) return parts.pop().split(";").shift();
        }
    </script>

</head>
<h3></h3>
<body>
    
    <form class="loginform" action="${root}/process" method="get">
        <div class="header">
            <h3>로그인</h3>
        </div>
        <br><br>
        <div class="body">
            <div class="userid">
                <input type="hidden" name="saveid" id="saveid" value="${sessionScope.saveid}">
                <c:if test="${sessionScope.saveid==null || sessionScope.saveid=='no' }">
                    <input type="text" id="login_myid" name="userid" class="form-control" placeholder="아이디">
                	<div id="userid-error" class="error-message"></div>
                </c:if>
                <c:if test="${sessionScope.saveid=='yes' }">
                    <input type="text" id="login_myid" name="userid" class="form-control" value="${sessionScope.userid}" >
                </c:if>
            </div>
            
            <div class="userpw">
                <input type="password" id="login_pass" name="userpw" class="form-control" placeholder="비밀번호">
            	<div id="userpw-error" class="error-message"></div>
            </div>
        </div>
        <div class="userenter-container">
        <div class="idcheck">
            <c:if test="${sessionScope.saveid==null || sessionScope.saveid=='no' }">
                <input type="checkbox" id="saveid_checkbox">&nbsp;아이디저장
            </c:if>
            <c:if test="${sessionScope.saveid=='yes' }">
                <input type="checkbox" id="saveid_checkbox" checked>&nbsp;아이디저장
            </c:if>
        </div>
        
        <div class="user"  style="margin-left:70px;">
            <a href="./form">
                회원가입
            </a>
        </div>
        <span class="add">|</span>
        <div class="usersearch">
            <a href="./search">
                아이디/비밀번호찾기
            </a>
        </div>
       </div>
   
        &nbsp;&nbsp;&nbsp;&nbsp;
        <div class="footer">
            <button type="submit" class="btnlogin" id="btnlogin">로그인</button>
        </div>
		 <!-- 네이버아이디로로그인 버튼 노출 영역 -->
		<div id="naver_id_login"></div>
		<!-- //네이버아이디로로그인 버튼 노출 영역 -->
		<script type="text/javascript">
		    var naver_id_login = new naver_id_login("PPrEmBV42EmjjizVxM97", "http://localhost:8080/nature/login/naverCallback");
		    var state = naver_id_login.getUniqState();
		    naver_id_login.setButton("white", 2,40);
		    naver_id_login.setDomain("http://localhost:8080/nature");
		    naver_id_login.setState(state);
		    naver_id_login.setPopup();
		    naver_id_login.init_naver_id_login();
		</script>
		
    </form>

</body>
</html>