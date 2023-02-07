package second.sosu.members.review.service;

import java.util.List;
import java.util.Map;

public interface ReviewService {

//	리뷰 전체 페이지
	List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception;
//	리뷰 상세보기
	Map<String, Object> reviewDetail(Map<String, Object> map) throws Exception;
//	리뷰 후기 개수
	Map<String, Object> reviewAllListCount(Map<String, Object> map) throws Exception;
//	리뷰 작성
	void insertReview(Map<String, Object> map) throws Exception;
//	리뷰 사진파일 작성
	void insertPhotoReview(Map<String, Object> map) throws Exception;
//	리뷰 수정
	void updateReview(Map<String, Object> map) throws Exception;
//	리뷰 사진파일 수정
	void updatePhotoReview(Map<String, Object> map) throws Exception;
//	리뷰 삭제	
	void deleteReview(Map<String, Object> map) throws Exception;
	
}
