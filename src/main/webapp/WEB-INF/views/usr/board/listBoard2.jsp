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
				
					<div class="panel panel-headline">
					
			
						
					</div>
						<div class="panel-heading">
							<div class="container" role="main"></div>
						</div>
				
			</div>
		</div>
	</div>
</body>
<script >
/* function delBtn(){
	if($("input:checkbox[name='chk_list']:checked").length ===0){
		alert('삭제할 항목을 선택하세요');
		
		return;
	}
		$("input:checkbox[name='chk_list']:checked").each(function(k,kVal){
			console.log("kVal ::",kVal.parentElement.parentElement.parentElement);
			let a =kVal.parentElement.parentElement.parentElement;
			$(a).remove();
			
			
			
		});
}; */
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
