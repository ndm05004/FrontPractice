<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//controller에서 저장한 값 꺼내기
int res = (Integer)request.getAttribute("res");

if(res > 0){
%>	
	{
		
		"flag" : "okay"
	
	}
<%}else{%>
	{
	
		"flag" : "no"
	
	}
<%	
}

%>