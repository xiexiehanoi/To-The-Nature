<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<style>
	/* div.main_content{
		
	} */
	
	/* div.main_content img.main_img{
		position: absolute;
		left: 50%;
		width: 50%;
		height: auto;
		margin-left: -25%;
		
	} */
	
	body {
  		/* margin: 0; */
	}
	
	div#three-model {
        position: absolute;
        top: 0;
        left: 0;
        z-index: -2;
        width: 100%;
        height: 100%;
    }

</style>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title>
    
    <script type="importmap">
        {
            "imports": {
                "three": "https://unpkg.com/three@0.155.0/build/three.module.js",
      			"three/addons/": "https://unpkg.com/three@0.155.0/examples/jsm/"
            }
        }
    </script>
    <!-- <script type="module" src="static/home.js" defer></script> -->
    <script type="module" src="static/main.js" defer></script>
    
    <script>
    	var isMainPage = true; // 또는 false, 페이지에 따라 다르게 설정
	</script>
</head>
<body>
<!-- <div class="main_content">
	<h1>진캉 최고</h1> -->
	
<%-- 	<img class="main_img" src="${root}/views/main/camping_illustration.png"> --%>
<%-- 	<script type="module" src="<c:url value='/static/main.js' />"></script> 

</div>--%>

<!-- <a href="./detail?num=1">디테일페이지</a> -->

<div id="three-model"></div>

<script>
    // 로그인 상태를 기반으로 JavaScript 변수 설정
    const isLoggedIn = ${not empty sessionScope.loginok};
</script>
<script>
    // 로그인 userid 가 nature 인지 판별
    const isAdmin = ${sessionScope.userid eq 'nature'};
</script>
</body>
</html>