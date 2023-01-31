$("#rvModify").on("click", function(e){
    let mo_cate = $("#mo_cate").val();
    
    $.ajax({
        url : "/review/reviewModify.sosu",
        type : "post",
        data : { MO_CATEGORY : mo_cate },
        success : function(data)
        {
            alert("수정이 완료되었습니다!");
        }
    }); 
});