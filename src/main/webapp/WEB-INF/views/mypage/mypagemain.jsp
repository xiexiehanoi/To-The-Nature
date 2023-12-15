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


    <style>
    body * {
            font-family: 'Jua';
        }
 	
   
     
    ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 25%;
  background-color: #f1f1f1;
  position: fixed;
  height: 100%;
  overflow: auto;
  
	}
	
	li a {
  display: block;
  color: #000;
  padding: 8px 16px;
  text-decoration: none;
	}

	li a.active {
  background-color: #555;
  color: white;
	}

	li a:hover:not(.active) {
  background-color: #555;
  color: white;
	}
	
    </style>
    <c:set var="root" value="<%=request.getContextPath()%>"/>
 <script>
        $(document).ready(function () {
            $(".navbar-nav .nav-link3").click(function () {
                $(".submenu").toggle();
            });
            $(".submenu").click(function (e) {
                e.stopPropagation();
            });

            $(document).click(function () {
                $(".submenu").hide();
            }); 
        });
    </script>
</head>
</head>

<body>
<div class="header">
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
	</div>
	
    <ul class="navbar-nav navall">
      <li class="nav-item">
        <a class="nav-link1" href="${root}/mypage/reservation">예약내역</a>
      </li>
      <li class="nav-item">
        <a class="nav-link2" href="${root}/mypage/review">리뷰관리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link3" href="#">회원관리</a> 
      <ul class="submenu">
      <li><a href="${root}/mypage/account">회원탈퇴</a></li>
      <li><a href="${root}/mypage/change">회원수정</a></li>
      </ul>
      
      </li>
    </ul>
    
    
	
</body>
</html>