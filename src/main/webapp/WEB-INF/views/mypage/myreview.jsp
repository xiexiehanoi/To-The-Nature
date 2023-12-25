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
 	
     
	.myreview-all {
			width:48%;
            padding: 10px;
            margin: 0 auto;
            
        }
       .navbar {
            width: 20%; /* Navbar 영역의 너비를 20%로 설정 */
            /* 다른 스타일을 필요에 따라 추가하세요. */
        } 
       .reviewtitle {
       	font-size:32px;
       	margin-top:100px;
       }
       .review-entry {
        display: flex; /* Use flexbox to align children horizontally */
    }
       
       .reviewphoto img {
        max-width: 100px;
        max-height: 100px;
        border-radius:8%;
    }
    .reviewaddr {
    	color:gray;
    }
    .reviewplace {
        display: flex;
        flex-direction: column;
        margin-left: 10px; /* Add margin to separate photo and place */
    }
      .reviewname {
      	
      	font-size:1.5em;
      }
     .reviewdate {
     	color:gray;
     	float: right;
     	
     }
     .startext {
        display: flex; /* Use flexbox to align children horizontally */
        margin-right: 5px;
    }
     .star {
        color: #FFE700; /* or any other color you prefer for the yellow stars */
        font-size: 14px; /* Adjust the size of the stars */
        margin-right: 2px; /* Adjust the spacing between stars */
    }  
    </style>
    <c:set var="root" value="<%=request.getContextPath()%>"/>
	<%@ include file="/WEB-INF/views/main/Navbar.jsp" %>
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
			$.each(res, function (idx, item) {
				let starrate = '★'.repeat(item.rate);
				s+=
					`
					${item.firstImageUrl}
					${item.doNm}
					${item.sigunguNm}
					${item.facltNm}
					${item.rate}
					${starrate}
					(${item.content})<br>
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

<div class="myreview-all">
<div class="review-all">
<div class="reviewtitle">리뷰관리</div><br>
<i class="bi bi-chat-right-text"></i>
작성 리뷰 ${userReviews.size()}개</div>
<hr>
  
      <c:forEach var="review" items="${userReviews}">
      <div class="review-entry">
                <div class="reviewphoto"><img src="${review.firstImageUrl}"></div>
                <div class="reviewplace">
                <div class="reviewaddr">${review.doNm}&nbsp; ${review.sigunguNm}</div>
                <div class="reviewname">${review.facltNm}</div>
                </div>
                </div>
                <div class="startext">별점&nbsp;
                    <div class="star">
                     <c:forEach begin="1" end="${review.rate}" varStatus="loop">
  				 <c:out value="★"/>
				</c:forEach></div></div>
                    <br>
                    <div>${review.content}</div>
                    <div class="reviewdate"><fmt:formatDate value="${review.created_at}" pattern="yyyy-MM-dd HH:mm"/></div>
                <br><hr>
            </c:forEach>
 </div>      
</body>
</html>