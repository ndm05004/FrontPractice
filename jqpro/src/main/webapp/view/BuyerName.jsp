<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//Controller에서 저장한 데이터 꺼내기
List<BuyerVO> volist = (List<BuyerVO>)request.getAttribute("list");


Gson gson = new Gson();

String result = gson.toJson(volist);

out.print(result);
out.flush(); // 없어도 무관함
%>
<%--
[
<%
	for(int i=0; i<volist.size(); i++){
		BuyerVO vo = volist.get(i);
		if( i > 0) out.print(", ");
%>
	{
		"id" : "<%= vo.getBuyer_id() %>",
		"name" : "<%= vo.getBuyer_name() %>"
	}
	
<%
	}
%>

]
--%>