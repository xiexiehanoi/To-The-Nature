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
<c:set var="root" value="<%=request.getContextPath()%>"/>

<script type="text/javascript">
$(document).ready(function() {
    // 로그인 버튼
    $("#btnlogin").click(function(event) {
        // 기본 양식 제출 동작 방지
        event.preventDefault();

        let saveid = $("#saveid").is(":checked");
        let userid = $("#login_myid").val();
        let userpw = $("#login_pass").val();
        
        if (userid === "" || userpw === "") {
            // userid가 없으면 팝업 창에 버튼과 닫기 버튼 추가
            let popupContent = `
                <div>
                    <p>아이디와 비밀번호를 입력해주세요.</p>
                    <button onclick="window.location.href='${root}/login/form'">회원가입</button>
                    <button onclick="$('#myModal').modal('hide')">닫기</button>
                </div>
            `;
            $("#popupContent").html(popupContent);
            $('#myModal').modal('show');
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
                    alert("아이디나 비밀번호가 맞지 않습니다");
                }
            }
        });
    });
    
});
</script>
</head>

<body>
	<!-- 팝업 창을 위한 모달 코드 추가 -->
<div class="modal" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- 모달 헤더 -->
            <div class="modal-header">
                <h4 class="modal-title">알림</h4>
            </div>

            <!-- 모달 바디 -->
            <div class="modal-body" id="popupContent">
                <!-- 팝업 창에 표시될 내용 -->
            </div>
        </div>
    </div>
</div>

     <form action="${root}/process" method="get">
      <div class="header">
       회원 로그인
      </div>
     <br><br>
      <div class="body">
        <div class="userid">
        <input type="hidden" name="saveid" id="saveid" value="${sessionScope.saveid}">
        			<c:if test="${sessionScope.saveid==null || sessionScope.saveid=='no' }">
        				<input type="text" id="login_myid" name="userid" class="form-control" placeholder="아이디">
        			</c:if>
        			
        			<c:if test="${sessionScope.saveid=='yes' }">
        				<input type="text" id="login_myid" name="userid" class="form-control" value="${sessionScope.userid}" >
        			</c:if>
        	</div>
        	
        	<div class="userpw">
        			<input type="password" id="login_pass" name="userpw" class="form-control" placeholder="비밀번호">
        	</div>
        	</div>

        	<div class="idcheck">
            	  <c:if test="${sessionScope.saveid==null || sessionScope.saveid=='no' }">
            		<input type="checkbox" id="saveid_checkbox">&nbsp;아이디저장
            	  </c:if>
            	  <c:if test="${sessionScope.saveid=='yes' }">
            		<input type="checkbox" id="saveid_checkbox" checked>&nbsp;아이디저장
            	  </c:if>         	
        </div>
      
      <div class="user">
      <a href="./form">
      회원가입
      </a>
      </div>
	  <div class="usersearch">
	  <a href="./search">
      아이디/비번찾기
      </a>
      </div>
      
      &nbsp;&nbsp;&nbsp;&nbsp;
      <div class="footer">
        <button type="submit" class="btnlogin"
        id="btnlogin">로그인</button>
        </div>
	</form>


</body>
</html>