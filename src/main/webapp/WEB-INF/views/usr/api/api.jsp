<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@include file="../main/header.jsp"%>



<!-- MAIN -->
<div class="main">
   <!-- MAIN CONTENT -->
   <div class="main-content">

      <div class="container-fluid">
         <!-- OVERVIEW -->
         <div class="panel panel-headline">
         <div align="center">
            <h2>&nbsp;&nbsp;파파고 API</h2>
</div>
            <div class="panel-heading">
               <div class="container" role="main">
                  <div class="mb-3">
                     <label for="title">입력(KOREAN) 
                     <input type="submit" id="ms" style=" margin-top: 10px;" value="번역" />
                        </label> <input type="text" class="form-control"  id="korean">
                  </div>
                 

                  <div class="mb-3">
                     <label for="reg_id">Chinese :</label> 
                     <input type="text" class="form-control"  id="chinese" name="ChineseValue">${Chinese}
                  </div>
                 
                  <div class="mb-3">
                     <label for="content">English :</label> 
                     <input type="text" class="form-control"  id="english" name="EnglishValuew">${english}
                  </div>

               </div>
            </div>
         </div>
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
            <li><a href="index.html" class="active"><i
                  class="lnr lnr-home"></i> <span>Dashboard</span></a></li>
            <li><a href="tables.html" class=""><i class="lnr lnr-dice"></i>
                  <span>Board</span></a></li>
            <li><a href="typography.html" class=""><i
                  class="lnr lnr-text-format"></i> <span>JqGrid</span></a></li>
            <li><a href="icons.html" class=""><i
                  class="lnr lnr-linearicons"></i> <span>API</span></a></li>
         </ul>
      </nav>
   </div>
</div>

<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="../member/main" class="active"><i class="lnr lnr-home"></i> <span>Dashboard</span></a></li>
						<li><a href="../board/listBoard" class=""><i class="lnr lnr-dice"></i> <span>Board</span></a></li>
						<li><a href="../jqgrid/jqgrid" class=""><i class="lnr lnr-text-format"></i> <span>JqGrid</span></a></li>
						<li><a href="../api/api" class=""><i class="lnr lnr-linearicons"></i> <span>API</span></a></li>
					</ul>
				</nav>
			</div>
		</div>

</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
   $(function() {
      $("#ms").click(function(){
         var ko = $("#korean").val();
        
         $.ajax({
            url:"chinese",
            type:"GET",
            data:{korean:ko},
            success:function(data){
            	var result = JSON.parse(data); //JSON 문자열을 인자로 받고 결과값으로 JavaScript 객체를 반환합니다
            	let ChJson = result.message.result.translatedText;
                 $('input[name=ChineseValue]').attr('value',ChJson); 

             /*   alert("성공")
               alert(data)
               $("#chinese").val(data) */
               
            },error:function(e){
               console.log(e)
               alert("실패")
            }
         });
      });
      
   });
   
   $(function() {
      $("#ms").click(function(){
         var ko = $("#korean").val();
      
         $.ajax({
            url:"english",
            type:"GET",
            data:{korean:ko},
            dataType:"text",
            
            success:function(data){
            	var result = JSON.parse(data);
            	let EnJson = result.message.result.translatedText;
                 $('input[name=EnglishValuew]').attr('value',EnJson); 
              /*  alert("성공")
               alert(data)
               $("#english").val(data) */
               
            },error:function(e){
               console.log(e)
               alert("실패")
            }
         });
      });
      
   });
</script>
</html>