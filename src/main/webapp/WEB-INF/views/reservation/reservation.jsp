<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!-- PortOne SDK -->
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script>
      var IMP = window.IMP;
      IMP.init("imp00141082");
 
      function requestPay() {
    	  IMP.request_pay(
    			  {
    			    pg: "html5_inicis.INIBillTst", // 실제 계약 후에는 실제 상점아이디로 변경
    			    pay_method: "card", // 'card'만 지원됩니다.
    			    merchant_uid: 'merchant_' + new Date().getTime(), // 상점에서 관리하는 주문 번호
    			    
    			    name: "${CampsiteName}",
    			    amount: 1000, // 결제창에 표시될 금액. 실제 승인이 이뤄지지는 않습니다.
    			    buyer_email: "${userDto.useremail}",
    			    buyer_name:  "${userDto.username}",
    			    buyer_tel:   "${userDto.userphone}",
    			  },
    			  function (rsp) {
    			    
    			  }
    			);
      };
    </script>
<meta charset="UTF-8">
<title>예약 페이지</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<style>
    .hidden-form {
        display: none;
    }
</style>

</head>
<script>
	$(document).ready(function() {
		// 초기값
		var currentValue = 1;

		// 결과를 나타내는 요소
		var resultElement = $('.result');

		// 감소 버튼
		$('.minus').on('click', function() {
			if (currentValue > 1) {
				currentValue--;
				resultElement.text(currentValue);
			}
		});

		// 증가 버튼
		$('.plus').on('click', function() {
			// 서버에서 설정한 roomCount 값을 직접 넣어주세요.
			var roomCount = ${roomCount};

			if (currentValue < roomCount) {
				currentValue++;
				resultElement.text(currentValue);
			}
		});
	});
