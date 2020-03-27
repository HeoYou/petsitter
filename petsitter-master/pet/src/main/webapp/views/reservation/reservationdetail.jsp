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
				<p>
					<br>
				<form action="${pageContext.request.contextPath}/rv/write" method="get">
					<div style="width: 700px; margin: auto;">
						<div style="width: 100%; margin: auto;">
							<b>리뷰 작성</b>
							<textarea cols="30" rows="5" name="rvIntro" style="resize: none;"></textarea>
							<p>
						</div>
					</div>
					
					<input type="hidden" name="psId" value="${Reservation.psId }"></input>


					<div style="width: 700px; margin: auto;">
						<b> 만족도</b>
						<div>
							<input type="radio" name="rvScore" value="1" id="1" /><label
								for="1">1점</label> <input type="radio" name="rvScore" value="2"
								id="2" /><label for="2">2점</label> <input type="radio"
								name="rvScore" value="3" id="3" /><label for="3">3점</label> <input
								type="radio" name="rvScore" value="4" id="4"><label
								for="4" />4점</label> <input type="radio" name="rvScore" value="5" id="5" /><label
								for="5">5점</label>
						</div>
					</div>

					<p>
					
					<div style="width: 700px; margin: auto;">
						<div style="float: left; width: 250px;">
							<button type="submit" class="button fit special">리뷰 작성</button>
							&nbsp;
						</div>
						<div style="float: right; width: 250px;">
							<a href="${pageContext.request.contextPath}/rsv/mylist.do"
								class="button fit special">목록으로</a>
						</div>
					</div>
				</form>

			</div>
		</div>
	</section>
	<%@ include file="/views/footer.jsp"%>
</body>
</html>