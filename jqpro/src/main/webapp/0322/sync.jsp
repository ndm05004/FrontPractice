<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

table {
	border : 1px solid blue;
	
}

td{
	width: 300px;
	height: 40px;
	text-align: center;
}

</style>

</head>
<body>

<%
	// 요청시 전송 데이터 받기
	
	
	// 데이터로 처리 수행 _ DB와 연결해서 CRUD
	
	
	// 처리 결과로 응답 데이터를 생성 - json Object 생성
	String sid = "a001";
%>


<table border="1">

	<tr>
		<td>아이디</td>
		<td>이름</td>
		<td>전화번호</td>
		<td>이메일</td>
	</tr>

	<tr>
		<td><%= sid %></td>
		<td>고양이</td>
		<td>010-14</td>
		<td>@gmail.com</td>
	</tr>
	
	<tr>
		<td>a005</td>
		<td>강아지</td>
		<td>010-15</td>
		<td>@gmail.com</td>
	</tr>
	
	<tr>
		<td>a006</td>
		<td>동물</td>
		<td>010-16</td>
		<td>@gmail.com</td>
	</tr>

	<tr>
		<td>a007</td>
		<td>짐승</td>
		<td>010-17</td>
		<td>@gmail.com</td>
	</tr>

</table>

</body>
</html>