<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    			    pg: "html5_inicis", // 실제 계약 후에는 실제 상점아이디로 변경
    			    pay_method: "card", // 'card'만 지원됩니다.
    			    merchant_uid: 'merchant_' + new Date().getTime(),, // 상점에서 관리하는 주문 번호
    			    
    			    name: ${CampsiteName},
    			    amount: 1000, // 결제창에 표시될 금액. 실제 승인이 이뤄지지는 않습니다.
    			    customer_uid: "your-customer-unique-id", // 필수 입력.
    			    buyer_email: ${userDto.useremail},
    			    buyer_name:  ${userDto.username},
    			    buyer_tel:   ${userDto.userphone},
    			  },
    			  function (rsp) {
    			    
    			  }
    			);
      }
    </script>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>

</body>
</html>