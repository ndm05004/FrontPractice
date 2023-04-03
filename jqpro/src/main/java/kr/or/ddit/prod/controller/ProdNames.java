package kr.or.ddit.prod.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.prod.vo.ProdVO;


@WebServlet("/ProdNames.do")
public class ProdNames extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdNames() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 요청시 전송데이터 받기 -lprod-gu
		String lgu = request.getParameter("guValue");
		
		// service객체 얻어오기
		IProdService service = ProdServiceImpl.getInstance();
		
		// service메소드 호출 - 결과값 받기
		List<ProdVO> list = service.selectIdName(lgu);
		
		// 결과값을 저장
		request.setAttribute("list", list);
		
		//view페이지로 결과값을 보냄
		request.getRequestDispatcher("/view/prodList.jsp").forward(request, response);
		
	}

}
