package kr.lee.board.home;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import kr.lee.board.vo.CommVO;
import kr.lee.board.vo.PagingVO;

@Controller
public class MemberController {
	 
	
	@RequestMapping(value = "/login")
	public ModelAndView login(@RequestParam(value = "error", required = false)	String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}
		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");
		return model;
	}
	
	 
	
	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This page is for ROLE_ADMIN only!");
		model.setViewName("admin");

		return model;

	}
	//for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String accesssDenied(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "403";
	}
//	@RequestMapping(value="/account")
//	public String account() {
//		return "account";
//	}
//	@RequestMapping(value="/accountOk", method = RequestMethod.GET)
//	public String accountOkGet() {
//		return "redirect:/account";
//	}
//	@RequestMapping(value="/accountOk", method = RequestMethod.POST)
//	public String accountOkPost(Account ac, RoleAccount ra) {
//		accService.insert(ac, ra);
//		return "redirect:/login";
//	}
	
	private String getPrincipal(){
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }

}