<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<title>펫시터 정보 수정</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${PageContext.request.contextPage}/resources/css/main.css" />
<%@ include file="/views/user/userCommon.jsp"%>
</head>
<body>
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

	<div>
		<h2>Petsitter Modify</h2>
	</div>

	<form action="${pageContext.request.contextPath}/user/sitterModify"
		method="post" enctype="multipart/form-data">

		<table class="table table-striped">
			<tr>${joinFail }</tr>

			<tr>
				<th></th>
				<img width="200px" height="200px" alt="사진출력부분" title="profileimage" />
			</tr>
			<tr>
				<th>파일 업로드</th>
				<td colspan="3"><input type="file" name="picture" multiple></td>
			</tr>
			<tr>
				<th>자기소개</th>
				<td colspan="3"><input id="psIntro" name="psIntro" type="text"
					placeholder="펫시터 소개" value="${petsitter.psIntro }" required></td>

			</tr>
			<tr>
				<th>Address</th>
				<td colspan="3"><input id="uAddress" name="psAddress"
					type="text" value="${petsitter.psAddress }"></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="psOption1" value='true' />목줄<br>
					<input type="checkbox" name="psOption2" value='true' />의약품<br>
					<input type="checkbox" name="psOption3" value='true' />사료</td>
				<td><input type="checkbox" name='psOption4' value='true' />간식<br>
					<input type="checkbox" name='psOption5' value='true' />식기<br>
					<input type="checkbox" name='psOption6' value='true' />방석</td>
				<td><input type="checkbox" name='psOption7' value='true' />배변패드<br>
					<input type="checkbox" name='psOption8' value='true' />장난감<br>
					<input type="checkbox" name='psOption9' value='true' />샤워용품</td>
				<td><input type="radio" name='psOption10' value='true' />위탁<br>
					<input type="radio" name='psOption10' value='false' />방문</td>
			</tr>
			<tr>
				<th>sprice</th>
				<td colspan="3"><input name="psSPrice" type="text"
					placeholder="비용"></td>
			</tr>
			<tr>
				<th>mprice</th>
				<td colspan="3"><input name="psMPrice" type="text"
					placeholder="비용"></td>
			</tr>
			<tr>
				<th>lprice</th>
				<td colspan="3"><input name="psLPrice" type="text"
					placeholder="비용"></td>
			</tr>
		</table>


		<input type="submit" value="수정" class="button special"> <input
			type="reset" type="reset" value="취소" class="btn btn-danger">



	</form>
	<br>
</body>
</html>
