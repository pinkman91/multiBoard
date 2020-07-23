package kr.lee.board.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.lee.board.dao.BoardDAO;
import kr.lee.board.dao.CommentDAO;
import kr.lee.board.vo.BoardVO;
import kr.lee.board.vo.CommentVO;
import kr.lee.board.vo.PagingVO;

@Service
public class BoardService {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private CommentDAO commentDAO;

	static Logger logger = LoggerFactory.getLogger(BoardService.class);
	// --------------------------------------------------------------

	// 1. 1개 얻기 -- 내용보기, 수정, 삭제
	public BoardVO selectByIdx(String tableName, int idx, int mode) {
		logger.info("BoardService.selectByIdx 인수 : " + tableName + "," + idx + ", " + mode);
		BoardVO vo = null; // 이부분만 변경
		try {
			// ------------------------------------------------------------------
			// 이부분만 변경
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("tableName", tableName);
			map.put("idx", idx + "");
			vo = boardDAO.selectByIdx(map);
			if (vo != null && mode == 1) { // 조회수 증가
				boardDAO.hitUpdate(map); // DB의 조회수 증가
				vo.setHit(vo.getHit() + 1); // VO의 조회수 증가
			}
			if (vo != null) {
				// 댓글을 가져온다.
				HashMap<String, String> map2 = new HashMap<String, String>();
				map2.put("tableName", tableName);
				map2.put("ref", vo.getIdx() + "");
				vo.setCommentList(commentDAO.selectList(map2));
			}
			vo.setTb(tableName);
			vo.setTableName(tableName);
			// ------------------------------------------------------------------
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("BoardService.selectByIdx 리턴값 : " + vo);
		return vo; // 이부분만 변경
	}

	// 2. 1페이지 얻기 - 목록보기
	public PagingVO<BoardVO> selectList(String tableName, int currentPage, int pageSize, int blockSize,
			String boardName) {
		logger.info("BoardService.selectList 인수 : " + tableName + "," + currentPage + ", " + pageSize + ", " + blockSize
				+ ", " + boardName);
		PagingVO<BoardVO> pagingVO = null; // 이부분만 변경
		try {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("tableName", tableName);
			map.put("boardName", boardName);
			int totalCount = boardDAO.selectCount(map); // 전체 개수 얻기
			pagingVO = new PagingVO<>(totalCount, currentPage, pageSize, blockSize); // 페이징 객체 생성
			HashMap<String, String> map2 = new HashMap<String, String>();
			map2.put("startNo", pagingVO.getStartNo() + "");
			map2.put("endNo", pagingVO.getEndNo() + "");
			map2.put("tableName", tableName); // 넣었음 ---------★★★★
			List<BoardVO> list = boardDAO.selectList(map2);
			// 댓글 처리를 한다.
			if (list != null) {
				for (BoardVO vo : list) {
					HashMap<String, String> map3 = new HashMap<String, String>();
					map3.put("tableName", tableName);
					map3.put("boardName", boardName);
					map3.put("ref", vo.getIdx() + "");
					vo.setCommentCount(commentDAO.selectCount(map3)); // 댓글의 개수를 구해서 넣는다.
					vo.setTb(tableName);
					vo.setTableName(tableName);
					vo.setBoardName(boardName); // 넣었음 ---------★★★★
				}
			}
			pagingVO.setList(list);
			// ------------------------------------------------------------------
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("BoardService.selectByIdx 리턴값 : " + pagingVO);
		return pagingVO; // 이부분만 변경
	}

	// 3. 저장
	public void insert(BoardVO vo) {
		logger.info("BoardService.insert 인수 : " + vo);
		try {
			// ------------------------------------------------------------------
			if (vo != null) {
				boardDAO.insert(vo);
			}
			// ------------------------------------------------------------------
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 4. 수정하기
	public void update(BoardVO vo) {
		logger.info("BoardService.update 인수 : " + vo);
		try {
			// ------------------------------------------------------------------
			if (vo != null) {
				if (vo.getSubject() != null && vo.getSubject().trim().length() > 0) {
					if (vo.getContent() != null && vo.getContent().trim().length() > 0) {
						if (vo.getIp() != null && vo.getIp().trim().length() > 0) {
							// 여기까지 오면 데이터는 모두 안전하게 들어왔다.!!!
							// 혹시 있을지 모르는 앞뒤 공백 제거
							vo.setName(vo.getName().trim());
							vo.setSubject(vo.getSubject().trim());
							vo.setContent(vo.getContent().trim());
							// dao를 호출해서 수정

							HashMap<String, String> map = new HashMap<String, String>();
							map.put("tableName", vo.getTableName());
							map.put("idx", vo.getIdx() + "");
							boardDAO.update(vo);

						}
					}
				}
			}

			// ------------------------------------------------------------------
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 5. 삭제하기
	public void delete(BoardVO vo) {
		logger.info("BoardService.delete 인수 : " + vo);
		try {
			// ------------------------------------------------------------------
			if (vo != null) {
				// dao를 호출해서 삭제
				// 지금 입력한 비번과 DB의 비번이 같을때만 수정
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("tableName", vo.getTableName());
				map.put("idx", vo.getIdx() + "");
				boardDAO.delete(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 6. 댓글 저장
	public void commentInsert(CommentVO vo) {
		logger.info("BoardService.commentInsert 인수 : " + vo);
		try {
			// 이부분만 변경
			if (vo != null) {
				commentDAO.insert(vo);
			}
			// ------------------------------------------------------------------
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 7. 댓글 수정
	public void commentUpdate(CommentVO vo) {
		logger.info("BoardService.commentUpdate 인수 : " + vo);
		try {
			// ------------------------------------------------------------------
			if (vo != null) {
				// DB의 비번과 현재의 비번이 같은경우만 수정
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("tableName", vo.getTableName());
				map.put("idx", vo.getIdx() + "");
				CommentVO dbVO = commentDAO.selectByIdx(map);
				if (dbVO != null && dbVO.getPassword().equals(vo.getPassword())) {
					commentDAO.update(vo);
				}
			}
			// ------------------------------------------------------------------
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 8. 댓글 삭제
	public void commentDelete(CommentVO vo) {
		logger.info("BoardService.commentDelete 인수 : " + vo);
		try {
			// ------------------------------------------------------------------
			if (vo != null) {
				// DB의 비번과 현재의 비번이 같은경우만 삭제
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("tableName", vo.getTableName());
				map.put("idx", vo.getIdx() + "");
				CommentVO dbVO = commentDAO.selectByIdx(map);
				if (dbVO != null && dbVO.getPassword().equals(vo.getPassword())) {
					commentDAO.delete(map);
				}
			}
			// ------------------------------------------------------------------
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("BoardService.commentDelete 리턴값 : ");
	}

}
