<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="../js/jquery.serializejson.min.js"></script>

<title>Insert title here</title>


<script type="text/javascript">
$(function() {
	
	
	chk=0;
	//데이터 유효성 체크
	//id
	$('#uid').on('keyup', function(){
		
		idvalue = $(this).val().trim();		
		
		idreg = /^[a-zA-Z][a-zA-Z0-9]{3,14}$/
		
		if(!(idreg.test(idvalue))){
			$(this).css('border', '1px solid red');
			$('#idCheck').prop('disabled', true);
		}else{
			$(this).css('border', '1px solid blue');
			$('#idCheck').prop('disabled', false);
		}
		
		regcheck(idreg,idvalue, this)
		
	})
	
	
	$('#uname').on('keyup', function(){
		
		namevalue = $(this).val().trim();		
		
		namereg = /^[가-힣]{2,5}$/;
		
		regcheck(namereg, namevalue, this);
		
	/* 	if(!(namereg.test(namevalue))){
			$(this).css('border', '1px solid red');
		}else{
			$(this).css('border', '1px solid blue');
		} */
		
	})
	
	
	$('#pwd').on('keyup', function(){
		
		passvalue = $(this).val().trim();		
		
		passreg = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*?]).{5,12}$/;
		
		regcheck(passreg, passvalue, this);
		
		// 전방탐색
		//str = ["1000원", "2원", "원", "5000원"];
		//reg = /.+(?=원)/;
		//reg = /(?=.*원)/	
	})
	
	$('#umail').on('keyup', function(){
		
		mailvalue= $(this).val().trim();
		
		mailreg = /^[a-zA-Z0-9]+@[a-z][0-9a-zA-Z]+(\.[a-zA-Z]+){1,2}/
		
		regcheck(mailreg, mailvalue, this);
		
	})
	
	
	$('#uhp').on('keyup', function(){
		
		hpvalue= $(this).val().trim();
		
		hpreg = /[0-9]{2,3}-[0-9]{4}-[0-9]{4}$/;
		
		regcheck(hpreg, hpvalue, this);
		
	})	
	
	
	regcheck = function(reg, value, ele){
		if(!(reg.test(value))){
			$(ele).css('border', '1px solid red');
		}else{
			$(ele).css('border', '1px solid blue');
		}
	}
	
	
	
	
	// 아이디 중복 검사
	$('#idCheck').on('click', function(){
		
		// 입력한 값을 가져온다.
		idvalue = $('#uid').val().trim();
				
		if(idvalue.length < 1){
			alert("아이디를 입력하세요");
			return false;
		}
		
		$.ajax({
			
			url : '<%= request.getContextPath() %>/IdCheck.do',
			type: 'get',
			data: {"id" : idvalue},
			success : function(res) {
				$('#idspan').html(res.flag).css('color','red');
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'	
		})
		
	})
	
	$('#zipsearch').on('click', function(){
		
		window.open("zipsearch.jsp", "우편번호찾기", "width=500", "height=500");
		
	})
	
	
	$('#zip').on('click',function(){
	       dongvalue = $('#dong').val().trim();
	       
	       $.ajax({
	          url : '<%= request.getContextPath() %>/ZipSearch.do',
	          data : {"dong" :dongvalue},
	          type : 'post',
	          dataType : 'json', 
	          success : function(res){
	             code ="<table>";
	             code += "<tr><td>우편번호</td><td>주소</td><td>번지</td></tr>"
	             $.each(res, function(i, v){
	            	 
	            	 bunji = v.bunji;
	            	 //undefined비교 
	            	 if(typeof bunji == "undefined"){
	            		 bunji = "------";
	            	 }
	            	
	            	 code += "<tr><td>"+v.zipcode+"</td>";
	            	 code += "<td>"+v.sido + v.gugun + v.dong +"</td>";
	            	 code += "<td>"+bunji+"</td></tr>"; 
	             })
	             code += "</table>";
	             
	             $('#result1').html(code);
	             
	          },
	          error : function(xhr) {
	             alert("상태 : " + xhr.status);
	          }
	          
	       })
	    }) 
	    //우편번호 검색 모달 창 실행 - 검색버튼 클릭
	    
	    $(document).on('click', '#result1 tr', function(){
	    	zip = $('td:eq(0)', this).text();
	    	addr = $('td:eq(1)', this).text();
	
	    	$('#uzip').val(zip);
		    $('#uadd1').val(addr);			
		    $('#zipModal').modal('hide');
		    $('#dong').val("");
		    $('#result1').empty();
		    
	    })
    //실행결과에서 한줄을 클릭하면 
	    
    $('#send').on('click', function(){
 
    	
    	//입력한 모든 값을 가져온다. - val()
    	
/*     	idval = $('#uid').val().trim();
    	nameval = $('#uname').val().trim();
    	mailvalue =$('#umail').val().trim();
    	hpvalue =$('#uhp').val().trim();
    	pwvalue =$('#pwd').val().trim();
    	zipvalue =$('#uzip').val().trim();
    	add1value =$('#uadd1').val().trim();
    	add2value =$('#uadd2').val().trim();
    	birvalue =$('#ubir').val().trim();
    	
    	fdata = {
    			"id"  :  idval, 
    			"name" : nameval, 
    			"mail" : mailvalue,
    			"pass" :  pwvalue, 
    			"hp"   :  hpvalue,
    			"bir"  :  birvalue,
    			"zip"  :  zipvalue,
    			"add1" : add1value,
    			"add2" : add2value
    			} */
    	
    	fdata1 = $('form').serialize();
    	fdata2 = $('form').serializeArray();
    	fdata3 = $('form').serializeJSON();    	
    	
    	
    	console.log(fdata1);
    	console.log(fdata2);
    	console.log(fdata3);
    	
    	
    	$.ajax({
    		
    		url : '<%= request.getContextPath() %>/Insert.do',
    		data : fdata1,
    		type : 'post',
    		success : function(res){
    			$('#joinspan').html(res.flag).css('color', 'red');
    		},
    		error : function(xhr){
    			alert("상태 : " + xhr.status)
    		},
    		dataType : 'json'
    		
    	}) 
    	
    })
    
})



