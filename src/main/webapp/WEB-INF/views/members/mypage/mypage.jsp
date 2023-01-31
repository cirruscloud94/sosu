<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script defer type="text/javascript" src="/resources/js/mypage.js"></script>
<link href="/resources/css/mypage.css" rel="stylesheet">
<link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<script>

$(document).ready(function(){
	$("input:checkbox[id='delZzim1']").on('click', function(){
		var delZzimMoim_parent = $(this).parent("#parent");
		var delZzimMoim_checkVal = delZzimMoim_parent.find("#delZzim1").val();
		var delZzimMoim_list = [];
		var $checked = $("input#delZzim1[type=checkbox]:checked");
	      $.each($checked, function(k, v){
	         delZzimMoim_list.push($(this).val());
	      });
	      console.log(delZzimMoim_list);

	    /*   $.ajax({
		         type : "POST",
		         url : "/members/deletezzim.sosu",
		         contentType: "application/json",
		            data : JSON.stringify({
		               ZzimBox : delZzimMoim_list
		            }),
		            dataType:'json'
			}) */
		
	})
})

//내가 찜한 자유게시판 삭제
$(document).ready(function(){
	$("input:checkbox[id='delZzim2']").on('click', function(){
		var delZzimFree_parent = $(this).parent("#hihi");
		var delZzimFree_check = delZzimFree_parent.find("#delZzim2").val();
		if($("input:checkbox[id='delZzim2']").is(":checked")==true){
		      $.ajax({
		         type : "POST",
		         url : "/members/deletezzim.sosu",
		         contentType: "application/json",
		            data : JSON.stringify({
		               Z_IDX : delZzimFree_check
		            }),
		            dataType:'json'
		      })
		   }else{
			   return false;
		   }
	})
})


   
		
   

</script>


</head>
<body>

