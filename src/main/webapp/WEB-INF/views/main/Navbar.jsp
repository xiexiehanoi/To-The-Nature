<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
     
    $(document).ready(function () {
        var isNavbarHovered = false;

        // My Page 영역을 hover 했을 때 세부 목록을 보이게 하는 스크립트
        $('#mypage').hover(function () {
            // 추가된 조건: sessionScope.loginok 값이 있을 때만 실행
            if (${not empty sessionScope.loginok}) {
                $('#mypageSubMenu').css('display', 'block');
                $('#navbar').addClass('hover');
                isNavbarHovered = true;
            }
        }, function () {
            $('#mypageSubMenu').css('display', 'none');
            $('#navbar').removeClass('hover');
            isNavbarHovered = false;
        });

        $('#mypageSubMenu').hover(function () {
            // 추가된 조건: sessionScope.loginok 값이 있을 때만 실행
            if (${not empty sessionScope.loginok}) {
                $(this).css('display', 'block');
                $('#navbar').addClass('hover');
                isNavbarHovered = true;
            }
        }, function () {
            $(this).css('display', 'none');
            $('#navbar').removeClass('hover');
            isNavbarHovered = false;
        });

        // 마우스가 #navbar 영역에서 벗어나면 hover 클래스를 제거하지만, 마우스가 다른 곳에 있으면 유지
        $('#navbar').mouseleave(function () {
            if (!isNavbarHovered) {
                $('#navbar').removeClass('hover');
            }
        });
    });  

</script>
</head>
<body>

<!-- Navbar -->
<nav id="navbar">
  <!-- My Page 영역을 hover 했을 때 세부 목록을 보이게 하는 스크립트 -->
  <ul class="navbar-items flexbox-col-right flexbox-left main-list">
    <li class="navbar-logo flexbox-left">
      <a class="navbar-item-inner flexbox" href="${root}">
        <i class="bi bi-list" style="font-size: 26px;color: white;margin-left: 6px;"></i>
      </a>
    </li>
    <li class="navbar-item flexbox-left">
      <c:if test="${not empty sessionScope.loginok}">
      	<!-- <a class="navbar-item-inner flexbox-left"> -->
	        <span class="navbar-item-inner-icon-wrapper flexbox">
           		<img src="${root}/res/upload/${sessionScope.userphoto}" class="rounded-circle profile_photo navbar-icon-center"
		     	 width=40 height="40" hspace="10" border=1 style="margin-left:16px; margin-bottom: 8px;"
	     		 onerror="this.src='${root}/res/photo/noimage.png'"><br>
        	</span>
        	<h6><span class="link-text" style="color:white; margin-left: 8px;font-size: 24px;">${sessionScope.userid}</span><span class="link-text" style="font-size: 20px;color: gray;"> 님</span></h6>
        <!-- </a> -->
      </c:if>
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
      	<a class="navbar-item-inner flexbox-left" href="${root}/login/main">
        	<span class="navbar-item-inner-icon-wrapper flexbox">
          	<i class="bi bi-box-arrow-left" style="font-size: 24px;margin-right: 6px;"></i>
      		</span>
      		<span class="link-text" id="btnlogout" style="color: white;">로그아웃</span>
      	</a>
	  </c:if>
    </li>
   
    <li class="navbar-item flexbox-left">
      <c:choose>
    	<c:when test="${sessionScope.userid == null}">
        	<a href="./plist?userId=null" class="navbar-item-inner flexbox-left">
        		<span class="navbar-item-inner-icon-wrapper flexbox">
          			<i class="bi bi-search" style="font-size: 20px;"></i>
        		</span>
        		<span class="link-text">켐핑장 찾기</span>
      		</a>
    	</c:when>
        <c:otherwise>
            <a href="./plist?userId=${sessionScope.userid}" class="navbar-item-inner flexbox-left">
        		<span class="navbar-item-inner-icon-wrapper flexbox">
          			<i class="bi bi-search" style="font-size: 20px;"></i>
        		</span>
        		<span class="link-text">켐핑장 찾기</span>
      		</a>
        </c:otherwise>
      </c:choose>

    </li>
    <li class="navbar-item flexbox-left mypage-section" id="mypage">
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
        	<c:if test="${sessionScope.userid eq 'nature'}">
        		<%-- <a href="${root}/admin/main" class="navbar-item-inner flexbox-left"> --%>
        		<a class="navbar-item-inner flexbox-left">
        		<span class="navbar-item-inner-icon-wrapper flexbox">
          			<i class="bi bi-person" style="font-size: 24px;"></i>
        		</span>
        		<span class="link-text">Admin</span>
        		</a>
        		<!-- 세부 항목 리스트 블록-->
				<ul class="sub-menu" id="mypageSubMenu" style="margin-top: 7.2em;">
	      			<li><a href="${root}/admin/search">회원 조회</a></li>
      				<li><a href="${root}/admin/reservation">예약 관리</a></li>
      				<li><a href="${root}/admin/manage">리뷰 관리</a></li>
				</ul>
    		</c:if>
    		
    		<c:if test="${sessionScope.userid ne 'nature'}">
    			<!-- userid가 'nature'가 아닌 경우 -->
    			<%-- <a href="${root}/mypage/main" class="navbar-item-inner flexbox-left"> --%>
    			<a class="navbar-item-inner flexbox-left">
        			<span class="navbar-item-inner-icon-wrapper flexbox">
          				<i class="bi bi-person" style="font-size: 24px;"></i>
        			</span>
        			<span class="link-text">My Page</span>
      			</a>
      			
      			<!-- 세부 항목 리스트 블록-->
				<ul class="sub-menu" id="mypageSubMenu">
	      			<li><a href="${root}/mypage/change">회원 정보</a></li>
      				<li><a href="${root}/mypage/reservation">예약 내역</a></li>
      				<li><a href="${root}/mypage/review">리뷰 관리</a></li>
      				<li><a href="${root}/mypage/delete">회원 탈퇴</a></li>
				</ul>
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
    <li class="navbar-item flexbox-left faq">
      <a href="/nature/FAQ" class="navbar-item-inner flexbox-left">
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