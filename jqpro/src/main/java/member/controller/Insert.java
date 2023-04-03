package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;

/**
 * Servlet implementation class Insert
 */
@WebServlet("/Insert.do")
public class Insert extends HttpServlet {
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
		
		request.setCharacterEncoding("utf-8");
		
		//요청시 전송데이터 받기 - 9개 - id, name, pass, mail, hp, bir, zip, add1, add2
		String memId = request.getParameter("mem_id");
		String memName = request.getParameter("mem_name");
		String memPass = request.getParameter("mem_pass");
		String memMail = request.getParameter("mem_mail");
		String memHp = request.getParameter("mem_hp");
		String memBir = request.getParameter("mem_bir");
		String memZip = request.getParameter("mem_zip");
		String memAdd1 = request.getParameter("mem_add1");
		String memAdd2 = request.getParameter("mem_add2");
		
		
	
		//vo클래스에 저장
		MemberVO vo = new MemberVO();
		vo.setMem_id(memId);
		vo.setMem_name(memName);
		vo.setMem_pass(memPass);
		vo.setMem_mail(memMail);
		vo.setMem_hp(memHp);
		vo.setMem_bir(memBir);
		vo.setMem_zip(memZip);
		vo.setMem_add1(memAdd1);
		vo.setMem_add2(memAdd2);
		
		
		//service객체 얻어오기
		IMemberService service = MemberServiceImpl.getInstance();
		
		//service메소드 호출하기 - 결과값 받기
		int res = service.insertMember(vo);
		
		// 결과값 request에 저장
		request.setAttribute("resvalue", res);
		
		// view페이지로 이동
		request.getRequestDispatcher("/view/insert.jsp").forward(request, response);
		
	}

}
