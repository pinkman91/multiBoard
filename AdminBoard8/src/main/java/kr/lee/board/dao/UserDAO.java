package kr.lee.board.dao;

import kr.lee.board.vo.UserVO;

public interface UserDAO {
	public void userInsert(UserVO vo);
	public void userRoleInsert(UserVO vo);
}
