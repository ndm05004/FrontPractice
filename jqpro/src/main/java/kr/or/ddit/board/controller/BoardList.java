package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;

/**
 * Servlet implementation class BoardList
 */
@WebServlet("/BoardList.do")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//요청시 전송데이터 가져오기
		int page = Integer.parseInt(request.getParameter("page")); // 최초 실행시 1
		String stype = request.getParameter("stype"); // 최초 실행시 값이 없음
		String sword = request.getParameter("sword"); // 최초 실행시 값이 없음
		
		// service객체 얻기
		IBoardService serivce = BoardServiceImpl.getInstance();
		
		// service메소드 호출하기 - 페이지 처리에 필요한 값들을 계산 
		
		
		// service메소드 - list를 select 결과값 받기
		
		
		// 결과값을 request에 저장
		
		
		//view페이지로 이동
		
		
	}

}
