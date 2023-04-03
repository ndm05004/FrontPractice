<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="../css/mystyle.css">

<script type="text/javascript"src = "../js/jquery-3.6.4.min.js"></script>

<script type="text/javascript">

$(function(){
	
	$('#Lprod').on('click', function(){
		
		$.ajax({
			
			url : "http://localhost/jqpro/0324/LprodController.jsp",
			type : 'get',
			success : function(res){
				
				code = "<table border='1'>";
				code += "<tr><td>lprod_id</td><td>lprod_gu</td>";
				code += "<td>lprod_nm</td></tr>";
				
				$.each(res, function(i, v){
					code += "<tr><td>" + v.lprod_id + "</td><td>" +v.lprod_gu+"</td>";
					code += "<td>"+v.lprod_nm+"</td></tr>";
				})
				code += "</table>";
				
				$('#result1').html(code);
				
			},
			error : function(xhr){
				
			},
			dataType : 'json'
			
		})
		
	})
	
})

</script>
<style>
table{
	border : 1px solid blue;
	
	}
td{
	width : 150px;
	height : 30px;
	text-align: center;
}
	
</style>
</head>
<body>

<div class="box">
   <p>
   </p>

   <input type="button" value="LPROD리스트" id = "Lprod">
	<br><br>
   <div class="result" id="result1">
   
   </div>
   
</div>
</body>
</html>



