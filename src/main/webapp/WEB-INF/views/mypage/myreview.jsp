<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>마이페이지</title>
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Permanent+Marker&family=Single+Day&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
    body * {
            font-family: 'Jua';
        }
 	
    .header {
    	border:1px solid black;
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
    </style>
    <c:set var="root" value="<%=request.getContextPath()%>"/>

</head>
<script type="text/javascript">
function list()
{
	let review_num=${dto.review_num};
	let loginok='${sessionScope.loginok}'; 
	let loginid='${sessionScope.myid}';
	//댓글 출력하는 함수
	$.ajax({
		type:"get",
		dataType:"json",
		url:"../mypage/review",
		data:{"review_num":review_num},
		success:function(res){
			let s="";
			$.each(res,function(idx,item){
				s+=
					`
					\${item.facltNm}
					\${item.rate}(\${item.content})<br>
					`;
				}

				s+=					
					`
					<span style="color:gray;font-size:0.9em;">\${item.writeday}</span>					
					`;
				
				s+="<br>";
			});

			$("div.reviewlist").html(s);
	    }
	});
}
</script>
<body>
<div class="header">
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
</div>
<div class="myreview-all">
<div class="review-all">리뷰관리<br>
내가 쓴 총 리뷰 ${userReviews.size()}개</div>
<hr>
  
      <c:forEach var="review" items="${userReviews}">
                <div class="reviewname">${review.facltNm}</div>
                <div class="reviewdate"><fmt:formatDate value="${review.created_at}" pattern="yyyy-MM-dd HH:mm"/></div><br>
                    <div>평점:${review.rate}</div>
                    <br>
                    <div>${review.content}</div>
                <br><br><hr>
            </c:forEach>
 </div>      
</body>
</html>