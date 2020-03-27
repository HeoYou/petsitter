<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>돌봐주개</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${PageContext.request.contextPage}/resources/css/main.css" />


<%@ include file="/views/user/userCommon.jsp"%>
</head>

<body class="subpage">
	<section class="wrapper style2" id="two">
		<div class="box">
			<div class="content">
				<header class="align-center">
					<p>펫시터 매칭 돌봐주개</p>
					<h2>예약 상세 정보</h2>
				</header>
				<div style="width: 700px; margin: auto;">
					<div style="width: 350px; margin: auto; float: left;">
						<img
							src="${pageContext.request.contextPath}/resources/icon/option1.jpg" />
					</div>
					<div style="width: 350px; margin: auto; float: right;">
						<b>예약번호</b> &nbsp; ${Reservation.rId}
					</div>
					<p>
					<div style="width: 350px; margin: auto; float: right;">
						<b>기간</b> &nbsp; ${Reservation.rSdate} ~ ${Reservation.rEdate}
					</div>


					<div style="width: 350px; margin: auto;">
						<b>예약자명</b> &nbsp; ${Reservation.uName }

					</div>

					<div style="width: 350px; margin: auto;">
						<b>펫 시터</b> &nbsp; ${psName }
					</div>
					<div style="width: 350px; margin: auto;">
						<b>펫 시팅 비용</b> &nbsp; ${Reservation.rPrice }
					</div>
				</div>
				<a href="${pageContext.request.contextPath}/rsv/accept?rId=${Reservation.rId}">수락</a>
				<a href="${pageContext.request.contextPath}/rsv/deny?rId=${Reservation.rId}">거절</a>
				<a href="${pageContext.request.contextPath}/rsv/success?rId=${Reservation.rId}">완료</a>


			</div>
		</div>

	</section>
	<%@ include file="/views/footer.jsp"%>
</body>
</html>