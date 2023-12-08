<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<script	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
.camp_info_box {
	position: relative;
	width: 80%;
	height: auto;
	overflow: hidden;
	margin-bottom: 100px;
	display: flex;
}

.camp_info_box .img_b {
	width: 50%;
}

.camp_info_box .img_b img {
	width: 100%;
	height: auto;
}

.camp_info_box .cont_tb {
	width: 50%;
	height: auto;
	overflow: hidden;
}

.camp_info_box .cont_tb table {
	width: 100%;
	font-size: 14px;
}

.img_grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	grid-gap: 10px;
}

.image_grid img, svg {
	vertical-align: middle;
	max-width: 100px;
	height: auto;
}

.camping_intro {
	width: 100%;
	padding: 20px 0;
	border-top: 2px solid #000;
	border-bottom: 1px solid #000;
	overflow: hidden;
	margin-top: 20px;
	display: block;
	clear: both;
}

.camping_intro>span {
	font-size: 14px;
	color: #000;
	display: block;
	line-height: 25px;
}

.camp_icon_list {
    width: 94%;
    height: auto;
    overflow: hidden;
    padding: 30px 3%;
    border-radius: 5px;
}
</style>
<script>
	function readmoreimage(){
		$(".image_grid").click(function() {

			$('.hidden-image').removeClass('hidden-image');
			$('.image_grid').hide();
		});
	}
    function submitReservation() {
        // Get form data
        const formData = new FormData(document.getElementById('reservationForm'));

        // You can perform additional validations or actions here

        // Example: Log the form data to the console
        for (var pair of formData.entries()) {
          console.log(pair[0] + ': ' + pair[1]);
        }

        // Here you can use AJAX to send the data to the server
        // For example, using jQuery:
        // $.post('your_server_endpoint', formData, function(response) {
        //   console.log(response);
        // });

        // Close the modal
        $('#reservationModal').modal('hide');
      }