<div class="container" style="text-align:center">
   <h1 style="margin-top:50px; margin-bottom:40px">MY PAGE</h1>
      <div class="pro_firsttt">
         <!-- 프로필 사진  -->
         <form enctype="multipart/form-data">
            <img class="img-pro" src="${pageContext.request.contextPath}/resources/img/upload/${mypageInfo[9][0].F_SVNAME}"><br/>
         </form>

      <!-- 공통 정보 -->
      <!-- 닉네임 + 수정하기 버튼 -->
      <p class="nickname">${mypageInfo[0][0].M_NICKNAME} 
         <span><a href="/members/mypagemodifyform.sosu">
         <img class="img-modi" src="/resources/img/icons/modify.png">
         </a></span>
      </p>
      
      <!-- 이메일 -->
      <p style="margin-top:10px;">${mypageInfo[0][0].M_EMAIL}</p>  
      
      <!-- 별점 띄우기 -->
      <p style="color: #ffc81e">
      <c:if test="${mypageInfo[2][0].STARINT eq 1}"><c:out value="★☆☆☆☆"/></c:if> 
      <c:if test="${mypageInfo[2][0].STARINT eq 2}"><c:out value="★★☆☆☆" /></c:if> 
      <c:if test="${mypageInfo[2][0].STARINT eq 3}"><c:out value="★★★☆☆" /></c:if> 
      <c:if test="${mypageInfo[2][0].STARINT eq 4}"><c:out value="★★★★☆" /></c:if>
      <c:if test="${mypageInfo[2][0].STARINT eq 5}"><c:out value="★★★★★" /></c:if>
      <span style="color:#212529">(${mypageInfo[1][0].STARFLOAT})</span>
      </p>
   </div>
   
   
   <form action="/members/mypage.sosu" method="get">
      <div class="pro_sec">
      <input type="hidden" id="category" class="mypageCategory" name="mypageCategory" value="">
      <input type="hidden" id="review" name="selectReview" value="">
      <input type="hidden" id="zzim" name="selectZzim" value="">
      
      <c:set var="reviewA" value="${fn:length(mypageInfo[5])}"/>
      <c:set var="reviewB" value="${fn:length(mypageInfo[6])}"/>
      <c:set var="zzimA" value="${fn:length(mypageInfo[7])}"/>
      <c:set var="zzimB" value="${fn:length(mypageInfo[8])}"/>
      
      <button type="submit" <c:if test="${mypageCategory eq '1'}">class="btn-mypage on"</c:if>
      <c:if test="${mypageCategory ne '1'}">class="btn-mypage"</c:if>
       id="check1">${fn:length(mypageInfo[3])} <br/>내가 개설한 모임</button>
      
      <button type="submit" <c:if test="${mypageCategory eq '2'}">class="btn-mypage on"</c:if>
      <c:if test="${mypageCategory ne '2'}">class="btn-mypage"</c:if>
       id="check2" >${fn:length(mypageInfo[4])} <br/>내가 참여한 모임</button>
      
      <button type="submit" <c:if test="${mypageCategory eq '3'}">class="btn-mypage on"</c:if>
      <c:if test="${mypageCategory ne '3'}">class="btn-mypage"</c:if>
       id="check3">${reviewA + reviewB} <br/>리뷰</button>
      
      <button type="submit" <c:if test="${mypageCategory eq '4'}">class="btn-mypage on"</c:if>
      <c:if test="${mypageCategory ne '4'}">class="btn-mypage"</c:if>
       id="check4">${zzimA + zzimB} <br/> 스크랩</button>
      </div>
   
   
   <c:if test="${mypageCategory eq '1' }">
      <section id="1">
      <div class="container" style="width:900px; margin-top: 5%;">
      <div class="row gy-5" style="width:900px;">
         
            <c:forEach begin="0" end="${fn:length(mypageInfo[3])}" items="${mypageInfo[3]}" var="mypage">
            <div class="col-lg-3 menu-item">
            <div class="row gy-5">
            <a onclick= "location.href='/moim/${mypage.MO_CATEGORY}/${mypage.MO_IDX}.sosu'">
               <input type="hidden" name="MO_CATEGORY" value="${mypage.MO_CATEGORY}">
               <input type="hidden" name="MO_IDX" value="${mypage.MO_IDX}">
               <img src="${pageContext.request.contextPath}/resources/img/icons/list.png" style="width: 200px; height: 200px; display:block">
            </a>
               <p class="detail-region">${mypage.MO_DETAILREGION }</p>
               <p class="moim-title">${mypage.MO_TITLE}
               <span class="moim-people">[${mypage.MOIMMEMBER} / ${mypage.MO_MAXPEOPLE }]
               <span class="detail-cate"> # ${mypage.MO_DETAILCATEGORY }</span></span></p>
               <hr class="hrhr">
               <p class="mo-cost"> ${mypage.MO_COST }
            </div>
            </div>
            </c:forEach>
         
         </div>
   </div>
   </section>
   </c:if>
   
   
   
   <c:if test="${mypageCategory eq '2' }">
   <div class="pro_sec">
   <p style="font-size: 15px; float: right; margin-top: 30px;">비공개
      <label class="switch-button" style="position: relative; display: inline-block; width: 54px; height: 30px; left: 2px; bottom: 12px; vertical-align: sub;">
         <input type="checkbox" onclick="checkReview()" id="private1" value="1" <c:if test="${privateCheck eq '1' || privateCheck eq '2'}">checked</c:if>>
      <span class="onoff-switch"></span>
   </label></p>
   </div>
   <section id="2">
   <div class="container" style="width:900px; margin-top: 5%;">
   <div class="row gy-5" style="width:900px;">
   
      <c:forEach begin="0" end="${fn:length(mypageInfo[4])}" items="${mypageInfo[4]}" var="mypage">
      <div class="col-lg-3 menu-item">
      <div class="row gy-5">
      <a onclick= "location.href='/moim/${mypage.MO_CATEGORY}/${mypage.MO_IDX}.sosu'">
         <input type="hidden" name="MO_CATEGORY" value="${mypage.MO_CATEGORY}">
            <input type="hidden" name="MO_IDX" value="${mypage.MO_IDX}">
            <img src="${pageContext.request.contextPath}/resources/img/icons/list.png" style="width: 200px; height: 200px; display:block">
      </a>
     
         <p class="detail-region">${mypage.MO_DETAILREGION }</p> 
         <p class="moim-title">${mypage.MO_TITLE}
         <span class="moim-people">[${mypage.MOIMMEMBER} / ${mypage.MO_MAXPEOPLE }]
         <span class="detail-cate"> # ${mypage.MO_DETAILCATEGORY }</span></span></p>
         <hr class="hrhr">
         <p class="mo-cost"> ${mypage.MO_COST }
      </div>
      </div>
      </c:forEach>
   
   </div>
   </div>
   </section>
   </c:if>
   
   <c:if test="${mypageCategory eq '3' }">
   <section id="3"><br/>
   
      <button type="submit" <c:if test="${selectReview eq '5'}">class="btn-review on"</c:if>
         <c:if test="${selectReview ne '5'}">class="btn-review"</c:if>
      id="check5">내가 남긴 리뷰 (${fn:length(mypageInfo[5])})</button>
   <button type="submit" <c:if test="${selectReview eq '6'}">class="btn-review on"</c:if>
         <c:if test="${selectReview ne '6'}">class="btn-review"</c:if>
      id="check6">내가 남긴 리뷰 (${fn:length(mypageInfo[6])})</button>      
   
      <div class="container" style="width:900px; margin-top: 2%;">
         <div class="row gy-5">
            <c:if test="${selectReview eq '5' }">
               <c:forEach begin="0" end="${fn:length(mypageInfo[5])}" items="${mypageInfo[5]}" var="mypage">
                  <div class="col-lg-3 menu-item">
                  <div class="row gy-5">
                     <img src="${pageContext.request.contextPath}/resources/img/icons/list.png" style="width: 200px; height: 200px; display:block">
                     <p class="rezimm-title">${mypage.MO_TITLE}<span class="moim-date">
                     <fmt:formatDate value="${mypage.MO_REGDATE}" pattern="yyyy-MM-dd"/></span></p>
                     <hr class="hrhr" style="width:200px;">
                     <p class="review-star" style="color: #ffc81e;text-align: left;margin-top: -10px;">
                        <c:if test="${mypage.RV_STAR eq 1}"><c:out value="★☆☆☆☆"/></c:if> 
                        <c:if test="${mypage.RV_STAR eq 2}"><c:out value="★★☆☆☆" /></c:if> 
                        <c:if test="${mypage.RV_STAR eq 3}"><c:out value="★★★☆☆" /></c:if> 
                        <c:if test="${mypage.RV_STAR eq 4}"><c:out value="★★★★☆" /></c:if>
                        <c:if test="${mypage.RV_STAR eq 5}"><c:out value="★★★★★" /></c:if>
                     </p>
                  </div>
                  </div>
               </c:forEach>
            </c:if>
      
            <c:if test="${selectReview eq '6' }">   
               <c:forEach begin="0" end="${fn:length(mypageInfo[6])}" items="${mypageInfo[6]}" var="mypage">
                  <div class="col-lg-3 menu-item">
                  <div class="row gy-5">
                     <img src="${pageContext.request.contextPath}/resources/img/icons/list.png" style="width: 200px; height: 200px; display:block">
                     <p class="rezimm-title">${mypage.MO_TITLE}<span class="moim-date">
                     <fmt:formatDate value="${mypage.MO_REGDATE}" pattern="yyyy-MM-dd"/></span></p>
                     <hr class="hrhr" style="width:200px;">
                     <p class="review-star" style="color: #ffc81e;text-align: left;margin-top: -10px;">
                        <c:if test="${mypage.RV_STAR eq 1}"><c:out value="★☆☆☆☆"/></c:if> 
                        <c:if test="${mypage.RV_STAR eq 2}"><c:out value="★★☆☆☆" /></c:if> 
                        <c:if test="${mypage.RV_STAR eq 3}"><c:out value="★★★☆☆" /></c:if> 
                        <c:if test="${mypage.RV_STAR eq 4}"><c:out value="★★★★☆" /></c:if>
                        <c:if test="${mypage.RV_STAR eq 5}"><c:out value="★★★★★" /></c:if>
                     </p>
                  </div>
                  </div>
               </c:forEach>
            </c:if>
         </div>
      </div>
   </section>
   </c:if>
   
   
      <c:if test="${mypageCategory eq '4' }">
      <section id="4"><br/>
   <button type="submit" <c:if test="${selectZzim eq '7'}">class="btn-review on"</c:if>
         <c:if test="${selectZzim ne '7'}">class="btn-review"</c:if>
      id="check7">내가 찜한 모임 (${fn:length(mypageInfo[7]) })</button>      
      
   <button type="submit" <c:if test="${selectZzim eq '8'}">class="btn-review on"</c:if>
         <c:if test="${selectZzim ne '8'}">class="btn-review"</c:if>
      id="check8">내가 찜한 자유게시판 (${fn:length(mypageInfo[8]) })</button>      
   
      <div class="pro_sec">
         <p style="font-size: 15px; float: right; margin-top: 30px;">비공개
         <label class="switch-button" style="position: relative; display: inline-block; width: 54px; height: 30px; left: 2px; bottom: 12px; vertical-align: sub;">
           <input type="checkbox" onclick="checkZzim()" id="private2" value="1" <c:if test="${privateCheck eq '1' || privateCheck eq '3'}">checked</c:if>>
            <span class="onoff-switch"></span>
         </label></p>
      </div>
   
   <div class="container" style="width:900px; margin-top: 5%;">
      <div class="row gy-5" style="width:900px;" id="zzimFreeDiv">
         <c:if test="${selectZzim eq '7' }">
            <c:forEach begin="0" end="${fn:length(mypageInfo[7])}" items="${mypageInfo[7]}" var="mypage">
               <div class="col-lg-3 menu-item">
               <div class="row gy-5" id="zzimMoim">
               <a onclick= "location.href='/moim/${mypage.MO_CATEGORY}/${mypage.MO_IDX}.sosu'">
                  <input type="hidden" name="MO_CATEGORY" value="${mypage.MO_CATEGORY}">
                     <input type="hidden" name="MO_IDX" value="${mypage.MO_IDX}">
                     <img src="${pageContext.request.contextPath}/resources/img/icons/list.png" style="width: 200px; height: 200px; display:block">
               </a>
                
                  <p class="detail-region">${mypage.MO_DETAILREGION }</p>
                  <p class="moim-title">${mypage.MO_TITLE}
                  <span class="moim-people">[${mypage.MOIMMEMBER} / ${mypage.MO_MAXPEOPLE }]
                  <span class="detail-cate" > # ${mypage.MO_DETAILCATEGORY }</span></span></p>
                  <hr class="hrhr" style="width:200px; margin-top: 0px;">
                  <p class="mo-cost"> ${mypage.MO_COST }
                  <div id="parent">
                  <input type="checkbox" id="delZzim1" value="${mypage.Z_IDX}" >
                  </div>
               </div>
               </div>
            </c:forEach>
         </c:if>   
      
      
         <c:if test="${selectZzim eq '8' }">
         
            <c:forEach begin="0" end="${fn:length(mypageInfo[8])}" items="${mypageInfo[8]}" var="mypage">
               <div class="col-lg-3 menu-item">
               <div class="row gy-5" >
                  <img src="${pageContext.request.contextPath}/resources/img/icons/list.png" style="width: 200px; height: 200px; display:block">
                  
                  <p class="moim-title" style="margin-top: 10px;">
                  <span>
                  <img class="img-pro-free" src="${pageContext.request.contextPath}/resources/img/upload/${mypage.PROFILE}"></span>
                  &nbsp;${mypage.FR_WRITER}</p>
                  <p class="moim-title"> ${mypage.FR_TITLE }</p>
                  <hr class="hrhr" style="width:200px; margin-top: 0px;">
                  <div id="parent">
                  <input type="checkbox" id="delZzim2" value="${mypage.Z_IDX}" >
                  <!-- <span class="hhh" style="text-align:right; width: 200px; margin-top:-19px;" >♥</span> -->
                  </div>
               </div>
               </div>
            </c:forEach>
         </c:if>
      </div>
   </div>
   </section>
   </c:if>
   
   </form>
</body>
</html>