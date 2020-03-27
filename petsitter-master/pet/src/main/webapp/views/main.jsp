<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>펫시터 매칭 돌봐주개</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${PageContext.request.contextPage}/resources/css/main.css" />
	
</head>
<body>

	<!-- Header -->
	<header id="header" class="alt">
		<div class="logo">
			<a href="${PageContext.request.contextPage}/main">돌봐주개 <span>by
					BU-3TEAM</span></a>
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

	<!-- Banner -->
	<section class="banner full">
		<article>
			<img
				src="${PageContext.request.contextPage}/resources/images/home1.jpg"
				alt="" />
			<div class="inner">
				<header>
					<p>
						당신의 반려동물을 돌봐드립니다. <a
							href="${PageContext.request.contextPage}/petsitter/list">예약하기</a>
					</p>
					<h2>돌봐주개</h2>
				</header>
			</div>
		</article>
		<article>
			<img
				src="${PageContext.request.contextPage}/resources/images/home2.jpg"
				alt="" />
			<div class="inner">
				<header>
					<p>
						믿을 수 있는 펫시터를 소개합니다. <a
							href="${PageContext.request.contextPage}/views/petsitter/petsearch.jsp">펫시터
							찾기</a>
					</p>
					<h2>돌봐주개</h2>
				</header>
			</div>
		</article>
		<article>
			<img
				src="${PageContext.request.contextPage}/resources/images/home3.jpg"
				alt="" />
			<div class="inner">
				<header>
					<p>사람의 영혼은 개를 대하는 모습으로 알 수 있다.</p>
					<h2>돌봐주개</h2>
				</header>
			</div>
		</article>
		<article>
			<img
				src="${PageContext.request.contextPage}/resources/images/home4.jpg"
				alt="" />
			<div class="inner">
				<header>
					<p>정의로운 인생을 추구하는 사람이라면 첫 번째 행동은 동물 학대를 금지하는 것이다.</p>
					<h2>돌봐주개</h2>
				</header>
			</div>
		</article>
		<article>
			<img
				src="${PageContext.request.contextPage}/resources/images/home5.jpg"
				alt="" />
			<div class="inner">
				<header>
					<p>인간은 동물을 다스릴 권리가 있는 것이 아니라 모든 생명체를 지킬 의무가 있다.</p>
					<h2>돌봐주개</h2>
				</header>
			</div>
		</article>
	</section>

 <!-- One -->
	<section id="one" class="wrapper style2">
		<div class="inner">
			<div class="grid-style">

				<div>
					<div class="box">
						<div class="image fit">
							<img
								src="${PageContext.request.contextPage}/resources/images/pic02.jpg"
								alt="" />
						</div>
						<div class="content">
							<header class="align-center">
								<p>반려동물에게 따뜻한 사랑을 주세요.</p>
								<h2>펫시터 등록하기</h2>
							</header>
							<p>
								돌봐주개에서 사랑넘치는 펫시터를 찾습니다. <br> 따뜻한 사랑을 전해주세요,
							</p>
							<footer class="align-center">
								<a
									href="${PageContext.request.contextPage}/views/petsitter/petsitterjoin.jsp"
									class="button alt">펫시터 등록하기</a>
							</footer>
						</div>
					</div>
				</div>

				<div>
					<div class="box">
						<div class="image fit">
							<img
								src="${PageContext.request.contextPage}/resources/images/pic03.jpg"
								alt="" />
						</div>
						<div class="content">
							<header class="align-center">
								<p>믿을 수 있는 펫시터 찾기</p>
								<h2>펫시터에게 맡기기</h2>
							</header>
							<p>
								펫시터의 집에서 편안하고 자유롭게 지낼 수 있어요.<br> 내 집처럼 편안하게 반려동물만을 위해
								보살펴드립니다.<br>
							</p>
							<footer class="align-center">
								<a href="#" class="button alt">펫시터에게 맡기기</a>
							</footer>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>

	<div class="row">
		<c:forEach items="${petSitters}" var="petSitters" varStatus="sts">
			<div class="col-md-4 col-sm-6 wow zoomIn" data-wow-delay="0.1s">
				<div class="tour_container">
					<div class="ribbon_3 popular">
						<span>BEST ${petSitters.psId}</span>
					</div>
					<div class="img_container">
						<input type="hidden" name="psId" value="${petSitters.psId}">
						<a href="detail.do?psId=${petSitters.psId}"> <img width=400
							height=auto src="/resources/image/dog1.jpg"
							class="img-responsive" alt="Image">
						</a>
					</div>
					<div class="tour_title">
						<h3>
							<strong>${petSitters.uName}</strong>
						</h3>
						${petSitters.psAddress}
						<div class="rating">
							<i class="icon-smile voted"></i><i class="icon-smile voted"></i><i
								class="icon-smile voted"></i><i class="icon-smile voted"></i><i
								class="icon-smile voted"></i><small>${petSitters.sittinCount}</small>
						</div>
						<div class="wishlist">
							<a class="tooltip_flip tooltip-effect-1"
								href="javascript:void(0);">+<span
								class="tooltip-content-flip"><span class="tooltip-back">즐겨찾기</span></span></a>
						</div>
						<!-- End wish list-->
					</div>
				</div>
				<!-- End box tour -->
			</div>
		</c:forEach>
	</div>
	<!-- End row -->



	<footer id="footer">
		<div class="container">
			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="https://www.instagram.com/dolbajudog/"
					class="icon fa-instagram"><span class="label">Instagram</span></a></li>
				<li><a href="#" class="icon fa-envelope-o"><span
						class="label">Email</span></a></li>
			</ul>
		</div>
		<div class="copyright">&copy; 2019BU-CAPSTONE 돌봐주개. All rights
			reserved.</div>
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

</body>
</html>