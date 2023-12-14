<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value='static/Navstyle.css' />">
<style>
	
	.login-section {
        margin-left: auto;
    }
    .mypage-section a{
    	text-decoration: none;
    	/* color: black; */
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
<!-- Navbar -->
<nav id="navbar">
  <ul class="navbar-items flexbox-col-right flexbox-left main-list">
    <li class="navbar-logo flexbox-left">
      <a class="navbar-item-inner flexbox" href="${root}">
        <i class="bi bi-list" style="font-size: 24px;"></i>
      </a>
    </li>
    <li class="navbar-item flexbox-left login-section">
      <c:if test="${empty sessionScope.loginok}">
    	<!-- 세션에 loginok 값이 없으면 (로그인 상태가 아니면) 로그인 링크 표시 -->
      	<a class="navbar-item-inner flexbox-left" href="${root}/login/main">
        	<span class="navbar-item-inner-icon-wrapper flexbox">
          		<i class="bi bi-box-arrow-in-right" style="font-size: 24px;"></i>
        	</span>
        	<span class="link-text">로그인</span>
      	</a>
      </c:if>
      
      <c:if test="${not empty sessionScope.loginok}">
      	<div class="navbar-item-inner-icon-wrapper flexbox">
          		<i class="bi bi-box-arrow-left" style="font-size: 24px;"></i>
      	</div>
      	<div class="link-text" style="margin-bottom: 12px;"> 
	    	<!-- 세션에 loginok 값이 있으면 (로그인 상태이면) 로그아웃 버튼 표시 -->
    		<h5 style="color: white;margin-bottom: 12px;">${sessionScope.userid} 님</h5>
    		<button type="button" class="btn" id="btnlogout" style="width: 100px;background-color: #528171;color: white;">로그아웃</button>
      	</div>
	  </c:if>
    </li>
    <li class="navbar-item flexbox-left">
      <a class="navbar-item-inner flexbox-left">
        <span class="navbar-item-inner-icon-wrapper flexbox">
          <i class="bi bi-search" style="font-size: 20px;"></i>
        </span>
        <span class="link-text">켐핑장 찾기</span>
      </a>
    </li>
    <li class="navbar-item flexbox-left mypage-section">
      <c:choose>
        <c:when test="${empty sessionScope.loginok}">
            <!-- 세션에 loginok 값이 없으면 (로그인 상태가 아니면) 로그인 페이지로 이동 -->
            <a href="${root}/login/main" class="navbar-item-inner flexbox-left">
        		<span class="navbar-item-inner-icon-wrapper flexbox">
          			<i class="bi bi-person" style="font-size: 24px;"></i>
        		</span>
        		<span class="link-text">My Page</span>
      		</a>
        </c:when>
        <c:otherwise>
            <!-- 세션에 loginok 값이 있으면 (로그인 상태이면) mypage 페이지로 이동 -->
            <a href="${root}/mypage/main" class="navbar-item-inner flexbox-left">
        		<span class="navbar-item-inner-icon-wrapper flexbox">
          			<i class="bi bi-person" style="font-size: 24px;"></i>
        		</span>
        		<span class="link-text">My Page</span>
      		</a>
      		<%-- <ul class="sub-menu">
    			<li><a href="${root}/mypage/main">회원 정보</a></li>
    			<li><a href="${root}/mypage/main">예약 내역</a></li>
    			<li><a href="${root}/mypage/main">리뷰 관리</a></li>
    			<li><a href="${root}/mypage/main">회원 탈퇴</a></li>
    		</ul> --%>
        	<c:if test="${sessionScope.userid eq 'nature'}">
        		<a href="${root}/admin/main">Admin</a>
    		</c:if>
        </c:otherwise>
      </c:choose>
    </li>
    <%-- <li class="navbar-item flexbox-left mypage-section">
    	<div class="navbar-item-inner flexbox-left">
	        <div class="navbar-item-inner-icon-wrapper flexbox">
            	<i class="bi bi-person" style="font-size: 24px;"></i>
        	</div>
        	<span class="link-text">My Page</span>
    	</div>
    	<!-- 세부 항목 리스트 블록 -->
    	<ul class="sub-menu">
	        <c:choose>
            	<c:when test="${not empty sessionScope.loginok}">
	                <!-- 로그인한 경우에만 표시 -->
                	<li><a href="${root}/mypage/profile">Profile</a></li>
                	<c:if test="${sessionScope.userid eq 'nature'}">
	                    <!-- admin으로 로그인한 경우에만 표시 -->
                    	<li><a href="${root}/admin/main">Admin Page</a></li>
                	</c:if>
                	<!-- 다른 세부 항목들을 필요에 따라 추가하세요 -->
                	<li><a href="${root}/mypage/settings">Settings</a></li>
            	</c:when>
            	<c:otherwise>
	                <!-- 로그인하지 않은 경우에만 표시 -->
                	<li><a href="${root}/login/main">Login</a></li>
            	</c:otherwise>
        	</c:choose>
    	</ul>
	</li> --%>
    <li class="navbar-item flexbox-left">
      <c:choose>
    	<c:when test="${sessionScope.userid == null}">
        	<a href="./detail?num=1&userId=null" class="navbar-item-inner flexbox-left">
        		<span class="navbar-item-inner-icon-wrapper flexbox">
          			<i class="bi bi-info-circle" style="font-size: 22px;"></i>
        		</span>
        		<span class="link-text">Detail Page</span>
      		</a>
    	</c:when>
        <c:otherwise>
            <a href="./detail?num=1&userId=${sessionScope.userid}" class="navbar-item-inner flexbox-left">
        		<span class="navbar-item-inner-icon-wrapper flexbox">
          			<i class="bi bi-info-circle" style="font-size: 22px;"></i>
        		</span>
        		<span class="link-text">Detail Page</span>
      		</a>
        </c:otherwise>
      </c:choose>
    
      
    </li>
    <li class="navbar-item flexbox-left">
      <a class="navbar-item-inner flexbox-left">
        <span class="navbar-item-inner-icon-wrapper flexbox">
          <i class="bi bi-question-circle" style="font-size: 22px;"></i>
        </span>
        <span class="link-text">FAQ</span>
      </a>
    </li>
    <li class="navbar-item flexbox-left">
      <a class="navbar-item-inner flexbox-left">
        <span class="navbar-item-inner-icon-wrapper flexbox">
          <i class="bi bi-people" style="font-size: 22px;"></i>
        </span>
        <span class="link-text">Team</span>
      </a>
    </li>
    <!-- <li class="navbar-item flexbox-left">
      <a class="navbar-item-inner flexbox-left">
        <div class="navbar-item-inner-icon-wrapper flexbox">
			<i class="bi bi-person-lock"></i>
 		</div>
        <span class="link-text">Admin</span>
      </a>
    </li> -->
  </ul>
</nav>
</body>
</html>