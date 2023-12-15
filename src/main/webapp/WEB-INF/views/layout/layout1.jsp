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
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Open+Sans:wght@600&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Permanent+Marker&family=Single+Day&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
	body{
	   font-family: 'Open Sans', sans-serif;
       /* background: #eaeef6; 
       background: #F9EBCE;
       */
       
	}

	/* div.header{
		position: fixed;*/
	 	/* top: 1rem;
	 	left: 1rem; 
	 	border-radius: 10px;
	 	padding: 1rem 0;
	 	height: calc(100vh - 4rem);
	 	*/
	 	/* background: #fff;
	 	border: none;
	 	height: 84px;
	 	width: 100%;
	 	z-index: 1;
	 	box-shadow: 0 10px 20px rgba(100, 100, 100, 0.07);
	}*/
    
    /*div.content{
    	position: absolute;
    	width: 100%;
    	height: 100%;
    	padding-top: 84px;
    	background-color: #eaeef6;
    	overflow-y: scroll;
    }  */
    
</style>
    
</head>
<body>
<%-- <div class="main_container">
	
	<div class="header">
		<tiles:insertAttribute name="header"/>
	</div>
	
	<div class="content">
		<tiles:insertAttribute name="content"/>
	</div>
	</div>--%>
	
	
	 <!-- Tiles를 사용하여 레이아웃 구성 -->
    <tiles:insertAttribute name="header" />
    <tiles:insertAttribute name="navbar" />
    <tiles:insertAttribute name="content" />

</body>
</html>
