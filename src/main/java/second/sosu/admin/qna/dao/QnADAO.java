package second.sosu.admin.qna.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import second.sosu.common.dao.AbstractDAO;

@Repository("qnaDAO")
public class QnADAO extends AbstractDAO {
	
//	페이징
	@SuppressWarnings("unchecked") 
	public List<Map<String,Object>>qnaList(Map<String, Object> map) throws Exception {
		
		return(List<Map<String,Object>>)selectList("help.qnaList", map); 
	}
	
//	작성
	public void qnaWrite(Map<String, Object> map) throws Exception {
		
		insert("help.qnaWrite", map);
	}
	
//	수정
	public void qnaUpdate(Map<String, Object> map) throws Exception {
		
		update("help.qnaUpdate", map);
	}
	
//	삭제
	public void qnaDelete(Map<String, Object> map) throws Exception {
		
		update("help.qnaDelete", map);
	}
}
