<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>
<%@ include file="/views/board/common.jsp"%>
<title>소셜보드</title>
<!-- Header ========================================================================================== -->
<jsp:include page="${pageContext.request.contextPath}/header.do" />
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />



</head>

<body class="subpage">

	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>소통하개</p>
				<h2>Article</h2>
			</header>
		</div>
	</section>

	<div class="container">
		<br />
		<div>
			<table>
				<colgroup>
					<col width="100" />
					<col width="*" />
					<col width="120" />
					<col width="120" />
					<col width="50" />
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">번호</th>
						<th class="text-center">제목</th>
						<th class="text-center">작성일</th>
						<th class="text-center">작성자</th>
						<th class="text-center">조회</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty articles}">
							<tr>
								<th colspan="5" class="text-center">게시물이 존재하지 않습니다.</th>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="article" items="${articles}">
								<tr>
									<td class="text-center">${article.articleId}</td>
									<td><a
										href="/article/detail?articleId=${article.articleId }">
											${article.articleTitle} </a>
									<c:if test="${article.articleDate == today}">ⓝ</c:if></td>
									<td class="text-center">${article.articleDate }</td>
									<td align="center"><a
										href="/article/userdetail?articleId=${article.articleId }">
											${article.uName} </a>
									<td class="text-center">${article.articleCount }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="align-right">
				<a
					href="${pageContext.request.contextPath}/views/board/articleWrite.jsp">
					<button type="button" class="btn btn btn-warning">등록</button>
				</a>
			</div>
		</div>
	</div>

	<!-- Footer ========================================================================================== -->

	</div>
	<%@ include file="/views/footer.jsp"%>
</body>
</html>