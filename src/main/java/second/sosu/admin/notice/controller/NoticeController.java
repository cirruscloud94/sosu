package second.sosu.admin.notice.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import second.sosu.admin.notice.service.NoticeService;
import second.sosu.common.domain.CommandMap;

@Controller
public class NoticeController {
	
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	/** 일반 이용자들이 볼 수 있는 공지사항 페이지 호출
	 * 
	 * @param commandMap
	 * @param session
	 * @return
	 * @throws Exception
	 */
	
	@GetMapping("/help/notice.sosu") 
	public ModelAndView noticeList(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("/help/notice");
		mv.setViewName("/help/notice");
		
		List<Map<String, Object>> list = noticeService.noticeList(commandMap.getMap());
		
		mv.addObject("list", list);
	  
		return mv; 
	}

}
