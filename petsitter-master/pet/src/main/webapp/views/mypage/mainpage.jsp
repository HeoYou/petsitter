<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>돌봐주개</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${PageContext.request.contextPage}/resources/css/main.css" />
</head>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						console.log(data.sido + " " + data.sigungu + " "
								+ data.bname1 + " " + data.bname2);

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;

						if (data.bname1 == "") {
							document.getElementById("sigunguquery").value = data.sido
									+ " " + data.sigungu + " " + data.bname;
						} else {
							document.getElementById("sigunguquery").value = data.sido
									+ " "
									+ data.sigungu
									+ " "
									+ data.bname1
									+ " " + data.bname2;
						}

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
</script>
<!-- Scripts -->

<body class="subpage">
	<form action="${pageContext.request.contextPath}/user/edit"
		method="post" enctype="multipart/form-data">
		<%@ include file="/views/user/userCommon.jsp"%>
		<div class="inner">
			<br>
			<div class="main_title">
				<h2 align="center">
					마이 <span>페이지</span>
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



					<div style="width: 300px; margin: auto;">

						<div style="width: 300px; margin: auto;">
							<b>닉네임</b>
						</div>

						<div style="width: 300px; margin: auto;">
							<input type="text" class="form-control" name="uName"
								value="${userinfo.uName }">
						</div>

						<div style="width: 300px; margin: auto;">
							<b>비밀번호</b>
						</div>

						<div style="width: 300px; margin: auto;">
							<input type="password" class="form-control" name="uPw"
								placeholder="비밀번호를 입력하세요">
						</div>

						<div style="width: 300px; margin: auto;">
							<b>비밀번호 확인</b>
						</div>

						<div style="width: 300px; margin: auto;">
							<input type="text" class="form-control" id="uPw"
								placeholder="다시 한번 비밀번호를 입력하세요">
						</div>

						<div style="width: 300px; margin: auto;">
							<b>주소</b>
						</div>
						<div style="width: 300px; margin: auto;">
							<input type="text" id="sample4_roadAddress" name="uAddress"
								placeholder="도로명주소" value="${userinfo.uAddress }" readonly>
						</div>
						<div style="width: 300px; margin: auto;">
							<span id="guide" style="color: #999; display: none"></span>
						</div>
						<div style="width: 300px; margin: auto;">
							<input type="button" onclick="sample4_execDaumPostcode()"
								value="우편번호 찾기">
						</div>
						<div style="width: 300px; margin: auto;">
							<b>전화번호</b>
						</div>

						<div style="width: 300px; margin: auto;">
							<input type="text" class="form-control" name="uPhone"
								value="${userinfo.uPhone }" id="uPhone">
						</div>

						<p>
						<div style="width: 300px; margin: auto;">
							<a
								href="${pageContext.request.contextPath}/user/edit.do?uId=${user.UId}"
								class="button special">수정</a> <a
								href="${pageContext.request.contextPath}/user/delete.do?uId=${user.UId}"
								class="button alt">탈퇴</a>
						</div>


					</div>
				</div>
			</div>




			<br>
			<!-- Footer -->
			<%@ include file="/views/footer.jsp"%>
	</form>
</body>
</html>