 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../main/header.jsp"%>

<body>
	<!-- MAIN -->
	<div class="main">
		<!-- MAIN CONTENT -->
		<div class="main-content">
			<div class="container-fluid">
				<div class="panel panel-headline">
					<div class="panel-body">
						<h1 class="panel-title" style="font-size: 3rem">Sing Up</h1>
						<div>
							<input type="text" id="custom_user_name" name="custom_user_name"class="name panel panel-headline" style="width: 800px;"maxlength="20" placeholder="NAME">
						</div>
						<div>
							<input type="text" id="custom_user_nick" name="custom_user_nick"class="name panel panel-headline" style="width: 800px;"maxlength="31" placeholder="Nick">
							  <div><font id="id_check" size="2"></font></div>
						</div>
						<div>
							<input type="password" id="custom_user_pwsd" name="custom_user_pswd"class="loginId panel panel-headline" style="width: 800px;"maxlength=20 placeholder="Pwd">
						</div>
						<div>
							<input id="checkPwd" type="password" name="custom_user_pswd"class="loginId panel panel-headline" style="width: 800px;"maxlength=20 placeholder="RepeatPwd">
						</div>
						<div>
							<input type="text" id="custom_user_email" name="custom_user_email"class="loginPw panel panel-headline" maxlength="20"style="width: 800px;" placeholder="Email">
						</div>
						<div>
							<input type="text"    id="custom_user_brith" name="custom_user_brith"class="cepllphoneNum panel panel-headline" style="width: 800px;"maxlength="20" placeholder="Birth">
						</div>
						<div>
							<input id="custom_user_phone"    type="tel" name="custom_user_phone"class=" phone panel panel-headline " maxlength="20"style="width: 800px;" placeholder="Phone">
						</div>
						<div>
							<input type="text"  id="custom_user_addr" name="custom_user_email"class="email panel panel-headline" maxlength="20"style="width: 800px;" placeholder="Addr">
						</div>
						<div>
							<input onclick="join();" type="button"style="width: 1180px; background-color: #B0E0E6; color: white"value="Join">
						</div>

					</div>
				</div>
			</div>
			
		</div>
	</div>
	<!-- END MAIN CONTENT -->
	<!-- END MAIN -->
	<!-- END WRAPPER -->
</body>
<script>
/* oninput="hypenTel(this)" */
/* oninput="hypenbrith(this)" */
//2월 2일 생년월일 자동 '-' 생성
/*  let hypenbrith = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/, `$1-$2-$3`);
	} */


//2월 2일 전화번호 자동 '-' 생성
/* let hypenTel = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
 */
/* //2월 2일 비밀번호 체크
$('#checkPwd').blur(function(){
let checkPwd=$('#checkPwd').val();
let custom_user_pwsd=$('#custom_user_pwsd').val();
	if(custom_user_pwsd===checkPwd){
		alert('비밀번호가 일치합니다');
		
	}else{
		alert('비밀번호가 일치 하지 않습니다');
	}
}) */



