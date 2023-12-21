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
	body{
		/* background-color: #C2C9BC; */
		/* background-color: #EBEADE; */
		background-color: #E4e4e4;
	}
	
	div.plist{
		font-family: 'Gowun Dodum', sans-serif;
		position: absolute;
		/* padding-top: 6em; */
		padding-left: 8em;
		/* border: 1px solid gray; */
		width: 100%;
		/* height: 100vh; */
		overflow-y: auto;
    	/* overflow-x: hidden; */
    	z-index: -2;
		/* display: flex;
    	justify-content: center;
    	align-items: center; */ 
	}
	
	.plist-coverimg{
		width: 100%;
		height: 250px;
		object-fit: cover;
		/* border: 1px solid gray; */
		border-radius: 5px 0px 0px 5px;
		background-color: #2F2F3D; 
		margin-top: -16px;
		box-shadow: 0px -6px 12px 0px rgba(20, 20, 20, 0.7) inset;
	}
	
	div.plist-content{
		width: 100%;
		margin-top: 32px;	
	}
	
	div.plist .plist-title-b{
		font-weight: 900;
		/* color: #2F2F3D; */
		color: #495F37;
		font-size: 48px;
		margin-top: 32px; /* 추가된 부분 */
	}
	
	div.plist .plist-title-search{
		flex-basis: calc(100% - 32px);
    	padding-right: 56px; /* 우측에 공백을 주세요 */
    	/* box-sizing: border-box; */ /* 박스 모델 조절 */
    	margin-bottom: 40px;
    	/* margin-right: 8px; */
    	display: flex;
    	justify-content: space-between;
    	align-items: baseline;
    	flex-direction: row;
	}
	
	div.plist .plist-search{
		
	}
	
	div.plist .plist-search-input{
		outline: none;
    	border: none;
		box-shadow: -3px -3px 6px 0px #FFF inset, 5px 5px 10px 0px rgba(0, 0, 0, 0.20) inset;
		font-weight: 500;
	}
	
	div.plist #plist-search-btn{
		outline: none;
    	border: none;
		box-shadow: -3px -3px 6px 0px #FFF, 5px 5px 10px 0px rgba(0, 0, 0, 0.20);
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 17px;
		color: #e4e4e4;
		font-weight: 400;
		letter-spacing: 4px;
	}
	
	div.plist .plist-list {
		display: flex;
		flex-wrap: wrap; /* 필요한 경우 자동으로 줄 바꿈 */
    	justify-content: flex-start;
    	align-items: center; 
	}
	
	div.plist .plist-item {
    	/* flex-basis: calc(33.333% - 32px); */ /* 3개씩 나열하고 간격은 10px로 조절 */
    	flex-basis: calc(25% - 32px); /* 3개씩 나열하고 간격은 10px로 조절 */
    	margin-right: 24px; /* 오른쪽 간격 설정 */
    	margin-bottom: 32px; /* 아래쪽 간격 설정 */
    	border-radius: 8px ;
    	/* border: 1px solid gray;*/
    	/* box-shadow: 2px 2px 8px #898989; */
    	box-shadow: 4px 4px 12px 0px rgba(40, 40, 40, 0.25);
    	background-color: #e4e4e4;
	}
	
	div.plist .plist-item-inner {
    	text-decoration: none;
    	color: #2F2F3D;
    	font-weight: 600;
    	font-size: 20.5px;
	}
	
	div.plist .plist-item:hover .plist-item-inner {
    	text-decoration: none;
    	color: #88B2A5;
    	font-weight: 600;
    	font-size: 20.6px;
	}
	
	div.plist .plist-item-inner:visited {
    	text-decoration: none;
    	color: #999999;
    	font-weight: 500;
    	font-size: 20.5px;
	}
	
	div.plist .plist-item:hover .plist-item-inner:visited {
    	text-decoration: none;
    	color: #88B2A5;
    	font-weight: 600;
    	font-size: 20.6px;
	}
		
	div.plist .plist-item-img{
		/* flex-basis: calc(33.333% - 0px); */
		width: 100%;
    	height: 200px;
    	object-fit: cover;
    	border-radius: 10px 10px 0px 0px;
    	margin-bottom: 8px;
	}
	
	div.plist .plist-item-no {
    	margin-left: 8px;
	}
	
	div.plist table.plist-item-info{
		width: 100%;
		font-weight: 600;
		/* background-color: transparent; */
		margin-top: 16px;
		margin-bottom: 16px;
		color: #a2a2a2;
		font-size: 14px;
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: center;
		
	}
	
	div.plist .plist-item-info-des{
		width: 100%;
	}
	
	div.plist .plist-options {
		display: flex;
		justify-content: center;
		flex-direction: column;
		width: 32%;
		flex-basis: calc(33.333% - 4px;);
		align-items: center;
	}
	
	div.plist .plist-item-info-icon{
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	div.plist .plist-item-info-des{
		display: flex;
		justify-content: center;
		align-items: baseline;
	}
	
	div.plist .plist-item-info-operdays,.plist-item-info-location,.plist-item-info-pet{
		width: 32%;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.plist-pagination {
		margin: 56px;
	}
	
	.plist-pagination a{
		text-decoration: none;
		font-size: 20px;
		font-weight: 900;
	}
	
	.plist-pagination a:hover{
		text-decoration: none;
		font-size: 20px;
		font-weight: 900;
		color: #88B2A5;
	}
	
</style>
<c:set var="root" value="<%=request.getContextPath()%>"/>

<%
String userId = (String) session.getAttribute("userid");
%>
<script type="text/javascript">
	var word=$("search").val();
	var facltNm=$(".plist-search-input").val();
	var sigunguNm=$(".plist-search-input").val();
	var doNm=$(".plist-search-input").val();
	console.log(word);
	
    $(document).on("click","#plist-search-btn",function(){
    	$.ajax({
            type: "POST",
            url: "./plist/search",
            data: {
                "word":word,
                "facltNm":facltNm,
                "sigunguNm":sigunguNm,
                "doNm":doNm
            },
            dataType: "json",
            success: function (res) {
            	console.log("a:"+res);
            	$(".plist-item-img").html(res.firstImageUrl);
            }
    		
    	})
    });
</script>
<body>
<div class="plist-coverimg">
	<img alt="coverimg" src="${root}/views/main/img/camping-coverimg.jpg" class="plist-coverimg">
</div>

<div class="plist">
	<!-- Camping Search Section -->
	<div class="plist-content">
		<div class="plist-title-search input-group">
			<div class="plist-title">
				<span class="plist-title-b">캠핑장 목록</span>
				<span class="plist-title-b" style="font-size: 20px;color: #999999;font-weight: 600;">총 ${totalCount}개의 캠핑장이 있습니다</span>
			</div>
			<div class="plist-search input-group" style="width: 450px;height:16px;">
				<input type="text" class="plist-search-input" name="search" style="width: 350px;border-radius: 5px 0px 0px 5px;outline: none;"
				  placeholder="캠핑장/시/군/구를 검색하세요">
				<button type="button" id="plist-search-btn" class="plist-search-btn" 
				  style="width: 100px;background-color: #528171;border:none;border-radius: 0px 5px 5px 0px;">검색</button>
			</div>
		</div>
		
		
		<!-- Camping Site List -->
		<div class="plist-list">
			<c:forEach var="dto" items="${plistpage}">
					<div class="plist-item">
						<c:choose>
    						<c:when test="${sessionScope.userid == null}">
	        					<a href="./detail?num=${dto.camping_num}&userId=null" class="plist-item-inner">
        							<img alt="캠핑장 이미지" class="plist-item-img" src="${dto.firstImageUrl}" onerror="this.src='${root}/views/main/noimage.jpg'">
									<span class="plist-item-no">
										<%-- ${dto.camping_num}. --%>
										<c:set var="dto.camping_num" value="${dto.camping_num-1}"/>
										${dto.facltNm}
									</span>
									<span class="plist-item-room" style="font-size: 16px;color: #528171;">
										(${dto.available_room}개 남음)
									</span>
      							</a>
    						</c:when>
        					<c:otherwise>
	            				<a href="./detail?num=${dto.camping_num}&userId=${sessionScope.userid}" class="plist-item-inner">
        							<img alt="캠핑장 이미지" class="plist-item-img" src="${dto.firstImageUrl}">
									<span class="plist-item-no">
										${dto.camping_num}.
										<c:set var="dto.camping_num" value="${dto.camping_num-1}"/>
										${dto.facltNm}
									</span>
									<span class="plist-item-room" style="font-size: 16px;color: #528171;">
										(${dto.available_room}개 남음)
									</span>
      							</a>
        					</c:otherwise>
      					</c:choose>
						<%-- <div class="plist-item-info">
							<div class="plist-item-info-location plist-options">
								<div class="plist-item-info-icon" style="width: 30%">
									<i class="bi bi-geo-alt-fill" style="font-size: 18px;"></i>
								</div>
								<div>
									${dto.doNm} ${dto.sigunguNm}
								</div>
							</div>
							<div class="plist-item-info-operdays plist-options">
								<div class="plist-item-info-icon" style="width: 25%">
									<i class="bi bi-calendar-check" style="font-size: 18px;"></i>
								</div>
								<div>
									${dto.operDeCl}
								</div>
							</div>	
							<div class="plist-item-info-pet plist-options">
								<div class="plist-item-info-icon" style="width: 30%">
									<img alt="pet-icon" src="${root}/views/main/img/pet-icon.png" style="height: 27px;">
								</div>
								<div>
									${dto.animalCmgCl}
								</div>
							</div>	
						</div> --%>
						<table class="plist-item-info" style="">
							<tbody style=" width: 100%;">
								<tr class="plist-item-info-icon">
									<td class="plist-options plist-item-info-location">
										<i class="bi bi-geo-alt-fill" style="font-size: 18px;"></i>
									</td>
									<td class="plist-options plist-item-info-operdays">
										<i class="bi bi-calendar-check" style="font-size: 18px;"></i>
									</td>
									<td class="plist-options plist-item-info-pet">
										<img alt="pet-icon" src="${root}/views/main/img/pet-icon2.png" style="height: 27px;">
									</td>
								</tr>
								<tr class="plist-item-info-des">
									<td class="plist-item-info-location">
										${dto.doNm} ${dto.sigunguNm}
									</td>
									<td class="plist-item-info-operdays">
										${dto.operDeCl}
									</td>
									<td class="plist-item-info-pet">
										${dto.animalCmgCl}
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				<%-- </c:forEach> --%>
			</c:forEach>
		</div>
		
		
		<!-- Pagination -->
		<div style="text-align: center;" class="plist-pagination">
			<!-- 이전 -->
			<c:if test="${startPage>1}">
				<a href="./plist?currentPage=${startPage-1}">이전</a>
			</c:if>
			&nbsp;
			<c:forEach var="pno" begin="${startPage}" end="${endPage}">
				<a href="./plist?currentPage=${pno}" style="cursor: pointer;">
					<c:if test="${pno==currentPage}">
						<!-- <p class="plist-pagingnum" style="background-color: #528171;width: 16px;"> -->
							<span style="color: #528171;">${pno}</span>
						<!-- </p> -->
					</c:if>
					<c:if test="${pno!=currentPage}">
						<span style="color: #8C8C8C;">${pno}</span>
					</c:if>
				</a>
				&nbsp;
			</c:forEach>
			<!-- 다음 -->
			<c:if test="${endPage<totalPage}">
				<a href="./plist?currentPage=${endPage+1}">다음</a>
			</c:if>
		</div>
	</div>
</div>
</body>
</html>