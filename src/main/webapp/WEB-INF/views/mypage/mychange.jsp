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
       
       
       
    }
    .changeinfo {
    
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .genderButtons {
        display: flex;
        justify-content: space-between;
       
    }
   .genderButton {
   
   			width: 50%;
            background-color: white;
            color: #000;
         	border: 1px solid #ccc;
        }
    .genderButton:hover {
   			background-color: white;
            color: #000;
            border: 1px solid #ccc;
   }  
   .genderButton.active {
        background-color: #528171 !important; /* !important를 사용하여 우선순위 부여 */
        color: #fff !important;
        border: 1px solid #528171 !important;
    }  
 	form {
        width: 80%;
        max-width: 600px; /* 최대 너비 설정 */
        height: 100%;
        max-height: 1600px;
        margin-top:200px;
    }
    .photoinfo {
        display: flex;
        justify-content: space-between;
    }
    .photoinsert {
    	width:30%;
    	height: 100%;
        display: flex;
        flex-direction: column;
    }
    .photoinsert img {
        width: 160px;
        height: 120px;
        border:1px solid lightgray;
    }
    #profileImage {
    	border-radius:6%;
    }
    .infogroup {
            width:70% ;
            margin-left: auto;
            height: 100%; /* photoinsert와 높이를 맞추기 위해 100%로 설정 */
        display: flex;
        flex-direction: column; /* 내부 요소를 세로 방향으로 정렬 */
        justify-content: space-between;
        }
   button#memberchange {
        width: 100%; /* 입력란과 같은 너비로 설정 */
        background-color: beige; /* 베이지 색상으로 설정 */
        color: #000000; /* 글자 색상을 검정으로 설정 */
        border: 1px solid white; /* 테두리를 흰색으로 설정 */
    }
    .readonly {
            background-color: #f8f9fa; /* 배경색 회색으로 변경 */
        }
    .error-message {
        color: red;
        font-size: 12px;
    }

    /* 입력 오류 시 테두리 스타일 */
    .error-border {
        border: 1px solid red;
    }    
    </style>
    <c:set var="root" value="<%=request.getContextPath()%>"/>
</head>
<script type="text/javascript">

function list()
{
	let userid=${dto.userid};
	let loginok='${sessionScope.loginok}';
	let loginid='${sessionScope.myid}';
	

    // DOM이 완전히 로드된 후 실행되는 함수
    $(document).ready(function () {
    	let userGender = '<%= session.getAttribute("usergender") %>';
    	
        // userGender가 male이면 남성 버튼에 색상 적용 및 비활성화
        if (userGender === 'male') {
            applyButtonStyle('saveMale', '#528171');
        } else if (userGender === 'female') {
            // userGender가 female이면 여성 버튼에 색상 적용 및 비활성화
            applyButtonStyle('saveFemale', '#528171');
        }
        $('.genderButton').on('click', function () {
            applyButtonStyle($(this).attr('id'),'#528171');
        });

        
    });
    }
	
	$.ajax({
		type:"get",
		dataType:"json",
		url:"../mypage/change",
		data:{"userid":userid},
		success:function(res){
			let s="";
			$.each(res, function (idx, item) {
               
				s+=
					`
					${item.username}
					${item.userbirth}
					${item.usergender}
					${item.userphone}
					${item.useremail}
					`;
				}

				
				
				s+="<br>";
			});

			
	    }
	});
}

</script>
<body>
<div class="changeinfo">
	<form id="yourFormId" action="./info" method="post" enctype="multipart/form-data" onsubmit="return check()">
		
			<h2 style="margin-bottom:50px;">회원정보 수정</h2>
			<br>
			<br>
			<c:if test="${not empty userInfo}">
			<div class="photoinfo">
			<div class="photoinsert">
			<img id="profileImage" src="${root}/res/upload/${sessionScope.userphoto}" onerror="this.src='${root}/res/photo/noimage.png'" class="profile_photo">
	     <input type="file" id="profile_upload" name="userphoto" style="display: none;">	</div>
				<div class="infogroup">	
				<input type="text" name="userid" id="userid" class="form-control readonly" value="${sessionScope.userid}" readonly >
							
    			<input type="text" name="userbirth" class="form-control readonly" minlength="8" maxlength="8" value="${userInfo.userbirth}" readonly>
    			<input type="text" class="form-control" required="required"
					autofocus="autofocus" name="username" minlength="2" maxlength="20" value="${userInfo.username}" placeholder="이름">
				</div></div>
				<br><input type="password" name="userpw" id="pass1" class="form-control" minlength="4" maxlength="20" required="required" placeholder="비밀번호">
				
					<input type="password"  id="pass2" class="form-control" minlength="4" maxlength="20" required="required" placeholder="비밀번호재입력">
					<br>
    	<div class="genderButtons">
        <button type="button" class="btn btn-secondary genderButton ${usergender eq 'male' ? 'active' : ''}" data-gender="male" id="saveMale" readonly>남성</button>
        <button type="button" class="btn btn-secondary genderButton ${usergender eq 'female' ? 'active' : ''}" data-gender="female" id="saveFemale" readonly>여성</button>
    	</div>
    	<input type="text" name="userphone" class="form-control" required="required" minlength="11" maxlength="11" value="${userInfo.userphone}" placeholder="연락처">
    	<input type="email" name="useremail" class="form-control" required="required" minlength="10" maxlength="50" value="${userInfo.useremail}" multiple placeholder="이메일">
    	<br><br>
	</c:if>
					
					<button type="submit" class="btn btn-secondary" id="memberchange" >회원수정</button>
			</form></div>
<script type="text/javascript">
$(function(){
	$("#profile_upload").change(function(){
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
		    $("#profileImage").attr("src",e.target.result);
		   }
		   reader.readAsDataURL($(this)[0].files[0]);
		  }
	});
});
	//셋팅 아이콘 클릭시 파일 업로드 이벤트 트리거
	$('#profileImage').on('click', function () {
        $('#profile_upload').trigger('click');
    });
	function check() {
	    var pass1 = document.getElementById("pass1").value;
	    var pass2 = document.getElementById("pass2").value;
		
	    $(".form-control").removeClass("error-border");
        $(".error-message").remove();
	    if (pass1 !== pass2) {
	    	$("#pass1").addClass("error-border");
	    	$("#pass2").addClass("error-border");
	    	$("#pass2").after('<div class="error-message" style="color: red;">비밀번호가 일치하지 않습니다. 다시 입력해주세요.</div>');
	      
	        return false; // Prevent form submission
	    }
	    alert("회원정보가 수정됐습니다.");
	    return true; // Allow form submission
	}	
</script>
	
</body>
</html>