<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
<c:choose>
<c:when test="${M_EMAIL != null }">
당신의 이메일(아이디)는 ${M_EMAIL} 입니다. 
</c:when>
<c:when test="${M_PW != null}">
당신의 비밀번호는 ${M_PW} 입니다. 
</c:when>
</c:choose>
</div>

<a href="/members/loginform.sosu">확인</a>

</body>
=======
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/login.css" rel="stylesheet">
</head>
<body>

<div class="container" style="text-align:center">
	<c:choose>
		<c:when test="${M_EMAIL != null }">
			<h1 style="margin-top:50px; margin-bottom:40px">FIND ID</h1>
			<p class="find-p">
			당신의 이메일(아이디)는 "
			<span class="find-result">${M_EMAIL}</span>
			" 입니다. </p>
		</c:when>
		<c:when test="${M_PW != null}">
			<h1 style="margin-top:50px; margin-bottom:40px">FIND PW</h1>
				<p class="find-p">
				당신의 비밀번호는 "
				<span class="find-result">${M_PW}</span>
				" 입니다. 
		</c:when>
	</c:choose>
		<div>
	<a href="/members/loginform.sosu"  class="btn-a">확인</a>
		</div>
</div>



</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/login.css" rel="stylesheet">
</head>
<body>

<div class="container" style="text-align:center">
	<c:choose>
		<c:when test="${M_EMAIL != null }">
			<h1 style="margin-top:50px; margin-bottom:40px">FIND ID</h1>
			<p class="find-p">
			당신의 이메일(아이디)는 "
			<span class="find-result">${M_EMAIL}</span>
			" 입니다. </p>
		</c:when>
		<c:when test="${M_PW != null}">
			<h1 style="margin-top:50px; margin-bottom:40px">FIND PW</h1>
				<p class="find-p">
				당신의 비밀번호는 "
				<span class="find-result">${M_PW}</span>
				" 입니다. 
		</c:when>
	</c:choose>
		<div>
	<a href="/members/loginform.sosu"  class="btn-a">확인</a>
		</div>
</div>



</body>
>>>>>>> branch 'develop' of https://github.com/gksmf4721/sosu.git
>>>>>>> branch 'develop' of https://github.com/GitHubHSK/sosu.git
</html>