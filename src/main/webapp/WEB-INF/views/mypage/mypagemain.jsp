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
                width: 15%;
                height: 50vh;
                transition: width 0.3s;
            }
            .navbar:hover {
                width: 25%; /* 마우스를 올리면 너비를 늘림 */
            }
            .navbar-nav .nav-link {
                font-size: 2em; /* 현재 크기보다 2배 이상으로 설정 */
            }
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
  <h2 class="mytitle">마이페이지</h2>
  <br><br>
    <ul class="navbar-nav flex-column">
      <li class="nav-item">
        <a class="nav-link" href="#">Link 1</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link 2</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link 3</a>
      </li>
    </ul>
  </div>
</nav>
</body>
</html>