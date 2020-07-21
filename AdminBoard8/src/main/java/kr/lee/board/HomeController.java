package kr.lee.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
public class HomeController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private BoardConfigService boardConfigService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/") // 바꿈
	public String home(@ModelAttribute CommVO commVO, Model model, HttpServletRequest request) {

		model.addAttribute("user", getPrincipal());

		List<BoardConfigVO> list = boardConfigService.selectList();

		model.addAttribute("list", list);
		logger.info("BoardConfigController.home : " + list);
		return "home";
	}
 
	
	@RequestMapping(value = "/index")
	public String index(@ModelAttribute CommVO commVO,BoardConfigVO boardConfigVO,Model model, HttpServletRequest request) {
		// POST 전송으로 값이 넘어오면 처리
		 String referer = request.getHeader("Referer");
		  
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if (flashMap != null) {
			Integer p = (Integer) flashMap.get("p");
			if (p != null)
				commVO.setCurrentPage(p);
			Integer s = (Integer) flashMap.get("s");
			if (s != null)
				commVO.setPageSize(s);
			Integer b = (Integer) flashMap.get("b");
			if (b != null)
				commVO.setBlockSize(b);
			String tb = (String) flashMap.get("tb");
			if (tb != null)
				commVO.setTb(tb);
			String boardName = (String) flashMap.get("boardName");
			if (boardName != null)
				commVO.setBoardName(boardName);
			else
				logger.info("!!!!!!");
		}
		
		
		if (commVO.getTb() == null || commVO.getTb().trim().length() == 0) {
//			commVO.setTb("freeboard");
//			commVO.setTableName("freeboard");
			  return "redirect:/";
		}
		
		PagingVO<BoardVO> pagingVO = 
				boardService.selectList(commVO.getTb(), commVO.getCurrentPage(), commVO.getPageSize(), commVO.getBlockSize(),commVO.getBoardName());
		pagingVO.setTableName(commVO.getTableName());
		pagingVO.setBoardName(commVO.getBoardName());
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("commVO", commVO);
		model.addAttribute("newLine", "\n");
		model.addAttribute("br", "<br/>");
		model.addAttribute("user", getPrincipal());
		logger.info("HomeController.index : " + pagingVO.toString());
		logger.info("HomeController.index : " + commVO.toString());
		return "index";
	}

	
	
	
	@RequestMapping(value = "/insert")
	public String insert(@ModelAttribute CommVO commVO,BoardVO boardVO, Model model, HttpServletRequest request) {
		logger.info("HomeController.insert : " + commVO.toString());
		model.addAttribute("commVO", commVO);
		model.addAttribute("user", getPrincipal());
		return "insert";
	}

	@RequestMapping(value = "/insertOK",method = RequestMethod.GET )
	public String insertOKGet() {
		logger.info("HomeController.insertOKGet!!!");
		return "redirect:/index";
	}

	@RequestMapping(value = "/insertOk" ,method = RequestMethod.POST) //가지고놈
	public String insertOKPost(@ModelAttribute BoardVO boardVO, @ModelAttribute CommVO commVO, Model model,
			HttpServletRequest request) {
		logger.info("HomeController.insertOKPost : " + commVO.toString());
		logger.info("HomeController.insertOKPost : " + boardVO.toString());
		boardService.insert(boardVO);
		FlashMap map = RequestContextUtils.getOutputFlashMap(request);
		map.put("p", 1);
		map.put("s", commVO.getPageSize());
		map.put("b", commVO.getBlockSize());
		map.put("tb", commVO.getTableName());
		map.put("boardName", commVO.getBoardName());
//		model.addAttribute("user", getPrincipal());
		return "redirect:/index";
	}
	@RequestMapping(value = "/view")
	public String view(@ModelAttribute CommVO commVO, Model model, HttpServletRequest request) {
		logger.info("뷰 : " + commVO.toString());
		// POST 전송으로 값이 넘어오면 처리
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if (flashMap != null) {
			Integer p = (Integer) flashMap.get("p");
			if (p != null)
				commVO.setCurrentPage(p);
			Integer s = (Integer) flashMap.get("s");
			if (s != null)
				commVO.setPageSize(s);
			Integer b = (Integer) flashMap.get("b");
			if (b != null)
				commVO.setBlockSize(b);
			Integer m = (Integer) flashMap.get("m");
			if (m != null)
				commVO.setMode(m);
			Integer idx = (Integer) flashMap.get("idx");
			if (idx != null)
				commVO.setIdx(idx);
			String tb = (String) flashMap.get("tb");
			if (tb != null)
				commVO.setTableName(tb);
			String boardName = (String) flashMap.get("boardName");
			if (tb != null)
				commVO.setBoardName(boardName);
		}

		BoardVO vo = boardService.selectByIdx(commVO.getTableName(), commVO.getIdx(), commVO.getMode());

		model.addAttribute("vo", vo);
		model.addAttribute("commVO", commVO);
		model.addAttribute("newLine", "\n");
		model.addAttribute("br", "<br/>");
		model.addAttribute("user", getPrincipal());
		return "view";
	}

	// 댓글저장
	@RequestMapping(value = "/CommentInsertOk")
	public String commentInsertOk(@ModelAttribute CommentVO commentVO, @ModelAttribute CommVO commVO, Model model,
			HttpServletRequest request) {
		commentVO.setIp(request.getRemoteAddr());
		boardService.commentInsert(commentVO);

		FlashMap map = RequestContextUtils.getOutputFlashMap(request);
		map.put("p", commVO.getCurrentPage());
		map.put("s", commVO.getPageSize());
		map.put("b", commVO.getBlockSize());
		map.put("idx", commentVO.getRef());
		map.put("m", 0);
		map.put("tb", commVO.getTableName());
		map.put("boardName", commVO.getBoardName());
		model.addAttribute("user", getPrincipal());
		return "redirect:/view";
	}

	// 댓글수정
	@RequestMapping(value = "/CommentUpdateOk")
	public String commentUpdateOk(@ModelAttribute CommentVO commentVO, @ModelAttribute CommVO commVO, Model model,
			HttpServletRequest request) {
		commentVO.setIp(request.getRemoteAddr());
		boardService.commentUpdate(commentVO);

		FlashMap map = RequestContextUtils.getOutputFlashMap(request);
		map.put("p", commVO.getCurrentPage());
		map.put("s", commVO.getPageSize());
		map.put("b", commVO.getBlockSize());
		map.put("idx", commentVO.getRef());
		map.put("m", 0);
		map.put("tb", commVO.getTableName());
		map.put("boardName", commVO.getBoardName());
		model.addAttribute("user", getPrincipal());
		
		return "redirect:/view";
	}

	// 댓글삭제
	@RequestMapping(value = "/CommentDeleteOk")
	public String commentDeleteOk(@ModelAttribute CommentVO commentVO, @ModelAttribute CommVO commVO, Model model,
			HttpServletRequest request) {

		boardService.commentDelete(commentVO);

		FlashMap map = RequestContextUtils.getOutputFlashMap(request);
		map.put("p", commVO.getCurrentPage());
		map.put("s", commVO.getPageSize());
		map.put("b", commVO.getBlockSize());
		map.put("idx", commentVO.getRef());
		map.put("m", 0);
		map.put("tb", commVO.getTableName());
		map.put("boardName", commVO.getBoardName());
		model.addAttribute("user", getPrincipal());
		return "redirect:/view";
	}

	// 수정하기
	@RequestMapping(value = "/update") // 폼
	public String update(@ModelAttribute CommVO commVO, Model model) {
		BoardVO vo = boardService.selectByIdx(commVO.getTableName(), commVO.getIdx(), commVO.getMode());
		model.addAttribute("vo", vo);
		model.addAttribute("commVO", commVO);
		model.addAttribute("user", getPrincipal());
		return "update";
	}

	@RequestMapping(value = "/updateOk", method = RequestMethod.GET) // 수정
	public String updateOkGet() {
		return "redirect:/";
	}

	@RequestMapping(value = "/updateOk", method = RequestMethod.POST) // 수정
	public String updateOkPost(@ModelAttribute BoardVO freeBoardVO, @ModelAttribute CommVO commVO, Model model,
			HttpServletRequest request) {
		boardService.update(freeBoardVO);
		FlashMap map = RequestContextUtils.getOutputFlashMap(request);
		map.put("p", commVO.getCurrentPage());
		map.put("s", commVO.getPageSize());
		map.put("b", commVO.getBlockSize());
		map.put("idx", freeBoardVO.getIdx());
		map.put("m", 0);
		map.put("tb", commVO.getTableName());
		map.put("boardName", commVO.getBoardName());
		model.addAttribute("user", getPrincipal());
		return "redirect:/view";
	}

	// 삭제하기
	@RequestMapping(value = "/delete") // 폼
	public String delete(@ModelAttribute CommVO commVO, Model model) {
		BoardVO vo = boardService.selectByIdx(commVO.getTableName(), commVO.getIdx(), commVO.getMode());
		model.addAttribute("vo", vo);
		model.addAttribute("commVO", commVO);
		model.addAttribute("user", getPrincipal());
		return "delete";
	}

	@RequestMapping(value = "/deleteOk", method = RequestMethod.GET) // 삭제
	public String deleteOkGet() {
		return "redirect:/";
	}

	@RequestMapping(value = "/deleteOk", method = RequestMethod.POST) // 삭제
	public String deleteOk(@ModelAttribute BoardVO freeBoardVO, @ModelAttribute CommVO commVO, Model model,
			HttpServletRequest request) {
		boardService.delete(freeBoardVO);
		FlashMap map = RequestContextUtils.getOutputFlashMap(request);
		map.put("p", commVO.getCurrentPage());
		map.put("s", commVO.getPageSize());
		map.put("b", commVO.getBlockSize());
		map.put("tb", commVO.getTableName());
		map.put("boardName", commVO.getBoardName());
		model.addAttribute("user", getPrincipal());
		return "redirect:/index";
	}

	// 시큐리티 영역ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminPage(ModelMap model, HttpServletRequest request) {

		model.addAttribute("user", getPrincipal());
		// 여기서부터 코딩
		logger.info("BoardConfigController.admin.list");
		List<BoardConfigVO> list = boardConfigService.selectList();

		model.addAttribute("list", list);
		logger.info("BoardConfigController.list : " + list);
		return "admin";

		// 게시판 리스트 값 불러오는 코딩

	}

	@RequestMapping(value = "/dba", method = RequestMethod.GET)
	public String dbaPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "dba";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "accessDenied";
	}

	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
}
