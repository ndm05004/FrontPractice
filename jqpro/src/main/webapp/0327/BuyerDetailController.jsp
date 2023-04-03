<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@page import="kr.or.ddit.buyer.service.BuyerServiceImpl"%>
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
// 요청시 데이터 받기 -id
String buyerId = request.getParameter("id");

//service 객체 얻기
IBuyerService service = BuyerServiceImpl.getInstance();

//service메소드 호출 - 결과값 받기
BuyerVO vo = service.selectById(buyerId);

//결과값을 requset에 저장
request.setAttribute("vo", vo);

//view페이지로 이동
RequestDispatcher disp = request.getRequestDispatcher("/view/buyerDetail.jsp");

disp.forward(request, response);

 %>
 
</body>
</html>