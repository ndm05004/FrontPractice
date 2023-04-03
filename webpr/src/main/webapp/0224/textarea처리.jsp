<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<style>
		table{
			border: 1px solid lightblue;
			argin: 50px auto;
		}
		
		td{
			width : 250px;
			height: 50px;
			text-align: center;
		}
		td:nth-child(1){
			background-color: pink;
		}
		
		div{
			widht : 500px;
			border: 1px solid lightblue;
			margin: 50px auto;
			padding: 10px;
			height: 500px;
			
		}
		p{
			border: 1px solid green;
		}
		
		p:nth-child(1){
			background-color: pink;
		}
		
		p:nth-child(2){
			height: 85%
		}
		
	</style>
	
</head>
<body>


<%

	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String tel = request.getParameter("tel");
	String area = request.getParameter("area");
	
	
	String rep = area.replaceAll("\r", "").replaceAll("\n", "<br>");

%>

<table border="1">
		<tr>
			<td>이름</td>
			<td><%=name %></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><%=id%></td>
		</tr>

		<tr>
			<td>전화번호</td>
			<td><%=tel%></td>
		</tr>
	
	</table>
	
	<div>
		<p><span>자기소개</span></p>
		<p><%=rep%></p>
	</div>
	
</body>
</html>


