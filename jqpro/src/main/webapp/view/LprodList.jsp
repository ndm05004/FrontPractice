<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// Controller에서 저장된 처리결과값을 꺼낸다.
List<LprodVO> varlist = (List<LprodVO>)request.getAttribute("list");

Gson gson = new Gson();

String result = gson.toJson(varlist);

out.print(result);
out.flush();

%>

<%--
[

 <%
 	for(int i=0; i<varlist.size(); i++){
 		LprodVO vo = varlist.get(i);
 		if(i > 0) out.print(",");
 %>		
 	{
 		"id"  : "<%= vo.getLprod_id() %>",
 		"gu"  : "<%= vo.getLprod_gu() %>",
 		"nm"  : "<%= vo.getLprod_nm() %>"
 	}	
 <%		
 	}
 %>
 

]
    --%>
    