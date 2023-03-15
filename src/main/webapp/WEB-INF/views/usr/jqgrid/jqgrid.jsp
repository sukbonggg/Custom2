<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../main/header.jsp"%>



<body>
	<!-- MAIN -->
	<div class="main">
		<!-- MAIN CONTENT -->
		<div class="main-content">
			<div class="container-fluid">
				<!-- OVERVIEW -->
				
					<div class="panel panel-headline">
					
						<table id="list">
	
				</table>
					<div id="pager"></div>
						
					</div>
						<div class="panel-heading">
							<div class="container" role="main"></div>
						</div>
				
			</div>
		</div>
	</div>


</body>

<script>
$(document).ready(function(){ 
    $("#list").jqGrid({          
        url:"jqgrid.do", //ajax 요청주소
        datatype:"json", //결과물 받을 데이터 타입
        caption:"list",
        type : "POST",
        height:"auto",
        rowNum:10,
        colNames:["custom_user_seq","custom_user_name","custom_user_nick","custom_user_email"],
        colModel:[
                  {name:"custom_user_seq", index:"custom_user_seq", align:"center"},
                  {name:"custom_user_name", index:"custom_user_name", align:"center", editable:true, edittype:"text"},
                  {name:"custom_user_nick", index:"custom_user_nick", align:"center", editable:true, edittype:"text"},
                  {name:"custom_user_email", index:"custom_user_email", align:"center", editable:true, edittype:"text"}
                 ],
           pager:"#pager",      
        viewrecords:true 
    });
});


</script>



</html>
