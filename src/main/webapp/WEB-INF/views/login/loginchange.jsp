<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Permanent+Marker&family=Single+Day&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
   body * {
       font-family: 'Jua';
   }
</style>
<script>
    $(document).ready(function () {
        $("#pwchangeBtn").click(function () {
            var userid = $("#login_id").val();
            var userpw = $("#login_pw").val();
            var userpwchange = $("#login_userpwchange").val();
            var userpwchangeConfirm = $("#login_pwchange_confirm").val();

            // 입력값 확인
            if (!userid || !userpw || !userpwchange || !userpwchangeConfirm) {
                // 모달창으로 경고 메시지 표시
                $("#modal-body").text("입력란을 모두 작성해주세요");
                $("#modal-footer").html('<button type="button" class="btn btn-primary" id="modal-confirm-btn">확인</button>');
                $("#myModal").modal("show");
                return;
            }

            // 새 비밀번호와 새 비밀번호 재입력이 일치하는지 확인
            if (userpwchange !== userpwchangeConfirm) {
                // 모달창으로 경고 메시지 표시
                $("#modal-body").text("새 비밀번호와 새 비밀번호 재입력이 일치하지 않습니다.");
                $("#modal-footer").html('<button type="button" class="btn btn-primary" id="modal-confirm-btn">확인</button>');
                $("#myModal").modal("show");
                return;
            }

            // AJAX로 서버에 요청 보내기
            $.ajax({
                url: "<%=request.getContextPath()%>/login/updatePassword",
                method: "POST",
                data: { userid: userid, userpw: userpw, userpwchange: userpwchange },
                success: function (data) {
                    if (data === "IncorrectPassword") {
                        // 현재 비밀번호가 일치하지 않을 때 모달창으로 메시지 표시
                        $("#modal-body").text("현재 비밀번호가 일치하지 않습니다.");
                    } else if (data === "Success") {
                        // 성공 시 모달창으로 메시지 표시
                        $("#modal-body").text("비밀번호가 성공적으로 변경되었습니다.");
                    }
                    $("#modal-footer").html('<button type="button" class="btn btn-primary" id="modal-confirm-btn">확인</button>');
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
    <h2>비밀번호 변경</h2>
    <br><br>
    <form>
        아이디 <input type="text" id="login_id" name="userid" class="form-control">
        현재 비밀번호 <input type="password" id="login_pw" name="userpw" class="form-control">
        새 비밀번호 <input type="password" id="login_userpwchange" name="userpwchange" class="form-control">
        새 비밀번호 재입력 <input type="password" id="login_pwchange_confirm" name="userpwchange_confirm" class="form-control">
        <br>
        <button type="button" class="pwchange" id="pwchangeBtn">비밀번호 변경</button>
        <button type="button" onclick="location.href='./main'">다음에 변경</button>
    </form>

    <!-- 모달 창 추가 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경 결과</h5>
                </div>
                <div class="modal-body" id="modal-body">
                    <!-- 결과 또는 경고 메시지가 이 부분에 표시됩니다. -->
                </div>
                <div class="modal-footer" id="modal-footer">
                    <!-- 이 부분에 버튼이 추가됩니다. -->
                </div>
            </div>
        </div>
    </div>
</body>
</html>