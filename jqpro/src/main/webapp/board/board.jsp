<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="../js/board.js"></script>
<script type="text/javascript" src="../js/jquery.serializejson.min.js"></script>
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

#pagelist{
	margin-left : 30%;
}

.reply-body{
	
	background: #f1faad;
	border : 1px solid gold;
	margin : 1px;
	padding: 5px;
	
}


</style>

<script type="text/javascript">
currentPage =1;
mypath = '<%=request.getContextPath()%>';
console.log(mypath)

reply = { }; //동적으로 속성과 기능을 추가할 수 있다. reply.name = "" reply.bonum = 31

	$(function(){
		
		$.listPageServer(1)
		
		
		//이벤트
		//페이지 번호 클릭
		$(document).on('click', '.pageno', function(){
			
			
       	 if($('#modifyform').css('display') != 'none'){
    		 // 열려 있다.
    		 replyReset();
    		 
    	 }
			
			currentPage= $(this).text().trim();
			$.listPageServer(currentPage)
		})
		
		
		//다음클릭
		$(document).on('click', '#next', function(){
			
       	 if($('#modifyform').css('display') != 'none'){
    		 // 열려 있다.
    		 replyReset();
    		 
    	 }
			
			currentPage = parseInt($('.pageno').last().text())+1
			$.listPageServer(currentPage)
		})
		//alert($('.pageno').last().text())
		
		//이전클릭
		$(document).on('click', '#prev', function(){
			
       	 if($('#modifyform').css('display') != 'none'){
    		 // 열려 있다.
    		 replyReset();
    		 
    	 }
			
			currentPage = parseInt($('.pageno').first().text())-1
			$.listPageServer(currentPage)
			
		})
				
		
		//검색 search클릭
		$("#search").on('click', function(){
			$.listPageServer(1);
		})
		
		//글쓰기 모달창에서 send전송 버튼 클릭
		$('#send').on('click', function(){
			//입력한 모든 값을 가져온다.
			
			fdata = $('form').serializeJSON();
			
			console.log(fdata);
			
			$('#wform .txt').val("");
			$('#wModal').modal('hide');
		
			//서버로 전송하기
			$.boardWriteServer();
		})
		
		
	      //수정 삭제 등록 댓글수정 댓글삭제 -- 이벤트
	      $(document).on('click','.action', function(){
	    	  
	    	  if($('#modifyform').css('display') != 'none'){
	        		// 열려 있다.
	        		replyReset(); 
	        	 }
	    	  
	         
	         vaction = $(this).attr('name');
	         vidx = $(this).attr('idx');
	         
	         if(vaction == "modify") {
	            alert(vidx + "번 글을 수정")
	         }else if(vaction == "delete") {
	            alert(vidx + "번 글을 삭제")
	            
	            $.boardDeleteServer();
	            
	         }else if(vaction == "list"){
	        	 //alert(vidx + "번 게시판글과 댓글을 모두 보기");
	        	 $.replyListServer(this)
	        	 
	         }else if(vaction == "reply") {
	            alert(vidx + "번 댓글을 씁니다.")
	            			
				cont = $(this).prev().val();
	            name1 = String.fromCharCode(parseInt(Math.random() * 26 + 65)); //A~Z
	            name2 = String.fromCharCode(parseInt(Math.random() * 26 + 97)); //a~z
	            name3 = parseInt(Math.random() * 100 + 1);
	            
	            reply.name = name1 + name2 + name3;
	            reply.cont = cont;
	            reply.bonum = vidx;
	            
	            $(this).prev().val("");
	            
	            //서버로 전송
	            $.replyWriteServer(this);
	            
	            //댓글 리스트를 출력
	            
	         }else if(vaction == "r_modify"){
	        	 //alert(vidx+"번 댓글을 수정")
	        	 
	        	 // modifyform이 열려 있는지 비교
	        	 if($('#modifyform').css('display') != 'none'){
	        		 // 열려 있다.
	        		 replyReset();
	        		 
	        	 }
	        	 

	             //수정할 내용 (원래 내용)을 가져온다
	             modifycont = $(this).parents('.reply-body').find('.p3').html().trim();
	             
	             //원래 내용의 <br>태그를 \n으로 변경 - modifyform (수정폼)에 출력
	             mcont = modifycont.replace(/<br>/g, "\n");
	             $('#modifyform textarea').val(mcont);
	             
	             //수정폼을 p3으로 이동
	             $(this).parents('.reply-body').find('.p3').empty().append($('#modifyform'));
	             
	             //수정폼을 보이기
	             //$('#modifyform').css('display', 'block')         
	             $('#modifyform').show();
	        	 
	        	 
	         }else if(vaction == "r_delete"){
	        	 //alert(vidx+"번 댓글을 삭제")
	        	 $.deleteReplyServer(this);
	         }
	         
	      })
			
	      replyReset = function(){
			
			//p3을 찾는다
			vp3 = $('#modifyform').parent();
			
			//수정폼을 body로 이동
			$('body').append($('#modifyform'));
			$('#modifyform').hide();
			
			//원래내용을 p3으로 다시 출력
			$(vp3).html(modifycont);
			
			
		}

		//댓글 수정창에서 확인버튼
	      $('#btnok').on('click',function(){
	         
	         //입력한 내용을 가져온다. - 엔터기호가 포함
	         modicont = $('#modifyform textarea').val();
	         
	         //엔터기호를 <br>태그로 변경
	         modiout = modicont.replace(/\n/g, "<br>");
	         
	         //p3을 찾는다.
	         //vp3 = $(this).parents($('.p3'));
	         vp3 = $('#modifyform').parent();
	         
	         //modigyform을 body로 이동 - 안 보이도록 설정
	         $('#modifyform').appendTo($('body'));
	         $('#modifyform').hide();
	         
	         //p3에 입력한 내용(<br>태그로 변경한)을 출력 - DB수정 후
	         //$(vp3).html(modiout);
	         
	         reply.cont = modicont;
	         reply.renum = vidx;
	         $.replyUpdateServer();
	         
	      })
	      
	      //댓글 수정창에서 취소버튼
	      $('#btnreset').on('click',function(){
	         
	      })
		

	      
	   })


