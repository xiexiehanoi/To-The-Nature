<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminreservation</title>
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
    z-index: -1;
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
  	overflow-y: auto;
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
  .reservationsearch{
  width:400px;
  margin-left: auto;
  margin-right: 150px;
  justify-content: flex-end;
 }
  #btnsearch {
  width: 56px;
  background-color:#528171;
  color:white;
  border: white;
  text-align: center;
  white-space: nowrap;
  margin-right:40px;
	}
</style>
</head>
<script type="text/javascript">
<<<<<<< HEAD
=======
var reservation_id = '${reservation_id}';
>>>>>>> refs/remotes/origin/feature/login

$(document).ready(function() {
    listAllresevation();
    
    $(document).on("click", ".reservationdelete", function() {
        let reservation_id = $(this).closest("tr").data("reservationId");
        deleteReservation(reservation_id);
    });
    
    
    $("#btnsearch").click(function() {
        let selectedField = $("#field option:selected").val() || "";
        let word = $("#word").val();
        
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "./reservationfind",
            data: {"searchword": selectedField, "word": word},
            success: function (res) {

                let tbody = $("tbody");
                tbody.empty();

                $.each(res, function (idx, item) {
					
                    let s = `<tr>
                        <td>\${item.facltNm}</td>
                        <td>\${item.userid}</td>
                        <td>\${item.startDate}</td>
                        <td>\${item.endDate}</td>
                        <td>\${item.adult_count}</td>
                        <td>\${item.child_count}</td>
                        <td>\${item.reservationDate}</td><br>
                        <td>
                            <i class="bi bi-x-square-fill reservationdelete" onclick="deleteReservation(${item.reservation_id})"
                                data-bs-toggle="tooltip" data-bs-placement="top" title="삭제"></i>
                        </td>
                    </tr>`;
                    tbody.append(s);
                });
            }
        });
    });
});


function listAllresevation() {
    $.ajax({
        type: "get",
        dataType: "json",
        url: "./reservation",
        success: function (res) {
            let s = "";
            let reservation_id = res.reservation_id;
            $.each(res, function (idx, item) {
                s += `
                    <tr>
                        <td>${item.firstImageUrl}</td>
                        <td>${item.facltNm}</td>
                        <td>${item.startDate}</td>
                        <td>${item.endDate}</td>
                        <td>${item.adult_count}</td>
                        <td>${item.child_count}</td>
                        <td>${item.reservationDate}</td>
                        <td><a href="javascript:void(0);" onclick="deleteReservation(${item.reservation_id})">삭제</a></td>
                    </tr>`;
            });
            $("tbody").html(s);
        }
    });
}


function deleteReservation(reservation_id) {
    $.ajax({
        type: "POST",
        url: "../admin/deleteReservation",
        data: {"reservation_id": reservation_id},
        success: function(res) {
            if (res.success) {
                $("tr[data-reservation-id=reservation_id]").remove();
                console
                alert("예약을 삭제했습니다.");
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

<<<<<<< HEAD
 <div class="input-group reservationsearch">	  
				<select id="field" class="form-select">
					<option value="facltNm">업체명</option>
					<option value="user_id">아이디</option>
				</select>
				<input type="text" class="form-control" style="margin-left:10px;"
				id="word" placeholder="검색값입력">
				<button type="button" class="btn-sm" id="btnsearch"
				style="margin-left:10px;">검색</button><br><br></div>

=======
>>>>>>> refs/remotes/origin/feature/login
<br>
 
      <table class="reservation-table">
            <thead>
                <tr>
                    <th class="tableFacility">Facility Name</th>
                    <th class="tableid">ID</th>
                    <th class="tablein">CheckIn</th>
                    <th class="tableout">CheckOut</th>
                    <th class="tableadult">Adult</th>
                    <th class="tablechild">Child</th>
                    <th class="tabledate">Reservation Date</th>
                    <th class="tabledelete">Delete</th>
                </tr>
            </thead>
            <tbody>
            <tr style="border-bottom: 2px solid black;"></tr>
                <c:forEach var="reservation" items="${allReservations}">
                	<tr data-reservation-id="${reservation.reservation_id}">
                        <td>${reservation.facltNm}</td>
                        <td>${reservation.userid}</td>
                        <td>${reservation.startDate}</td>
                        <td>${reservation.endDate}</td>
                        <td>${reservation.adult_count}</td>
                         <td>${reservation.child_count}</td>
                        <td>${reservation.reservationDate}</td>
                         <td>
			                <i class="bi bi-x-square-fill reservationdelete" 
			                   data-reservation-id="${reservation.reservation_id}"  
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
 </div>      
</body>
</html>