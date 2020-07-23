package kr.lee.board;

import java.util.List; 
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.support.RequestContextUtils;

import kr.lee.board.service.BoardConfigService;
import kr.lee.board.service.BoardService;
import kr.lee.board.vo.BoardConfigVO;
import kr.lee.board.vo.BoardVO;
import kr.lee.board.vo.CommVO;
import kr.lee.board.vo.CommentVO;
import kr.lee.board.vo.PagingVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardConfigController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private BoardConfigService boardConfigService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardConfigController.class);
	
	
	
//	@RequestMapping(value = "/admin")
//	public String home(Model model, HttpServletRequest request) {
//		logger.info("BoardConfigController.admin.list");
//		List<BoardConfigVO> list = boardConfigService.selectList();
//		
//		model.addAttribute("list", list);
//		logger.info("BoardConfigController.list : " + list);
//		return "admin";
//	}
	
	
	@RequestMapping(value = "/adminInsert")
	public String insert(Model model, HttpServletRequest request) {
		logger.info("BoardConfigController.admin.insert");
		
		return "adminInsert";
	}
	
	
	@RequestMapping(value = "/admin/insertOK")
	public String insertOK(@ModelAttribute BoardConfigVO vo, Model model, HttpServletRequest request) {
		logger.info("BoardConfigController.admin.insertOK");
		boardConfigService.insert(vo);
		return "redirect:/admin";
	}

	@RequestMapping(value = "/admin/delete")
	public String delete(@ModelAttribute BoardConfigVO vo, Model model, HttpServletRequest request) {
		logger.info("BoardConfigController.admin.delete");
	return "adminDelete";
	}
	
	
	
	@RequestMapping(value = "/admin/deleteOk")
	public String deleteOk(@ModelAttribute BoardConfigVO vo, Model model, HttpServletRequest request) {
		logger.info("BoardConfigController.admin.deleteOk");
		boardConfigService.adminDelete(vo);
		return "redirect:/admin";
	}
}





