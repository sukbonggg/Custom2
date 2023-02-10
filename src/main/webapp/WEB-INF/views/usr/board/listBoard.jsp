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
			        <input type="button" onclick="location.href='../board/writeBoard'" style="padding: 12px; margin-left: 670px; border: none; margin-right: 0px; color: white; background-color: #DCDCDC"; value="글쓰기" /> 
			        <input type="button"style="padding: 12px; border: none; color: white; background-color: #DCDCDC"; value="삭제" />

						<table>
							<thead>
								<tr bgcolor="#D3D3D3">
									<th>선택</th>
									<th>번호</th>
									<th>제목</th>
									<th>내용</th>
									<th>작성자</th>
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
												<th><label><input type="checkbox"> </label></th>
												<th>${listBoard.board_seq}</th>
												<th>${listBoard.board_title}</th>
												<th>${listBoard.board_text}</th>
												<th>${listBoard.board_writer}</th>
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
			</div>
		</div>
	</div>
</body>
</html>
