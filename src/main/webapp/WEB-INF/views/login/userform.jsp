<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Permanent+Marker&family=Single+Day&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
   body {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }
    #btnidcheck{
    	border:1px solid #528171;
    	color:white;
    	background-color:#528171;
    	border-radius:10%;
    	font-size:12px;
    }
    #btnidcheck:hover {
    	background-color:#528171;
    	color:white;
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
   .genderButton.active,
    .genderButton:hover {
        background-color: white;
        color: #528171;
        border: 2px solid #528171;
    }
  form {
        width: 80%;
        max-width: 600px; /* 최대 너비 설정 */
    }
   button#loginsuccess {
        width: 100%; /* 입력란과 같은 너비로 설정 */
        background-color: beige; /* 베이지 색상으로 설정 */
        color: #000000; /* 글자 색상을 검정으로 설정 */
        border: 1px solid white; /* 테두리를 흰색으로 설정 */
    }
	
</style>
<script type="text/javascript">
let idok=false;
let selectedGender = "";
$(function(){
	
	
	//중복체크 버튼 이벤트
	$("#btnidcheck").click(function(){
		//입력한 아이디
		let userid=$("#userid").val();
		if (userid.length < 4) {
			alert("아이디를 4자 이상 입력해주세요.");
			return;
		}
		$.ajax({
			type:"get",
			dataType:"json",
			url:"./idcheck",
			data:{"userid":userid},
			success:function(res){
				if(res.count!=0){
					alert("이미 가입된 아이디입니다.");
					idok=false;
					$("#userid").val("");
				}else{
					alert("사용 가능한 아이디입니다");
					idok=true;
				}
		    }
		});
	});
	
	//아이디 입력시 발생하는 이벤트
	$("#userid").keyup(function(){
		idok=false;
	});
	
	$(".genderButton").click(function () {
        // 버튼 클릭 시 다른 버튼의 활성화를 해제
        $(".genderButton").removeClass("active");
        // 클릭한 버튼에 활성화 클래스 추가
        $(this).addClass("active");
        selectedGender = $(this).data("gender");
        $("#usergender").val(selectedGender);
    });
	$("#saveMale").click(function () {
        // "남성" 버튼 클릭 시 usergender 값을 "male"로 설정
        $("#usergender").val("남성");
    });
    $("#saveFemale").click(function () {
        // "여성" 버튼 클릭 시 usergender 값을 "female"로 설정
        $("#usergender").val("여성");
    });
	  
});//close function
function check(){
	if(!idok){
		alert("중복확인 버튼을 눌러주세요");
		return false;
	}
	let pass1=$("#pass1").val();
	let pass2=$("#pass2").val();
	if(pass1==pass2){
		$("#signupModal").modal("show");
		$("<input>").attr({
            type: "hidden",
            id: "usergender_hidden",
            name: "usergender"
        }).val(selectedGender).appendTo("#yourFormId");
		return true;//action 호출
	}else{
		$("#passwordMismatchError").show();
			return false;//action 이 호출되지 않는다
		}		
}
</script>
</head>
<body>
	<form id="yourFormId" action="./success" method="post" enctype="multipart/form-data" onsubmit="return check()">
		
			<h2 style="margin-bottom:50px;">회원가입</h2>
			<br>
			<br>
					
					<div class="input-group">
					<input type="text" name="userid" id="userid" class="form-control" minlength="4" maxlength="20" required="required" autofocus="autofocus" placeholder="아이디">
					<button type="button" class="btn-sm" id="btnidcheck">중복확인</button>
					</div>
				<input type="password" name="userpw" id="pass1" class="form-control" minlength="4" maxlength="20" required="required" placeholder="비밀번호">
				
					<input type="password"  id="pass2" class="form-control" minlength="4" maxlength="20" required="required" placeholder="비밀번호 재입력">
					<div id="passwordMismatchError" style="color: red; font-size:12px; display: none;">비밀번호가 일치하지 않습니다.</div>
					<br>
					<input type="text" class="form-control" required="required"
					autofocus="autofocus" name="username" minlength="2" maxlength="20" placeholder="이름">
				
					
    				<input type="text" name="userbirth" class="form-control" required="required" minlength="8" maxlength="8" placeholder="생년월일 8자리"><br>
   					<div class="genderButtons">
					<button type="button" class="btn btn-secondary genderButton" data-gender="남성" id="saveMale">남성</button>
					<button type="button" class="btn btn-secondary genderButton" data-gender="여성" id="saveFemale">여성</button>
					</div>
					<input type="text" name="userphone" class="form-control" required="required" minlength="11" maxlength="11" placeholder="휴대전화번호">
					
			
					<input type="email" name="useremail" class="form-control" required="required" minlength="10" maxlength="50" placeholder="이메일" multiple>
					<br>
				
					
					<button type="submit" class="btn btn-secondary" id="loginsuccess" >회원가입</button>
			</form>
</body>
</html>