</script>
<body>
	<section class="product-info content-w100">
		<h3 class="section-title">상품정보</h3>
		<p class="body-large fw-bold">${CampsiteName}</p>
		<div class="schedule d-flex my-2">
			<div class="col-6">
				<div class="date d-flex gap-1">
					<i class="bi bi-calendar-check fs-6"></i>
					<p class="fs-6">입실일</p>
				</div>
				<h5>${rDto.startDate}</h5>
			</div>
			<div class="col-6">
				<div class="date d-flex gap-1">
					<i class="bi bi-calendar-minus fs-6"></i>
					<p class="fs-6">퇴실일</p>
				</div>
				<h5>${rDto.endDate}</h5>
			</div>
		</div>
		<div
			class="d-flex align-items-center justify-content-center d-day text-center visitor-counter">
			<p>캠핑 가는 날&emsp;</p>
			<span class="fw-bold mb-0">D - <span>${remainingDays}</span></span>
		</div>
	</section>



	<section class="reserved-room-count content-w100">
		<h3 class="section-title">예약 객실 수</h3>
		<p>최대 ${roomCount}개 선택가능</p>
		<div class="d-flex align-items-center justify-content-between">
			<div class="d-flex justify-content-center">
				<sapn>객실 수</sapn>
			</div>
			<div class="d-flex align-items-center">
				<button type="button" class="counter-btn minus">-</button>
				<span class="result flex-grow-1">1</span>
				<button type="button" class="counter-btn plus counter-active">+</button>
			</div>
		</div>
	</section>



	<section class="division2 content-w100">
		<form>
			<h3 class="section-title">예약자 정보</h3>
			<div class="d-flex flex-column body-normal">
				<div class="d-flex align-items-center justify-content-between mb-0">
					<label for="closeSite1" class="first-column-division2">이름 <span
						class="required">(필수)</span></label> <input type="text"
						id="closeSite1" class="input-area-border second-column-division2 mb-0 is-invalid"
						value="${userDto.username}">
				</div>
				<div class="d-flex justify-content-between">
					<div class="first-column-division2"></div>
					<span
						class="second-column-division2 form-text font-weight-bolder text-danger"
						style="display: none;">한글 또는 영문자만 입력가능합니다.</span>
				</div>
				<div class="d-flex align-items-center justify-content-between mb-0">
					<label for="closeSite2" class="first-column-division2">연락처 <span
						class="required">(필수)</span></label> <input type="tel"
						id="closeSite2" class="input-area-border second-column-division2 mb-0 is-invalid"
						value="${userDto.userphone}">
				</div>
				<div class="d-flex justify-content-between">
					<div class="first-column-division2"></div>
					<span
						class="second-column-division2 form-text font-weight-bolder text-danger"
						style="display: none;">올바른 휴대폰 번호를 입력해주세요.</span>
				</div>
				<div class="d-flex align-items-center justify-content-between mb-0">
					<label for="closeSite3" class="first-column-division2">이메일 <span
						class="optional">(선택)</span></label> <input type="email"
						id="closeSite3" class="input-area-border second-column-division2 mb-0"
						value="${userDto.useremail}">
				</div>
				<div class="d-flex justify-content-between">
					<div class="first-column-division2"></div>
					<span
						class="second-column-division2 form-text font-weight-bolder text-danger"
						style="display: none;">올바른 이메일 주소를 입력해주세요.</span>
				</div>
				<div class="d-flex align-items-start justify-content-between mb-0">
					<label for="closeSite4" class="first-column-division2">요청사항
						<span class="optional">(선택)</span>
					</label>
					<textarea id="closeSite4" class="input-area-border second-column-division2 mb-0"></textarea>
				</div>
			</div>
		</form>
	</section>



	<section class="guest-qaa content-w100">
		<h3 class="section-title">예약자 질의응답</h3>

		<div class="guest-q">
			<span class="guest-q-required body-small text-center">필수</span>
			<p class="body-small">[예약자안내] ***취소/환불 규정 및 예약변경 불가 안내*** 1.
				취소수수료는 예약시점과 관계없이 '입실일로부터 남은 날짜' 기준으로 부과되며, 입실일 기준 10일 이내에 취소 시 (예약
				후 바로 취소해도) 취소수수료 발생합니다. (결제 전 취소/환불 규정 필독) 2. '상품 변경', '우천 및 개인사정으로
				날짜 변경' 불가하며, 필요하신 경우 직접 취소 후 재예약하셔야 합니다. 동의하시나요?</p>
			<!---->
			<!---->
			<select required="required" class="mySelect"><option
					disabled="disabled" selected="selected" hidden="hidden">필수
					질의응답을 선택 해주세요</option>
				<option value="네 동의합니다.">네 동의합니다.</option></select>
			<!---->
			<!---->
		</div>
		<div class="guest-q">
			<span class="guest-q-required body-small text-center">필수</span>
			<p class="body-small">[예약자안내] ***중복 예약 및 요금 오류 예약 취소 안내*** 1. 중복
				예약 : 실시간 예약의 특성상 동일한 상품에 중복 예약 발생할 수 있으며, 먼저 완료된 예약 건에 우선권이 있으므로 이후
				중복 예약 건은 취소될 수 있습니다. (위약금 없음) 2. 요금 오류 : 성수기 요금의 확정 전 또는 잘못 등록된 요금으로
				요금 오류 발생 시, 고객센터를 통한 안내 후 예약 취소 처리되며 정상 요금으로 재예약하실 수 있습니다. 동의하시나요?</p>
			<!---->
			<!---->
			<select required="required" class="mySelect"><option
					disabled="disabled" selected="selected" hidden="hidden">필수
					질의응답을 선택 해주세요</option>
				<option value="네 동의합니다.">네 동의합니다.</option></select>
			<!---->
			<!---->
		</div>

		<div class="guest-q">
			<span class="guest-q-required body-small text-center">필수</span>
			<p class="body-small">[예약자안내] 캠핑, 글램핑 2팀이상 예약불가합니다. 1팀만 예약 받습니다.
				위 규정을 어길시 환불금액 없이 퇴실조치 될 수 있습니다. 동의하십니까?</p>
			<!---->
			<!---->
			<select required="required" class="mySelect"><option
					disabled="disabled" selected="selected" hidden="hidden">필수
					질의응답을 선택 해주세요</option>
				<option value="네 동의합니다.">네 동의합니다.</option></select>
			<!---->
			<!---->
		</div>
	</section>


	<!--	이용약관 동의									-->
	<section class="terms-agree content-w100">
		<h3 class="section-title">약관동의</h3>
		<div class="agree-all">
			<input type="checkbox" name="selectall" value="selectall"
				id="allPrivateInfoAgree" class="align-middle"> <label
				for="allPrivateInfoAgree">전체 이용 약관에 동의합니다.</label>
		</div>
		<div class="agreement body-small">
			<div class="d-flex justify-content-between">
				<div class="d-flex align-items-center">
					<input type="checkbox" name="agree" id="privateInfoAgree0">
					<label for="privateInfoAgree0">(필수) 취소 및 환불 수수료에 동의합니다.</label>
				</div>
				<button data-bs-toggle="modal" data-bs-target="#legalNotice"
					class="body-small">보기</button>
			</div>
			<div class="d-flex align-items-center justify-content-between">
				<div class="d-flex align-items-center">
					<input type="checkbox" name="agree" id="privateInfoAgree1">
					<label for="privateInfoAgree1">(필수) 이용 시 주의사항에 동의합니다.</label>
				</div>
				<button data-bs-toggle="modal" data-bs-target="#legalNotice"
					class="body-small">보기</button>
			</div>
			<div class="d-flex align-items-center justify-content-between">
				<div class="d-flex align-items-center">
					<input type="checkbox" name="agree" id="privateInfoAgree2">
					<label for="privateInfoAgree2">(필수) 개인 정보 수집 및 이용에 동의합니다.</label>
				</div>
				<button data-bs-toggle="modal" data-bs-target="#legalNotice"
					class="body-small">보기</button>
			</div>
			<div class="d-flex align-items-center justify-content-between">
				<div class="d-flex align-items-center">
					<input type="checkbox" name="agree" id="privateInfoAgree3">
					<label for="privateInfoAgree3">(필수) 개인 정보 제 3자 제공에 동의합니다.</label>
				</div>
				<button data-bs-toggle="modal" data-bs-target="#legalNotice"
					class="body-small">보기</button>
			</div>
			<div class="d-flex align-items-center justify-content-between">
				<div class="d-flex align-items-center">
					<input type="checkbox" name="agree" id="privateInfoAgree4">
					<label for="privateInfoAgree4">(필수) 예약자는 성인이며, 서비스 이용약관에
						동의합니다.</label>
				</div>
				<button data-bs-toggle="modal" data-bs-target="#legalNotice"
					class="body-small">보기</button>
			</div>
		</div>
	</section>

	<section class="cpt-footer">
		<p>© Campingtalk Corp.</p>
		<div class="footer-compony accordion">
			<p>캠핑톡은 통신판매 중개자로서 통신판매의 당사자가 아니며 고객지원을 제외한 상품의 예약, 이용 등과 관련한 의무와
				책임 등 모든 거래에 대한 책임은 가맹점에게 있습니다.</p>
		</div>
	</section>

	<section class="bottom-section">
		<div class="bottom-btn d-flex justify-content-center">
			<a href="javascript:;"> 예약하기 &nbsp;|&nbsp; <span>150,000</span>원
				(<span>${reservationdays}</span>박)
			</a>
		</div>
	</section>




	<!-- 필수 항목 미동의 모달 창 -->
	<div class="modal" id="agreeModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">* 필수 항목 중 입력(선택)하지 않거나 잘못 입력하신 항목이
						있어요.</h5>
				</div>
				<div class="modal-footer">
					<button type="button" id="okButton1" class="btn btn-primary">OK</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 이용약관 동의 모달 -->
	<div class="modal" id="agreementModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">*이용약관에 동의해주세요.</h5>
				</div>
				<div class="modal-footer">
					<button type="button" id="okButton2" class="btn btn-primary">OK</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- hidden form -->
	<form id="myForm" class="hidden-form">
		<input type="text" name="CampsiteName" value="${CampsiteName}">
		<input type="text" name="userid" value="${userDto.userid}">
		<input type="text" name="username" value="${userDto.username}">
		<input type="text" name="userphone" value="${userDto.userphone}">
		<input type="text" name="useremail" value="${userDto.useremail}">
	</form>


