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
    .reservation-title {
    	font-size:32px;
    }    
    .myreservation-all {
     	width: 56%;
        display: flex;
        flex-direction: column;
        margin-top: 50px;
        margin-left: auto;
   		margin-right: auto;
   		boder:1px solid black;
    }
    .reservation-content {
    display: flex;
    flex-direction: row;
    margin-bottom: 16px; /* Adjust the spacing between reservation-content items */
}
    .reservation-contain {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    margin-left:10px;
}
	.reservationfirstImageUrl {
    display: flex;
    flex-direction: row;
    align-items: center;
    margin-bottom: 10px; /* Adjust the spacing between reservationfirstImageUrl and reservation-contain */
}
	.reservationfirstImageUrl img {
        width: 200px; /* 이미지의 최대 너비를 부모 요소의 100%로 설정 */
        height: 150px; /* 이미지의 높이를 자동으로 조정하여 가로세로 비율 유지 */
        display: block; /* 이미지 간격 문제 해결을 위해 블록 요소로 설정 */
        margin: 0; /* 이미지를 가운데 정렬 */
        border-radius:8%;
    }
    .reservationname {
    	font-size:24px;
    }
    .reservationduring {
    display: flex;
    flex-direction: row;
    margin-top: 10px; /* Adjust the spacing between reservationduring and other elements */
}
    </style>
    <c:set var="root" value="<%=request.getContextPath()%>"/>

</head>
<script type="text/javascript">

function list()
{
	
	let loginok='${sessionScope.loginok}'; 
	let userId='${sessionScope.userId}';
	
	$.ajax({
		type:"get",
		dataType:"json",
		url:"../mypage/reservation",
		data:{"userId":userId},
		success:function(res){
			let s="";
			$.each(res, function (idx, item) {
                
				s+=
					`
					${item.firstImageUrl}
					${item.facltNm}<br>
					${item.startDate}
					${item.endDate}<br>
					${item.adult_count}
					${item.child_count}
					${item.reservationDate}<br><hr>
                     `;
             });
			$("div.reservationlist").html(s);
	    }
	});
}
</script>
<body>

<div class="myreservation-all">
<div class="reservation-all"><span class="reservation-title">예약관리</span><br><br>
예약내역 ${userReservations.size()}개</div>
<hr>
  
      <c:forEach var="reservation" items="${userReservations}">
      			<div class="reservation-content">
      			<div class="reservationfirstImageUrl"><img src="${reservation.firstImageUrl}"></div>
                <div class="reservation-contain">
                <div class="reservationname">${reservation.facltNm}</div>
                <div class="reservationduring">예약기간:&nbsp;
                <div class="reservationstarDate">${reservation.startDate}</div>&nbsp;-&nbsp;
                <div class="reservationendDate">${reservation.endDate}</div>
                </div>
                <div class="person">
                <div class="reservationadult_count">성인: ${reservation.adult_count}</div>
                <div class="reservationchild_count">아동: ${reservation.child_count}</div>
                </div>
                <div class="reservationreservationDate">예약일: ${reservation.reservationDate}</div><hr>
            	 </div></div><hr>
            </c:forEach>
 </div>      
</body>
</html>