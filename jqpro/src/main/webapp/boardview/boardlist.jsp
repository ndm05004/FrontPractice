<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%

List<BoardVO> list = (List<BoardVO>)request.getAttribute("listValue");

int startPage = (int)request.getAttribute("startPage");
int endPage = (int)request.getAttribute("endPage");
int totalPage = (int)request.getAttribute("totalPage");


JsonObject obj = new JsonObject();
obj.addProperty("sp", startPage);
obj.addProperty("ep", endPage);
obj.addProperty("tp", totalPage);


Gson gson = new Gson();

JsonElement result = gson.toJsonTree(list);

obj.add("datas", result);

out.print(obj);
out.flush();
%>