</body>
<script>
    $(document).ready(function() {
    	
    	 $('#allPrivateInfoAgree').on('change', function() {
             // 전체 약관 동의 체크박스의 상태 가져오기
             var isChecked = $(this).prop('checked');
             // 다른 약관 동의 체크박스에 상태 적용
             $('input[name="agree"]').prop('checked', isChecked);
         });

         // 개별 약관 동의 체크박스 선택 이벤트
         $('input[name="agree"]').on('change', function() {
             // 개별 약관 동의 체크박스의 상태 가져오기
             var isAllAgreed = $('input[name="agree"]:checked').length === $('input[name="agree"]').length;

             // 전체 약관 동의 체크박스에 상태 적용
             $('#allPrivateInfoAgree').prop('checked', isAllAgreed);
         });
    	
        // 예약하기 버튼 클릭 이벤트
        $('.bottom-btn').on('click', function() {
        		let selectedValue = $(".mySelect").val();
 		    	if (selectedValue != '네 동의합니다.') {
	 		      	// 모달 창을 표시합니다.
	 		      	$('#agreeModal').modal('show');
	 		      	return;
 		    	}
        	
        		// 선택한 값을 저장할 배열을 생성합니다.
        		var selectedValues = [];
        		// 모든 .mySelect 요소에 대해 값을 가져와서 배열에 저장합니다.
        		$(".mySelect").each(function() {
        		    selectedValues.push($(this).val());
        		});
        		
        		var firstValue = selectedValues[0];
        		var allValuesAreEqual = true;
        		for (var i = 1; i < selectedValues.length; i++) {
        		    if (selectedValues[i] != firstValue) {
        		        allValuesAreEqual = false;
        		        break;
        		    }
        		}
     		    if (allValuesAreEqual == false ) {
     		      // 모달 창을 표시합니다.
     		      $('#agreeModal').modal('show');
     		    } else {
     		    	var isAgreed = $('#allPrivateInfoAgree').prop('checked');
     	            
     	            // 체크되지 않았을 경우 모달 띄우기
     	            if (!isAgreed) {
     	                $('#agreementModal').modal('show');
     	            } else {
     	                // 체크되었을 경우 예약 로직 수행
     	                // 여기에 예약 로직 추가
     	                requestPay();
     	            	//const formData = new FormData(document.getElementById('myForm'));
	     	     		//document.getElementById('myForm').action = '/nature/payment';
	     	     		//document.getElementById('myForm').method = 'POST';
	     	     		// 폼을 제출
	     	     		//document.getElementById('myForm').submit();
     	                
     	            }
     		    }
            // 체크 여부 확인
        });
        
        $('#okButton1').on('click', function () {
            // 여기에 "OK" 버튼 클릭 시 수행할 동작 추가
            // 모달을 닫고 싶다면 아래 코드를 사용
            $('#agreeModal').modal('hide');
        });
        
        $('#okButton2').on('click', function () {
            // 여기에 "OK" 버튼 클릭 시 수행할 동작 추가
            // 모달을 닫고 싶다면 아래 코드를 사용
            $('#agreementModal').modal('hide');
        });
    });
</script>
</html>