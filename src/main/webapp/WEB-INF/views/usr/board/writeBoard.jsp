 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../main/header.jsp"%>



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
							
		<form action="writeBoard" method="post" enctype="multipart/form-data">
		<div class="container" role="main">

				<div class="mb-3">
		
					<label for="title">제목</label>

					<input type="text" class="form-control" style="width: 90%;" name="board_title" id="board_title" placeholder="제목을 입력해 주세요">
				</div>
				
					<div class="mb-3">
						<label for="reg_id">작성자</label>
						<input type="text" class="form-control" style="width: 90%;" name="board_writer" id="board_writer" placeholder="이름을 입력해 주세요">
					</div>

				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control " style="width: 90%;" rows="5" name="board_text" id="board_text" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
					<input type="file" name="imgfile"/> 
				<input type="submit" style= "padding:12px; margin-left:900px; margin-top:10px; border:none;  color:white;   background-color: 	#DCDCDC	" value="작성"/>
								 
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
						<li><a href="../member/main" class="active"><i class="lnr lnr-home"></i> <span>Dashboard</span></a></li>
						<li><a href="../board/listBoard" class=""><i class="lnr lnr-dice"></i> <span>Board</span></a></li>
						<li><a href="../jqgrid/jqGrid" class=""><i class="lnr lnr-text-format"></i> <span>JqGrid</span></a></li>
						<li><a href="../api/api" class=""><i class="lnr lnr-linearicons"></i> <span>API</span></a></li>
						<li><a href="../board/wordle" class=""><i class="lnr lnr-linearicons"></i> <span>wordle</span></a></li>
					</ul>
				</nav>
			</div>
		</div>
		

		
</body>
		
</html>
