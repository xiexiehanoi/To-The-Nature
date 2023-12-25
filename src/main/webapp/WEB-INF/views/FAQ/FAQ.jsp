<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap">
<script	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
body {
    font-family: 'Roboto', sans-serif;
    /* background-color: #F0F2F5; */
    margin: 0;
    padding: 0;   
}

.allbox{
    display: flex;
	justify-content: center;
    align-items: center;
    height: 100vh;
	flex-direction: column; /* 추가 */
}


.accordion-container {
    width: 80%;
    max-width: 600px;
}

.accordion-item {
    background-color: #FFFFFF;
    border: 1px solid #E0E0E0;
    border-radius: 8px;
    margin-bottom: 10px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

.accordion-header {
    background-color: #528171;
    color: #FFFFFF; /* White text */
    padding: 15px;
    font-size: 18px;
    border: none;
    width: 100%;
    text-align: left;
    cursor: pointer;
    outline: none;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-radius: 8px 8px 0 0;
    transition: background-color 0.3s ease;
}

.accordion-header:hover {
    background-color: #456e60;
}

.accordion-content {
    background-color: #FAFAFA; /* Very light grey for content */
    overflow: hidden;
    padding: 0 15px;
    max-height: 0;
    transition: max-height 0.3s ease;
}

.accordion-content p {
    margin: 15px 0;
    line-height: 1.5;
}

.icon {
    transition: transform 0.3s ease;
}

.active .icon {
    transform: rotate(45deg);
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	  $('.accordion-header').click(function() {
	    const accordionContent = $(this).next();

	    $(this).toggleClass('active');

	    if ($(this).hasClass('active')) {
	      accordionContent.css('max-height', accordionContent.prop('scrollHeight') + 'px');
	    } else {
	      accordionContent.css('max-height', '0');
	    }

	    $('.accordion-header').not(this).removeClass('active');
	    $('.accordion-content').not(accordionContent).css('max-height', '0');
	  });
	});
</script>
<body>
	<div class="allbox">
	<div class="title">
		<h3>자주 묻는 질문 FAQ</h3>
	</div>

  <div class="accordion-container">
        <div class="accordion-item">
            <button class="accordion-header">
                Q. 예약을 취소하고 싶어요 <span class="icon">+</span>
            </button>
            <div class="accordion-content">
                <p>A: 
                <br>
                예약자 본인이 직접 예약확인/취소 가능합니다.
                <br>
				예약/결제 당시 안내된 취소/환불 규정에 따라 처리되며, 취소수수료가 발생 시 취소수수료를 차감한 금액으로 환불 처리됩니다.</p>
            </div>
        </div>
        <div class="accordion-item">
            <button class="accordion-header">
                Q. 천재지변으로 인한 예약취소는 어떻게 하나요? <span class="icon">+</span>
            </button>
            <div class="accordion-content">
                <p>A: 
                <br>
                일반적인 우천에 의한 예약 취소 및 변경 불가합니다.
                <br>
                태풍 등 기상 특보 시, 입실 당일 현장 날씨 및 캠핑장/펜션의 정책에 따라 연기 또는 취소 결정됩니다.
				<br>
				입실 당일 오전에 캠핑장/펜션에 연락하셔서 안내 받으시기 바랍니다.</p>
            </div>
        </div>
        <div class="accordion-item">
            <button class="accordion-header">
                Q. 입실일을 변경하고 싶어요. <span class="icon">+</span>
            </button>
            <div class="accordion-content">
                <p>A: 
                <br>
                예약 이용일 변경은 불가능합니다.
                <br>
				취소 수수료를 확인하시고 기존 예약건을 취소하신 다음 재예약하셔야 합니다.</p>
            </div>
        </div>
        <div class="accordion-item">
            <button class="accordion-header">
                Q. 취소수수료 산정 기준은 어떻게 되나요? <span class="icon">+</span>
            </button>
            <div class="accordion-content">
                <p>A. 
                <br>
                예약 취소 후 간편결제 사업자, 은행 또는 신용카드사에 따라 환불 절차에 일정 시간이 소요될 수 있습니다.
                <br>
                영업일 기준(토/일/공휴일 제외) 실시간 계좌이체는 2~3일, 신용카드는 3~5일 소요됩니다.
                </p>
            </div>
        </div>
        <div class="accordion-item">
            <button class="accordion-header">
                Q. 예약 취소했는데 언제 환불되나요? <span class="icon">+</span>
            </button>
            <div class="accordion-content">
                <p>A: 
                <br>
                예약 취소 후 간편결제 사업자, 은행 또는 신용카드사에 따라 환불 절차에 일정 시간이 소요될 수 있습니다.
                <br>
				영업일 기준(토/일/공휴일 제외) 실시간 계좌이체는 2~3일, 신용카드는 3~5일 소요됩니다.</p>
            </div>
        </div>
    </div>
   </div>
</body>
</html>