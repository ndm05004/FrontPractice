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


@WebServlet("/ReplyUpdate.do")
public class ReplyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		//요청시 전송데이터 받기 - cont, renum
		int renum = Integer.parseInt(request.getParameter("renum"));
		String cont = request.getParameter("cont");
		ReplyVO vo = new ReplyVO();
		
		vo.setCont(cont);
		vo.setRenum(renum);
		
		System.out.println(vo.getCont());
		System.out.println(vo.getRenum());
		
		//service객체 얻기
		IBoardService service = BoardServiceImpl.getInstance();
		
		//service메소드 호출- 결과값 받기
		int cnt = service.updateReply(vo);
		
		//request에 결과값 저장하기
		request.setAttribute("res", cnt);
		
		//View페이지로 이동;
		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);
	}

}
