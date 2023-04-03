<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.lprod.service.LprodServiceImpl"%>
<%@page import="kr.or.ddit.lprod.service.ILprodService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	//요청 데이터
	
	
	//service객체를 얻어오기
	ILprodService service = LprodServiceImpl.getinstance();
	
	
	//serive메소드 호출 - 결과 값 받기
	List<LprodVO> list = service.selectAll();
	
	
	//결과값을 request에 저장
	request.setAttribute("list", list);
	
	//view페이지로 이동
	
	//view페이지 명 이름을 넣어줌
	RequestDispatcher rds = request.getRequestDispatcher("/view/LprodList.jsp");
	rds.forward(request, response);
	

%>
</body>
</html>

