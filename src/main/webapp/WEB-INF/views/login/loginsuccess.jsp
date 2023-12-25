<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
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
            width: 60vh;
            height: 60vh;
            border: 1px solid gray;
  }
  .welcomeicon {
  	margin-bottom:20px;
  	font-size:64px;
  	color:#528171;
  }
  .welcome-title {
 	font-size:24px;
 }
  .welcome-body {
  	font-size:16px;
  }
  .btnmove {
      display: flex;
      flex-direction: row; /* Set the flex direction to row */
  }
  
  .btnlogin {
  			padding: 5px 10px;
            background-color: #528171;
            color:white;
            border: 1px solid #528171;
            width: 96px;
           
        }
  .btnmain {
  			padding: 5px 10px;
            background-color: white;
            color:#528171;
            border: 1px solid #528171;
            width: 96px;
        }      
</style>
<c:set var="root" value="<%=request.getContextPath()%>"/>
</head>
<body>
<div class="header">
    <%@ include file="/WEB-INF/views/layout/header.jsp" %>
</div>
<div class="welcome">
<i class="bi bi-check-circle welcomeicon"></i>
<div class="welcome-title">회원가입이 완료되었습니다.</div><br>
<div class="welcome-body">로그인하시면 더욱 다양한 서비스와 혜택을 제공 받으실 수 있습니다.</div>
<hr>
<div class="btnmove">
<!-- 로그인 버튼 -->
<button type="button" class="btnlogin" onclick="location.href='./main'">로그인</button>
<!-- 메인 페이지로 이동하는 버튼 -->
&nbsp;&nbsp;
<button type="button" class="btnmain" onclick="location.href='${root}'">메인화면</button>

</div>
</div>
</body>
</html>