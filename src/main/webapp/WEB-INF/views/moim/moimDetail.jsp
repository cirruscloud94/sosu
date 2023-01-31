<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<body>
<%   //개행을 위한..(구현X)
      pageContext.setAttribute("crcn", "\r\n");
      pageContext.setAttribute("br", "<br>"); 
%> 

<input type="hidden" name = "MO_IDX" value="${MO_IDX}">
<main class="layoutCenter">
<div align="center"><h1>모임 디테일</h1></div>

<table>
   <colgroup>   
      <col width="15%"/>
      <col width="5%"/>
      <col width="15%"/>
   </colgroup>
   <tbody>
      <tr>
         <th>카테고리</th>
         <td>
            <strong id="cate">${Detail.MO_CATEGORY}</strong>   
         </td>
         <th>모임번호</th>
         <td id="MO_IDX">
            <strong>${Detail.MO_IDX}</strong>   
         </td>
         <th>모임제목</th>
         <td>
            <strong>${Detail.MO_TITLE}</strong>
         </td>
         <th>방장 닉네임</th>
         <td>
            <form action="/members/usermypage.sosu">
               <input type="hidden" value="${Detail.M_NICKNAME}" name="M_NICKNAME">
               <button type="submit">${Detail.M_NICKNAME}</button>
            </form>
         </td>
         <th>모임지역</th>
         <td>${Detail.MO_DETAILREGION}</td>
      </tr>
      <tr>
         <th>작성일</th>
         <td colspan="7">${Detail.MO_REGDATE}</td>
      </tr>
      <tr>
         <td>${Detail.MO_DETAIL}</td>
      </tr>
   </tbody>
</table>
<br>
<br>
<p>참여 인원 리스트</p>
   <table>
      <thead>
         <tr align="center">
            <th>참여자 프로필</th>
            <th>참여자 닉네임</th>
         </tr>
      </thead>
      <tbody>
         <c:choose>
            <c:when test="${fn:length(list) > 0 }">
               <c:forEach items="${list}" var = "m" >
                  <tr align="center">
                      <td>${m.PROFILE}</td>
                     <td><form action="/members/usermypage.sosu">
               <input type="hidden" value="${m.M_NICKNAME}" name="M_NICKNAME">
               <button type="submit">${m.M_NICKNAME}</button>
            </form></td>
                    
                  </tr>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <tr>
                  <td colspan="4">조회된 결과가 없습니다.</td>
               </tr>
            </c:otherwise>
         </c:choose>
      </tbody>
</table>
<div align="center" id="btndiv">
<c:if test ="${sessionss ne null and sessionss ne Detail.M_IDX}">
<form action = "/moim/moimJoin.sosu">
<button type="submit" onclick="checkJoin();">참여하기</button>
<input type="hidden" name = "MO_IDX" value="${MO_IDX}">
</form>
</c:if>   
<a href="/moim/${MO_CATEGORY}.sosu" class = "btn normal">목록으로</a>
<input type = "hidden" name = "MO_CATEGORY" value = "${Detail.MO_CATEGORY}"/>
<c:if test ="${sessionss ne null and sessionss eq Detail.M_IDX}">
<a href="/moimModify/${MO_IDX}.sosu" class = "btn normal">수정하기</a>
<input type="hidden" value="${MO_IDX}"  name = "MO_IDX">
<form action="/moim/moimDelete.sosu">
<button type="submit" onclick="check();">삭제하기</button>
</form>
</c:if>
</div>
</main>
</body>

<!-- 삭제 컨펌 alert 1/20기준 미완 -->
<script type="text/javascript">
function check() {
   
   var cate = $("#cate").text();
   var idx = $("#MO_IDX").text();
   
   
    if (confirm("게시글을 삭제 하시겠습니까?")){ 
       alert("삭제 되었습니다.");
       location.href="/moim/moimDelete.sosu";
       } else {
       location.href="/moim/" +cate + "/" + idx + ".sosu";
      return false;
      
   }
    }
function checkJoin() {
   
   var cate = $("#cate").text();
   var idx = $("#MO_IDX").text();
   var list = ${list};
   
   for(int i=0 ; i<list.length ; i++){
	   if(<%=session.getAttribute("sessionss")%>==list[i].values("M_IDX")){
		   alert("이미 참여함ㅋ");
		   return false;
	   }else{
		   if (confirm("모임에 참여하시겠습니까??")){ 
		       alert("참여완료.");
		       location.href="/moim/moimJoin.sosu";
		       } else {
		       location.href="/moim/" +cate + "/" + idx + ".sosu";
		      return false;
		   }
	   }
   }
   
    
}
</script>