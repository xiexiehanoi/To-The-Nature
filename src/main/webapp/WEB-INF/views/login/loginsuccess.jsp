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
  .welcome {
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
  .welcome a {
      margin-top: 10px; /* Adjust the top margin as needed */
  }
  .welcome a:first-child {
      margin-top: 0; /* Remove top margin for the first link */
  }
  .btnmove {
      display: flex;
      flex-direction: row; /* Set the flex direction to row */
  }
  .btnmove a {
      margin-right: 10px; /* Adjust the right margin between links as needed */
  }
  .btnlogin, .btnmain {
  			
            background-color: beige;
            border: 1px solid white;
        }
</style>
<c:set var="root" value="<%=request.getContextPath()%>"/>
</head>
<body>
<div class="header">
    <%@ include file="/WEB-INF/views/layout/header.jsp" %>
</div>
<div class="welcome">
<h5>가입을 환영합니다</h5>
<div class="btnmove">
<!-- 로그인 버튼 -->
<button type="button" class="btnlogin" onclick="location.href='./main'">로그인</button>
<!-- 메인 페이지로 이동하는 버튼 -->
<button type="button" class="btnmain" onclick="location.href='${root}'">메인 페이지로 이동</button>

</div>
</div>
</body>
</html>