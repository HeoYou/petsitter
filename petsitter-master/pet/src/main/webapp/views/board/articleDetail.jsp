<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	pageContext.setAttribute("replaceChar", "\n");
%>
<!DOCTYPE html>

<html lang="ko">
<head>
<title>소셜보드</title>

<jsp:include page="${pageContext.request.contextPath}/header" />

</head>
<body>

	<!-- Container ======================================================================================= -->
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
					<col width="70" />
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">글번호</th>
						<th class="text-center">제목</th>
						<th class="text-center">작성일</th>
						<th class="text-center">작성자</th>
						<th class="text-center">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty detail}">
							<tr>
								<th colspan="5" class="text-center">게시물이 존재하지 않습니다.</th>
							</tr>
						</c:when>
						<c:otherwise>

							<tr>
								<td class="text-center">${detail.articleId}</td>
								<td class="text-center">${detail.articleTitle}</td>
								<td class="text-center">${detail.articleDate}</td>
								<td class="text-center">${detail.uName}</td>
								<td class="text-center">${detail.articleCount }</td>
							</tr>
							<tr>
								<td colspan="5">${fn:replace(detail.articleInfo, replaceChar, "<br/>")}
								</td>
							</tr>

						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="align-right">
				<c:if test="${detail.uId == user.UId }">
					<input type="button"
						onclick="location.href='${pageContext.request.contextPath}/article/modify?articleId=${detail.articleId}'"
						value="수정" />
					<input type="button"
						onclick="location.href='${pageContext.request.contextPath}/article/delete?articleId=${detail.articleId}'"
						value="삭제" />
				</c:if>
			</div>
		</div>
		<br /> ---댓글----------------------------------------------------<br />
		<c:choose>
			<c:when test="${empty comments}">
				<tr>
					<th colspan="5" class="text-center">댓글이 존재하지 않습니다. 첫번째 댓글을
						달아보세요!</th>
				</tr>
			</c:when>
			<c:otherwise>


				<table class="table" style="font-size: 13px; padding: 20px;">
					<c:forEach var="comments" items="${comments }">
						<tr>
							<td><strong>${comments.uName}</strong></td>
							<td class="text-right">${comments.cmtDate}</td>
							<td width="100"><c:if test="${comments.uId == user.UId }">
									<a class="glyphicon glyphicon-trash"
										href="${pageContext.request.contextPath}/article/cmtrmv?articleId=${detail.articleId}&cmtId=${comments.cmtId}">댓글삭제</a>
								</c:if></td>
						</tr>
						<tr>
							<td colspan="3">
								<p class="txt">${fn:replace(comments.comment, replaceChar, "<br/>")}</p>
							</td>
						</tr>
					</c:forEach>
				</table>


			</c:otherwise>
		</c:choose>

		<div>

			<div class="write_area">
				<p>댓글 쓰기</p>
				<form action="${pageContext.request.contextPath}/article/cmtRegist">
					<div>
						<input type="hidden" name="articleId" value="${detail.articleId}">
						<input type="hidden" name="uId" value="${user.UId }">
						<c:choose>

							<c:when test="${user.UId==null }">
								<textarea disabled placeholder="로그인시 이용가능합니다."></textarea>

							</c:when>
							<c:otherwise>
								<textarea class="input_write_comment" name="comment"
									placeholder="댓글쓰기"></textarea>
							</c:otherwise>
						</c:choose>
						
						<input type="submit" class="comment_submit" value="전송">
					</div>
				</form>
			</div>
		</div>
	</div>


	<div></div>

	<div class="text-center">
		<a href="/article/list">
			<button type="button" class="btn btn-default">목록</button>
		</a>
	</div>
	<!-- Footer ========================================================================================== -->

	<%@ include file="/views/footer.jsp"%>
</body>
</html>