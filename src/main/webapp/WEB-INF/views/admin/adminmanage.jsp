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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
   body * {
       font-family: 'Jua';
   }
  .myreview-all {
			width:72%;
            padding: 10px;
            margin: 0 auto;
        }
      .review-all {
       	margin-top:48px;
       	margin-left:200px;
       }
       .reviewsubject {
       font-size:32px;
       }
       .reviewsearch {
       	width:400px;
       	margin-left: auto;
       	margin-right: 150px;
       	display: flex;
        justify-content: flex-end;
       }
       .table {
       width:64%;
       text-align:center;
       }
      .reviewfacltNm {
      width:200px;
      }
      .reviewid {
      width:80px;
      }
      .reviewrate {
      width:50px;
      }
      .reviewcontent {
      width:200px;
      }
      .reviewdate {
      width:200px;
      }
     .reviewdelete{
     width:30px;
     cursor: pointer;
     }
     #btnsearch {
		width: 48px;
		background-color:#528171;
		color:white;
		border: white;
	}
	.hidden {
        display: none;
    }
</style>
</head>
<script type="text/javascript">

$(document).ready(function () {
    $(document).on("click", "#btnsearch", function() {
        let selectedField = $("#field option:selected").val() || "";
        let word = $("#word").val();
        
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "../admin/reviewfind",
            data: {"searchword": selectedField, "word": word},
            success: function (res) {
                let tbody = $("tbody.table_list");
                tbody.empty();

                $.each(res, function (idx, item) {
					let createdDate = new Date(item.created_at);
                	
                	let year = createdDate.getFullYear();
                	let month = String(createdDate.getMonth() + 1).padStart(2, '0');
                	let day = String(createdDate.getDate()).padStart(2, '0');
                	let hour = String(createdDate.getHours()).padStart(2, '0');
                	let minute = String(createdDate.getMinutes()).padStart(2, '0');

                	let createdate = year + '-' + month + '-' + day + ' ' + hour + ':' + minute;
                	
                    let s = `<tr>
                        <td>\${item.facltNm}</td>
                        <td>\${item.user_id}</td>
                        <td>\${item.rate}</td>
                        <td>\${item.content}</td>
                        <td>\${createdate}</td>
                        <td>
                            <i class="bi bi-x-square-fill reviewdelete" onclick="deleteReview(\${item.review_num})"
                                data-bs-toggle="tooltip" data-bs-placement="top" title="삭제"></i>
                        </td>
                    </tr>`;
                    tbody.append(s);
                });

                $("div.reviewlist").addClass("hidden");
                $("div#searchResult").removeClass("hidden");
            }
        });
    });
});
function list()
{
    <c:forEach var="review" items="${userReviews}">
        let review_num=${review.review_num};
        let loginok='${sessionScope.loginok}';
        let loginid='${sessionScope.myid}';
        
        $.ajax({
            type:"get",
            dataType:"json",
            url:"../admin/manage",
            data:{"review_num":review_num},
            success:function(res){
                let s="";
                $.each(res, function (idx, item) {
                    s+= `<div>${item.facltNm} ${item.rate} (${item.content})`;
                    s += `<a href="javascript:void(0);" onclick="deleteReview(${review_num})">삭제</a>`;
                    s += `<br>`;
                });
               
                $("div.reviewlist").html(s);
            }
        });
    </c:forEach>
}

//삭제 함수
function deleteReview(review_num) {
    // 삭제 처리를 수행하는 Ajax 요청
    $.ajax({
        type: "POST",
        url: "../admin/delete",
        data: {"review_num": review_num},
        success: function (res) {
            if (res.success) {
                // 성공 시 해당 리뷰를 화면에서 삭제
                alert("리뷰를 삭제했습니다.");
                $(`div[data-review-num="${review_num}"]`).remove();
                location.reload();
            } else {
                alert("리뷰 삭제에 실패했습니다.");
            }
        },
        error: function () {
            alert("서버와의 통신 중 오류가 발생했습니다.");
        }
    });
}
</script>
<body>
<div class="myreview-all">
<div class="review-all">
<div class="reviewsubject">리뷰관리</div><br>
</div> 
 <div class="input-group reviewsearch">	  
				<select id="field" class="form-select">
					<option value="facltNm">업체명</option>
					<option value="user_id">아이디</option>
				</select>
				<input type="text" class="form-control" style="margin-left:10px;"
				id="word" placeholder="검색값입력">
				<button type="button" class="btn-sm" id="btnsearch"
				style="margin-left:10px;">검색</button><br><br></div>

 <br>
      <table class="table mx-auto">
    <thead>
        <tr>
            <th class="reviewfacltNm">Facility Name</th>
            <th class="reviewid">User ID</th>
            <th class="reviewrate">Rate</th>
            <th class="reviewcontent">Content</th>
            <th class="reviewdate">Date</th>
            <th class="reviewdelete">Delete</th>
        </tr>
    </thead>
    <tbody class="table_list">
        <c:forEach var="review" items="${allReviews}">
            <tr>
                <td>${review.facltNm}</td>
                <td>${review.user_id}</td>
                <td>${review.rate}</td>
                <td>${review.content}</td>
                <td><fmt:formatDate value="${review.created_at}" pattern="yyyy-MM-dd HH:mm"/></td>
                
                <td>
                    <i class="bi bi-x-square-fill reviewdelete" onclick="deleteReview(${review.review_num})"
                        data-bs-toggle="tooltip" data-bs-placement="top" title="삭제"></i>
                </td>
            </tr>
            <tr>
                <td colspan="6"></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
            <div class="reviewlist"></div>
            <div id="searchResult" class="reviewsearch hidden"></div>
 </div>
  
</body>
</html>