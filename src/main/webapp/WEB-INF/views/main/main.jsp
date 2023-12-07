<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<style>
	/* div.main_content{
		
	} */
	
	div.main_content img.main_img{
		position: absolute;
		left: 50%;
		width: 50%;
		height: auto;
		margin-left: -25%;
		
	}

</style>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="main_content">
	<h1>진캉 최고</h1>
	
	<img class="main_img" src="${root}/views/main/camping.png">
</div>
</body>
</html>