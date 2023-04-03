<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>

    <style>
      h1 {
        color: red;
      }
      p {
        color: blue;
        font-size: 2em;
      }
    </style>
  </head>
  <body>
    <h1>JSP JAVA Server Page</h1>
    <p>서버내에서 실행되는 프로그램</p>
    <% String userId = request.getParameter("id") ; %> <%= userId %>님
    환영합니다.
  </body>
</html>
