package kr.or.ddit.prod.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.prod.vo.ProdVO;


@WebServlet("/ProdDetail.do")
public class ProdDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//요청시 전송데이터 받기
		String prodId = request.getParameter("prodId");
		
		//service객체 얻기
		IProdService service = ProdServiceImpl.getInstance();
		
		//service메소드 호출 - 결과값 받기
		ProdVO vo = service.selectDetail(prodId);
		
		//결과값 저장
		request.setAttribute("prodvo", vo);
		
		//view 페이지로 이동
		request.getRequestDispatcher("/view/prodDetail.jsp").forward(request, response);
		
	}

}
