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
            margin-right: 20px; 
        }
    </style>
    <c:set var="root" value="<%=request.getContextPath()%>"/>
    <script>
        $(document).ready(function () {
            $("#pwsearchBtn").click(function () {
                var username = $("#login_name").val();
                var userid = $("#login_id").val();
                var useremail = $("#login_email").val();

                // 입력값 확인
                if (!username || !userid || !useremail) {
                    // 모달창으로 경고 메시지 표시
                    $("#modal-body").text("이름, 아이디, 이메일을 모두 입력하세요.");
                    $("#modal-footer").html('<button type="button" class="btn btn-primary" id="modal-confirm-btn">확인</button>');
                    $("#myModal").modal("show");
                    return;
                }

                // AJAX로 서버에 요청 보내기
                $.ajax({
                    url: "<%=request.getContextPath()%>/login/findPassword",
                    method: "GET",
                    data: { username: username, userid: userid, useremail: useremail },
                    success: function (data) {
                        if (data === "Not Found") {
                            // 결과가 없을 때 모달창으로 메시지 표시
                            $("#modal-body").text("일치하는 정보가 없습니다. 다시 확인해주세요.");
                            $("#modal-footer").html('<button type="button" class="btn btn-primary" id="modal-confirm-btn">확인</button>');
                        } else {
                            // 결과가 있을 때 모달창으로 임시 비밀번호 표시
                            $("#modal-body").text("임시 비밀번호: " + data);
                            $("#modal-footer").html('<a href="<%=request.getContextPath()%>/login/main" class="btn btn-primary">로그인 페이지로 이동</a><button type="button" class="btn btn-primary" id="modal-confirm-btn">확인</button>');
                        }
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
    <div class="search">
        <div class="idtitle"><a href="./search">아이디 찾기</a></div>
        <div class="pwtitle"><a href="./find">비밀번호 찾기</a></div>
    </div>
    <br><br>
    <form>
        이름  <input type="text" id="login_name" name="username" class="form-control">
        아이디  <input type="text" id="login_id" name="userid" class="form-control">
        이메일  <input type="text" id="login_email" name="useremail" class="form-control">
        <br>
        <button type="button" class="pwsearch" id="pwsearchBtn">비밀번호 찾기</button>
    </form>

    <!-- 모달 창 추가 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">비밀번호 찾기 결과</h5>
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
