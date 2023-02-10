<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="/resources/css/list.css" rel="stylesheet">
<script src="/resources/js/review.js"></script>
<main class="container" style="margin-top: 75px;">
	<article>
		<section class="row gy-5" style="margin-bottom: 90px;">
			<div class="container">
				<div class="row gy-5">
					<div class="col">
						<div style="float: left; font-size: 14.5px;">
							<select onchange="location.href=(this.value);">
								<option value="/review/culture.sosu"
									<c:if test="${MO_CATEGORY == 'culture'}">selected="selected"</c:if>>문화/예술</option>
								<option value="/review/sports.sosu"
									<c:if test="${MO_CATEGORY == 'sports'}">selected="selected"</c:if>>운동/스포츠</option>
								<option value="/review/game.sosu"
									<c:if test="${MO_CATEGORY == 'game'}">selected="selected"</c:if>>게임/오락</option>
								<option value="/review/outdoor.sosu"
									<c:if test="${MO_CATEGORY == 'outdoor'}">selected="selected"</c:if>>아웃도어/여행</option>
								<option value="/review/food.sosu"
									<c:if test="${MO_CATEGORY == 'food'}">selected="selected"</c:if>>음식</option>
								<option value="/review/etc.sosu"
									<c:if test="${MO_CATEGORY == 'etc'}">selected="selected"</c:if>>기타</option>
							</select>
							<div class="reg">
								<span>전체</span> <span>중부</span> <span>동부</span> <span>서부</span>
								<span>남부</span> <span>북부</span>
							</div>
							<div class="filter">
								<input type="datetime-local">
							</div>
						</div>
					</div>
				</div>

				<div>
					<h1 class="h1_review">후기 ${review_count.RVC}개 있어요!</h1>
					<div class="AVGstarpoint">
						<c:forEach begin="1" end="${((review_count.AVGSP*10)-(review_count.AVGSP*10%10))/10}">⭐</c:forEach>
						<span>&nbsp;${review_count.AVGSP}</span>
					</div>
				</div>
				<hr>
			</div>
			<c:choose>
				<c:when test="${detailList[0].TOTAL_COUNT != 0}">
					<c:forEach items="${detailList}" var="r">
						<div class="col-lg-3 menu-item reviewHeader" style="margin-bottom: 80px;">
							<div class="row gy-5">
								<!-- input hidden 값 -->
								<input type="hidden" name="MO_CATEGORY" id="mo_category" value="${r.MO_CATEGORY}">
								<input type="hidden" name="RV_IDX" id="rv_idx" value="${r.RV_IDX}">
								<input type="hidden" name="M_IDX" id="rv_idx" value="${r.M_IDX}">
								<input type="hidden" name="MO_IDX" id="MO_IDX" value="${r.MO_IDX}">
								<input type="hidden" class="review_regdate" name="RV_REGDATE" id="RV_REGDATE" value="${r.RV_REGDATE}">
								<br/>
								<div class="info">
									<%-- <div class="profile">
										<img class="review_profile" src="/resources/img/profile/${m_map.PROFILE}">
									</div> --%>
									
									<div>
										<div>${r.M_NICKNAME}</div>
										<div class="info_SD">
											<div class="starpoint">
												<c:forEach begin="1" end="${r.RV_STAR}">⭐</c:forEach>
											</div>
											<div class="review_date"></div>
											<span>${r.RV_CONTENT}</span>
										</div>
									</div>
								</div>
								${r.MO_TITLE}
								<c:if test="${not empty r.F_SVNAME}">
									<div class="rv_img"><img src="/resources/img/upload/${r.F_SVNAME}"></div>
								</c:if>
								<hr>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div>
						<div>조회된 결과가 없습니다.</div>
					</div>
				</c:otherwise>
			</c:choose>
		</section>
	</article>
</main>