<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보찾기</title>
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Permanent+Marker&family=Single+Day&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
       
        .find-all {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 60vh;
            height: 60vh;
            border: 1px solid gray;
        }
        .search {
            float: left;
            display: flex;
        }
        .search a {
            color: inherit;
            text-decoration: none;
        }
        .search .idtitle,
        .search .pwtitle {
            margin-right: 0;
        }
        .idtitle {
        	background-image: linear-gradient(120deg, #84fab0 0%, #8fd3f4 100%);
  			background-repeat: no-repeat;
  			background-size: 0% 0%;
  			background-position: 50 88%;
  			border: 1px solid white;
   			border-bottom: 1px solid #ddd;
   			padding: 10px;
        }
        .idtitle:hover{
  		background-size: 100% 100%;
		}
        .pwtitle {
        	background-image: linear-gradient(120deg, #84fab0 0%, #8fd3f4 100%);
  			background-repeat: no-repeat;
  			background-size: 100% 0%;
  			background-position: 0 100%;
  			transition: background-size 0.25s ease-in;
  			border: 1px solid #ddd;
    		border-bottom: none;
    		padding: 10px;
        }
        .pwtitle:hover{
  		background-size: 100% 100%;
		}
        .formfind {
            width: 60%;
            margin: 0 auto;
        }

        .form-control {
        	border:1px solid #B8B8B8;
            margin-bottom: 10px;
        }

        .form-control::placeholder {
            color: #ccc;
        }
       
        .pwsearch {
            width: 100%;
            padding: 10px;
            background-color: beige;
            border: 1px solid white;
        }
        .error-message {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }

        .error-border {
            border: 1px solid red;
        }
        .modal-content {
        width: 64%; /* Adjust the width as per your preference */
        height: 150px;
        margin: auto; /* Center the modal horizontally */
        margin-top: 100px; /* Adjust the top margin as per your preference */
    }
	.modal-body {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 30%;
    
	}
	.modal-footer {
	height: 40%;
	}
    .btnlogin {
    padding: 5px 10px; /* Adjust padding to change the button size */
    font-size: 11px; /* Adjust font size as needed */
    border: 1px solid #528171;
    background-color: #528171;
    color: white;
    text-decoration: none;
    text-align:center;
    width: 96px;
    }
    .btnchange {
    padding: 5px 10px; /* Adjust padding to change the button size */
    font-size: 11px; /* Adjust font size as needed */
    border: 1px solid #528171;
    background-color: white;
    color: #528171;
    text-decoration: none;
    text-align:center;
    width: 96px; 
    }
    .btnchange:hover {
    background-color: #528171;
    color: white;
}

#email-Authentication {
    width: 115px; /* 버튼 너비 */
    height: 30px; /* 버튼 높이 */
    font-family: Arial, sans-serif; /* 글꼴 가족 */
    font-size: 16px; /* 글꼴 크기 */
    color: white; /* 글꼴 색상 */
    background-color: #4CAF50; /* 배경 색상 */
    border: none; /* 테두리 없음 */
    border-radius: 5px; /* 둥근 모서리 */
    cursor: pointer; /* 호버 시 손가락 모양 커서 */
    transition: background-color 0.3s; /* 배경색 변화에 대한 전환 효과 */
}

#email-Authentication:hover {
    background-color: #528171; /* 호버 시 더 어두운 색상 */
}
    </style>
    <c:set var="root" value="<%=request.getContextPath()%>"/>
    <script>
    var emailok=false;
    var dataNum;
    var responseStatus;
        $(document).ready(function () {
            $("#pwsearchBtn").click(function () {
            	
                var username = $("#login_name").val();
                var userid = $("#login_id").val();
                var useremail = $("#login_email").val();
                var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
               
                $(".form-control").removeClass("error-border");
                $(".error-message").remove();
             // 입력값 확인
                if (username.length < 2) {
                    // 테두리를 빨간색으로 변경
                    $("#login_name").addClass("error-border");
                    // 입력란 아래에 에러 메시지 추가
                    $("#login_name").after('<div class="error-message">이름을 입력해주세요.</div>');
                    return;
                }else {
                    // 테두리 및 에러 메시지 삭제
                    $("#login_name").removeClass("error-border");
                    $("#login_name + .error-message").remove();
                }

                if (userid.length < 5) {
                    // 테두리를 빨간색으로 변경
                    $("#login_id").addClass("error-border");
                    // 입력란 아래에 에러 메시지 추가
                    $("#login_id").after('<div class="error-message">아이디를 입력해주세요.</div>');
                    return;
                }else {
                    // 테두리 및 에러 메시지 삭제
                    $("#login_id").removeClass("error-border");
                    $("#login_id + .error-message").remove();
                }
                if (!emailPattern.test(useremail)) {
                    // 테두리를 빨간색으로 변경
                    $("#login_email").addClass("error-border");
                    // 입력란 아래에 에러 메시지 추가
                    $("#login_email").after('<div class="error-message">이메일 주소를 정확히 입력해주세요.</div>');
                    return;
                } else {
                    // 테두리 및 에러 메시지 삭제
                    $("#login_email").removeClass("error-border");
                    $("#login_email + .error-message").remove();
                }
                
                if(!emailok){
            		alert("인증번호 받기 버튼을 눌러주세요");
            		return false;
            	}
                var emailNumber = $("#email-Authentication-number").val();
                console.log(emailNumber);
                console.log(dataNum);
                if(emailNumber==""){
                	alert("인증번호를 입력해주세요");
                	return false;
                }
                
                if(dataNum!=emailNumber){
                	alert("인증번호가 일치하지 않습니다");
                	return false;
                }
                

                // AJAX로 서버에 요청 보내기
                $.ajax({
                    url: "<%=request.getContextPath()%>/login/findPassword",
                    method: "GET",
                    data: { username: username, userid: userid, useremail: useremail },
                    success: function (data) {
                        if (data === "Not Found") {
                            // 결과가 없을 때 모달창으로 메시지 표시
                        	$(".pwsearch").after('<div class="error-message" style="color: red;">일치하는 정보가 없습니다. 다시 확인해주세요.</div>');
                        } else {
                            // 결과가 있을 때 모달창으로 임시 비밀번호 표시
                            $("#modal-body").html("임시 비밀번호: " + data);
                            
                            $("#modal-footer").html('<a href="<%=request.getContextPath()%>/login/main" class="btnlogin">로그인</a><a href="./change" class="btnchange">비밀번호 변경</a>');
                            $("#myModal").modal("show");
                        }
                       
                    },
                    error: function () {
                    	alert("오류가 발생했습니다.");
                    }
                });
            });
            $("#email-Authentication").click(function () {
            	var username = $("#login_name").val()
            	var userid = $("#login_id").val();
                var useremail = $("#login_email").val();
                if(username ==""){
                	alert("이름을 입력해주세요");
                	return false;
                }
                if(userid ==""){
                	alert("아이디를 입력해주세요");
                	return false;
                }
                if(useremail==""){
                	alert("이메일을 입력해주세요");
                	return false;
                }
            	
            	// AJAX로 서버에 요청 보내기
                $.ajax({
                    url: "<%=request.getContextPath()%>/login/authenticationNumber",
                    method: "POST",
                    data: { "username":username ,"userid": userid, "useremail": useremail },
                    success: function (data) {
                    	console.log(data);
                    	console.log(typeof data.status)
                    	console.log("111");
                    	console.log(data.status);
                        dataNum= data.num;
                        responseStatus = data.status;
                        emailok=true;
                        if (responseStatus === false) { // 엄격한 비교 사용
                            alert("사용자 정보가 일치하지 않습니다");
                            return false;
                        }
                        
                    },
                    error: function () {
                    	alert("오류가 발생했습니다.");
                    }
                });
            	
            	
				
			});

        });
        
       
    </script>
