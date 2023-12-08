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
            float:left;
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
            $("#idsearchBtn").click(function () {
                var username = $("#login_name").val();
                var userphone = $("#login_phone").val();

                // 입력값 확인
                if (!username || !userphone) {
                    // 모달창으로 경고 메시지 표시
                    $("#modal-body").text("이름과 연락처를 모두 입력하세요.");
                    $("#myModal").modal("show");

                    // 모달 닫힐 때 입력 폼으로 포커스 이동
                    $("#myModal").on("hidden.bs.modal", function () {
                        $("#login_name").focus();
                    });

                    return;
                }

                // AJAX로 서버에 요청 보내기
                $.ajax({
                    url: "<%=request.getContextPath()%>/login/findUserId",
                    method: "GET",
                    data: { username: username, userphone: userphone },
                    success: function (data) {
                        if (data === "Not Found") {
                            // 결과가 없을 때 모달창으로 메시지 표시
                            $("#modal-body").text("일치하는 정보가 없습니다. 다시 확인해주세요.");
                        } else {
                            // 결과가 있을 때 모달창으로 아이디 표시
                            $("#modal-body").text("아이디: " + data);
                           
                        }
                        $("#myModal").modal("show");
                    },
                    error: function () {
                        // 실패 시 알림창 표시
                        alert("서버와 통신 중 오류가 발생했습니다.");
                    }
                });
            });

            // 모달창 확인 버튼 클릭 시 모달 닫기
            $("#modal-confirm-btn").click(function () {
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
        이름 : <input type="text" id="login_name" name="username" class="form-control">
        연락처 : <input type="text" id="login_phone" name="userphone" class="form-control">
        <br>
        <button type="button" class="idsearch" id="idsearchBtn">아이디 찾기</button>
    </form>

    <!-- 모달 창 추가 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">아이디 찾기</h5>
                </div>
                <div class="modal-body" id="modal-body">
                    <!-- 결과 또는 경고 메시지가 이 부분에 표시됩니다. -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="modal-confirm-btn">확인</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>