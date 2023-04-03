package kr.or.ddit.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PageVO;
import kr.or.ddit.board.vo.ReplyVO;

public class BoardServiceImpl implements IBoardService{
	
	private static IBoardService service;
	private IBoardDao dao;
	
	private BoardServiceImpl() {
		dao = BoardDaoImpl.getInstane();
	}
	
	public static IBoardService getInstance() {
		if(service==null) service = new BoardServiceImpl();
		return service;
	}
	
	
	@Override
	public int insertBoard(BoardVO vo) {
		
		return dao.insertBoard(vo);
	}

	@Override
	public int deleteBoard(int num) {

		return dao.deleteBoard(num);
	}

	@Override
	public int updateBoard(BoardVO vo) {

		return dao.updateBoard(vo);
	}

	@Override
	public int updateHit(int num) {
		return dao.updateHit(num);
	}

	@Override
	public List<BoardVO> selectByPage(Map<String, Object> map) {
		return dao.selectByPage(map);
	}

	@Override
	public int insertReply(ReplyVO vo) {
		return dao.insertReply(vo);
	}

	@Override
	public int deleteReply(int renum) {
		return dao.deleteReply(renum);
	}

	@Override
	public int updateReply(ReplyVO vo) {
		return dao.updateReply(vo);
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		return dao.totalCount(map);
	}

	@Override
	public PageVO pageInfo(int page, String stype, String sword) {
		
		// 전체글갯수 구하기
		Map<String, Object> map = new HashMap<>();
		map.put("sword", sword);
		map.put("stype", stype);
		map.put("page", page);
		
		int count = this.totalCount(map);
		
		// 전체 페이지 수 구하기
		int totalPage = count / PageVO.getPerList();
		
		return null;
	}
	
	
	
	
	

}