</script>
<body>
	<c:forEach var="dto" items="${campinglist}">
		<div id="cont_inner">
			<div class="sub_layout layout">
				<div class="camp_info_box">
					<!-- 이미지 부분은 이미지 경로를 반영 -->
					<div class="img_b">
						<img src="${dto.firstImageUrl}" alt="캠핑장 메인 이미지">
					</div>
					<!-- 테이블 부분 -->
					<div class="cont_tb">
						<table class="table">
							<colgroup>
								<col style="width: 30%;">
								<col style="width: 70%;">
							</colgroup>
							<tbody>
								<tr class="camp_name">
									<th scope="col">캠핑장명</th>
									<td>${dto.facltNm}</td>
								</tr>
								<tr class="camp_addr">
									<th scope="col">지역</th>
									<td>${dto.doNm}${dto.sigunguNm}</td>
								</tr>
								<tr class="camp_detailaddr">
									<th scope="col">전체 주소</th>
									<td>${dto.addr1}</td>
								</tr>
								<tr class="camp_call">
									<th scope="col">전화번호</th>
									<td>${dto.tel}</td>
								</tr>
								<tr class="camp_homepage">
									<th scope="col">홈페이지</th>
									<td><a href="${dto.homepage}">${dto.homepage}</a></td>
								</tr>
								<tr class="camp_workingday">
									<th scope="col">운영일</th>
									<td>${dto.operDeCl}</td>
								</tr>
								<tr class="camp_pet">
									<th scope="col">반려동물 출입 여부</th>
									<td>${dto.animalCmgCl}</td>
								</tr>
								<!-- <%-- <button type="button" class="btn_gB1 btn_modify"
                                    onclick="location.href='/zboard/createForm.do?lmCode=campRequest&amp;c_no='+${campinglist.campingNum}">
                                    정보수정요청</button> --%> -->
							</tbody>
						</table>
						<!-- 테이블 끝 -->
						<div class="btn_bottom">
							<button id="widhBtn" type="button" class="btn"
								onclick="fnCampBkmk(); return false">
								<i id="heartIcon" class="bi bi-heart" style="color: red;"></i>&nbsp;찜하기
							</button>
							<div id="reviewInfo">
								<span>리뷰</span> <span id="reviewCount">0</span>
								<!-- 리뷰 개수가 표시될 부분 -->
							</div>
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reservationModal">예약하기</button>

							<div class="image_grid">
								<c:forEach var="imageUrl" items="${fn:split(dto.imageUrl, ',')}"
									varStatus="loop">
									<img src="${imageUrl.trim()}" alt="캠핑장 이미지"
										class="${loop.index + 1 > 6 ? 'hidden-image' : ''} hidden-image">
								</c:forEach>
							</div>
							<button type="button" class="btn btn-secondary load_image">more</button>
						</div>
					</div>
				</div>
				<div class="camping_information_group">
					<h3 class="camping_info">
						<i class="bi bi-info-circle-fill"></i>&nbsp;캠핑장 소개
					</h3>
					<p class="camping_icon">
						<c:if test="${not empty dto.intro}">
							<span>${dto.intro}</span>
						</c:if>
						<c:if test="${empty dto.intro}">
							<span>내용 업데이트 예정</span>
						</c:if>
					</p>
					<h3 class="camping_info">
						<i class="bi bi-info-circle-fill"></i>&nbsp;캠핑장 시설정보
					</h3>
 					<p class="camping_facility">
                            <c:forEach var="sbrcl" items="${fn:split(dto.sbrsCl, ',')}">
                        		<ul class="camping_icon_list">
                                <c:choose>
                                    <c:when test="${sbrcl == '운동시설'}">
                                        <li><span><i class="bi bi-universal-access"></i></span><span>${sbrcl}</span></li>
                                    </c:when>
                                    <c:when test="${sbrcl == '전기'}">
                                        <li><span><i class="bi bi-lightning"></i></span><span>${sbrcl}</span></li>
                                    </c:when>
                                    <c:when test="${sbrcl == '무선인터넷'}">
                                        <li><span><i class="bi bi-wifi"></i></span><span>${sbrcl}</span></li>
                                    </c:when>
                                    <c:when test="${sbrcl == '장작판매'}">
                                        <li><span><i class="bi bi-tree"></i></span><span>${sbrcl}</span></li>
                                    </c:when>
                                    <c:when test="${sbrcl == '온수'}">
                                        <li><span><i class="bi bi-cup-hot"></i></span><span>${sbrcl}</span></li>
                                    </c:when>
                                    <c:when test="${sbrcl == '트렘폴린'}">
                                        <li><span><i class="bi bi-trampoline"></i></span><span>${sbrcl}</span></li>
                                    </c:when>
                                    <c:when test="${sbrcl == '물놀이장'}">
                                        <li><span><i class="bi bi-droplet"></i></span><span>${sbrcl}</span></li>
                                    </c:when>
                                    <c:when test="${sbrcl == '마트.편의점'}">
                                        <li><span><i class="bi bi-shop"></i></span><span>${sbrcl}</span></li>
                                    </c:when>
                                    <c:when test="${sbrcl == '놀이터'}">
                                        <li><span><i class="bi bi-scooter"></i></span><span>${sbrcl}</span></li>
                                    </c:when>
                                    <c:when test="${sbrcl == '산책로'}">
                                        <li><span><i class="bi bi-tree"></i></span><span>${sbrcl}</span></li>
                                    </c:when>
                                    <c:when test="${sbrcl == '운동장'}">
                                        <li><span><i class="bi bi-dribbble"></i></span><span>${sbrcl}</span></li>
                                    </c:when>
                                </c:choose>
	                        </ul>
                          </c:forEach>
					</p>
					  <!-- Your existing HTML code goes here -->

  <div class="modal fade" id="reservationModal" tabindex="-1" aria-labelledby="reservationModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="reservationModalLabel">Reservation Details</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="reservationForm">
            <div class="mb-3">
              <label for="startDate" class="form-label">Start Date</label>
              <input type="date" class="form-control" id="startDate" name="startDate" required>
            </div>
            <div class="mb-3">
              <label for="endDate" class="form-label">End Date</label>
              <input type="date" class="form-control" id="endDate" name="endDate" required>
            </div>
            <div class="mb-3">
              <label for="adults" class="form-label">Adults</label>
              <input type="number" class="form-control" id="adults" name="adults" min="1" required>
            </div>
            <div class="mb-3">
              <label for="children" class="form-label">Children</label>
              <input type="number" class="form-control" id="children" name="children" min="0" required>
            </div>
            <button type="button" class="btn btn-primary" onclick="submitReservation()">Confirm Reservation</button>
          </form>
        </div>
      </div>
    </div>
  </div>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>