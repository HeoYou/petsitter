<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${PageContext.request.contextPage}/resources/css/main.css" />

<!-- BASE CSS -->
<!--     <link href="css/base.css" rel="stylesheet"> -->
<link rel="stylesheet" href="/resources/css/base.css" type="text/css" />

<!-- REVOLUTION SLIDER CSS -->
<!--     <link href="rs-plugin/css/settings.css" rel="stylesheet"> -->
<link rel="stylesheet" href="/resources/rs-plugin/css/settings.css"
	type="text/css" />
<!--     <link href="css/extralayers.css" rel="stylesheet"> -->
<link rel="stylesheet" href="/resources/css/extralayers.css"
	type="text/css" />
<!--      <link href="css/tabs_home.css" rel="stylesheet"> -->
<link rel="stylesheet" href="/resources/css/tabs_home.css"
	type="text/css">


<title>Petsitters</title>

<%-- <jsp:include page="${pageContext.request.contextPath}/header.do" /> --%>

<style>
.carousel-inner>.item>a>img, .carousel-inner>.item>img, .img-responsive,
	.thumbnail a>img, .thumbnail>img {
	display: block;
	max-width: 350px;
	height: 300px;
}

.pagination {
	display: inline-block;
	padding-left: 0;
	margin-left: 45%;
	border-radius: 4px;
}
</style>

<jsp:include page="${pageContext.request.contextPath}/header.do" />

</head>
<body class="subpage">

	<section class="banner">
		<article>
			<img
				src="${PageContext.request.contextPage}/resources/images/home1.jpg"
				alt="" /> <font size="7em">돌봐주개</font>
		</article>
		<article>
			<img
				src="${PageContext.request.contextPage}/resources/images/home2.jpg"
				alt="" /> <font size="7em">돌봐주개</font>
		</article>
		<article>
			<img
				src="${PageContext.request.contextPage}/resources/images/home3.jpg"
				alt="" /> <font size="7em">돌봐주개</font>
		</article>
		<article>
			<img
				src="${PageContext.request.contextPage}/resources/images/home4.jpg"
				alt="" /> <font size="7em">돌봐주개</font>
		</article>
		<article>
			<img
				src="${PageContext.request.contextPage}/resources/images/home5.jpg"
				alt="" /> <font size="7em">돌봐주개</font>
		</article>
	</section>


	<div class="container margin_60">

		<input value="펫시터 검색하기"
			onclick="if(this.parentNode.getElementsByTagName('div')[0].style.display != ''){this.parentNode.getElementsByTagName('div')[0].style.display = '';this.value = '숨기기';}else{this.parentNode.getElementsByTagName('div')[0].style.display = 'none'; this.value = '펫시터 검색하기';}"
			type="button" /></br>


		<div style="display: none;">
			<form action="findByName.do">
				<input name="sName" type="text" placeholder="펫시터 검색" value="">
				<input class="btn btn-xs btn-default" type="submit" value="검색">
			</form>

			<form action="findByAddress.do">
				<input name="sAddress" type="text" placeholder="지역 검색" value="">
				<input class="btn btn-xs btn-default" type="submit" value="검색">
			</form>
			<a href="${pageContext.request.contextPath}/petsitter/list"
				class="button special">검색 값 초기화</a>


		</div>


		<div class="main_title">
			<h2>
				유명한<span> 펫시터</span>
			</h2>
		</div>
		<div id="map" style="width: 100%; height: 400px; margin-bottom: 20px;"></div>
		<br>
		<br>

		<div class="row">
			<c:forEach items="${petSitters}" var="petSitter" varStatus="sts">
				<div class="col-md-4 col-sm-6 wow zoomIn" data-wow-delay="0.1s">
					<div class="tour_container">
						<div class="ribbon_3 popular">
							<span>BEST ${sts.count}</span>
						</div>
						<div class="img_container">
							<input type="hidden" name="psId" value="${petSitter.psId}">
							<a href="detail.do?psId=${petSitter.psId}"> <img width=365
								height=auto
								src="${PageContext.request.contextPage}/resources/upload/${petSitter.imgId}"
								class="img-responsive" alt="Image">
							</a>
						</div>
						<div class="tour_title">
							<h3>
								<strong>${petSitter.uName}</strong>
							</h3>
							${petSitter.psAddress}
							<div class="rating">
								<i class="icon-smile voted"></i><i class="icon-smile voted"></i><i
									class="icon-smile voted"></i><i class="icon-smile voted"></i><i
									class="icon-smile voted"></i><small>${petSitter.sittinCount}</small>
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
	</div>
	<!-- End row -->

	<%@ include file="/views/footer.jsp"%>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=244fd56c890625a569e0a0afdec80d2b&libraries=services"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			level : 7
		};

		var map = new kakao.maps.Map(container, options);
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		var geocoder = new kakao.maps.services.Geocoder();
		
		
		<c:forEach items="${petSitters}" var="petSitter">
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${petSitter.psAddress}', function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:3px 0;">${petSitter.uName}</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		     } 
		});    
		</c:forEach>
	</script>
</body>
</html>
