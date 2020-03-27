<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>로그인</title>

<%@ include file="/views/user/userCommon.jsp"%>

</head>
<body class="subpage">

	<section class="wrapper style2" id="two">
		<form action="${pageContext.request.contextPath}/user/login"
			method="post">
			<div class="inner">
				<div class="box">
					<div class="content">
						<header class="align-center">
							<p>펫시터 매칭 돌봐주개</p>
							<h2>로그인</h2>
						</header>
						<div style="width: 300px; margin: auto;">
							<p>
							<div style="width: 300px; margin: auto;" id="id_check"></div>
							<div style="width: 300px; margin: auto;">
								<b>ID</b>
							</div>
							<div style="width: 300px; margin: auto;">
								<input id="uId" name="uId" type="text" placeholder="ID를 입력해주세요."
									required>
							</div>
							</p>

							<p>
							<div style="width: 300px; margin: auto;">
								<b>Password</b>
							</div>
							<div style="width: 300px; margin: auto;">
								<input id="uPw" name="uPw" type="password"
									placeholder="비밀번호를 입력해주세요." required>
							</div>
							</p>
							<p>
							<div>
								<div style="width: 300px; margin: auto;">
									<input type="submit" class="button fit special"	value="로그인">
								</div>
								</p>
								<p align="center">
									회원가입을 안하셨나요? <a
										href="${pageContext.request.contextPath}/views/user/join.jsp">회원가입</a>
							</div>
						</div>
					</div>
				</div>
		</form>
	</section>



</body>
<%@ include file="/views/footer.jsp"%>

</html>