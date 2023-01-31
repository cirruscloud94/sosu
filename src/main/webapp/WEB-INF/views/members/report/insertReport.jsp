<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function(){
	var close = ${close};
	if(close!=null){
		window.close();
	}
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
function report(){
	 var param = $("form[name=reportForm]").serialize();
	 $.ajax({
         type : "POST",
         url : "/members/report.sosu",
         contentType: "application/json",
            data : param,
            dataType:'json',
      });

 }
 
function reportClose(){
	window.close();
}
</script>


<div class="container">

<!-- <div class="container" id="success"></div> -->
<c:if test="${close eq null}">
<form action="/members/report.sosu" name="reportForm" method="post" id="report">

	<div><h2>신고사유</h2></div>
	
		<input type="hidden" name="M_IDX" value="${M_IDX}">
	
		<div>
			<select name="R_REASON">
				<option value="">질문을 선택해주세요.</option>
				<option value="1">폭언/욕설</option>
				<option value="2">개인정보 노출 게시물</option>
				<option value="3">도배, 불법 광고</option>
				<option value="4">음란물</option>
				<option value="5">기타</option>
			</select>
	
		</div>
	
		<div><h2>상세내용</h2></div>
		<div><textarea rows="17" name="R_DETAIL" placeholder="내용 작성"></textarea></div>
	
		<input type="submit" value="신고하기">
		</form>
	</c:if>
	
	<c:if test="${close ne null}">
			<h3>신고가 완료됐습니다.</h3>
			<input type="button" value="닫기" onclick="reportClose();">
	</c:if>
</div>

</body>
</html>