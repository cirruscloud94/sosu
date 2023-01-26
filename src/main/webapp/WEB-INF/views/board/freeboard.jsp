<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<html>
<head>
<title>소수 자유게시판</title>
</head>
<body>
<h1>자유게시판 </h1>

<table style="border:1px solid #ccc">
	<colgroup>
		<col width="10%"/>
		<col width="10%"/>
		<col width="*"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="20%"/> 
	</colgroup>
	<thead>
		<tr>
			<th scope="col">자유 No.</th>
			<th scope="col">메인이미지</th>
			<th scope="col">제목</th>
			<th scope="col">글쓴이</th>
			<th scope="col">찜</th>
			<th scope="col">등록날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${!empty list }">
				<c:forEach items="${list }" var="i" >
					<tr align="center" onclick="location.href='/freeboard/${i.FR_CATEGORY }/${i.FR_IDX }.sosu'" >	
						<td>${i.FR_IDX }</td>
						<td>${i.F_SVNAME }</td>
						<td>${i.FR_TITLE }</td>
						<td>${i.M_NICKNAME }</td>
						<td>${i.FRZ_COUNT }</td>
						<td>${i.FR_REGDATE }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="3">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		<tr> 
			<td>
				<a class="use_move" href="/freeboard/insertForm/${FR_CATEGORY }.sosu" onclick="move(this, 'in', 'FR_IDX', 'FR_CATEGORY', 'M_NICKNAME')" >
					글쓰기
					<input type="hidden" name="FR_ID" value="${i.FR_ID }"><!-- 게시판 -->
					<input type="hidden" name="M_NICKNAME" value="${i.M_NICKNAME }"><!-- 글쓴이 -->
					<input type="hidden" name="FR_CATEGORY" value="${i.FR_CATEGORY }"><!-- 카테고리 -->
					<input type="hidden" name="M_IDX" value="${i.M_IDX }"><!-- 회원 번호 -->							
				</a> &nbsp;
			</td>
		</tr>	
	</tbody>
</table>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>		
<script src="/resources/js/common.js"></script>
</body>
</html>