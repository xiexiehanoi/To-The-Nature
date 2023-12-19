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
<script type="text/javascript"src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=y9u6f6xda4"></script>
</head>
<style>
<style>
.body{
	background-color: white;
}
.camp_container {
    margin: 10%;
    background-color: white; /* 배경색을 흰색으로 설정 */
}
.camp_info_box {
    width: 90%;
    height: auto;
    /* background-color: green; */
    margin: 0 auto;
    min-height: 100%;
    display: flex; /* flex 컨테이너 설정 */
    /* border: 1px solid black; */
    justify-content: space-between; /* 요소들을 가능한 넓게 배치 */
    flex-wrap: wrap; /* 자식 요소들을 랩핑 */
    overflow: hidden;
}	
div .img_b{
	float:left;
	width:50%;
	height: auto;
	box-sizing: border-box;
	overflow: hidden;
}
div .img_b img{
	width: 100%;
	height: 484px;
	object-fit: cover;
	border-radius: 20px;
}
div .camp_tb{
	float:right;
	height:100%;	
	width:50%;
	box-sizing: border-box;
	overflow: hidden;
}
div .btn_bottom {
    display: flex;
    justify-content: center;
    align-items: center;
}
div .btn_bottom span {
    margin: 0 20px;
}
#heartIcon {
    cursor: pointer;
}
hr{
	 margin-left: 5%;
	 margin-right: 5%;
}
.camp_img_grid{
    width: 90%;
    height: auto;
    margin: 0 auto;
}
.camp_inner_img {
    display: flex;
    border-radius: 20px;
    flex-wrap: wrap;
    gap: 10px; /* 이미지 사이의 간격 조정 */
	border-radius: 8px;
	object-fit: cover;
}
.hidden-image {
    max-width: 22.5%;
    height: 200px; /* 이미지 너비 조정 (4개씩 배치하려면 25%) */
    border-radius: 8px;
}
.hidden {
    display: none;
}
.camping_information_group{
	width: 90%;
    height: auto;
    margin: 0 auto;
}

.camping_facility {
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start;
}

.camping_icon_list {
    list-style: none;
    display: flex;
    flex-direction: row;
    margin-right: 10px;
    align-items: center;
    text-align: center;
}

.camping_icon_list i {
    font-size: 40px;
    color: #f5dcb7;
    display: block;
}

i{
  font-size: 30px;
  color: #f5dcb7;
}
.i_heart{
  color:red;
}
.star_rating {
  width: 100%; 
  box-sizing: border-box; 
  display: inline-flex; 
  float: left;
  flex-direction: row; 
  justify-content: flex-start;
}
.star_rating .star {
  width: 25px; 
  height: 25px; 
  margin-right: 10px;
  display: inline-block; 
  background: url('https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FE2bww%2FbtsviSSBz4Q%2F5UYnwSWgTlFt6CEFZ1L3Q0%2Fimg.png') no-repeat; 
  background-size: 100%; 
  box-sizing: border-box; 
}
.star_rating .star.on {
  width: 25px; 
  height: 25px;
  margin-right: 10px;
  display: inline-block; 
  background: url('https://blog.kakaocdn.net/dn/b2d6gV/btsvbDoal87/XH5b17uLeEJcBP3RV3FyDk/img.png') no-repeat;
  background-size: 100%; 
  box-sizing: border-box; 
}

.start_boxs {
  width: 90%;
  display: flex;
  justify-content: space-between;
}

.star_box {
  flex: 1;
  box-sizing: border-box;
  margin: 0;
  background: #F3F4F8;
  border: 0;
  border-radius: 10px;
  resize: none;
  padding: 15px;
  font-size: 13px;
  font-family: sans-serif;
}

.btn02 {
  width: auto;
  height: auto;
  margin: 0;
  border-radius: 10px
}

.camp_map{
	width: 90%;
    height: auto;
    margin: 0 auto;
}

.reviewbox {
    width: 90%;
    height: auto;
    margin: 0 auto;
    border-radius: 20px;
}

.reviewbox .reviewtable {
    width: 100%;
    font-size: 13px;
    font-family: sans-serif;
    box-sizing: border-box;
    resize: none;
    border-collapse: collapse;
}

