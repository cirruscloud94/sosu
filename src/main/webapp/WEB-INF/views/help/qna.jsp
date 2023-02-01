<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main>
	<article class="container">
		<h1>QnA</h1>
		<hr>
		QNA
		<br>
		<table>
			<tbody>
				<c:choose>
					<c:when test="${list[0].TOTAL_COUNT == 0}">
						<tr>
							<td colspan="4" align="center">조회된 결과가 없습니다.</td>
						</tr>
					</c:when>
					<c:when test="${list[0].TOTAL_COUNT != 0}">
						<c:forEach var="rows" items="${list}">
							<tr>
								<td>
									${rows.Q_TITLE}
									<p>${rows.Q_CONTENT}</p>
									<p>${rows.Q_REGDATE}</p>
								</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</tbody>
		</table>
		<hr>
	</article>
</main>
</body>
</html>