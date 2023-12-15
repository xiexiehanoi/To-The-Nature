<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>change</title>
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Permanent+Marker&family=Single+Day&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
   

    <style>
    body {
        
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }
    .genderButtons {
        display: flex;
        justify-content: space-between;
        
    }
   .genderButton {
   
   			width: 50%;
            background-color: #fff; 
            color: #000; 
         	border: 1px solid #ccc;
        }
 	form {
        width: 80%;
        max-width: 600px; /* 최대 너비 설정 */
    }
   button#memberchange {
        width: 100%; /* 입력란과 같은 너비로 설정 */
        background-color: beige; /* 베이지 색상으로 설정 */
        color: #000000; /* 글자 색상을 검정으로 설정 */
        border: 1px solid white; /* 테두리를 흰색으로 설정 */
    }
    .readonly {
            background-color: #eee; /* 배경색 회색으로 변경 */
        }
    </style>
    <c:set var="root" value="<%=request.getContextPath()%>"/>
</head>
<body>

	<form id="yourFormId" action="./info" method="post" enctype="multipart/form-data" onsubmit="return check()">
		
			<h2 style="margin-bottom:50px;">회원정보 수정</h2>
			<br>
			<br>
					
					<div class="input-group">
					<input type="text" name="userid" id="userid" class="form-control" value="${sessionScope.userid}" readonly >
					
					</div>
				<input type="password" name="userpw" id="pass1" class="form-control" minlength="4" maxlength="20" required="required" placeholder="비밀번호">
				
					<input type="password"  id="pass2" class="form-control" minlength="4" maxlength="20" required="required" placeholder="비밀번호재입력">
					<br>
					<input type="text" class="form-control" required="required"
					autofocus="autofocus" name="username" minlength="2" maxlength="20" value="${sessionScope.username}" placeholder="이름">
				
					
    				<input type="text" name="userbirth" class="form-control" minlength="8" maxlength="8" value="${sessionScope.userbirth}" readonly><br>
   					<div class="genderButtons">
					<button type="button" class="btn btn-secondary genderButton" ${sessionScope.usergender eq 'male' ? 'active' : ''}" data-gender="male" id="saveMale">남성</button>
					<button type="button" class="btn btn-secondary genderButton" ${sessionScope.usergender eq 'female' ? 'active' : ''}" data-gender="female" id="saveFemale">여성</button>
					</div>
					<input type="text" name="userphone" class="form-control" required="required" minlength="11" maxlength="11" value="${sessionScope.userphone}" placeholder="연락처">
					
			
					<input type="email" name="useremail" class="form-control" required="required" minlength="10" maxlength="50" value="${sessionScope.useremail}" multiple placeholder="이메일">
					<br>
				
					
					<button type="submit" class="btn btn-secondary" id="memberchange" >회원수정</button>
			</form>

</body>
</html>