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
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
   body * {
       font-family: 'Jua';
   }
  
</style>

<script type="text/javascript">
let idok=false;
$(function(){
	$("#upload").change(function(){
		  console.log("1:"+$(this)[0].files.length);
		  console.log("2:"+$(this)[0].files[0]);
		  //정규표현식
		var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
		var f=$(this)[0].files[0];//현재 선택한 파일
		if(!f.type.match(reg)){
		   alert("확장자가 이미지파일이 아닙니다");
		   return;
		}

		  if($(this)[0].files[0]){
		   var reader=new FileReader();
		   reader.onload=function(e){
		    $("#showimg").attr("src",e.target.result);
		   }
		   reader.readAsDataURL($(this)[0].files[0]);
		  }
	});
	
	//중복체크 버튼 이벤트
	$("#btnidcheck").click(function(){
		//입력한 아이디
		let userid=$("#userid").val();
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
		$(document).ready(function () {
        // 남성 체크박스를 클릭했을 때
        $(".maleCheckbox").click(function () {
            // 남성 체크박스가 체크되어 있으면 여성 체크박스의 체크를 해제
            if ($(this).prop("checked")) {
                $(".femaleCheckbox").prop("checked", false);
            }
        });

        // 여성 체크박스를 클릭했을 때
        $(".femaleCheckbox").click(function () {
            // 여성 체크박스가 체크되어 있으면 남성 체크박스의 체크를 해제
            if ($(this).prop("checked")) {
                $(".maleCheckbox").prop("checked", false);
            }
        });
    });
		
	   
});//close function
  
function check(){
	if(!idok){
		alert("중복체크 버튼을 눌러주세요");
		return false;
	}
	let pass1=$("#pass1").val();
	let pass2=$("#pass2").val();
	if(pass1==pass2){
		$("#signupModal").modal("show");
		return true;//action 호출
	}else{
			alert("두개의 비밀번호가 맞지 않습니다");
			return false;//action 이 호출되지 않는다
		}		
}
</script>
</head>
<body>

	<form id="yourFormId" action="./success" method="post" enctype="multipart/form-data" onsubmit="return check()">
		
			<h2><b>회원가입</b></h2>
			<br>
			<br>
					<img id="showimg" style="width:150px;height:150px;"
					 src="../res/photo/noimage.png">
					<br>
					<button type="button" class="btn btn-secondary"
					onclick="$('#upload').trigger('click')">사진선택</button>
					
					<input type="file" name="upload" id="upload" maxlength="100" style="display: none;">
					<div class="input-group">
					<input type="text" name="userid" id="userid" class="form-control" minlength="5" maxlength="20" required="required" autofocus="autofocus" placeholder="아이디">
					<button type="button" class="btn btn-danger btn-sm" id="btnidcheck">중복체크</button>
					</div>
				<input type="password" name="userpw" id="pass1" class="form-control" minlength="4" maxlength="20" required="required" placeholder="비밀번호">
				
					<input type="password"  id="pass2" class="form-control" minlength="4" maxlength="20" required="required" placeholder="비밀번호재입력">
					<br>
					<input type="text" class="form-control" required="required"
					autofocus="autofocus" name="username" minlength="2" maxlength="20" placeholder="이름">
				
					
    				<input type="text" name="userbirth" class="form-control" required="required" minlength="8" maxlength="8" placeholder="생년월일 8자리"><br>
   					
					<input type="checkbox" class="maleCheckbox" id="saveid" checked>&nbsp;남성
					<input type="checkbox" class="femaleCheckbox" id="saveid">&nbsp;여성
							
					<input type="text" name="userphone" class="form-control" required="required" minlength="11" maxlength="11" placeholder="휴대전화번호">
					
			
					<input type="email" name="useremail" class="form-control" required="required" minlength="10" maxlength="50" placeholder="이메일" multiple>
					<br>
				
					
					<button type="submit" class="btn btn-secondary" id="loginsuccess" >회원가입</button>
			</form>

</body>
</html>