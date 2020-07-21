package kr.lee.board.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.lee.board.dao.UserDAO;
import kr.lee.board.vo.UserVO;

@Service
public class UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	static Logger logger = LoggerFactory.getLogger(BoardService.class);
	// 3. 저장
		public void userInsert(UserVO vo) {
			logger.info("UserService.userInsert 인수 : " + vo);
			try {
				// ------------------------------------------------------------------
				if (vo != null) {
					userDAO.userInsert(vo);
				}
				// ------------------------------------------------------------------
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void userRoleInsert(UserVO vo) {
			logger.info("UserService.userRoleInsert 인수 : " + vo);
			try {
				// ------------------------------------------------------------------
				if (vo != null) {
					userDAO.userRoleInsert(vo);
				}
				// ------------------------------------------------------------------
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
