<%@page import="com.google.gson.Gson"%>
<%@page import="member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// Controller에서 저장된 처리결과값을 꺼낸다.
List<MemberVO> varlist = (List<MemberVO>)request.getAttribute("listvalue");


Gson gson = new Gson();

String result = gson.toJson(varlist);

out.print(result);
out.flush(); // 없어도 무관함

%>
<%--
[

 <%
 	for(int i=0; i<varlist.size(); i++){
 		MemberVO vo = varlist.get(i);
 		if(i > 0) out.print(",");
 %>		
 	{
 		"id"  :  "<%= vo.getMem_id() %>",
 		"name"  : "<%= vo.getMem_name() %>",
 		"tel"   : "<%= vo.getMem_hp() %>",
 		"mail"  : "<%= vo.getMem_mail() %>"
 	}	
 <%		
 	}
 %>
 

]

 --%>