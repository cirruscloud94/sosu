<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<form action="/sosu/freeboard/updatefree" method="post" onclick="move(this, in, FR_IDX)">
<table class="board_view">
	<tbody>
		<tr>
			<th scope="row" style="width: 90px;">자유No.</th>
			<td style="width: 250px;">
				${i.FR_IDX}
				<input type="hidden" id="FR_IDX" name="FR_IDX" value="${i.FR_IDX }">
			</td>
			<th scope="row">작성자</th>
			<td colspan="3">
				${i.FR_WRITER }
			</td>
		</tr>
		<tr>
			<th scope="row">작성일</th>
			<td>
				${i.FR_REGDATE }
			</td>
			<th scope="row">수정여부</th>
			<td colspan="3"> 
				${i.RE_MOD_YN }
			</td>	
		</tr>
		<tr>
			<th scope="row" style="width: 90px;">카테고리</th>
			<td style="width: 250px;">
				${i.FR_CATEGORY }
			</td>	
		</tr>
		<tr>
			<th scope="row">제목</th>
			<td>
				${i.FR_TITLE }
				<input type="text" id="FR_TITLE" name="FR_TITLE" value="${i.FR_TITLE }">
			</td>	
		</tr>
		<tr>
			<th scope="row">내용</th> 
			<td colspan="3">
				<textarea rows="20" cols="100" id="FR_CONTENT" name="FR_CONTENT" style="height:300px">${i.FR_CONTENT }</textarea>
			</td>
		</tr>
	</tbody>
</table>
<input type="hidden" name="" value="">
</form>

<input class="btn" type="submit" value="수정하기">
<script src="/resources/js/common.js"></script>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>