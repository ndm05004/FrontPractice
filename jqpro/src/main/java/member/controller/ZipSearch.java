package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.ZipVO;

/**
 * Servlet implementation class ZipSearch
 */
@WebServlet("/ZipSearch.do")
public class ZipSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		//전송 데이터 dong값 가져오기
		String dong = request.getParameter("dong");
		
		//service 객체 얻기
		IMemberService serivce = MemberServiceImpl.getInstance();
		
		//service메소드 호출 -결과값 받기
		List<ZipVO> list= serivce.selectByDong(dong);
		
		//결과값을 request에 저장하기
		request.setAttribute("list", list);
		
		//view페이지로 이동
		request.getRequestDispatcher("/view/zipList.jsp").forward(request, response);
	}

}
