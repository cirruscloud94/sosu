<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<form action="/members/findpw.sosu" method="POST">
   <div>이름</div><input type="text" name="M_NAME" id="m_name">
   <div>이메일(아이디)</div><input type="text" name="M_EMAIL">
   <div>주민등록번호</div>
   <input type="text" name="M_JUMIN" maxlength="6">     
   
   <input type="submit" value="확인">
</form>
</div>
</body>
=======
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/login.css" rel="stylesheet">
</head>
<body>
<div class="container" style="text-align:center">

<h1 style="margin-top:50px; margin-bottom:40px">FIND PW</h1>

<form action="/members/findpw.sosu" method="POST">
	<table class="input-form" >
	<colgroup>
			<col style="width:100px;">
			<col style="width:auto;">
		</colgroup>
		<thead></thead>
		<tbody>	
  			<tr>
				<th class="header"><label for="m_name">이름</label></th>
				<td class="find-contents"  colspan="2" >
					<input type="text" name="M_NAME" id="m_name">
				</td>
			</tr>
			
			<tr>
				<th class="header"><label for="m_email">이메일</label></th>
				<td class="find-contents"  colspan="2" >
				<input type="text" name="M_EMAIL" id="m_email">
				</td>
			</tr>
			
			<tr>
				<th class="header"><label for="m_jumin">주민번호</label></th>
				<td class="find-contents" colspan="2" >
				<input type="text" name="M_JUMIN" id="m_jumin" maxlength="6">
				</td>
			</tr>
			
			<tr>
					<td colspan="3" align="center">
						<input type="submit" value="비밀번호 찾기" class="btn-login">
					</td>
				</tr>	
   
   </tbody>
   </table>
   
</form>
</div>
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/login.css" rel="stylesheet">
</head>
<body>
<div class="container" style="text-align:center">

<h1 style="margin-top:50px; margin-bottom:40px">FIND PW</h1>

<form action="/members/findpw.sosu" method="POST">
	<table class="input-form" >
	<colgroup>
			<col style="width:100px;">
			<col style="width:auto;">
		</colgroup>
		<thead></thead>
		<tbody>	
  			<tr>
				<th class="header"><label for="m_name">이름</label></th>
				<td class="find-contents"  colspan="2" >
					<input type="text" name="M_NAME" id="m_name">
				</td>
			</tr>
			
			<tr>
				<th class="header"><label for="m_email">이메일</label></th>
				<td class="find-contents"  colspan="2" >
				<input type="text" name="M_EMAIL" id="m_email">
				</td>
			</tr>
			
			<tr>
				<th class="header"><label for="m_jumin">주민번호</label></th>
				<td class="find-contents" colspan="2" >
				<input type="text" name="M_JUMIN" id="m_jumin" maxlength="6">
				</td>
			</tr>
			
			<tr>
					<td colspan="3" align="center">
						<input type="submit" value="비밀번호 찾기" class="btn-login">
					</td>
				</tr>	
   
   </tbody>
   </table>
   
</form>
</div>
</body>
>>>>>>> branch 'develop' of https://github.com/gksmf4721/sosu.git
>>>>>>> branch 'develop' of https://github.com/GitHubHSK/sosu.git
</html>