package kr.lee.board;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.support.RequestContextUtils;

import kr.lee.board.service.UserService;
import kr.lee.board.vo.CommVO;
import kr.lee.board.vo.CommentVO;
import kr.lee.board.vo.UserVO;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	// 회원가입페이지 이동
	@RequestMapping(value = "/userSignUp")
	public String userInsert() {
		
		return "userSignUp";
	}
	
	// 회원가입
	@RequestMapping(value = "/userSignUpOk")
	public String userInsertOk(@ModelAttribute UserVO userVO,HttpServletRequest request) {
		logger.info("userInsertOk"+userVO);
		
		FlashMap map = RequestContextUtils.getOutputFlashMap(request);
		map.put("name", userVO.getName());
		
		userService.userInsert(userVO);
		userService.userRoleInsert(userVO);
		
		return "redirect:/userSignUpComplete";
	}

	@RequestMapping(value = "/userSignUpComplete")
	public String userSignUpComplete(@ModelAttribute UserVO userVO,Model model,HttpServletRequest request) {
		logger.info("userSignUpComplete"+userVO);
		
		
		//리다이렉트 된 페이지 에서 flashMap 선언

		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);

		//값이있다면 쓰는걸로~

		if(flashMap !=null) {  

			model.addAttribute("userName",userVO.getName());

		}
		
		
		
		return "userSignUpComplete";
	}
	
}
