<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/resources/js/review.js"></script>

<main>
	<article class="container">
		<h1>리뷰</h1>
		<form action="/review/{MO_CATEGORY}.sosu" method="post" onsubmit="return confirm('삭제하시겠습니까?');">
			<table>
				<tbody>
					<tr>
						<th>카테고리</th>
						<td>
							<strong>${detail.MO_CATEGORY}</strong>
							<input type="hidden" name="MO_CATEGORY" id="mo_category" value="${detail.MO_CATEGORY}">
						</td>
						<th>리뷰번호</th>
						<td>
							<strong>${detail.RV_IDX}</strong>
							<input type="hidden" name="RV_IDX" id="rv_idx" value="${detail.RV_IDX}">	
						</td>
						<th>회원번호</th>
						<td>
							<strong>${detail.M_IDX}</strong>
							<input type="hidden" name="M_IDX" id="rv_idx" value="${detail.M_IDX}">
						</td>
						<th>모임번호</th>
						<td>
							<strong>${detail.MO_IDX}</strong>
							<input type="hidden" name="MO_IDX" name="MO_IDX" value="${detail.MO_IDX}">
						</td>
						<th>제목</th>
						<td>${detail.RV_TITLE}</td>
					</tr>
					<tr>
						<th>등록날짜</th>
						<td>${detail.RV_REGDATE}</td>
					</tr>
					<tr>
						<th>별점</th>
						<td>${detail.RV_STAR}</td>
					</tr>
					<tr>
						<td>${detail.RV_CONTENT}</td>
					</tr>
				</tbody>
			</table>
			
			<div>	
				<a href="/review/${detail.MO_CATEGORY}.sosu" class="btn normal">목록으로</a>
				
				<a href="/reviewModify/${detail.MO_CATEGORY}/${detail.RV_IDX}.sosu">수정하기</a>
				
				<button class="submit">삭제</button>
			</div>
		</form>
	</article>
</main>