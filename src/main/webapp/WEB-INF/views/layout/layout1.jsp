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
	}
	
	div.header{
		position:fixed;
		width: 100%; 
		height: 6em;
		border: 1px solid blue;
		/*background-color: transparent; */
		background-color: white;
		/* display: flex;
        justify-content: space-between;
        align-items: center; */
	} 
	
	.navbar:hover + .content {
        margin-left: 12em; /* Navbar가 확장될 때 content를 오른쪽으로 이동시킴 */
    }

    .content {
    	transition: margin-left 0.5s cubic-bezier(0.4, 0.8, 0.2, 1); /* 조정된 cubic-bezier 함수 */
	} 
    
</style>
    
</head>
<script>
//Set a JavaScript variable to indicate if it's the main page
var isMainPage = <%= request.getAttribute("isMainPage") %>;

$(document).ready(function() {
    // Check if the current page is main.jsp
    if (isMainPage) {
        // Add specific styles for views/main/main.jsp
        $(".header").css("display", "none");
    } else {
        // Show header for other pages
        $(".header").css("display", "block");
    }
});
</script>

<body>	
	<!-- Tiles를 사용하여 레이아웃 구성 -->
	<div class="header">
    	<tiles:insertAttribute name="header" />
    </div> 
    
    <span class="navbar">
    	<tiles:insertAttribute name="navbar" />
    </span>
    
    <div class="content">
    	<tiles:insertAttribute name="content" />
    </div>
    
    <%-- <div class="content">
        <c:choose>
			<c:when test="${requestScope['javax.servlet.forward.request_uri'] == '/WEB-INF/views/main/main.jsp'}">
				<!-- Add specific content for main.jsp -->
			</c:when>
			<c:otherwise>
				<tiles:insertAttribute name="content" />
			</c:otherwise>
		</c:choose>
    </div> --%>
</body>
</html>
