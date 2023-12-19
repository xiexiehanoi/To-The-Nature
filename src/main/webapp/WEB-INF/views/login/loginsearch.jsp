<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Permanent+Marker&family=Single+Day&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .search-all {
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
        .pwtitle {
        	background-image: linear-gradient(120deg, #84fab0 0%, #8fd3f4 100%);
  			background-repeat: no-repeat;
  			background-size: 0% 0%;
  			background-position: 50 50%;
  			border: 1px solid white;
   			border-bottom: 1px solid #ddd;
   			padding: 10px;
  			 
        }
        .pwtitle:hover{
  		background-size: 100% 100%;
  		border:1px solid #ddd;
		}
        .idtitle {
        	background-image: linear-gradient(120deg, #84fab0 0%, #8fd3f4 100%);
  			background-repeat: no-repeat;
  			background-size: 100% 0%;
  			background-position: 0 100%;
  			transition: background-size 0.25s ease-in;
  			border: 1px solid #ddd;
    		border-bottom: none;
    		padding: 10px;
    		
        }
        .idtitle:hover{
  		background-size: 100% 100%;
  		
		}
        .formsearch {
            width: 60%;
            margin: 0 auto;
            margin-bottom:45px;
        }

        .form-control {
        	border:1px solid #B8B8B8;
            margin-bottom: 10px;
        }

        .form-control::placeholder {
            color: #ccc;
        }

        .idsearch {
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
    .modal-header {
    height: 30%;
    
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
    .btncheck {
    padding: 5px 10px; /* Adjust padding to change the button size */
    font-size: 14px; /* Adjust font size as needed */
    border: 1px solid #528171;
    background-color: white;
    color: #528171;
    text-decoration: none;
    width: 64px; /* Adjust the width as per your preference */
}
	.btnlogin {
    padding: 5px 10px; /* Adjust padding to change the button size */
    font-size: 14px; /* Adjust font size as needed */
    border: 1px solid #528171;
    background-color: #528171;
    color: white;
    text-decoration: none;
    width: 64px; /* Adjust the width as per your preference */
}
.btncheck:hover {
    background-color: #528171;
    color: white;
}
    </style>
    <c:set var="root" value="<%=request.getContextPath()%>"/>
    <script>
        $(document).ready(function () {
            $("#idsearchBtn").click(function () {
                var username = $("#login_name").val();
                var userphone = $("#login_phone").val();
				
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


                if (userphone < 12) {
                    // 테두리를 빨간색으로 변경
                    $("#login_phone").addClass("error-border");
                    // 입력란 아래에 에러 메시지 추가
                    $("#login_phone").after('<div class="error-message">연락처를 입력해주세요.</div>');
                    return;
                }else {
                    // 테두리 및 에러 메시지 삭제
                    $("#login_phone").removeClass("error-border");
                    $("#login_phone + .error-message").remove();
                }
               
                // AJAX로 서버에 요청 보내기
                $.ajax({
                    url: "<%=request.getContextPath()%>/login/findUserId",
                    method: "GET",
                    data: { username: username, userphone: userphone },
                    success: function (data) {
                        if (data === "Not Found") {
                           
                        	$(".idsearch").after('<div class="error-message" style="color: red;">일치하는 정보가 없습니다.</div>');
                        } else {
                            // 결과가 있을 때 모달창으로 아이디 표시
                            $("#modal-body").html("<br>아이디는 " + data + " 입니다.");
                            $("#modal-footer").html('<a href="<%=request.getContextPath()%>/login/main" class="btnlogin">로그인</a><button type="button" class="btncheck" id="modal-confirm-btn">확인</button>');
                            $("#myModal").modal("show");
                        }
                       
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        // 실패 시 알림창 표시
                        console.error("AJAX Error:", textStatus, errorThrown);
                        alert("오류가 발생했습니다.");
                    }
                });
                // 모달창 확인 버튼 클릭 시 모달 닫기
                $(document).on("click", "#modal-confirm-btn", function () {
                    $("#myModal").modal("hide");
                });
            });

           
        });
    </script>
</head>
<body>
    <div class="search-all">
        <div class="search">
                        <div class="idtitle">
                            
                                <a href="./search;">아이디 찾기</a>
                            </div>
                            <div class="pwtitle">
                                <a href="./find;">비밀번호 찾기</a>
                            </div>
                       
                </div>
        <br><br>
        <form class="formsearch">
            <input type="text" id="login_name" name="username" class="form-control" maxlength="20" placeholder="이름">
            <input type="text" id="login_phone" name="userphone" class="form-control" maxlength="11" placeholder="연락처">
            <br>
            <button type="button" class="idsearch" id="idsearchBtn">아이디 찾기</button>
        </form>
    </div>
    <!-- 모달 창 추가 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
                
                <h5 class="modal-title" style="font-size:14px;font-weight: bold;">아이디 찾기</h5>
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