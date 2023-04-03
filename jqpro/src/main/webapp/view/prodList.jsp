<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// controller에서 저장된 결과값 꺼내기

List<ProdVO> list = (List<ProdVO>)request.getAttribute("list");

JsonObject obj = new JsonObject();

// gson은 VO에 있는 데이터를 가져올 때만 사용한다.

if(list != null && list.size() > 0){
	obj.addProperty("flag", "ok");
	
	Gson gson = new Gson();
	JsonElement jele = gson.toJsonTree(list);
	
	obj.add("datas", jele);
}else{
	obj.addProperty("flag", "no");
}

out.print(obj);
out.flush();

%>

<%--
{ "flag" : "ok",
  "datas" : 
[

	<%
		for(int i=0; i<list.size(); i++){
			ProdVO vo = list.get(i);
			if(i > 0) out.print(",");
	%>
			{
				"id" : "<%= vo.getProd_id() %>",
				"name" : "<%= vo.getProd_name() %>"
			
			}
	<%
		}
	%>
]
}
<%
} else{
%>
	{
		"flag" : "no"
	}
<%
}
%>
 --%>