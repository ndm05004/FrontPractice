package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;

@WebServlet("/ReplyDelete.do")
public class ReplyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//요청시 전송데이터 받기 - renum
		int renum = Integer.parseInt(request.getParameter("renum"));
		
		//service 객체 얻어오기
		IBoardService service = BoardServiceImpl.getInstance();
		
		//service메소드 호출하기 - 결과값 받기
		int cnt = service.deleteReply(renum);
		//request에 결과값 저장하기
		request.setAttribute("res", cnt);
		
		//View페이지로 이동;
		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