//2월1일 아이디 중복체크
$('#custom_user_nick').keyup(function(){
	
	   let custom_user_nick = $('#custom_user_nick').val();  
   	    console.log("아이디:"+custom_user_nick); 
   	   $.ajax({
   		   type: 'post', //타입 (get,post,put등등)
   		   url:    'idcheck' ,     //요청할 서버 url
   		   data : custom_user_nick,
   		   dataType:'json',		
   		   contentType: 'application/json; charset=utf-8',
   		   
   		   success : function(cnt){
   			   if(cnt < 1 ){
   				$("#id_check").html('사용 가능한 아이디입니다.')
   				$("#id_check").attr('color','#00FF00')
   			   }else{
   				$("#id_check").html('이미 사용중인 아이디입니다.')
   				$("#id_check").attr('color','#FF0000')
   			   }
   		   }

   	   })

});
function join(){
	let custom_user_name = /^[가-힣]+$/; //한글만 가능
	let custom_user_birth = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
	let custom_user_nick = /^[a-z0-9_-]{4,10}$/; //영문자 소문자, 숫자, "-", "_" 로만 구성된 길이 2 ~ 10자리 사이 문자열
	let custom_user_email = /(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))/;
	let custom_user_addr = /(([가-힣A-Za-z·\d~\-\.]{2,}(로|길).[\d]+)|([가-힣A-Za-z·\d~\-\.]+(읍|동)\s)[\d]+)/;
	let custom_user_phone = /^[0-9]{11,11}$/;
	let custom_user_pwsd = /^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/;	//최소 8자 이상으로 숫자, 특수문자가 각각 최소 1개이상
	
	if($('#custom_user_name').val()==""){
		alert("이름을 입력하세요.");
		$('#custom_user_name').focus();
	}
	else if(!custom_user_name.test($('#custom_user_name').val())){
		alert("이름 형식이 잘못되었습니다.");
		$('#custom_user_name').focus();
	}
	else if($('#custom_user_brith').val()==""){
		console.log(custom_user_brith); 
		alert("생년월일을 입력하세요.");
		$('#custom_user_brith').focus();
	}
	else if(!custom_user_birth.test($('#custom_user_brith').val())){
		alert("생년월일 형식이 잘못되었습니다.");
		$('#custom_user_brith').focus();
	}
	else if($('#custom_user_nick').val()==""){
		alert("아이디를 입력하세요.");
		$('#custom_user_nick').focus();
	}
	else if(!custom_user_nick.test($('#custom_user_nick').val())){
		alert("아이디 형식이 잘못되었습니다.");
		$('#custom_user_nick').focus();
	}
	else if($('#custom_user_email').val()==""){
		alert("이메일을 입력하세요.");
		$('#custom_user_email').focus();
	}
	else if(!custom_user_email.test($('#custom_user_email').val())){
		alert("이메일 형식이 잘못되었습니다.");
		$('#custom_user_email').focus();
	}
	else if($('#custom_user_addr').val()==""){
		alert("주소를 입력하세요.");
		$('#custom_user_addr').focus();
	}
	else if(!custom_user_addr.test($('#custom_user_addr').val())){
		alert("주소 형식이 잘못되었습니다.");
		$('#custom_user_addr').focus();
	}
	else if($('#custom_user_phone').val()==""){
		alert("전화번호를 입력하세요.");
		$('#custom_user_phone').focus();
	}
	else if(!custom_user_phone.test($('#custom_user_phone').val())){
		alert("전화번호 형식이 잘못되었습니다.");
		$('#custom_user_phone').focus();
	}
	else if($('#custom_user_pwsd').val()==""){
		alert("비밀번호를 입력하세요.");
		$('#custom_user_pwsd').focus();
	}
	else if(!custom_user_pwsd.test($('#custom_user_pwsd').val())){
		alert("비밀번호 형식이 잘못되었습니다.");
		$('#custom_user_pwsd').focus();
	}
	else if($('#checkPwd').val()==""){
		alert("비밀번호 재확인을 입력하세요.");
		$('#checkPwd').focus();
	}
	else if($('#custom_user_pwsd').val()!=$('#checkPwd').val()){
		alert("비밀번호 재확인이 잘못되었습니다.")
		$('#checkPwd').focus();
	}
	else{
	 let custom_user_name = $('#custom_user_name').val();
	 let custom_user_nick = $('#custom_user_nick').val();
	 let custom_user_addr = $('#custom_user_addr').val();
	 let custom_user_email = $('#custom_user_email').val();
	 let custom_user_pwsd = $('#custom_user_pwsd').val();
	 let custom_user_phone = $('#custom_user_phone').val();
	 let custom_user_brith = $('#custom_user_brith').val();
	 
	 let data={'custom_user_name':custom_user_name,
			  'custom_user_brith':custom_user_brith,
			  'custom_user_nick':custom_user_nick,
			  'custom_user_email':custom_user_email,
			  'custom_user_addr':custom_user_addr,
			  'custom_user_phone':custom_user_phone,
			  'custom_user_pwsd':custom_user_pwsd
	 }
	 console.log(data);
	 $.ajax({
		   type: 'post', //타입 (get,post,put등등)
		   url:    'doJoin' ,     //요청할 서버 url
		   data: JSON.stringify(data), //JavaScript 값이나 객체를 JSON 문자열로 변환합니다.
		   dataType:'json',		
		   contentType: 'application/json; charset=utf-8',
		success : function(success){
			if(success===1)
			alert("회원가입되었습니다.");
			location.href="login";
			return;
			
	},//success
		error : function(success){
			if(success>1){
				alert("회원가입 실패");	
				return;
			}
			} //error
		})//ajax
	}//else 
}
</script>
</html>
