<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../main/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>

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
 <!-- <form  action="detail" method="post">  -->
<div class="table-responsive" style="text-align:center;">
<table id="datatable-scroller"
	class="table table-bordered tbl_Form">
	<caption></caption>
	<colgroup>
		<col width="250px" />
		<col />
	</colgroup>
	<tbody>
		<tr>
			<th class="active" >작성자</th>
			<td>
			${detailBoard.board_writer}
			</td>
		</tr>
		<tr>
			<th class="active">제목</th>
			<td>
			${detailBoard.board_title}
			</td>
		</tr>
		<tr>
			<th class="active" >내용</th>
			<td>
			${detailBoard.board_text}
			</td>
		</tr>
		<tr>
			<th class="active " >파일</th>
			<td>
			<img src="${path}/img/${detailBoard.board_img_path}" style="width: 400px;">
			</td>
		</tr>
		<!-- Comments Form -->

	</tbody>
		
</table>
</div>
<!-- 추천 기능 -->
		<div>
			<div class="w3-border w3-center w3-padding">
				<c:if test="${ sessionScope.custom_user_nick == null }">
					추천 기능은 <button type="button" id="login"><b class="w3-text-blue">로그인</b></button> 후 사용 가능합니다.<br />
					<i class="fa fa-heart" style="font-size:16px;color:red"></i>
					<span class="rec_count"></span>					
				</c:if>
			
			</div>
		</div>


<div style="margin-left:1px;">
<a href="listBoard" class="btn btn-primary">목록</a>
<a href="modify?board_seq=${detailBoard.board_seq}" class="btn btn-primary">수정</a>
			<c:if test="${sessionScope.custom_user_nick != null }">
					<input type="hidden" id="board_seq" value="${detailBoard.board_seq}"  />
					<input type="hidden" id="writer" value="${sessionScope.custom_user_nick }"  />
					<button onclick="heart();"  class="w3-button w3-black w3-round" >
							<i class="fa fa-heart" style="font-size:16px;color:red"></i>
						&nbsp;<span class="rec_count"></span>
					</button> 
				</c:if>
</div>
<!--  </form>  -->
<div class="card my-4">
		<h5 class="card-header">댓글:</h5>
		<div class="card-body">
			<form name="comment-form" action="comment" method="post" autocomplete="off">
				<div class="form-group">
					<input type="hidden" name="board_seq" value="${detailBoard.board_seq}"  />
					<input type="hidden" name="writer" value="${sessionScope.custom_user_nick }"  />
					<textarea name="content" class="form-control" rows="3"></textarea>
				</div>
				<button type="submit"  class="btn btn-primary">전송하기</button>
			</form>
		</div>
	</div>
	<c:choose>
							
								<c:when test="${!empty comment }">
									<c:forEach var="comment" items="${comment}">
										<tbody>
											<tr>
											
											
												<th class="active">작성자 :</th>	<c:out value="${comment.writer}"/>
											</tr>
											<c:out value="${comment.date}"/>
											<p>
											
													<c:out value="${comment.content}"/>
													
													</p>
										</tbody>
									</c:forEach>
								</c:when>
							</c:choose>
</div>
</div>
</div>
</div>

			
			</div>
		</div>
	</div>
</body>
<script>
function heart(){
	 var seq = $("#board_seq").val();
	 var id = $('#writer').val();
	 var alldata={"seq":seq,"id":id}; 
		console.log(alldata);
	
	  $.ajax({
		   type: 'post', //타입 (get,post,put등등)
		   url:    'heart', //요청할 서버 url
		   data : alldata,
		   dataType:'json',		
		success : function(cnt){
			if(success===1)
			alert("추천완료");
			location.href="detailBoard?";
			return;
			
	}
		});//ajax */
 }
</script>

</html>
