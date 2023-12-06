<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별보러가자</title>
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
    $(function(){
        // 로그아웃 버튼
        $("#btnlogout").click(function(){
            $.ajax({
                type: "get",
                dataType: "text",
                url: "${root}/login/logout",
                success: function(res){
                    // 로그아웃 성공시 페이지 새로고침
                    location.reload();
                },
                error: function(res) {
                    // 실패시 처리
                    alert("로그아웃에 실패했습니다.");
                }
            });
        });
    });
</script>
</head>
<body>

<c:if test="${empty sessionScope.loginok}">
    <!-- 세션에 loginok 값이 없으면 (로그인 상태가 아니면) 로그인 링크 표시 -->
    <a href="${root}/login/main">로그인</a>
</c:if>

<c:if test="${not empty sessionScope.loginok}">
    <!-- 세션에 loginok 값이 있으면 (로그인 상태이면) 로그아웃 버튼 표시 -->
    <h5>${sessionScope.userid}님</h5>
    <button type="button" class="btn btn-success" id="btnlogout" style="width: 100px;">로그아웃</button>
</c:if>

</body>
</html>
