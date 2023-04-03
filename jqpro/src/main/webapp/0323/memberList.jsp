<%@page import="member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="member.service.MemberServiceImpl"%>
<%@page import="member.service.IMemberService"%>
<%@page import="member.dao.IMemberDao"%>
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
	// 요청시 전송 데이터 받기
	
	
	// service객체가 필요
	
	IMemberService service = MemberServiceImpl.getInstance();
	
	List<MemberVO> list = service.getAllMember();
	
	// 처리결과를 request에 저장
	request.setAttribute("listvalue", list);
	
	
	// 처리 결과로 view페이지로 이동시켜 응답 데이터를 생성 - json 배열을 생성한다.
	// 이동방법 
	RequestDispatcher disp = request.getRequestDispatcher("/view/listData.jsp");
	disp.forward(request, response);
	
%>

</body>
</html>