</head>
<body>
<div class="find-all">
    <div class="search">
        <div class="idtitle"><a href="./search">아이디 찾기</a></div>
        <div class="pwtitle"><a href="./find">비밀번호 찾기</a></div>
    </div>
    <br><br>
    <form class="formfind">
        <input type="text" id="login_name" name="username" class="form-control" maxlength="20" placeholder="이름">
        <input type="text" id="login_id" name="userid" class="form-control" maxlength="20" placeholder="아이디">
        <input type="text" id="login_email" name="useremail" class="form-control" maxlength="50" placeholder="이메일">
        <button type="button" id="email-Authentication" name="email-Authentication"  >인증번호 받기</button>
        <input type="text" id="email-Authentication-number" name="email-Authentication-number" style="width:207px;">
        <br>
        <button type="button" class="pwsearch" id="pwsearchBtn" style="margin-top: 15px;">비밀번호 찾기</button>
    </form>
</div>
    <!-- 모달 창 추가 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
                
                <h5 class="modal-title" style="font-size:14px;font-weight: bold;">비밀번호 찾기</h5>
             </div>
                <div class="modal-body text-center" id="modal-body">
                    <!-- 결과 또는 경고 메시지가 이 부분에 표시됩니다. -->
                </div>
                <div class="modal-footer d-flex justify-content-center" id="modal-footer" style="border: none;">
                    <!-- 이 부분에 버튼이 추가됩니다. -->
                </div>
            </div>
        </div>
    </div>
</body>
</html>