.reviewbox .table {
    width: 100%;
    border-collapse: collapse;
    margin: 0;
}

.reviewbox .table td,
.reviewbox .table th {
    padding: 8px;
    vertical-align: top;
    border: 1px solid #e0e0e0;
}

.reviewbox .yellowstar {
    color: gold;
}

.camp_location{
	font-size: 30px;
}

</style>
<%
String userId = (String) session.getAttribute("userid");
String loginStatus = (String) session.getAttribute("loginok");
/* Integer userNum = (Integer) session.getAttribute("userNum"); */
%>
<script type="text/javascript">
    var urlParams = new URLSearchParams(window.location.search);
    var campingNum = urlParams.get('num');
    var userId = '<%= userId %>';
    var iswished = ${campinglist[0].iswished};
    var loginStatus = "<%= loginStatus %>";
    <%-- var userNum = <%= userNum %>;
    console.log(userNum); --%>

    <%-- 예약 내용 보내기 --%>
	function submitReservation() {
		  const formData = new FormData(document.getElementById('reservationForm'));
		  document.getElementById('reservationForm').action = './reservation/page';
		  document.getElementById('reservationForm').method = 'POST';
		  // 폼을 제출
		  document.getElementById('reservationForm').submit();
		
		  $('#reservationModal').modal('hide');
		}
	
	
	
