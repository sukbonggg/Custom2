<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../main/header.jsp"%>
<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}
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
					<h3>board list</h3>
				<form action="listBoard" method="get">
					<input class="ml-2 w-84 input input-bordered" type="text" name="searchKeyword" placeholder="검색어를 입력해주세요" maxlength="20" value="${searchKeyword }"/>
					<button class="ml-2 btn btn-active btn-ghost">검색</button>
				</form>
			        <input type="button" onclick="location.href='../board/writeBoard'" style="padding: 12px; margin-left: 80%; border: none; margin-right: 0px; color: white; background-color: #DCDCDC"; value="글쓰기" />
			        <input type="button"  onclick="delBtn();"  style="padding: 12px; border: none; color: white; background-color: #DCDCDC"; value="삭제" />
			        <input type="button"  onclick="location.href='../board/modify'" style="padding: 12px; border: none; color: white; background-color: #DCDCDC"; value="수정" />

						<table>
							<thead>
								<tr bgcolor="#D3D3D3">
									<th>선택</th>
									<th>번호</th>
									<th>제목</th>
									<th>내용</th>
									<th>작성자</th>
									<th>추천수</th>
								</tr>
							</thead>

							<c:choose>
								<c:when test="${empty listBoard }">
									<tr>
										<td colspan="5" align="center">데이터가 없습니다</td>
									</tr>  
								</c:when>
								<c:when test="${!empty listBoard }">
									<c:forEach var="listBoard" items="${listBoard}">
										<tbody>
											<tr>
												<th><label><input name="checkbox"   value="${listBoard.board_seq}" type="checkbox"> </label></th>
												<th><c:out value="${listBoard.board_seq}"/></th>
												<th><a href="/usr/board/detail?board_seq=${listBoard.board_seq}">
												<c:out value="${listBoard.board_title}"/>
												</a></th>
												<th><c:out value="${listBoard.board_text}"/></th>
												<th><c:out value="${listBoard.board_writer}"/></th>
												<th><c:out value="${listBoard.board_count}"/></th>
											</tr>
										</tbody>
									</c:forEach>
								</c:when>
							</c:choose>
						</table>
					</div>
						<div class="panel-heading">
							<div class="container" role="main"></div>
						</div>
				</c:if>
				<ul class="paging">
    <c:if test="${paging.prev}">
        <span><a href='<c:url value="/usr/board/listBoard?page=${paging.startPage-1}"/>'>이전</a></span>
    </c:if>
    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
        <span><a href='<c:url value="/usr/board/listBoard?page=${num}"/>'>${num}</a></span>
    </c:forEach>
    <c:if test="${paging.next && paging.endPage>0}">
        <span><a href='<c:url value="/usr/board/listBoard?page=${paging.endPage+1}"/>'>다음</a></span>
    </c:if>
</ul>
			</div>

		</div>
	</div>
	
</body>
<script >

function delBtn(){
	
	let checkbox = $("input[name='checkbox']");
	
	let array = new Array();

	for(let i = 0; i<checkbox.length; i++){
		if(checkbox[i].checked){
			array.push(checkbox[i].value);
		}
	}
	
	if(array.length == 0){
		alert("체크박스를 선택해주세요.");
	}
	else{
		let confirmation = confirm(array.length+"개의 게시글을 삭제합니다.");
		if(confirmation == true){
			
			$.ajax({
				url : "removeCheckbox",
				type : "POST",
				traditional : true, //넘기는 데이터값이 배열일 경우 추가하는 옵션
				data : {
						array : array,
						
				},
				success : function(result){
					if(result = 1){
						alert("글이 삭제되었습니다.");
						location.replace("listBoard");
					}
					else{
						alert("삭제 실패");
					}
				}
			});
			
		}
	}
}

 




</script>



</html>
