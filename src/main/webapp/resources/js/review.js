//== 리뷰 작성 및 수정 폼 유효성 검증 ==//

function check() 
{
    let title = document.querySelector("#rv_title").value; // 제목
    let contents = document.querySelector("#rv_content").value; //내용
    let imgFile = document.querySelector("#review_file").value; //이미지 파일
    let Category = $('#rate1');

    if($(':radio[name="RV_STAR"]:checked').length < 1)
    {
        alert('별점을 선택해주세요.');           
        
        return false;
    }
    
    if(title == "" || title == null)
    {
        alert('제목을 입력해주세요.');
        
        return false;
    }

    if (contents == "" || contents == null) 
    {
        alert("리뷰를 작성해주세요.");

        return false;
    }

    if(imgFile == "" || imgFile == null)
    {
        alert("이미지를 등록해주세요!");
        return false;
    }
}
//=====================================================================//

//== 리뷰 수정 ==//
$("#rvModify").on("click", function(e){
    let mo_cate = $("input[name='mo_cate']").val();
    
    $.ajax({
        url : "/review/reviewModify.sosu",
        type : "post",
        data : { MO_CATEGORY : mo_cate },
        success : function(data)
        {
            alert("수정이 완료되었습니다!");
            console.log(data);
        }
    }); 
});
//=====================================================================//
