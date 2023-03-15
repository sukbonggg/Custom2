<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../main/header.jsp"%>

<body>
	<!-- MAIN -->
	<div class="main">
		<!-- MAIN CONTENT -->
		<div class="main-content">
			<div class="container-fluid">
			
<div class="panel" style="margin-left:1px;">
<div id="contAreaBox">
<div class="panel">
<div class="panel-body">

<div class="table-responsive" style="text-align:center;">

<table id="datatable-scroller"
	class="table table-bordered tbl_Form">
		
	<caption></caption>
	<colgroup>
	
		<col width="250px" />
		
		<col />
	
	</colgroup>
		
	<tr>
		<th class="active">제목</th>
		<td><input type="text" class="form-control" name="board_title" id="board_title" placeholder="수정할 제목을 작성해주세요" value="${BoardDto.board_title}"></td>
		
		
		</tr>
		<tr>
			<th class="active" >내용</th>
			
			<td><input type="text" class="form-control" name="board_text" id="board_text"  placeholder="수정할 내용을 작성해주세요"  value="${BoardDto.board_text}"></td>
			
		</tr>
	</tbody>
</table>
<input type="button" onclick="modifyBoard(${BoardDto.board_seq})" value="수정">

</div>
<div style="margin-left:1px;">
<a href="listBoard" class="btn btn-primary">목록</a>


	

</div>
<!-- </form> -->
</div>
</div>
</div>
</div>

			
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
 function  modifyBoard(board_seq){
	alert(board_seq);

	if($('#board_title').val()==""){
		alert("제목을 입력해주세요.")
		$("#board_title").focus();
		return;
	}
	
	if($('#board_text').val()==""){
		alert("내용을 입력해주세요.")
		$("#board_text").focus();
		return;
	}
	 let data={'board_title':$('#board_title').val(),'board_text':$('#board_text').val(),'board_seq':board_seq}
	 console.log(data)
		         $.ajax({
		        	 
		            url:"updateBoard",
		            type:"POST",
		            data: data,
		            dataType:"json",
		         
		            success:function(data){
		                if(data=="1")   {
		                	alert("글 수정이 완료되었습니다");
		                	location.replace("listBoard");
		                	
		                }             
	                }, error:function(e){
		               console.log(e)
		               alert("실패")
		            }
		         });
		      }
		      
		  
		

 </script>
</html>
