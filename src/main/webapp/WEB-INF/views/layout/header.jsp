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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<style type="text/css">
	
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
                	window.location.href = "${root}/login/main";
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


	<%-- <c:if test="${not empty sessionScope.loginok}">
    	<!-- 세션에 loginok 값이 있으면 (로그인 상태이면) 로그아웃 버튼 표시 -->
    	<h5>${sessionScope.userid}님</h5><br>
    	<button type="button" class="btn btn-success" id="btnlogout" style="width: 100px;">로그아웃</button>
	</c:if>
</div>
&nbsp;&nbsp;
	<div class="mypage-section">
    <c:choose>
        <c:when test="${empty sessionScope.loginok}">
            <!-- 세션에 loginok 값이 없으면 (로그인 상태가 아니면) 로그인 페이지로 이동 -->
            <a href="${root}/login/main">mypage</a>
        </c:when>
        <c:otherwise>
            <!-- 세션에 loginok 값이 있으면 (로그인 상태이면) mypage 페이지로 이동 -->
            <a href="${root}/mypage/main">mypage</a>
        <c:if test="${sessionScope.userid eq 'nature'}">
        <div class="admin-main"><a href="${root}/admin/main">admin</a></div>
    	</c:if>
        </c:otherwise>
    </c:choose>

</div>  --%>  

</body>
</html>