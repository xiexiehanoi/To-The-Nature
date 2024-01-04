<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
	<script type="text/javascript">
			var naver_id_login = new naver_id_login("PPrEmBV42EmjjizVxM97", "http://localhost:8080/nature/login/naverLogin");
			alert(naver_id_login.oauthParams.access_token);
			naver_id_login.get_naver_userprofile("naverSignInCallback()");
			console.log('콜백실행')  
		  
		  
		 function naverSignInCallback() {
			nickname = naver_id_login.getProfileData('nickname');
			name = naver_id_login.getProfileData('name');
			email = naver_id_login.getProfileData('email');
			gender = naver_id_login.getProfileData('gender');
				
			
				$.ajax({
					type: 'POST',
					url: 'naverLogin', 
					data: {
						'userid': nickname,
						'username': name,
						'email': email,
						'gender': gender
						}, // data
					dataType: 'text',
					success: function(result) {
						if(result == 1) {
							console.log('성공')
							closePopupAndRedirect(); 
						} else  {
							window.close();
						}
					}, 
					error: function(result) {
						window.close();
					} 
				}) 
		  }
		  
		function closePopupAndRedirect() {
			window.opener.postMessage('naverLoginSuccess', '*'); 
		    window.close(); 
		  } 	
		  
	</script>
	
</body>
</html>