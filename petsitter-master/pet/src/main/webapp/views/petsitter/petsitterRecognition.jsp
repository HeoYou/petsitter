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
<jsp:include page="${pageContext.request.contextPath}/header.do" />
</head>
<body class="subpage">
	<form action="${pageContext.request.contextPath}/reservation/mylist.do"
		method="post" enctype="multipart/form-data">
		<%@ include file="/views/user/userCommon.jsp"%>


		<div class="inner">
			<br>
			<div class="main_title">
				<h2 align="center">
					펫시터 <span>신청 현황</span>
				</h2>
			</div>

			<div class="test">
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<colgroup>
							<col width="60" />
							<col width="100" />
							<col width="100" />
							<col width="70" />
						</colgroup>
						<thead>
							<tr>
								<th class="text-center">예약 번호</th>
								<th class="text-center">지역</th>
								<th class="text-center">이름</th>
								<th class="text-center">상태</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty petSitters}">
									<tr>
										<th colspan=4 class="text-center">신청 현황이 존재하지 않습니다!</th>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="petSitters" items="${petSitters}">
										<tr>
											<td class="text-center"><a
												href="${pageContext.request.contextPath}/petsitter/myread2.do?psId=${petSitters.psId}">${petSitters.psId}</a>
											</td>
											<td class="text-center">${petSitters.psAddress}</td>
											<td class="text-center">${petSitters.uName}</td>

											<c:if test="${petSitters.psflag eq 0}">
												<td class="text-center">접수 중</td>
											</c:if>
											<c:if test="${petSitters.psflag eq 1}">
												<td class="text-center">펫시터 가입 완료</td>
											</c:if>
											<c:if test="${petSitters.psflag eq 2}">
												<td class="text-center">펫시터 가입 거절</td>
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
			<%@ include file="/views/footer.jsp"%>
	</form>
</body>
</html>