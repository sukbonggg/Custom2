
<!doctype html>
<html lang="en" class="fullscreen-bg">
  <script type="text/javascript" src="/js/jquery-3.6.3.min.js"></script> 
     <script type="text/javascript" src="/js/i18n/grid.locale-kr.js"></script>
    <script type="text/javascript" src="/js/jquery.jqGrid.min.js"></script>
    
    <!-- 카카오 라이브러리 -->
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<head>
	<title>Login</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="/css/bootstrap.min.css">
	<link rel="stylesheet" href="/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/img/favicon.png">
	
	
	
	
</head>

<!-- 카카오api -->






	<!-- WRAPPER -->
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box ">
					<div class="left">
						<div class="content">
							<div class="header">
								<div class="logo text-center"><img src="/img/logo-dark.png" alt="Klorofil Logo"></div>
								<p class="lead">Login to your account</p>
							</div>
							
							<form id="inputDto"  action="doLogin" method="post"> <!-- inputclass="form-auth-small" action="index.php"> -->
								<div class="form-group">
									<label for="signin-email" class="control-label sr-only">id</label>
									<input type="text" class="form-control" id="custom_user_nick" name="custom_user_nick"  placeholder="id">
								</div>
								<div class="form-group">
									<label for="signin-password" class="control-label sr-only">Password</label>
									<input type="password" class="form-control" id="custom_user_pwsd" name="custom_user_pwsd" placeholder="Password">
								</div>
								<div class="form-group clearfix">
									<label class="fancy-checkbox element-left">
										<input type="checkbox">
										<span>Remember me</span>
									</label>
								</div>
								<button  type="submit" class="btn btn-primary btn-lg btn-block">LOGIN</button>
								
								<button type="button" class="btn btn-primary btn-lg btn-block" style="background-color: grey;"  onclick="location.href='join';">Sign Up</button>
								<a id="kakao-login-btn"></a>
								<button type="button"   class="kakao-login-btn" onclick="kakaoLogin()">kakaoLogin</button>
								<button type="button" class="kakao-login-btn" onclick="kakaoLogout()">kakaoLogout</button>
								<div class="bottom">
									<span class="helper-text"><i class="fa fa-lock"></i> <a href="#">Forgot password?</a></span>
								</div>
							</form>
						
					
						</div>
					</div>
					<div class="right">
						<div class="overlay"></div>
						<div class="content text">
							<h1 class="heading">Free Bootstrap dashboard template</h1>
							<p>by The Develovers</p>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- END WRAPPER -->
</body>
  
	<script>
Kakao.init('3cf0ac14f5ded25b5b97c1c0be9dd6b5'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단 */
/* function list(){
	alert("test");
	 $.ajax({
		  	type: 'post', //타입 (get,post,put등등)
		   	url:    'dolist' ,     //요청할 서버 url
		   	dataType:'json',		
		   	contentType: 'application/json; charset=utf-8',
			success : function(success){	
			},
			error : function(success){

			}
			} //error
		})//ajax
	}//else 
} */
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
       	 Kakao.API.request({
        	   url: '/v2/user/me',
          	   success: function (response) {
        		var custom_user_email = response.kakao_account.email;
        			console.log(custom_user_email);
        			 $.ajax({
        				  	type: 'post', //타입 (get,post,put등등)
        				   	url:  'kakaoLogin' ,     //요청할 서버 url
        				   	data: custom_user_email,
        				   	dataType:'text',		
        				   	contentType: 'application/json; charset=utf-8',
        					success : function(cnt){
        						if(cnt==0){
        							location.href="join"
        						}else if(cnt>0){
        							location.href="main"
        						}
        					},
        					error : function(success){}
        					})
        		},
		      	fail: function (error) {
		        console.log(error)
		      },
    		})  
		}
    })
}
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
    	  url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }

    </script>



