<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<style>
.camp_info_box {
    position: relative;
    width: 80%; /* 80%만 차지하도록 수정 */
    height: auto;
    overflow: hidden;
    margin-bottom: 100px;
    display: flex;
}

.camp_info_box .img_b {
    width: 50%; /* 이미지 영역의 너비 50%로 수정 */
}

.camp_info_box .img_b img {
    width: 100%; /* 이미지가 부모 너비 50%를 차지하도록 수정 */
    height: auto;
}

.camp_info_box .cont_tb {
    width: 50%; /* 테이블 영역의 너비 50%로 수정 */
    height: auto;
    overflow: hidden;
}

.camp_info_box .cont_tb table {
    width: 100%;
    font-size: 14px;
}


</style>
<body>
	<div id="cont_inner">
		<div class="sub_layout layout">
			<div class="camp_info_box">
				<!-- 이미지 부분은 이미지 경로를 반영 -->
				<div class="img_b">
					<img src="${campingDto.firstImageUrl}" alt="캠핑장 메인 이미지">
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
								<td>${campingDto.facltNm}</td>
							</tr>
							<tr class="camp_addr">
								<th scope="col">지역</th>
								<td>${campingDto.doNm}${campingDto.sigunguNm}</td>
							</tr>
							<tr class="camp_detailaddr">
								<th scope="col">전체 주소</th>
								<td>${campingDto.addr1}</td>
							</tr>
							<tr class="camp_call">
								<th scope="col">전화번호</th>
								<td>${campingDto.tel}</td>
							</tr>
							<tr class="camp_homepage">
								<th scope="col">홈페이지</th>
								<td><a href="${campingDto.homepage}">${campingDto.homepage}</a></td>
							</tr>
							<tr class="camp_workingday">
								<th scope="col">운영일</th>
								<td>${campingDto.operDeCl}</td>
							</tr>
							<tr class="camp_pet">
								<th scope="col">반려동물 출입 여부</th>
								<td>${campingDto.animalCmgCl}</td>
							</tr>
							<!-- 버튼 부분 -->
							<div class="btn_bottom">
								<span>
									<button id="widhBtn" type="button" class="btn"
										onclick="fnCampBkmk(); return false">
										<i id="heartIcon" class="bi bi-heart" style="color: red;"></i>&nbsp;찜하기
									</button>
								</span>
								<div id="reviewInfo">
									<span>리뷰</span> <span id="reviewCount">0</span>
									<!-- 리뷰 개수가 표시될 부분 -->
								</div>
								<%-- <button type="button" class="btn_gB1 btn_modify"
									onclick="location.href='/zboard/createForm.do?lmCode=campRequest&amp;c_no='+${campingDto.campingNum}">
									정보수정요청</button> --%>
							</div>

						</tbody>
					</table>
				</div>
				<!-- 테이블 끝 -->
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script>
					/*        $(document).ready(function () {
					 // 페이지 로딩 시, URL 파라미터에서 num 값 가져와서 데이터를 불러옵니다.
					 var urlParams = new URLSearchParams(window.location.search);
					 var num = urlParams.get('num');
					 // Ajax를 사용하여 서버에서 데이터를 가져옵니다.
					 $.ajax({
					 type: 'GET',
					 url: '/nature/detail?num=' + num, // 실제로 데이터를 가져올 URL로 변경해야 합니다.
					 success: function (data) {
					 // 가져온 데이터를 출력할 영역에 삽입합니다.
					 $('#detailContent').html(data);
					 },
					 error: function () {
					 // 에러 처리 로직을 추가할 수 있습니다.
					 console.error('Failed to load data.');
					 }
					 });
					 }); */
				</script>
	</div>
	</div>
</body>
</html>