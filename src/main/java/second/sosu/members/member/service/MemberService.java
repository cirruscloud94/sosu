package second.sosu.members.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface MemberService {

	// 아이디 중복확인
	int checkId(Map<String, Object> map) throws Exception;

	// 회원가입
	void join(Map<String, Object> map) throws Exception;

	// 로그인
	Map<String, Object> login(Map<String, Object> map) throws Exception;

	// 프로필 사진 여부
	List<Map<String, Object>> profileCheck(Map<String, Object> map) throws Exception;

	// 프로필 삽입
	void profileRegister(Map<String, Object> map, HttpServletRequest request) throws Exception;

	// 아이디찾기
	Map<String, Object> findId(Map<String, Object> map) throws Exception;

	// 비밀번호찾기
	Map<String, Object> findPw(Map<String, Object> map) throws Exception;

	// 마이페이지
	public List<List<Map<String, Object>>> mypage(Map<String, Object> map) throws Exception;

	void mypageModify(Map<String, Object> map, HttpServletRequest request, HttpSession session) throws Exception;

	// 탈퇴하기
	public void mypageDelete(Map<String, Object> map) throws Exception;

	// 프로필 비공개
	public void mypagePrivate(Map<String, Object> map) throws Exception;

}