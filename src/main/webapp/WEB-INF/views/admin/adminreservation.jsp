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
  .myreservation-all {
  	display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 50px;
    width:72%;
    margin-left: auto;
    margin-right: auto;
  }
  .reservation-all {
  	margin-right:700px;
  	white-space: nowrap;
  }
  .reservation-subject {
  	font-size:32px;
  }
  .reservation-table {
  	width: 64%;
    max-width: 100%;
    height:80%;
    max-height:100%;
  	
  }
  .tableFacility {
  width:150px;
  }
  .tableid {
  width:50px;
  }
  .tablein {
  width:100px;
  }
  .tableout {
  width:100px;
  }
  .tableadult {
  width:30px;
  }
  .tablechild {
  width:30px;
  }
  .tabledate {
  width:100px;
  }
  .tabledelete {
  width:30px;
  }
  .reservationsearch {
   	width:400px;
   	margin-left: auto;
   	margin-right: 150px;
   	display: flex;
    justify-content: flex-end;
   }
</style>
</head>
<script type="text/javascript">
var reservation_id = '${reservation_id}';
$(document).ready(function() {
    listAllresevation();
    
    $(document).on("click", "#btnsearch", function() {
        let selectedField = $("#field option:selected").val() || "";
        let word = $("#word").val();
        
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "../admin/reservationfind",
            data: {"searchword": selectedField, "word": word},
            success: function (res) {
            	console.log(res);
                let tbody = $("tbody.table_list");
                tbody.empty();

                $.each(res, function (idx, item) {
					let startDate = new Date(item.startDate);
					let endDate = new Date(item.endDate);
                	
                	let year = createdDate.getFullYear();
                	let month = String(createdDate.getMonth() + 1).padStart(2, '0');
                	let day = String(createdDate.getDate()).padStart(2, '0');
                	let hour = String(createdDate.getHours()).padStart(2, '0');
                	let minute = String(createdDate.getMinutes()).padStart(2, '0');

                	let startdate = year + '-' + month + '-' + day + ' ' + hour + ':' + minute;
                	let enddate = year + '-' + month + '-' + day + ' ' + hour + ':' + minute;
                	
                    let s = `<tr>
                    	<td>\${item.firstImageUrl}</td>
                        <td>\${item.facltNm}</td>
                        <td>startdate</td>
                        <td>enddate</td>
                        <td>\${item.adult_count}</td>
                        <td>\${item.child_count}</td>
                        <td>\${item.reservationDate}</td>
                    </tr>`;
                    tbody.append(s);
                });

                $("div.reservationlist").addClass("hidden");
                $("div#searchResult").removeClass("hidden");
            }
        });
    });
});

function listAllresevation() {
    $.ajax({
        type: "get",
        dataType: "json",
        url: "../admin/searchReservation", // URL을 올바른 엔드포인트로 업데이트
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
                    ${item.reservationDate}<br>
                     `;
                s += `<a href="javascript:void(0);" onclick="deleteReservation(${reservation_id})">삭제</a>`;
            });
            $("div.reservationlist").html(s);
        }
    });
}
//예약 삭제 요청 함수

function deleteReservation(reservation_id) {
	console.log("Deleting reservation with ID:", reservation_id);
    $.ajax({
        type: "POST",
        url: "../admin/deleteReservation",
        data: {"reservation_id": reservation_id},
        success: function(res) {
        	
            if (res.success) {
                alert("예약을 삭제했습니다.");
                $(`div[data-reservation-id="${reservation_id}"]`).remove();
                listAllresevation();
            } else {
                alert("예약 삭제에 실패했습니다.");
            }
        },
        error: function() {
            alert("서버와의 통신 중 오류가 발생했습니다.");
        }
    });
}
</script>
<body>

<div class="myreservation-all">
<div class="reservation-all">
<div class="reservation-subject">예약관리</div><br>
총 예약내역 ${allReservations.size()}개</div>
<hr>
 <div class="input-group reservationsearch">	  
				<select id="field" class="form-select">
					<option value="facltNm">캠핑장명</option>
					<option value="user_id">아이디</option>
				</select>
				<input type="text" class="form-control" style="margin-left:10px;"
				id="word" placeholder="검색값입력">
				<button type="button" class="btn-sm" id="btnsearch"
				style="margin-left:10px;">검색</button><br><br></div>
				<br>
      <table class="reservation-table">
            <thead>
                <tr>
                    <th class="tableFacility">캠핑장명</th>
                    <th class="tableid">ID</th>
                    <th class="tablein">입실일</th>
                    <th class="tableout">퇴실일</th>
                    <th class="tableadult">성인</th>
                    <th class="tablechild">어린이</th>
                    <th class="tabledate">예약일</th>
                    <th class="tabledelete">삭제</th>
                </tr>
            </thead>
            <tbody class="table_list">
            <tr style="border-bottom: 2px solid black;"></tr>
                <c:forEach var="reservation" items="${allReservations}">
                    <tr>
                        <td>${reservation.facltNm}</td>
                        <td>${reservation.userid}</td>
                        <td>${reservation.startDate}</td>
                        <td>${reservation.endDate}</td>
                        <td>${reservation.adult_count}</td>
                         <td>${reservation.child_count}</td>
                        <td>${reservation.reservationDate}</td>
                        <td>
                    <i class="bi bi-x-square-fill reservationdelete" onclick="deleteReservation(${reservation.reservation_id})"
                        data-bs-toggle="tooltip" data-bs-placement="top" title="삭제"></i>
                </td>
                    </tr>
                     <c:if test="${!loop.last}">
        <tr>
            <td colspan="8" style="border-bottom: 1px solid #ddd; height: 10px;"></td>
        </tr>
    </c:if>
                </c:forEach>
            </tbody>
        </table>
        <div class="reservationlist"></div>
            <div id="searchResult" class="reservationsearch hidden"></div>
 </div>      
</body>
</html>