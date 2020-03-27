<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
<title>Hielo by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${PageContext.request.contextPage}/resources/css/main.css" />
</head>
<body class="subpage">
		<!-- Header -->
		<header id="header">
			<div class="logo">
				<a href="index.html">돌봐주개 <span>에 오신걸 환영합니다!</span></a>
			</div>
			<a href="#menu">Menu</a>
		</header>

		<!-- Nav -->
		<nav id="menu">
			<ul class="links">
				<li><a href="index.html">Home</a></li>
				<li><a href="generic.html">Generic</a></li>
				<li><a href="elements.html">Elements</a></li>
			</ul>
		</nav>


		<!-- Banner -->
		<section class="banner">
			<article>
				<img
					src="${PageContext.request.contextPage}/resources/images/slide01.jpg"
					alt="" />
				<div class="inner">
					<header>
						<p>
							A free responsive web site template by <a
								href="https://templated.co">TEMPLATED</a>
						</p>
						<h2>Hielo</h2>
					</header>
				</div>
			</article>
			<article>
				<img
					src="${PageContext.request.contextPage}/resources/images/slide02.jpg"
					alt="" />
				<div class="inner">
					<header>
						<p></p>
						<h2>Magna etiam</h2>
					</header>
				</div>
			</article>
			<article>
				<img
					src="${PageContext.request.contextPage}/resources/images/slide03.jpg"
					alt="" />
				<div class="inner">
					<header>
						<p>Sed cursus aliuam veroeros lorem ipsum nullam</p>
						<h2>Tempus dolor</h2>
					</header>
				</div>
			</article>
			<article>
				<img
					src="${PageContext.request.contextPage}/resources/images/slide04.jpg"
					alt="" />
				<div class="inner">
					<header>
						<p>Adipiscing lorem ipsum feugiat sed phasellus consequat</p>
						<h2>Etiam feugiat</h2>
					</header>
				</div>
			</article>
			<article>
				<img
					src="${PageContext.request.contextPage}/resources/images/slide05.jpg"
					alt="" />
				<div class="inner">
					<header>
						<p>Ipsum dolor sed magna veroeros lorem ipsum</p>
						<h2>Lorem adipiscing</h2>
					</header>
				</div>
			</article>
		</section>
		<div class="container margin_60"></div>
		<div class="container">

			<div class="main_title">
				<h2 align="center">마이 페이지</h2>
			</div>
			<div class="button">
				<div class="col-xs-6 col-sm-12 col-md-6 col-lg-6 text-left">
					<a class="btn btn-link btn-sm btn-block"
						href="${pageContext.request.contextPath}/views/mypage/mainpage.jsp">내
						정보</a>
				</div>
				<div class="col-xs-6 col-sm-12 col-md-6 col-lg-6 text-left">
					<a class="btn btn-link btn-sm btn-block"
						href="${pageContext.request.contextPath}/views/mypage/rlog.jsp">예약현황</a>
				</div>
				<div class="col-xs-6 col-sm-12 col-md-6 col-lg-6 text-left">
					<a class="btn btn-link btn-sm btn-block"
						href="${pageContext.request.contextPath}/views/mypage/pspage.jsp">펫시터
						정보</a>
				</div>
				<div class="col-xs-6 col-sm-12 col-md-6 col-lg-6 text-left">
					<a class="btn btn-link btn-sm btn-block"
						href="${pageContext.request.contextPath}/views/mypage/prlog.jsp">펫시터
						예약현황</a>
				</div>
			</div>
		</div>


		<div class="test">

			<form class="form=horizontal">
				<div class="form-group">
					<label for="uName" class="col-sm-2 control-label">닉네임</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" value="${User.uName }"
							id="uName">
					</div>
				</div>
				<div class="form-group">
					<label for="uPw" class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="uPw"
							placeholder="비밀번호를 입력하세요">
					</div>
				</div>
				<div class="form-group">
					<label for="uPw" class="col-sm-2 control-label">비밀번호 확인</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="uPw"
							placeholder="다시 한번 비밀번호를 입력하세요">
					</div>
				</div>
				<div class="form-group">
					<label for="uAddress" class="col-sm-2 control-label">주소</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" value="${User.uAddress }"
							id="uAddress">
					</div>
				</div>
				<div class="form-group">
					<label for="uPhone" class="col-sm-2 control-label">전화번호</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" value="${User.uPhone }"
							id="uPhone">
					</div>
				</div>
			</form>

			<div class="button">
				<input type="submit" value="수정" id="btnUpdate"> <input
					type="submit"
					href="${pageContext.request.contextPath}/user/delete.do" value="탈퇴">
			</div>
		</div>

		<br>

		<footer id="footer">
			<div class="container">
				<ul class="icons">
					<li><a href="#" class="icon fa-twitter"><span
							class="label">Twitter</span></a></li>
					<li><a href="#" class="icon fa-facebook"><span
							class="label">Facebook</span></a></li>
					<li><a href="#" class="icon fa-instagram"><span
							class="label">Instagram</span></a></li>
					<li><a href="#" class="icon fa-envelope-o"><span
							class="label">Email</span></a></li>
				</ul>
			</div>
			<div class="copyright">&copy; Untitled. All rights reserved.</div>
		</footer>

		<!-- Scripts -->
		<script
			src="${PageContext.request.contextPage}/resources/js/jquery.min.js"></script>
		<script
			src="${PageContext.request.contextPage}/resources/js/jquery.scrollex.min.js"></script>
		<script
			src="${PageContext.request.contextPage}/resources/js/skel.min.js"></script>
		<script src="${PageContext.request.contextPage}/resources/js/util.js"></script>
		<script src="${PageContext.request.contextPage}/resources/js/main.js"></script>
	</form>
</body>
</html>