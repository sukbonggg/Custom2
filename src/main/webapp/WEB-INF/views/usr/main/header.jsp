 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@page import="java.net.URLEncoder"%>

<!DOCTYPE html>
<html lang="ko">
 
<head>
<title>Custom</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- VENDOR CSS -->
<!-- Javascript -->
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="/scripts/klorofil-common.js"></script>
<link rel="stylesheet" href="/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/vendor/linearicons/style.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="/css/main.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet" href="/css/demo.css">
<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
	rel="stylesheet">
<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76" href="/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="/img/favicon.png">

</head>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="index.html"> THE CUSTOM</a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth">
						<i class="lnr lnr-arrow-left-circle"></i>
					</button>
				</div>
			
				<c:if test="${empty sessionScope.custom_user_nick }">
				<div class="navbar-btn navbar-btn-right">
				<!-- 세션 저장되어있는 널 값이면 -->							
				
					<a class="btn btn-success update-pro"> <span>login</span></a>
					 <a class="btn "><span>Sing up</span></a>
				</div>
				</c:if>		
				
				<c:if test="${!empty sessionScope.custom_user_nick }">
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						 <form action="doLogout">
						<li class="dropdown">
						<img src="/img/user.png" class="img-circle" alt="Avatar"><span>${sessionScope.custom_user_nick }님 환영합니다</span>
						<button type="submit" style="margin-top:25px; padding:7px;  background-color:#00FF00 " >logOut</button>
						</form>
					</ul>
				</div>
				</c:if>
				
			</div>
		</nav>
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="../member/main" class="active"><i class="lnr lnr-home"></i> <span>Dashboard</span></a></li>
						<li><a href="../board/listBoard" class=""><i class="lnr lnr-dice"></i> <span>Board</span></a></li>
						<li><a href="typography.html" class=""><i class="lnr lnr-text-format"></i> <span>JqGrid</span></a></li>
						<li><a href="icons.html" class=""><i class="lnr lnr-linearicons"></i> <span>API</span></a></li>
					</ul>
				</nav>
			</div>
		</div>
		
