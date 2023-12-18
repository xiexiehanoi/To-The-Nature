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
			width:70%;
            padding: 10px;
            margin: 0 auto;
           
        }
      .reviewname {
      	display: inline-block;
      	font-size:1.5em;
      }
     .reviewdate {
     	display: inline-block;
     	float: right;
     	
     }
     .reviewid {
        display: inline-block;
        margin-right: 10px;
     }
     .reviewrate {
        display: inline-block;
     }
     .reviewdelete{
     float:right;
     cursor: pointer;
     }
</style>
</head>
<script type="text/javascript">

function list()
{
    <c:forEach var="review" items="${userReviews}">
        let review_num=${review.review_num};
        let loginok='${sessionScope.loginok}';
        let loginid='${sessionScope.myid}';
        // 댓글 출력하는 함수
        $.ajax({
            type:"get",
            dataType:"json",
            url:"../admin/manage",
            data:{"review_num":review_num},
            success:function(res){
                let s="";
                $.each(res, function (idx, item) {
                    s+= `<div>${item.facltNm} ${item.rate} (${item.content})<br>`;
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
<div class="review-all">리뷰관리<br>
총 리뷰 ${allReviews.size()}개</div>
 <div class="input-group reviewsearch">	  
				<select id="field" class="form-select">
					<option value="facltNm">업체명</option>
					<option value="user_id">아이디</option>
				</select>
				<input type="text" class="form-control" style="margin-left:10px;"
				id="word" placeholder="검색값입력">
				<button type="button" class="btn btn-success btn-sm" id="btnsearch"
				style="margin-left:10px;">검색</button><br><br></div>
<hr>
 
      <c:forEach var="review" items="${allReviews}">
                <div class="reviewname">${review.facltNm}</div>
                <div class="reviewdate"><fmt:formatDate value="${review.created_at}" pattern="yyyy-MM-dd HH:mm"/></div><br>
                    <div class="reviewid">${review.user_id}</div>
                    <div class="reviewrate">평점:${review.rate}</div>
                    <br><br>
                    <div>${review.content}</div>
                <br>
                <i class="bi bi-x-square-fill reviewdelete" onclick="deleteReview(${review.review_num})" data-bs-toggle="tooltip" data-bs-placement="top" title="삭제"></i><br><hr>
            </c:forEach>
            <div class="reviewlist"></div>
 </div>
 <script type="text/javascript">
$(document).ready(function () {
    // 초기 로딩 시 전체 리뷰 목록을 표시
    list();

    // 검색 버튼 클릭 시 이벤트
    $("#btnsearch").click(function () {
        // 선택한 필드와 검색어를 가져오기
        var field = $("#field").val();
        var word = $("#word").val();

        // 검색 결과를 표시할 영역 초기화
        $("div.reviewlist").html("");

        // 검색을 위한 Ajax 요청
        $.ajax({
            type: "GET",
            dataType: "json",
            url: "../admin/reviewfind",
            data: {"field": field, "word": word},
            success: function (res) {
                if (res.length > 0) {
                    // 검색 결과가 있으면 출력
                    let s = "";
                    $.each(res, function (idx, item) {
                    	s += `<div class="reviewname">${item.facltNm}</div>`;
                        s += `<div class="reviewdate">${item.created_at}</div><br>`;
                        s += `<div class="reviewid">${item.user_id}</div>`;
                        s += `<div class="reviewrate">평점:${item.rate}</div>`;
                        s += `<br><br>`;
                        s += `<div>${item.content}</div>`;
                        s += `<br>`;
                        s += `<i class="bi bi-x-square-fill reviewdelete" onclick="deleteReview(${item.review_num})" data-bs-toggle="tooltip" data-bs-placement="top" title="삭제"></i><br><hr>`;
                    });
                    $("div.reviewlist").html(s);
                } else {
                    // 검색 결과가 없을 때 메시지 표시
                    $("div.reviewlist").html("검색 결과가 없습니다.");
                }
            },
            error: function () {
                alert("서버와의 통신 중 오류가 발생했습니다.");
            }
        });
    });
});

function list() {
    // 전체 리뷰 목록을 표시하는 함수
    <c:forEach var="review" items="${allReviews}">
        // 각 리뷰에 대한 처리 (생략)
    </c:forEach>
}
// 삭제 함수 (생략)
</script>  
</body>
</html>