$(document).ready(function () {
    getreviewlist(campingNum);
    updateHeartIcon();
    
 // countPerson 함수 수정
    function countPerson() {
        var adults = parseInt($("#adults").val());
        var children = parseInt($("#children").val());
        var totalPerson = adults + children;

        $("#totalPerson").html('<b>' + totalPerson + '</b>');
    }

    // totalAmount 함수 수정
    function totalAmount(amount, countdate) {
        var totalAmount = amount * countdate;
        $("#totalAmount").html('<strong>' + new Intl.NumberFormat('ko-KR').format(totalAmount) + ' 원</strong>');
    }

    // 성인과 미성년자 입력 값이 변경될 때 countPerson 함수 호출
    $("#adults, #children").on("input", countPerson);


    // 페이지 로드 시 초기 계산 실행
    countPerson();
	
    //숙박일 수 구하기
    $("#startDate, #endDate").on("change", function () {
        var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();
        var campingAmount = parseInt(document.getElementById("campingAmount").value);
        
        console.log("startDate:", startDate);
        console.log("endDate:", endDate);
        console.log("campingAmount:", campingAmount);

        if (!isNaN(new Date(startDate).getTime()) && !isNaN(new Date(endDate).getTime())) {
            var timeDiff = Math.abs(new Date(endDate).getTime() - new Date(startDate).getTime());
            var countdate = Math.ceil(timeDiff / (1000 * 3600 * 24));
            $("#totalDates").html('<strong>' + countdate + '일</strong>');
            totalAmount(campingAmount, countdate);
        } else {
            // 날짜 형식이 올바르지 않을 경우 처리
            $("#totalDates").html("");
            $("#totalAmount").html("");
        }
    });
	
        // 찜하기 추가
    $(document).on("click", "#heartIcon", function () {
   //로그인해서 누를 경우
    if (loginStatus === "yes") {
        var ajaxUrl = iswished == "0" ? "./detail/insertWish" : "./detail/deleteWish";
        $.ajax({
            type: "POST",
            url: ajaxUrl,
            data: {
                userId: userId,
                campingNum: campingNum
            },
            success: function (res) {
                if (res.success) {
                    iswished = iswished == "0" ? "1" : "0";
                    updateHeartIcon();
                    $("#countWish").text(res.updatedCountWish);
                } else {
                    console.error("Error:", res.error);
                }
            },
            error: function (xhr, status, error) {
                console.error("Ajax Error:", error);
            }
        });
    } else {
    	iswished = "0";
        updateHeartIcon();
        alert("로그인 후 이용 가능하십니다.");
    }
});

	//사진 더보기 버튼	
  
        var visibleImages = 5; // 한 번에 표시할 이미지 수
        var $hiddenImages = $(".hidden-image");
        var $loadButton = $(".load_image");
        // 초기에는 숨겨진 이미지를 보이지 않도록 설정
        $hiddenImages.slice(0, visibleImages).removeClass("hidden");
        // "more" 버튼 클릭 이벤트 핸들러
        $loadButton.on("click", function () {
            var currentVisibleCount = $(".hidden-image:not(.hidden)").length;
            var nextVisibleCount = currentVisibleCount + visibleImages;
            // 다음에 표시될 이미지들을 보이도록 변경
            $hiddenImages.slice(currentVisibleCount, nextVisibleCount).removeClass("hidden");
            // 모든 이미지가 표시되었다면 "more" 버튼 숨김
            if (nextVisibleCount >= $hiddenImages.length) {
                $loadButton.hide();
            }
        });
        
    //예약시 아이디 여부확인
	        $("#reservationbutton").click(function (e) {
	        if (userId == null || userId == "" || userId=="null") {
	            $('#reservationModal').modal("hide");
	            alert("회원만 예약 가능합니다.");
	            return;
	        } else {
	            $('#reservationModal').modal("show");
	        }

        });
	      //별점 등록부분
	        $('.star_rating > .star').click(function() {
	        	  $(this).parent().children('span').removeClass('on');
	        	  $(this).addClass('on').prevAll('span').addClass('on');
	        	})
	      //리뷰 등록  	
	        $(".btn02").click(function(){
	        	//별점 가져오기
	        	var rate = $(".star_rating .star.on").length;
	        	//내용
	        	var content = $(".star_box").val();
	        	
	        	/*var isUserPaid = ${reservationDto != null ? 'true' : 'false'};*/
	        	
	        	/*if (isUserPaid) {*/
	                $.ajax({
	                    type: "POST",
	                    url: "./detail/insertReview",
	                    contentType: "application/json",
	                    data: JSON.stringify({
	                        "userId": userId,
	                        "campingNum": campingNum,
	                        "rate": rate,
	                        "content": content
	                    }),
	                    success: function (res) {
	                        alert("리뷰가 성공적으로 등록되었습니다.");
	                        getreviewlist(campingNum);
	                    },
	                    error: function (xhr, status, error) {
	                        console.error("Ajax Error:", error);
	                    }
	                });
	             /*} else {
	                $(".btn02").hide();
	            }*/
	    	
	    });//readyclose

	//review 불러오기
function getreviewlist(campingNum) {
    $.ajax({
        type: "GET",
        url: "./detail/reviewList",
        dataType: "json",
        data: {
            "campingNum": campingNum
        },
        success: function (res) {
            var review = "";
            if (res.reviewlist.length>0) {
                review += '<table class="table reviewtable">';
                review += '<tr>';
                review += '<th>작성자</th>';
                review += '<th>리뷰 내용</th>';
                review += '<th>별점</th>';
                review += '<th>작성일</th>';
                review += '</tr>';
                $.each(res.reviewlist, function (index, item) {
                	var createdDate = new Date(item.created_at);
                	
                	var year = createdDate.getFullYear();
                	var month = String(createdDate.getMonth() + 1).padStart(2, '0');
                	var day = String(createdDate.getDate()).padStart(2, '0');
                	var hour = String(createdDate.getHours()).padStart(2, '0');
                	var minute = String(createdDate.getMinutes()).padStart(2, '0');

                	var createdate = year + '-' + month + '-' + day + ' ' + hour + ':' + minute;
                	
                	var starrate = '';
                	for (var i = 0; i < 5; i++) {
                	    if (i < item.rate) {
                	        starrate += '<span class="yellowstar">★</span>';
                	    } else {
                	        starrate += '<span>☆</span>';
                	    }
                	}
                	
                    review += '<tr>';
                    review += '<td>' + item.userid + '</td>';
                    review += '<td>' + item.content + '</td>';
                    review += '<td class="ratebox">' + starrate + '</td>';
                    review += '<td>' + createdate + '</td>';
                    review += '</tr>';
                });
                review += '</table>';
            } else { 
                review = "등록된 리뷰가 없습니다.";
            }
            $(".reviewList").html(review);
            $(".countReview").eq(0).text("리뷰 : " + res.total.count + " 개");
            $(".review_total h4").eq(0).text(res.total.avg.toFixed(2) + " 점");
            $(".ratebox span").html(starrate);
        },
        error: function (xhr, status, error) {
            console.error("Ajax Error:", error);
            $(".reviewList").html("리뷰를 불러오는 중 오류가 발생했습니다.");
        }
    });
}
function updateHeartIcon() {
    if (iswished == "1") {
        $("#heartIcon").removeClass("bi-heart").addClass("bi-heart-fill").css("color", "red");
    } else {
        $("#heartIcon").removeClass("bi-heart-fill").addClass("bi-heart").css("color", "");
    }
}

function updateCountWish() {
	$("#countWish").text(newCountWish);
}
</script>
<body>
<input type="hidden" name="userId" value="${sessionScope.userid}">
<div class="camp_container">
<c:forEach var="dto" items="${campinglist}">
	<div class="camp_info_box">
			<!-- 메인 사진 부분 -->
			<div class="img_b">
				<img src="${dto.firstImageUrl}" alt="캠핑장 메인 이미지">
			</div>
			<!-- 메인 정보 테이블-->
			<!-- 테이블 부분 -->
			<div class="camp_tb">
				<table class="table table-bordered">
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
						<tr class="camp_amount">
							<th scope="col">1박 가격</th>
							<td>
								<fmt:formatNumber value="${dto.amount}" pattern="###,### 원/일" />	
							</td>
						</tr>
						<tr class="camp_toilet">
							<th scope="col">화장실</th>
							<td>${dto.toiletCo}</td>
						</tr>
						<tr class="camp_showerbooth">
							<th scope="col">샤워실</th>
							<td>${dto.swrmCo}</td>
						</tr>
						<tr class="camp_showerbooth">
							<th scope="col">세면대</th>
							<td>${dto.wtrplCo}</td>
						</tr>
					</tbody>
				</table>
				<!-- 테이블 아래 찜, 리뷰, 예약 -->
				<div class="btn_bottom input-group">
					<span>
						<i id="heartIcon" class="bi bi-heart i_heart" style="color: red;"></i>&nbsp;찜하기<span id="countWish">${dto.countwish}</span>				
					</span>
					<span id="reviewInfo">
						<i class="bi bi-star-fill" style="color: gold;"></i><span class="countReview"></span> 
						<!-- 리뷰 개수가 표시될 부분 -->
					</span>
					<!-- 예약하기 버튼 -->
					<span>
				      <!--  <button type="button" id="reservationbutton" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reservationModal">예약하기</button> -->
				       <button type="button" id="reservationbutton" class="btn btn-primary">예약하기</button>
					</span>
				</div>
			</div>
		</div><!-- camp_info_box close -->
		<br>
		<!-- div grid -->
			<hr>
		<div class="camp_img_grid">
			<!-- 캠프 내부 사진 grid -->
			<h3>
				<i class="bi bi-info-circle-fill"></i>&nbsp;캠핑장 내부 사진
			</h3>
			<div class="camp_inner_img">
				<c:forEach var="imageUrl" items="${fn:split(dto.imageUrl, ',')}"
					varStatus="loop">
					<img src="${imageUrl.trim()}" alt="캠핑장 이미지"
						class="hidden-image ${loop.index + 1 > 5 ? 'hidden' : ''}">
				</c:forEach>
				<button type="button" class="btn btn-secondary load_image">more</button>
			</div>
		</div>
		<hr>
		<!--  -->
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
			<div class="camping_facility">
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
								<li><span><img src="./res/photo/trampoline.svg" style="color:#f5dcb7;padding:2px;"></span>&nbsp;<span>${sbrcl}</span></li>
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
			</div>
			<!-- Your existing HTML code goes here -->
			<div class="modal fade" id="reservationModal" tabindex="-1"
				aria-labelledby="reservationModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="reservationModalLabel">Reservation
								Details</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form id="reservationForm">
								<input type="hidden" name="camping_num" value="${campingNum}" >
								<input type="hidden" name="userid" value="${userId}">
								<input type="hidden" name="CampsiteName" value="${dto.facltNm}">
								<div class="mb-3">
									<label for="startDate" class="form-label">캠핑장명 :
										${dto.facltNm}</label>
								</div>
								<div class="mb-3 input-group">
									<label for="startDate" class="form-label">입실일</label> <input
										type="date" class="form-control datainput" id="startDate"
										name="startDate" required> <label for="endDate"
										class="form-label">퇴실일</label> <input type="date"
										class="form-control datainput" id="endDate" name="endDate"
										required>
								</div>
								<div class="mb-3 input-group">
									<label for="adults" class="form-label">성인</label> 
									<input type="number" class="form-control datainput" id="adults"
										name="adult_count" min="1" value="1" required> <label for="children"
										class="form-label">미성년자(만0세~17세)</label> <input type="number"
										class="form-control datainput" value="0" id="children" name="children_count"
										min="0" required>
								</div>
								<div class="mb-3">
			                        <label for="totalNights" class="form-label">총 숙박 일 : <span id="totalDates"></span></label>
			                    </div>
			                    <div class="mb-3">
			                        <label for="totalPerson" class="form-label">총 인원 : <span id="totalPerson"></span></label>
			                    </div>
			                    <div class="mb-3">
			                        <label for="totalAmount" class="form-label">총 금액 : <span id="totalAmount"></span></label>
			                    	<input type="hidden" id="campingAmount" value="${dto.amount}">
			                    </div>
								<button type="button" class="btn btn-primary"
									onclick="submitReservation()">Confirm Reservation</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<br>
	<hr>
	<div class="camp_map">
		<div class="camp_map_title">
			<span><i class="bi bi-compass-fill icon"></i><span style="font-size:30px;">&nbsp;위치</span></span>
		</div>
		<div id="map" style="width: 100%; height: 400px;"></div>
	    <script>
	    	var mapX = Number("${campinglist[0]['mapX']}"); // 위도
	    	var mapY = Number("${campinglist[0]['mapY']}"); // 경도
	
			var mapOptions = {
				    center: new naver.maps.LatLng(mapY, mapX),
				    zoom: 15
				};
	
			//위치 표시하기
			var map = new naver.maps.Map('map', {
			    center: new naver.maps.LatLng(mapY, mapX),
			    zoom: 15
			});
			
			//위치 표시하기 marker
			var marker = new naver.maps.Marker({
			    position: new naver.maps.LatLng(mapY, mapX),
			    map: map
	        });
			
			var contentString = [
		        '<div class="iw_inner">',
		        '   <h5>${campinglist[0].facltNm}</h5>',
		        '   <p style="font-size:15px;">${campinglist[0].addr1}<br />',
		        '   </p>',
		        '</div>'
		    ].join('');

		var infowindow = new naver.maps.InfoWindow({
		    content: contentString
		});

		naver.maps.Event.addListener(marker, "click", function(e) {
		    if (infowindow.getMap()) {
		        infowindow.close();
		    } else {
		        infowindow.open(map, marker);
		    }
		});

		infowindow.open(map, marker);
	    </script>
	    </div>
	<br>
	<hr>
	<div class="reviewbox">
		<br>
		<div class="reviewTitle">
			<div class="review_total">
				<h2>캠핑장 리뷰</h2>
				<h4>점수</h4>
			</div> <!-- cloase review_total  -->

		<div class ="star_rating">
		  <span class="star on" value="1"> </span>
		  <span class="star" value="2"> </span>
		  <span class="star" value="3"> </span>
		  <span class="star" value="4"> </span>
		  <span class="star" value="5"> </span>별점을 선택해주세요.
		</div> <!-- close star_rating -->
			<div class="input-group start_boxs">
				<textarea class="star_box" placeholder="리뷰 내용을 작성해주세요." ></textarea>	
				<input type="submit" class="btn02" value="등록"/>
			</div> <!-- close star_rating -->
			<br>
			<div class="reviewList">
				
			</div> <!-- close reviewList -->
		</div> <!-- cloase reviewTitle -->	
	</div> <!-- close reviewbox  -->
</div>
</body>
</html>