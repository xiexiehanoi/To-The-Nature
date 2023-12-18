<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<script	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
	div.plist{
		position: absolute;
		padding-top: 6em;
		padding-left: 8em;
		border: 1px solid gray;
		width: 100%;
		height: 100vh;
		overflow-y: auto;
    	overflow-x: hidden;
    	z-index: -2;
		/* display: flex;
    	justify-content: center;
    	align-items: center; */ 
	}
	
	div.plist .plist-coverimg{
		width: 100vw;
		height: 200px;
		border: 1px solid gray;
		border-radius: 5px 0px 0px 5px;
		background-color: gray;
	}
	
</style>
<%
String userId = (String) session.getAttribute("userid");
%>
<script type="text/javascript">
    
</script>
<body>
<div class="plist">
	<div class="plist-coverimg">
		<img alt="coverimg" src="" class="plist-coverimg">
	</div>
	<div class="plist-content">
		<div class="top-content-image">ffff</div>
		<div class="top-content-text">aaaaaa</div>
		<div class="mid-content"></div>
		<div class="bottom-content-left"></div>
		<div class="bottom-content-right"></div>
	</div>
</div>
</body>
</html>