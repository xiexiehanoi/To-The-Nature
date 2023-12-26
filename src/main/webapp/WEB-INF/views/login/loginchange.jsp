<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Permanent+Marker&family=Single+Day&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
   .change-all {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 50vh;
            height: 50vh;
            border: 1px solid lightgray;
        }
        .change-title {
        	margin-bottom: 15px;
        }
        .changeform {
            width: 60%;
            hieght: 90%;
            margin: 0 auto;
        }
        .form-control {
        	
            margin-bottom: 10px;
        }
        .form-control:placeholder {
            color: #ccc;
        }
        .pwchange, .nextchange {
            width: 100%;
            hieght: 40px;
            margin-bottom: 10px;
            background-color: beige;
            border: 1px solid white;
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
    /* Style for buttons in modal footer */
    .btncheck {
        padding: 5px 10px; /* Adjust padding to change the button size */
        font-size: 11px; /* Adjust font size as needed */
        border: 1px solid #528171;
    	background-color: #528171;
    	color: white;
    	text-decoration: none;
    	text-align:center;
    	width: 64px
    }
</style>
<script>
    $(document).ready(function () {
        $("#pwchangeBtn").click(function () {
            var userid = $("#login_id").val();
            var userpw = $("#login_pw").val();
            var usernewpw = $("#login_usernewpw").val();
            var userpwchangeConfirm = $("#login_pwchange_confirm").val();
            // 입력값 확인
            if (!userid || !userpw || !usernewpw || !userpwchangeConfirm) {
                // 모달창으로 경고 메시지 표시
                $("#modal-body").text("입력란을 모두 작성해주세요");
                $("#modal-footer").html('<button type="button" class="btncheck" id="modal-confirm-btn">확인</button>');
                $("#myModal").modal("show");
                return;
            }
         // 새 비밀번호와 현재 비밀번호가 같은지 확인
            if (usernewpw === userpw) {
                // 모달창으로 경고 메시지 표시
                $("#modal-body").text("새 비밀번호는 현재 비밀번호와 같을 수 없습니다.");
                $("#modal-footer").html('<button type="button" class="btncheck" id="modal-confirm-btn">확인</button>');
                $("#myModal").modal("show");
                return;
            }
            // 새 비밀번호와 새 비밀번호 재입력이 일치하는지 확인
            if (usernewpw !== userpwchangeConfirm) {
                // 모달창으로 경고 메시지 표시
                $("#modal-body").text("새 비밀번호가 일치하지 않습니다.");
                $("#modal-footer").html('<button type="button" class="btncheck" id="modal-confirm-btn">확인</button>');
                $("#myModal").modal("show");
                return;
            }
            // AJAX로 서버에 요청 보내기
            $.ajax({
                url: "<%=request.getContextPath()%>/login/updatePassword",
                method: "POST",
                data: {userid: userid,
                   	 userpw: userpw,
                   	 usernewpw: usernewpw,
                     userpwchangeConfirm: userpwchangeConfirm},
                success: function (data) {
                    if (data === "UserNotFound") {
                        // 등록된 userid와 userpw가 일치하지 않을 때 모달창으로 메시지 표시
                        $("#modal-body").text("등록된 아이디가 아닙니다.");
                    } else if (data === "IncorrectPassword") {
                        // 현재 비밀번호가 일치하지 않을 때 모달창으로 메시지 표시
                        $("#modal-body").text("현재 비밀번호가 일치하지 않습니다.");
                    } else if (data === "Success") {
                        // 성공 시 모달창으로 메시지 표시
                        $("#modal-body").text("비밀번호가 변경됐습니다.");
                    }
                    $("#modal-footer").html('<a href="./main" class="btncheck">확인</a>');
                    $("#myModal").modal("show");
                },
                error: function (xhr, status, error) {
                    // 실패 시 모달창으로 에러 메시지 표시
                    $("#modal-body").text("서버와 통신 중 오류가 발생했습니다. 상태: " + status + ", 에러: " + error);
                    $("#modal-confirm-btn").text("확인");
                    $("#myModal").modal("show");
                }
            });
        });
        // 모달창 확인 버튼 클릭 시 모달 닫기
        $(document).on("click", "#modal-confirm-btn", function () {
            $("#myModal").modal("hide");
        });
    });
</script>
</head>
<body>
    <div class="change-all">
    <div class="change-title">비밀번호 변경</div>
    <form class="changeform">
        <input type="text" id="login_id" name="userid" class="form-control" placeholder="아이디">
        <input type="password" id="login_pw" name="userpw" class="form-control" placeholder="비밀번호">
        <input type="password" id="login_usernewpw" name="usernewpw" class="form-control" placeholder="새 비밀번호">
        <input type="password" id="login_pwchange_confirm" name="userpwchange_confirm" class="form-control" placeholder="새 비밀번호 확인">
        <br>
        <button type="button" class="pwchange" id="pwchangeBtn">비밀번호 변경</button>
        <button type="button" class="nextchange" onclick="location.href='./main'">다음에 변경</button>
    </form>
	</div>
    <!-- 모달 창 추가 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                
                <h5 class="modal-title" style="font-size:14px;font-weight: bold;">비밀번호 변경</h5>
             </div>
                <div class="modal-body" id="modal-body" style="border: none;font-size:12px;">
                    <!-- 결과 또는 경고 메시지가 이 부분에 표시됩니다. -->
                </div>
                <div class="modal-footer" id="modal-footer" style="border: none;">
                    <!-- 이 부분에 버튼이 추가됩니다. -->
                </div>
            </div>
        </div>
    </div>
</body>
</html>