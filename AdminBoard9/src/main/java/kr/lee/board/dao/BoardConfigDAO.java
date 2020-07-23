package kr.lee.board.dao;

import java.util.HashMap;
import java.util.List;

import kr.lee.board.vo.BoardConfigVO;
import kr.lee.board.vo.BoardVO;

public interface BoardConfigDAO {
	public int selectCount();
	public BoardConfigVO selectByIdx(int idx);
	public BoardConfigVO selectByTableName(HashMap<String, String> map);
	public List<BoardConfigVO> selectList();
	public void insert(BoardConfigVO vo);
	public void update(BoardConfigVO vo);
	public void adminDelete(BoardConfigVO vo);
	public void createSequence1(HashMap<String, String> map);
	public void createTable1(HashMap<String, String> map);
	public void createSequence2(HashMap<String, String> map);
	public void createTable2(HashMap<String, String> map);
	public void createSequence3(HashMap<String, String> map);
	public void createTable3(HashMap<String, String> map);
}
