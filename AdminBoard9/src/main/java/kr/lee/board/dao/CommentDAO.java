package kr.lee.board.dao;

import java.util.HashMap;
import java.util.List;

import kr.lee.board.vo.CommentVO;

public interface CommentDAO {
	public int selectCount(HashMap<String, String> map);
	public List<CommentVO> selectList(HashMap<String, String> map);
	public CommentVO selectByIdx(HashMap<String, String> map);
	public void insert(CommentVO vo);
	public void update(CommentVO vo);
	public void delete(HashMap<String, String> map);
}
