package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.ReplyVO;


@WebServlet("/ReplyWrite.do")
public class ReplyWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		
		//요청시 전송 데이터 받기 - cont, bonum, name
		String repName = request.getParameter("name");
		int repBonum = Integer.parseInt(request.getParameter("bonum"));
		String repCont = request.getParameter("cont");
		
		ReplyVO vo = new ReplyVO();
		vo.setBonum(repBonum);
		vo.setCont(repCont);
		vo.setName(repName);
		
		// service객체 얻기
		IBoardService service = BoardServiceImpl.getInstance();
		
		// service메소드 호출 -결과값을 받기
		int res = service.insertReply(vo);
		
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);;
		
	}

}