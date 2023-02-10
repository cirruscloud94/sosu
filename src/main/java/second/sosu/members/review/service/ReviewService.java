package second.sosu.members.review.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ReviewService {

//	리뷰 전체 페이지
	List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception;
//	리뷰 상세보기
	Map<String, Object> reviewDetail(Map<String, Object> map) throws Exception;
//	리뷰 상세보기(사진)
	List<Map<String, Object>> reviewPhotoList(Map<String, Object> map) throws Exception;
//	리뷰 후기 개수
	Map<String, Object> reviewAllListCount(Map<String, Object> map) throws Exception;
//	리뷰 작성(+이미지)
	void insertReview(Map<String, Object> map, HttpServletRequest request) throws Exception;
//	리뷰 수정(+이미지)
	void updateReview(Map<String, Object> map, HttpServletRequest request) throws Exception;
//	리뷰 삭제	
	void deleteReview(Map<String, Object> map) throws Exception;
}
