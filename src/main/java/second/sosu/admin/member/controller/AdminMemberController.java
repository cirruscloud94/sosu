package second.sosu.admin.member.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import second.sosu.common.domain.CommandMap;
import second.sosu.members.member.service.MemberService;

@Controller
public class AdminMemberController {

   Logger log = Logger.getLogger(this.getClass());

   @Resource(name = "memberService")
   private MemberService memberService;

   @RequestMapping(value = "/admin/memberlist.sosu")
   public ModelAndView adminMemberList(CommandMap commandMap) throws Exception {
      ModelAndView mv = new ModelAndView();      
      if(commandMap.get("listType")==null) {
    	  commandMap.put("listType", "adminMemberList");
      }
      mv.addObject("adminList", memberService.adminMemberList(commandMap.getMap()));
      mv.setViewName("/admin/member/adminMemberList");
      
      return mv;    
   }
   
   @RequestMapping(value = "/admin/memberdetail.sosu")
   public ModelAndView adminMemberDetail(CommandMap commandMap) throws Exception {
      ModelAndView mv = new ModelAndView();
      mv.addObject("memberDetail",memberService.adminMemberDetail(commandMap.getMap()));
      mv.addObject("memberReport",memberService.adminMemberReport(commandMap.getMap()));
      mv.addObject("RECOUNT",commandMap.get("RECOUNT"));
      mv.setViewName("/admin/member/adminMemberDetail");
      return mv;
   }
   
   @ResponseBody
   @RequestMapping(value = "/admin/reportdelete.sosu", method=RequestMethod.POST)
   public int adminMemberReportDelete(@RequestBody Map<String,Object> param) throws Exception {      
      int result;
      try {
    	  memberService.adminMemberReportDelete(param); 
    	  result = 0;
      }catch(Exception e){
    	  e.printStackTrace(); 
    	  result = 1;
      }
      return result;
   }
   
   //정지버튼
   @ResponseBody
   @RequestMapping(value = "/admin/memberstop.sosu", method=RequestMethod.POST)
   public int adminMemberStop(@RequestBody Map<String,Object> param) throws Exception {
	   int result;
	   try {
		   memberService.adminMemberStop(param);
		   result = 0;
	   }catch(Exception e){
		   e.printStackTrace(); 
		   result = 1;
	   }
	   return result;
   }
   
   
   
   // 탈퇴
   @RequestMapping(value = "/admin/memberdelete.sosu", method = RequestMethod.GET)
   public ModelAndView mypageDelete(CommandMap commandMap) throws Exception {
      ModelAndView mv = new ModelAndView();
      commandMap.put("M_IDX", commandMap.get("M_IDX"));
      memberService.mypageDelete(commandMap.getMap());
      mv.setViewName("redirect:/admin/memberlist.sosu");
      return mv;
   }
   
   /** 공지사항 및 QNA 관리
    * 
    * @param commandMap
    * @return
    * @throws Exception
    */
   @GetMapping("/admin/help.sosu")
   public ModelAndView adminHelp(CommandMap commandMap) throws Exception {
	   ModelAndView mv = new ModelAndView("/admin/help/help");
	   mv.setViewName("/admin/help/help");
	   
	   return mv;
   }
}