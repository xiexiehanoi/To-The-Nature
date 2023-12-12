<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>마이페이지</title>
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Permanent+Marker&family=Single+Day&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
    body * {
            font-family: 'Jua';
        }
 	@media (min-width: 576px) {
            .navbar {
                position: fixed;
                width: 15%;
                height: 70vh;
                padding:20px;
                transition: width 0.3s;
                display: flex;
            flex-direction: column; /* 수직으로 나오도록 설정 */
            align-items: center;
            }
            .navbar:hover {
                width: 25%; /* 마우스를 올리면 너비를 늘림 */
            }
            .navbar .mytitle {
            margin-bottom: 100px;
            
        }
            .navbar .mytitle {
            margin-bottom: 20px; /* mytitle과 navbar 간 여백 추가 */
        	display: flex;
            flex-direction: column; /* 수직으로 나오도록 설정 */
            align-items: center; 
        }
        .navbar .mytitle,
        .navbar .navbar-icon,
        .navbar .navbar-nav,
        .navbar .myaccount {
            text-align: center; /* 가운데 정렬 */
        }
        .navbar .navbar-icon {
            display: flex;
            flex-direction: column; /* 수직으로 나오도록 설정 */
            align-items: center; /* 가운데 정렬 */
        }
        .navbar .navbar-nav {
            margin-top: 20px; /* 각 링크 사이 여백 추가 */
        }
        .navbar-nav .nav-item {
            margin-bottom: 10px; /* 각 링크 사이 여백 추가 */
        }
            .navbar-nav .nav-link {
                font-size: 1.5em; /* 현재 크기보다 2배 이상으로 설정 */
            	position: absolute;
                opacity: 0;
                transition: opacity 0.3s;
                pointer-events: none;
            }
            .navbar:hover .navbar-nav .nav-link {
                opacity: 1;
                pointer-events: auto; /* 마우스 이벤트 허용 */
            }
            .navbar .myaccount {
            margin-top: auto;
        }
           
        

    </style>
    <c:set var="root" value="<%=request.getContextPath()%>"/>

</head>
<body>
 <div class="header">
            <%@ include file="/WEB-INF/views/layout/header.jsp" %>
        </div>
  <nav class="navbar bg-light">
  <div class="container-fluid">
  <div class="mytitle">마이페이지</div>
  	<ul class="navbar-icon">
  	<li class="navar-list">
  	<i class="bi bi-calendar4"></i>
  	</li>
  	<li class="navar-list">
  	<i class="bi bi-pencil-square"></i>
  	</li>
  	<li class="navar-list">
  	<i class="bi bi-chat-right-text"></i>
  	</li>
  	</ul>
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link1" href="${root}/mypage/reservation">예약내역</a>
      </li>
      <li class="nav-item">
        <a class="nav-link2" href="${root}/mypage/review">리뷰관리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link3" href="${root}/mypage/cs">고객센터</a>
      </li>
    </ul>
    <br><br><br><br><br><br>
    <div class="myaccount"><a href="${root}/mypage/account">회원탈퇴</a></div>
  </div>
</nav>
</body>
</html>