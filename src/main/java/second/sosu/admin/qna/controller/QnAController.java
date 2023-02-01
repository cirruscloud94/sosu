package second.sosu.admin.qna.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import second.sosu.admin.qna.service.QnAService;
import second.sosu.common.domain.CommandMap;

@Controller
public class QnAController {
	
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="qnaService")
	private QnAService qnaService;
	
	/** 일반 유저들이 볼 수 있는 QnA 페이지
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/help/qna.sosu") 
	public ModelAndView freeList(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("/help/qna");
		mv.setViewName("/help/qna");
		
		List<Map<String, Object>> list = qnaService.qnaList(commandMap.getMap());
		
		mv.addObject("list", list);
	  
		return mv; 
	}

}
