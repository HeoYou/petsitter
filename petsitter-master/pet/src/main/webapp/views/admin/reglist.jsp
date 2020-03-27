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

<title>Petsitters</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${PageContext.request.contextPage}/resources/css/main.css" />

<header id="header">
	<div class="logo">
		<a href="/main">관리자 페이지 <span>by 3조</span></a>
	</div>
	<a href="${pageContext.request.contextPath }/views/main.jsp"> 메인메뉴
	</a> <a
		href="${pageContext.request.contextPath }/views/petsitter/petsitters.jsp">
		펫시터 리스트 </a>
</header>
<body class="subpage">


	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>펫시터 관리</p>
				<h2>Petsitters administration</h2>
			</header>
		</div>
	</section>
	<div class="container">
		</br> </br>
		<table class="table table-hover">
			<thead>
				<tr>
					<th style:"width: 5%; ">펫시터 번호</th>
					<th style:"width: 15%; ">펫시터 이름</th>
					<th style:"width: 60%; ">펫시터 주소</th>
					<th style:"width: 10%; "> </th>
					<th style:"width: 10%; "> </th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty petSitters}">
						<tr>
							<th colspan="5" class="text-center">등록시킬 펫 시터가 없습니다.</th>
						</tr>

					</c:when>
					<c:otherwise>
						<c:forEach var="petSitter" items="${petSitters}">
							<tr>
								<c:if test="${petSitter.psflag eq 2 }">
									<td style="font-weight: bold;"><a
										href="${pageContext.request.contextPath }/petsitter/detail.do?psId=${petSitter.psId}">
											<font color="blue">${petSitter.psId}</font>
									</a></td>
								</c:if>
								<c:if test="${petSitter.psflag eq 0 }">
									<td><a
										href="${pageContext.request.contextPath }/petsitter/detail.do?psId=${petSitter.psId}">
											${petSitter.psId} </a></td>
								</c:if>
								<td>${petSitter.uName}</td>
								<td>${petSitter.psAddress }</td>
								<td><input type="button" value="수락"
									onclick="location.href = '${pageContext.request.contextPath }/admin/accept?psId=${petSitter.psId}'" /></td>
								<td><input type="button" value="거절"
									onclick="location.href = '${pageContext.request.contextPath }/admin/deny?psId=${petSitter.psId}'" /></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>

	<%@ include file="/views/footer.jsp"%>
</body>
</html>
