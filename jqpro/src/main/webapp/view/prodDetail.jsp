<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
//controller에서 저장한 데이터 꺼내기

ProdVO pvo = (ProdVO)request.getAttribute("prodvo");

Gson gson = new Gson();

String vo = gson.toJson(pvo);

out.print(vo);
out.flush();

%>

<%--
{
	"id" : "<%=pvo.getProd_id() %>",
	"lgu" : "<%=pvo.getProd_lgu() %>",
	"name" : "<%=pvo.getProd_name() %>",
	"price" : "<%=pvo.getProd_price() %>",
	"detail" : "<%=pvo.getProd_detail() %>",
	"cost" : "<%=pvo.getProd_cost() %>",
	"buyer" : "<%=pvo.getProd_buyer() %>",
	"sale" : "<%=pvo.getProd_sale() %>",
	"outline" : "<%=pvo.getProd_outline() %>"
}
 --%>