</script>

<style>
	
	nav a{
		visibility : hidden;
	}
	
	#stype {
		width : 100px;
				
	}
	
	#sword{
		width : 150:
	}
	
	label{
		display : inline-block;
		width: 80px;
		height: 30px;
	}
	
	#modifyform{
		display: none;
	}
	
</style>

</head>
<body>

<div id="modifyform">
	<textarea rows="5" cols="50"></textarea>
	
	<input type="button" value="확인" id="btnok">
	<input type="button" value="취소" id="btnreset">
	
</div>
 
	<input input="button" value="글쓰기" id="write" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#wModal">
	<br><br>
	
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
  		<div class="container-fluid">
   		<!--<a class="navbar-brand" href="javascript:void(0)">Logo</a> -->
    	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
      	<span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mynavbar">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">Link</a>
        </li>
      </ul>
      <form class="d-flex">
       <select class="form-select" id= "stype">
		  <option value="">전체</option>
		  <option value="writer">이름</option>
		  <option value="subject">제목</option>
		  <option value="content">내용</option>
		</select>
       
        <input class="form-control me-2" id="sword" type="text" placeholder="Search">
        <button class="btn btn-primary" iD="search" type="button">Search</button>
      </form>
    </div>
  </div>
</nav>

	<br><br>
	
	<div id ="result"></div>
	<br><br>
	<div id ="pagelist"></div>




<!-- 글쓰기 The Modal -->
<div class="modal" id="wModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      	<form name="wform" id="wform">
      		<label>이름</label>
      		<input type="text" class="txt" name="writer"><br>
      		
      		<label>제목</label>
      		<input type="text" class="txt" name="subject"><br>
      		
      		<label>메일</label>
      		<input type="text" class="txt" name="mail"><br>
      		
      		<label>비밀번호</label>
      		<input type="password" class="txt" name="password"><br>
      		
      		<label>내용</label>
      		<br>
      		<textarea rows="5" cols="40" class="txt" name="content"></textarea>
      		<br><br>
      		<input type="button" value="전송" id="send">
      	</form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

</body>
</html>