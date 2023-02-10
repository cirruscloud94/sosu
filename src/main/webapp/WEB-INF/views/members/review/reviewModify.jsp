<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
    
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/resources/js/review.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/reviewForm.css"/>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<main class="container">
<article>
	<form action="/review/reviewModify.sosu" method="post" onsubmit="return check()" name="insertReview" id="insertReview" enctype="multipart/form-data">
		<h1>리뷰 수정하기</h1>
		
		<fieldset>
		    <legend>별점을 선택해주세요</legend>
		    <input type="radio" name="RV_STAR" value="5" id="rate1"><label for="rate1">⭐</label>
		    <input type="radio" name="RV_STAR" value="4" id="rate2"><label for="rate2">⭐</label>
		    <input type="radio" name="RV_STAR" value="3" id="rate3"><label for="rate3">⭐</label>
		    <input type="radio" name="RV_STAR" value="2" id="rate4"><label for="rate4">⭐</label>
		    <input type="radio" name="RV_STAR" value="1" id="rate5"><label for="rate5">⭐</label>
		</fieldset>
		
		<h3>제목</h3>
		<input type="text" name="RV_TITLE" id="rv_title" value="${map.RV_TITLE}">
		
		<h3>내용</h3>
		<textarea name="RV_CONTENT" id="rv_content" placeholder="후기 내용을 작성해주세요.">${map.RV_CONTENT}</textarea>
		
		<!-- 회원번호 -->
		<input type="hidden" name="M_IDX" value="${map.M_IDX}">
		<!-- 모임번호 --> 
		<input type="hidden" name="MO_IDX" value="${map.MO_IDX}">
		<!-- 리뷰번호 -->
		<input type="hidden" name="RV_IDX" value="${RV_IDX}"> 
		<!-- 선택한 카테고리 -->
		<input type="hidden" name="mo_cate" value="${MO_CATEGORY}">
		<!-- 파일번호 -->
		<input type="hidden" name="F_IDX" value="${map.F_IDX}">
		<!-- 파일 태그 --> 
		<input type="hidden" name="F_TABLE" value="${map.F_TABLE}">
		
		<div id="fileDiv">
		<c:forEach items="${map}" end="${fn:length(F_IDX)}" varStatus="m">
			<p> <!-- accept로 이미지파일 확장자 제한 가능 -->
				<input type="hidden" id="F_IDX" name="F_IDX_${m.index}" value="${map.F_IDX}"> 
				<a href="#this" id="name_${m.index}" name="name_${m.index}">${map.F_OGNAME}</a>
				<input type="file" id="file_${m.index}" name="file_${m.index}" accept="image/jpeg, image/png, image/jpg"> 
				(${map.F_SIZE}kb) 
				<a href="#this" class="btn" id="delete_${m.index}" name="delete_${m.index}">삭제</a>
			</p>
		</c:forEach>
		</div>
		<br/>
		<br/>
		<a href="#this" class="btn" id="addFile">파일 추가</a>
		<a href="/members/mypage.sosu" class="btn">취소</a><!-- 마이페이지 URL  -->
		<button class="submit">등록</button>
	</form>
</article>
</main>
<script type="text/javascript">
	var gfv_count = '${fn:length(list)+1}';

	$(document).ready(function() {

		$("#deleteCafeinfo").on("click", function(e) { //삭제하기 버튼
			e.preventDefault();
			fn_deleteCafeinfo();
		});

		$("#addFile").on("click", function(e) { //파일추가 버튼
			e.preventDefault();
			fn_addFile();
		});

		$("a[name^='delete']").on("click", function(e) { //파일추가 삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});

	});

	function fn_addFile(){
		var str = "<p>" +
				"<input type='file' id='file_"+(gfv_count)+"' name='file_"+(gfv_count)+"'>"+
				"<a href='#this' class='btn' id='delete_"+(gfv_count)+"' name='delete_"+(gfv_count)+"'>삭제</a>" +
			"</p>";
		$("#fileDiv").append(str);
		$("#delete_"+(gfv_count++)).on("click", function(e){ 
			e.preventDefault();
			fn_deleteFile($(this));
		});
	}

	function fn_deleteFile(obj) {
		obj.parent().remove();
	}
</script>