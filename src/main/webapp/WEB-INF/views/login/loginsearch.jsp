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
      width: 40vh;
      height: 40vh;
      border: 1px solid lightgray;
    }
    .search {
      display: flex;
      justify-content: center;
      margin-bottom: 20px;
      margin-right: 40px;
    }
    .search ul {
      list-style-type: none;
      display: flex;
    }
    .search li {
      margin-right: 20px;
    }
    .search .idtitle a,
    .search .pwtitle a {
      color: inherit;
      text-decoration: none;
      padding: 10px;
    }
    .formsearch {
      width: 60%;
      margin: 0 auto;
    }
    .form-control {
     	
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
    width: 70%; /* Adjust the width as per your preference */
    height: 150px;
    margin: auto; /* Center the modal horizontally */
    margin-top: 100px; /* Adjust the top margin as per your preference */
  }
	.modal-body {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100%;
}
  /* Style for buttons in modal footer */
  .btnlogin, .btncheck {
    padding: 5px 10px; /* Adjust padding to change the button size */
    font-size: 14px; /* Adjust font size as needed */
    border: 1px solid white;
    background-color: #555;
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
             	$(".idsearch").after('<div class="error-message" style="color: red;">일치하는 정보가 없습니다. 다시 확인해주세요.</div>');
            } else {
              // 결과가 있을 때 모달창으로 아이디 표시
              $("#modal-body").html("아이디: " + data);
              $("#modal-body").css("font-weight", "bold");
              $("#modal-footer").html('<a href="<%=request.getContextPath()%>/login/main" class="btn btn-primary btnlogin">로그인 페이지로 이동</a><button type="button" class="btn btn-primary btncheck" id="modal-confirm-btn">확인</button>');
              $("#myModal").modal("show");
            }
          },
          error: function () {
            // 실패 시 알림창 표시
            alert("오류가 발생했습니다.");
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
  <div class="search-all">
    <div class="search">
            <ul>
              <li class="nav-item active">
                <a class="nav-link" href="./search;">아이디 찾기</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="./find;">비밀번호 찾기</a>
              </li>
            </ul>
        </div>
    <br><br>
    <form class="formsearch">
      <input type="text" id="login_name" name="username" class="form-control" placeholder="이름">
      <input type="text" id="login_phone" name="userphone" class="form-control" placeholder="연락처">
      <br>
      <button type="button" class="idsearch" id="idsearchBtn">아이디 찾기</button>
    </form>
  </div>
  <!-- 모달 창 추가 -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
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