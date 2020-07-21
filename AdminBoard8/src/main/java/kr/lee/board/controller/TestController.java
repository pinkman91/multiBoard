package kr.lee.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import kr.lee.board.service.TestService;
import kr.lee.board.vo.TestVO;

@Controller
public class TestController {

	@Autowired
	private TestService testService;
	
	@RequestMapping(value="/testVO")
	@ResponseBody
	public TestVO testObject() {
		return new TestVO(1,"한사람",22);
	}
	
	@RequestMapping(value="/testText" , produces="text/plain;charset=utf-8")
	@ResponseBody
	public String testText() {
		return "한글qwerty`12345!@#$%";
	}

	@RequestMapping(value="/testDB")
	public String testDB(Model model) {
		model.addAttribute("today", testService.today());
		model.addAttribute("mul", testService.mul(12,34));
		model.addAttribute("sum", testService.sum(1,2,3));
		return "testDB";
	}
	
	// 리다이렉트시 POST 전송하기
	// 보낼때 1
	@RequestMapping("/redirect1")
	public String redirectnewpage(RedirectAttributes redirectAttributes){
	    redirectAttributes.addFlashAttribute("name", "한사람");
	    redirectAttributes.addFlashAttribute("age", "22");
	    return "redirect:/herepage1";
	}
	// 받을때 1
	@RequestMapping(value = "/herepage1")
	public String herepagePost(HttpServletRequest request, Model model){
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap !=null) {  
		     model.addAttribute("name", flashMap.get("name"));
		     model.addAttribute("age", flashMap.get("age"));
		}
	    return "herepage1";
	}
	// 보낼때 2
	@RequestMapping("/redirect2")
	public String redirectnewpage2(HttpServletRequest request){
		FlashMap map = RequestContextUtils.getOutputFlashMap(request);
		map.put("name", "두사람");
		map.put("age", "33");
		return "redirect:/herepage2";
	}
	// 받을때 2
	@RequestMapping(value = "/herepage2")
	public String herepagePost2(HttpServletRequest request, Model model){
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap !=null) {  
			model.addAttribute("name", flashMap.get("name"));
			model.addAttribute("age", flashMap.get("age"));
		}
		return "herepage2";
	}

}
