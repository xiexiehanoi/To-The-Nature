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
  .search {
            float:left;
            display: flex;
        }
 .search a {
  			color: inherit;
            text-decoration: none;
        }
  .search .idtitle,
  .search .pwtitle {
            margin-right: 20px; 
        }
  
</style>
<c:set var="root" value="<%=request.getContextPath()%>"/>
</head>
<body>
<div class="search">
<div class="idtitle"><a href="./search">아이디 찾기</a></div>
<div class="pwtitle"><a href="./find">비밀번호 찾기</a></div>
</div>
<br><br>
<form>
        이름 : <input type="text" id="login_name" name="username" class="form-control">
        아이디 : <input type="text" id="login_id" name="userid" class="form-control">
        이메일 : <input type="text" id="login_email" name="useremail" class="form-control">
        <br>
        <button type="button" class="pwsearch" id="pwsearchBtn">비밀번호 찾기</button>
    </form>
</body>
</html>