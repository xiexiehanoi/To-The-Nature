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
  .reservationfirstImageUrl img {
        width: 200px; /* 이미지의 최대 너비를 부모 요소의 100%로 설정 */
        height: auto; /* 이미지의 높이를 자동으로 조정하여 가로세로 비율 유지 */
        display: block; /* 이미지 간격 문제 해결을 위해 블록 요소로 설정 */
        margin: 0; /* 이미지를 가운데 정렬 */
        /* 추가적으로 필요한 스타일을 여기에 추가할 수 있습니다. */
    }
</style>
</head>
<script type="text/javascript">
$(document).ready(function() {
    listAllresevation();
});
function listAllresevation() {
    $.ajax({
        type: "get",
        dataType: "json",
        url: "../admin/resevation", // URL을 올바른 엔드포인트로 업데이트
        data:{"reservation_id":reservation_id},
        success: function (res) {
            let s = "";
            $.each(res, function (idx, item) {
                s +=
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
<div class="reservation-all">예약관리<br>
총 예약내역 ${allReservations.size()}개</div>
<hr>
 
      <c:forEach var="reservation" items="${allReservations}">
      			<div class="reservationfirstImageUrl"><img src="${reservation.firstImageUrl}"></div>
                <div class="reservation-contain">
                <div class="reservationname">${reservation.facltNm}</div>
                <div class="reservationduring">예약기간&nbsp;
                <div class="reservationstarDate">${reservation.startDate}</div>
                <div class="reservationendDate">${reservation.endDate}</div>
                </div>
                <div class="person">
                <div class="reservationadult_count">성인: ${reservation.adult_count}</div>
                <div class="reservationchild_count">아동: ${reservation.child_count}</div>
                </div>
                <div class="reservationreservationDate">${reservation.reservationDate}</div><hr>
            	 </div>
            </c:forEach>
 </div>      
</body>
</html>