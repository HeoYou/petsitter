<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${PageContext.request.contextPage}/resources/css/main.css" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="${PageContext.request.contextPage}/resources/js/jquery.min.js"></script>
<script
	src="${PageContext.request.contextPage}/resources/js/jquery.scrollex.min.js"></script>
<script
	src="${PageContext.request.contextPage}/resources/js/skel.min.js"></script>
<script src="${PageContext.request.contextPage}/resources/js/util.js"></script>
<script src="${PageContext.request.contextPage}/resources/js/main.js"></script>
</head>
<body>
	<!-- Header -->
	<header id="header">
		<div class="logo">
			<a href="/main">돌봐주개 <span>by 3조</span></a>
		</div>
		<a href="#menu">Menu</a>
	</header>

	<!-- Nav -->
	<nav id="menu">

		<ul class="links">
			<li><a href="${menu1addr }">${menu1 }</a></li>
			<li><a href="${menu2addr }">${menu2 }</a></li>
			<li><a href="${menu3addr }">${menu3 }</a></li>
			<li><a href="${menu4addr }">${menu4 }</a></li>
			<li><a href="${menu5addr }">${menu5 }</a></li>
			<li><a href="${menu6addr }">${menu6 }</a></li>
		</ul>
	</nav>

</body>
</html>
