<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회</title>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Permanent+Marker&family=Single+Day&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
   body * {
       font-family: 'Jua';
   }
 
   .search-contain {
       position: absolute;
       top: 40%;
       left: 50%;
       transform: translate(-50%, -50%);
       width: 900px; /* Set the width as needed */
       height: 500px;
   }
   .usersearch {
        font-size: 24px; /* 수정된 부분: 폰트 크기를 늘림 */
        margin-bottom: 50px; /* 수정된 부분: usersearch와 검색 입력창 사이 공백을 늘림 */
    }
   .selectsearch {
            position: fixed;
            top: 10px;
            right: 10px;
            width: 400px; /* Set the width as needed */
            z-index: 1; /* Set a higher z-index to keep it above other elements */
        }
	
        #resultTable {
            max-height: 800px; /* Set the max height for the resultTable */
            overflow-y: auto; /* Add a scrollbar when the content exceeds the height */
       		margin-top: 80px;
        }
    .delete-icon {
        cursor: pointer;
    } 
</style>
<script type="text/javascript">

$(function(){
	$("#btnsearch").click(function(){
        list();
    });
	$(document).on("click", ".delete-icon", function() {
	    // 클릭된 delete-icon에서 writeday 속성을 가져옴
	    var writeday = $(this).closest('tr').data("writeday");
        console.log("Clicked delete-icon. UserId:", userId);
        // 사용자를 삭제하기 위한 함수 호출
        deleteUser(writeday);
    })
function list()
{
	let selectedField = $("#field option:selected").val() || "";
    let word = $("#word").val() || "";

	$.ajax({
		type:"get",
		dataType:"json",
		url:"../admin/result",
		data: { field: selectedField, word: word },
		success:function(res){
			let s="";
			s+=
				`
				<table class="table center-table" style="width:100%;">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">아이디</th>
      <th scope="col">이름</th>
      <th scope="col">생년월일</th>
      <th scope="col">성별</th>
      <th scope="col">연락처</th>
      <th scope="col">이메일</th>
      <th scope="col">가입일</th>
      <th scope="col">계정삭제</th>
    </tr>
  </thead>
  <tbody class="table-group-divider">					      
				`;
			$.each(res,function(idx,item){

				s+=
					`
	<tr data-writeday="${item.writeday}">
      <th scope="row"></th>
      <td>\${item.userid}</td>
      <td>\${item.username}</td>
      <td>\${item.userbirth}</td>
      <td>\${item.usergender}</td>
      <td>\${item.userphone}</td>
      <td>\${item.useremail}</td>
      <td>\${item.writeday}</td>
      <td>&nbsp;&nbsp;&nbsp;<i class="bi bi-x-square-fill delete-icon" data-writeday="${item.writeday}"></i></td>
    </tr>
					`;
			});
			
			s+="</tbody><table>";
			$("#resultTable").html(s);
			$("#resultTable tbody tr").each(function(index, element) {
                $(element).find("th:first").text(index + 1);
            });
		},
        error: function (xhr, status, error) {
            console.error(xhr.responseText);
        }
    });
}

	function deleteUser(writeday) {
        $.ajax({
            type: "POST",
            url: "../admin/userdelete",
            data: { writeday: writeday },
            success: function (res) {
                // 삭제가 성공하면 사용자 목록을 새로 고침
                list();
            },
            error: function (xhr, status, error) {
            	console.error("Error deleting user:", error);
            	console.log("Error deleting user. UserID: " + userId);
            }
        });
    }
});

</script>
</head>
<body>
<div class="search-contain">
<div class="usersearch">회원조회</div>
 <div class="input-group selectsearch">	  
				<select id="field" class="form-select">
					
					<option value="userid">아이디</option>
					<option value="username">이름</option>
					<option value="usergender">성별</option>
					<option value="userphone">핸드폰</option>
					<option value="useremail">이메일</option>
				</select>
				<input type="text" class="form-control" style="margin-left:10px;"
				id="word" placeholder="검색값입력">
				<button type="button" class="btn btn-success btn-sm" id="btnsearch"
				style="margin-left:10px;">검색</button><br><br></div>
				<div id="resultTable"></div>

</div>
</body>
</html>