</script>

<style type="text/css">
#result1 tr:hover{
	background : skyblue;
}

.borderstyle{
	border: 2px solid red;
}

</style>

</head>
<body>

 <div class="container">
  	 
  <h2>회원가입</h2>
  <form class="needs-validation" novalidate>
    <div class="form-group">
      <label for="uid">아이디</label>
      <button type="button" id="idCheck" class="btn btn-outline-success btn-sm">중복검사</button>
      <span id="idspan"></span>
      <input type="text" class="form-control" id="uid" placeholder="Enter username" name="mem_id" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    
     <div class="form-group">
      <label for="uname">이름</label>
      <input type="text" class="form-control" id="uname" name="mem_name" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="pwd">Password</label>
      <input type="password" class="form-control" id="pwd" name="mem_pass" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
      <div class="form-group">
      <label for="ubir">생년월일</label>
      <input type="date" class="form-control" id="ubir" name="mem_bir" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
  
    <div class="form-group">
      <label for="uhp">전화번호</label>
      <input type="text" class="form-control" id="uhp" name="mem_hp" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="umail">이메일</label>
      <input type="text" class="form-control" id="umail" name="mem_mail" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
     <div class="form-group">
      <label for="uzip">우편번호</label>
      <button type="button" id="zipsearch" class="btn btn-outline-success btn-sm">번호검색</button>
      <button type="button" class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#zipModal">번호검색modal</button>
      
      <input type="text" class="form-control" id="uzip" name="mem_zip" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    
      <div class="form-group">
      <label for="uadd1">주소</label>
      <input type="text" class="form-control" id="uadd1" name="mem_add1" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
     <div class="form-group">
      <label for="uadd2">상세주소</label>
      <input type="text" class="form-control" id="uadd2" name="mem_add2" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div> 
    
    <button type="button" class="btn btn-outline-primary btn-lg" id="send">Submit</button>
    <span id="joinspan"></span>
  </form>
</div>


<div class="modal" id="zipModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        우편번호찾기
        <div class="box">
   		<p>찾는 동을 입력하세요</p>
	
	   <input type="text" id="dong" >
	   <input type="button" value="검색" id="zip" >
		<br><br>
	   <div class="result" id="result1"></div>
		</div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>


</body>
</html>