<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
    
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/resources/js/review.js"></script>
<link href="/resources/css/review.css" rel="stylesheet">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<main class="container">
	<article>
		<form action="/review/{MO_CATEGORY}.sosu" method="post" onsubmit="return confirm('삭제하시겠습니까?');">
			<div class="reviewHeader">
				<!-- input hidden 값 -->
				<input type="hidden" name="MO_CATEGORY" id="mo_category" value="${MO_CATEGORY}">
				<input type="hidden" name="RV_IDX" id="RV_IDX" value="${RV_IDX}">
				<input type="hidden" name="M_IDX" id="M_IDX" value="${M_IDX}">
				<input type="hidden" name="MO_IDX" id="MO_IDX" value="${map.MO_IDX}">
				<input type="hidden" class="review_regdate" name="RV_REGDATE" id="RV_REGDATE" value="${map.RV_REGDATE}">
				<input type="hidden" name="RV_M_IDX" id="RV_M_IDX" value="${map.M_IDX}">
				<div class="info">
					<div class="profile">
						<%-- <c:forEach items="${m_map}" var="m">
							<img class="review_profile" src="/resources/img/profile/${m.PROFILE}">
						</c:forEach> --%>
					</div>
					<div class="info_notPhoto">
						<div class="name">${map.M_NICKNAME}</div>
						<div class="info_SD">
							<div class="starpoint">
								<c:forEach begin="1" end="${map.RV_STAR}">⭐</c:forEach>
							</div>
							<div class="review_date"></div>
						</div>
					</div>
				</div>
				<div class="contents">${map.RV_CONTENT}</div>
			</div>
			<div class="join_moim">
				<div class="title_moim">${map.MO_TITLE}</div>
			</div>
				<c:forEach items="${list}" var="f">
					<c:if test="${f.F_TABLE eq 'R' and f.F_MAIN_YN eq 'N'}">
						<div class="rv_img"><img src="/resources/img/upload/${f.F_SVNAME}"></div>
					</c:if>
				</c:forEach>
			<div class="rv_btn">	
				<a href="/review/${MO_CATEGORY}.sosu" class="btn_a">목록으로</a>
				
				<!-- 리뷰 작성자와 회원번호 값이 다를 경우(작성자 본인이 아닐경우 삭제, 수정버튼 사라짐) -->
				<c:if test="${M_IDX == map.M_IDX}">
				<a href="/reviewModify/${MO_CATEGORY}/${RV_IDX}.sosu" class="btn_a">수정하기</a>
				<button class="submit warning">삭제</button>
				</c:if>
			</div>
		</form>
	</article>
</main>