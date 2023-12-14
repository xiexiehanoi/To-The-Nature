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
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
   body * {
       font-family: 'Jua';
   }
   
   .mybuttons {
            display: flex;
            justify-content: flex-start;
            margin-left:100px;
        }
   .error-message {
            color: red;
            margin-top: 10px;
        }     
  .header,
    .mypagemain,
    .delete {
        display: inline-block;
        width: 100%; /* 전체 너비로 설정 */
        
    }

    .mypagemain {
        float: left;
        width: 29%; /* 변경된 부분: 49%로 설정하여 왼쪽에 위치하도록 조정 */
    }

    .delete {
        float: right;
        width: 70%; /* 변경된 부분: 49%로 설정하여 오른쪽에 위치하도록 조정 */
    }
</style>
<script>
        function check() {
            var checkbox = document.getElementById('checkDelete');
            var usernameInput = document.getElementById('username');
            var userpwInput = document.getElementById('userpw');

       
            

            if (checkbox.checked && usernameInput.value === username && userpwInput.value === password) {
                $('#deleteConfirmationModal').modal('show');
            } else {
                $('#invalidInfoModal').modal('show');
                // 입력 필드 초기화
                usernameInput.value = "";
                userpwInput.value = "";
            }

            return false;
        }

        function deleteAccount() {
            // 여기에 계정 삭제 로직을 수행하세요
        	$.ajax({
                type: "POST",
                url: "${root}/mypage/account",
                data: {
                    username: $("#username").val(),
                    userpw: $("#userpw").val()
                },
                success: function(response) {
                    if (response.success) {
                        alert("계정이 성공적으로 삭제되었습니다!");
                        window.location.href = "${root}";
                    } else {
                        // 서버에서 에러가 발생한 경우
                        alert("서버 오류: " + response.message);
                    }
                },
                error: function(xhr, status, error) {
                    alert("에러 발생: " + error);
                }
            });
        }
        // 모달 닫힐 때 입력 필드 초기화
        $('#deleteConfirmationModal, #invalidInfoModal').on('hidden.bs.modal', function (e) {
            document.getElementById('username').value = "";
            document.getElementById('userpw').value = "";
            document.getElementById('checkDelete').checked = false;
        });
    </script>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<div class="header">
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
</div>
<div class="mypagemain">
<%@ include file="/WEB-INF/views/mypage/mypagemain.jsp" %>
</div>
<div class="delete">
<h3>회원탈퇴</h3>
<ul>
<li>탈퇴를 하실 경우 회원님의 모든 정보가 삭제 되오니 신중하게 결정하셔서 신청해 주세요.</li>
<li>탈퇴하신 계정의 아이디는 5일동안 동일한 ID로 가입이 불가능 합니다.</li>
<li>잔여 포인트는 탈퇴와 함께 삭제되며, 환불되지 않습니다.</li>
<li>사용하지 않은 쿠폰/지역티켓이 있는 경우, 사용하신 후 탈퇴해 주세요.</li>
</ul>
<p>
1. 회원 탈퇴 완료 후 잔여 포인트는 모두 삭제되며 환불되지 않습니다. 단, 환급 가능 유료포인트가 남아있는 경우 먼저 환불 받으셔야 탈퇴가 가능합니다.<br><br>
2. 회원탈퇴 신청 즉시 회원전용 서비스의 이용이 불가능합니다.<br><br>
3. 회원탈퇴 이후에는 게시물 편집, 삭제가 불가능하므로, 게시물을 편집하거나 삭제하기 바라시는 경우 게시물 편집/삭제 후 회원탈퇴를 해주시기 바랍니다.<br><br>
4. 회원탈퇴가 완료되면 해당 계정에 대한 모든 정보는 삭제되며 복원이 불가능 합니다. <br>또한 기존의 계정정보 보호를 위해 탈퇴 신청 후 5일 동안은 재가입이 제한됩니다.<br><br>
5. 단 [전자상거래 등에서의 소비자보호에 관한 법률], [통신비밀보호법], [개인정보 보호법] 등 법률에 근거하여 거래 관련 권리의무관계의 확인 등을 이유로 일정기간 그 정보를 보유하여야 할 필요가 있을 경우에는 일정기간 동안 그 정보를 보유합니다.
</p>
<c:if test="${not empty message}">
            <div class="alert alert-danger" role="alert">
                ${message}
            </div>
        </c:if>
<form action="./myaccount" method="post" enctype="multipart/form-data" onsubmit="return check()">
            <div class="mycheck">
                <input type="checkbox" id="checkDelete">잔여 포인트 삭제내용을 확인하였습니다.
            </div>
            <br>
            <h5>회원정보 확인</h5>
            <table class="table table-bordered" style="width:300px;">
                <tr>
                    <th>이름</th>
                    <td><input type="text" name="username" id="username" class="form-control" minlength="2" maxlength="20" required="required" autofocus="autofocus" ></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" name="userpw" id="userpw" class="form-control" minlength="4" maxlength="20" required="required" autofocus="autofocus"></td>
                </tr>
            </table>
            <div class="mybuttons">
                <button type="submit" class="btn btn-secondary" id="myaccountdelete" >탈퇴</button>&nbsp;&nbsp;&nbsp;
                <button type="button" class="myclose" onclick="location.href='./main'">취소</button>
            </div>
             <div class="error-message" id="errorMessage"></div>
        </form>
    </div>
<div class="modal fade" id="deleteConfirmationModal" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmationModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteConfirmationModalLabel">확인</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                회원 탈퇴를 진행하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-danger" onclick="deleteAccount()">확인</button>
            </div>
        </div>
    </div>
</div>

<!-- 정보 불일치 알림 모달 -->
<div class="modal fade" id="invalidInfoModal" tabindex="-1" role="dialog" aria-labelledby="invalidInfoModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="invalidInfoModalLabel">알림</h5>
                
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                삭제 확인을 체크하고 사용자 이름 및 비밀번호가 정확한지 확인하세요.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>
     
</body>
</html>