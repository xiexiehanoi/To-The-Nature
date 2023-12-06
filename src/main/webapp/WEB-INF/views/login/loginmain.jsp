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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
   body * {
       font-family: 'Jua';
   }
  
</style>
<c:set var="root" value="<%=request.getContextPath()%>"/>

<script type="text/javascript">
$(function(){
	//로그인버튼
	$("#btnlogin").click(function(){
		let saveid=$("#saveid").is(":checked");//true/false,val() 은 체크여부와상관없이 무조건 'on'
		let userid=$("#login_myid").val();
		let userpw=$("#login_pass").val();
		//alert(saveid+","+myid);
		
		//$("#btnclose").trigger("click");//강제로 닫기 버튼 클릭하기
		$.ajax({
			type:"get",
			dataType:"json",
			url:"${root}/login/process",
			data:{"saveid":saveid,"userid":userid,"userpw":userpw},
			success:function(res){
				//성공여부 : res.success
				if(res.success){
					window.location.href = "${root}/main/main";
				}else{
					alert("아이디나 비밀번호가 맞지 않습니다");
				}
		    }
		});		
	});

});
</script>
</head>

<body>


     <form action="${root}/login/process" method="get">
      <div class="header">
       회원 로그인
      </div>
     <br><br>
      <div class="body">
        <div class="userid">
        <input type="hidden" name="saveid" id="saveid" value="${sessionScope.saveid}">
        			<c:if test="${sessionScope.saveid==null || sessionScope.saveid=='no' }">
        				<input type="text" id="login_myid" name="userid" class="form-control" placeholder="아이디">
        			</c:if>
        			
        			<c:if test="${sessionScope.saveid=='yes' }">
        				<input type="text" id="login_myid" name="userid" class="form-control" value="${sessionScope.userid}" >
        			</c:if>
        	</div>
        	
        	<div class="userpw">
        			<input type="password" id="login_pass" name="userpw" class="form-control" placeholder="비밀번호">
        	</div>
        	</div>

        	<div class="idcheck">
        	 <caption align="bottom">
            	<label>
            	  <c:if test="${sessionScope.saveid==null || sessionScope.saveid=='no' }">
            		<input type="checkbox" id="saveid">&nbsp;아이디저장
            	  </c:if>
            	  <c:if test="${sessionScope.saveid=='yes' }">
            		<input type="checkbox" id="saveid" checked>&nbsp;아이디저장
            	  </c:if>
            	</label>
            </caption>
        </div>
      
      <div class="user">
      <a href="./form">
      회원가입
      </a>
      </div>
	  <div class="usercheck">
      아이디/비번찾기
      </div>
      
      &nbsp;&nbsp;&nbsp;&nbsp;
      <div class="footer">
        <button type="submit" class="btnlogin"
        id="btnlogin">로그인</button>
        </div>
	</form>

</body>
</html>