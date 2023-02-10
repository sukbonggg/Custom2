 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../main/header.jsp"%>

<style>
 
</style>

<body>
	<!-- MAIN -->
	<div class="main">
		<!-- MAIN CONTENT -->
		<div class="main-content">
		
				<div class="container-fluid">
					<!-- OVERVIEW -->
					<c:if test="${!empty sessionScope.custom_user_nick }">
					<div class="panel panel-headline">
					<h2>Board Write</h2>
					
						<div class="panel-heading">
							
		<form action="writeBoard" id="writeBoard">
		<div class="container" role="main">

				<div class="mb-3">

					<label for="title">제목</label>

					<input type="text" class="form-control" name="board_title" id="board_title" placeholder="제목을 입력해 주세요">
				</div>
				
				
					<div class="mb-3">
						<label for="reg_id">작성자</label>
						<input type="text" class="form-control" name="board_writer" id="board_writer" placeholder="이름을 입력해 주세요">
					</div>
				
				
				

				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="board_text" id="board_text" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
							<input type="button"  onclick="writeBoard();"  style= "padding:12px; margin-left:1100px; margin-top:10px; border:none;  color:white;   background-color: 	#DCDCDC	"; value="작성"/>
							
						</div>
				</form>
					</div>
				</div>
				</c:if>
			</div>
		</div>
				
		</div>

					
	<!-- END MAIN CONTENT -->
	<!-- END MAIN -->
	<!-- END WRAPPER -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="index.html" class="active"><i class="lnr lnr-home"></i> <span>Dashboard</span></a></li>
						<li><a href="tables.html" class=""><i class="lnr lnr-dice"></i> <span>Board</span></a></li>
						<li><a href="typography.html" class=""><i class="lnr lnr-text-format"></i> <span>JqGrid</span></a></li>
						<li><a href="icons.html" class=""><i class="lnr lnr-linearicons"></i> <span>API</span></a></li>
					</ul>
				</nav>
			</div>
		</div>
		
		<script >
		function writeBoard(){
			var data = $("#writeBoard").serialize();
			
			$.ajax({
				type : "POST",
				url : "writeBoard",
				data : JSON.stringify(data),
				dataType:'json',		
				success: function(data){
					if(data == "true"){
						alert("글 등록이 완료되었습니다.");
						location.href = "main";		
					}else(data =="false"){
						alert("실패");
						console.log(data);
					}
				},
			/* 	error: function(data){
					alert("실패");
					console.log(data);
				} */
			});
		};
		</script>
		
</body>

</html>
