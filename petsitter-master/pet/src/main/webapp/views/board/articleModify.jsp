<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="ko">
<head>
<%@ include file="/views/board/common.jsp"%>
<title>게시글 등록</title>
<jsp:include page="${pageContext.request.contextPath}/header.do" />



</head>
<body>

	<!-- Container ======================================================================================= -->
	<div class="container">
		</br> </br> </br> </br>
		<h3>게시글 수정</h3>
		</br> </br>


		<form action="${pageContext.request.contextPath}/article/modify"
			method="POST">
		<input type="hidden" name="uId" value="${user.UId }">
		<input type="hidden" name="articleId" value="${article.articleId }">
		
			<fieldset>
				<div>
					<label>제목</label>

					<div>
						<input type="text" name="articleTitle" value=${article.articleTitle }>
					</div>
					</br>
				</div>

				<div>
					<label>내용</label>

					<div>
						<textarea name="articleInfo" rows="15" >${article.articleInfo }</textarea>
					</div>
					<br/>
					<br/>
				</div>
				<div>
					<div>
						<button type="submit" class="btn btn-primary">확인</button>
						<button type="reset" class="btn btn-default" onclick="location.href='javascript:history.back()'">취소</button>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
	</div>



	<!-- Footer ========================================================================================== -->

	<%@ include file="/views/footer.jsp"%>
</body>
</html>