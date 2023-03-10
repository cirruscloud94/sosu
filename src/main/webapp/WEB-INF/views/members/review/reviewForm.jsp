<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/resources/js/review.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/reviewForm.css"/>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<main class="container">
	<article>
		<form action="/members/reviewForm.sosu" method="post" name="insertReview" id="insertReview" enctype="multipart/form-data" onsubmit="return check()" >
			<h1>${MO_TITLE}</h1>
			
			<fieldset>
			    <input type="radio" name="RV_STAR" value="5" id="rate1"><label class="starp" for="rate1">⭐</label>
			    <input type="radio" name="RV_STAR" value="4" id="rate2"><label class="starp" for="rate2">⭐</label>
			    <input type="radio" name="RV_STAR" value="3" id="rate3"><label class="starp" for="rate3">⭐</label>
			    <input type="radio" name="RV_STAR" value="2" id="rate4"><label class="starp" for="rate4">⭐</label>
			    <input type="radio" name="RV_STAR" value="1" id="rate5"><label class="starp" for="rate5">⭐</label>
			</fieldset>
			
			<h3>제목</h3>
			<input type="text" name="RV_TITLE" id="rv_title">
			
			<h3>내용</h3>
			<textarea name="RV_CONTENT" id="rv_content" placeholder="후기 내용을 작성해주세요."></textarea>
			
			<!-- 회원번호 -->
			<input type="hidden" name="M_IDX" value="${M_IDX}">
			<!-- 모임번호 --> 
			<input type="hidden" name="MO_IDX" value="${MO_IDX}">
			<!-- 모임 제목 -->
			<input type="hidden" name="MO_TITLE" value="${MO_TITLE}">
			<!-- 게시글 테이블 타입 -->
			<input type="hidden" name="F_TABLE" value="${F_TABLE}">
			
			<div id="fileDiv">
				<div class="filebox">	<!-- accept로 이미지파일 확장자 제한 가능 -->
					<input class="upload-name-main" value="썸네일첨부" placeholder="썸네일첨부">
					<label for="file" class="filesearch">파일찾기</label>
					<input type="file" id="file" name="mainIamge" accept="image/jpeg, image/png, image/jpg">
					
					<input class="upload-name" value="파일첨부" placeholder="파일첨부">
					<label for="file_0" class="filesearch">파일찾기</label>
					<input type="file" id="file_0" name="file_0" accept="image/jpeg, image/png, image/jpg">
				</div>
			</div>

			<br/>
			<br/>
			<a href="#this" class="btn_a" id="addFile">파일 추가</a>
			<a href="/members/mypage.sosu" class="btn_a">취소</a><!-- 마이페이지 URL  -->
			<button class="submit">등록</button>
		</form>
	</article>
</main>
<script type="text/javascript">
	var gfv_count = 1;

	$(document).ready(function() {

		$("#addFile").on("click", function(e) { //파일추가 버튼
			e.preventDefault();
			fn_addFile();
		});

		$("a[name='delete']").on("click", function(e) { //삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});

	});

	function fn_addFile() {
		var str = "<div class='filebox'>" + 
				"<input class='upload-name' value='파일첨부' placeholder='파일첨부'>" +
				"<label for='file_0' class='filesearch'>파일찾기</label>" +
				"<input type='file' name='file_" + (gfv_count++) + "' accept='image/jpeg, image/png, image/jpg'>" +
				"<a href='#this' class='btn_a' name='delete'>삭제</a></div>";
		$("#fileDiv").append(str);  //<<div id="fileDiv">에 변수 str의 값을 추가
		$("a[name='delete']").on("click", function(e) {
			e.preventDefault();
			fn_deleteFile($(this));
		});
	}

	function fn_deleteFile(obj) {
		obj.parent().remove(); //this의 바로 위의 요소(<p>태그)를 삭제
	}
	
	$("#file").on('change',function(){
		  var fileName = $("#file").val();
		  $(".upload-name-main").val(fileName);
	});
	
	$("#file_0").on('change',function(){
		  var fileNames = $("#file_0").val();
		  $(".upload-name").val(fileNames);
	});
</script>
