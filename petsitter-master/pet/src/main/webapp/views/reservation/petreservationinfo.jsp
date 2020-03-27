<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<head>
<title>펫시터 찾아주는 돌봐주개</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${PageContext.request.contextPage}/resources/css/main.css" />
</head>
<body class="subpage">
	<c:if test="${petsitter.psId == null }">
		<script type="text/javascript">
			var login = confirm("펫시터가 아니시네요 \n 펫시터에 등록하시겠습니까?");

			if (login) {
				location.href = "/views/petsitter/petsitterjoin.jsp";
			} else {
				history.back();
			}
		</script>

	</c:if>

	<%@ include file="/views/user/userCommon.jsp"%>

	<div class="inner">
		<br>
		<div class="main_title">
			<h2 align="center">
				펫시터 <span>예약 현황</span>
			</h2>
		</div>
		<div class="box">
			<div class="content">
				<div align="center">
					<a
						href="${pageContext.request.contextPath}/user/userinfo"
						class="button alt">내 정보</a> <a
						href="${pageContext.request.contextPath}/rsv/mylist.do"
						class="button alt">예약 현황</a> <a
						href="${pageContext.request.contextPath}/user/sitterModify"
						class="button alt">펫시터 정보</a> <a
						href="${pageContext.request.contextPath}/rsv/pslist.do"
						class="button alt">펫시터 예약정보</a>
					<p>
				</div>



			</div>
		</div>
	</div>
	<div class="test">
		<div class="table-responsive">
			<table class="table table-striped table-bordered table-hover">
				<colgroup>
					<col width="50" />
					<col width="110" />
					<col width="100" />
					<col width="70" />
					<col width="50" />
					<col width="70" />
					<col width="70" />
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">예약 번호</th>
						<th class="text-center">시작 일자</th>
						<th class="text-center">종료 일자</th>
						<th class="text-center">가격</th>
						<th class="text-center">예약자</th>
						<th class="text-center">상태</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty Reservation}">
							<tr>
								<th colspan=6 class="text-center">예약이 없습니다!</th>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="Reservation" items="${Reservation}">
								<tr>
									<td class="text-center"><a
										href="${pageContext.request.contextPath}/rsv/myread.do?rId=${Reservation.rId}">${Reservation.rId}</a>
									</td>
									<td class="text-center"><fmt:formatDate
											value="${Reservation.rSdate}" pattern="YY-MM-dd" /></td>
									<td class="text-center"><fmt:formatDate
											value="${Reservation.rEdate}" pattern="YY-MM-dd" /></td>
									<td class="text-center">${Reservation.rPrice}</td>
									<td class="text-center">${Reservation.uName}</td>
									<c:if test="${Reservation.rStatus eq 0}">
											<td class="text-center">접수 중</td>
										</c:if>
										<c:if test="${Reservation.rStatus eq 1}">
											<td class="text-center">접수 완료</td>
										</c:if>
										<c:if test="${Reservation.rStatus eq 2}">
											<td class="text-center">시팅 완료</td>
										</c:if>
										<c:if test="${Reservation.rStatus eq 3}">
											<td style="font-weight:bold; color:red;" class="text-center">거 절</td>
										</c:if>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
	<br>
	<footer id="footer">
		<div class="container">
			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
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


</body>
</html>