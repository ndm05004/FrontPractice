<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
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
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String foods[] = request.getParameterValues("foods");
	String foods2[] = request.getParameterValues("foods2");
	String str = "";
	String str2 = "";
	
	
	for(String ss : foods){
		str += ss + "<br>";
	}
	
	for(String ss : foods2){
		str2 += ss + "<br>";
	}

%>


<table border="1">
	
	<tr>
		<td>아이디</td>
		<td><%=id %></td>
	</tr>

	<tr>
		<td>이름</td>
		<td><%=name %></td>
	</tr>
	
	<tr>
		<td>좋아하는 음식</td>
		<td><%=str %></td>
	</tr>
	
	<tr>
		<td>좋아하는 음식2</td>
		<td><%=str2 %></td>
	</tr>	

</table>





</body>
</html>