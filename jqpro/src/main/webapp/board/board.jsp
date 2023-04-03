<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<style>

*{
	box-sizing: border-box;
}

p{
	margin : 1px;
	padding : 3px;
	height : auto;
}

.p1{
	float : left;
	width: 70%;
}

.p2{
	float : left;
	width: 28%;
}

.p3{
	clear: both;
}

input[name=reply]{
	height : 50px;
	vertical-align: top; 
}


</style>

<script type="text/javascript">
	
	$(function(){
		
		vtype = "";
		vword = "";
		
		$.ajax({
			
			url : '<%=request.getContextPath()%>/BoardList.do',
			type : 'post',
			data : {
				"page" : 1,
				"stype" : vtype,
				"sword" : vword
			},
			success : function(res){
				
			},
			error : function(xhr){
				alert("상태 :" + xhr.status)
			},
			dataType : 'json'
			
			
		})
	})


</script>

</head>
<body>

	<div id ="result"></div>


</body>
</html>