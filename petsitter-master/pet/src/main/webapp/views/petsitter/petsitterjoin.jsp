<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<title>펫시터 등록신청</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
   href="${PageContext.request.contextPage}/resources/css/main.css" />

<%@ include file="/views/user/userCommon.jsp"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
div.check-option	{
	float: left;
	width: 33%;

}
input.textarea-intro	{
	width: 100%;
	height: 300px;
	wrap: "hard";
}

</style>
</head>
<body class="subpage">
	<section class="wrapper style" id="two">
		<div class="box">
			<div class="content">
				<header class="align-center">
					<p>펫시터 매칭 돌봐주개</p>
					<h2>펫 시터 등록</h2>
					<br>
				</header>

				<form action="${pageContext.request.contextPath}/user/sitterjoin"
					method="post" enctype="multipart/form-data">

					<div style="width: 400px; margin: auto;">
						<b>업로드 사진 선택</b>
						<p>
							<input type="file" name="pictures" multiple required>
					</div>
					<div style="width: 400px; margin: auto;">
						<b>자기소개</b>
						<p>
							<textarea style="width: 100%" rows="7" name="psIntro"></textarea>
					</div>

					<div style="width: 400px; margin: auto;">
						<b>주소</b> <input type="text" id="sample4_postcode"
							placeholder="우편번호" readonly>
					</div>
					<div style="width: 400px; margin-bottom: 10px; margin: auto;">
						<input type="text" id="sample4_roadAddress" name="psAddress"
							placeholder="도로명주소" readonly>
					</div>
					<div style="width: 400px; margin: auto;">
						<span id="guide" style="color: #999; display: none"></span>
					</div>
					<br>
					<div style="width: 400px; margin: auto;">
						<input type="button" onclick="sample4_execDaumPostcode()"
							value="우편번호 찾기">
					</div>
					<br>
					<div style="width: 400px; margin: auto;">
						<b>소형견 펫시팅 비용</b> <input name="psSPrice" type="text"
							placeholder="비용"> <br>
					</div>
					<div style="width: 400px; margin: auto;">
						<b>중형견 펫시팅 비용</b> <input name="psMPrice" type="text"
							placeholder="비용">
						</td> <br>
					</div>
					<div style="width: 400px; margin: auto;">
						<b>대형견 펫시팅 비용</b> <input name="psLPrice" type="text"
							placeholder="비용"> <br>
					</div>

					<div style="width: 400px; margin: auto;">
						<div>
							<b> 펫시터 옵션</b>
						</div>
						<div class="check-option">
							<input type="checkbox" name="psOption1" value='true' id="1" /><label
								for="1">산책</label>
						</div>
						<div class="check-option">
							<input type="checkbox" name="psOption2" value='true' id="2" /><label
								for="2">산책</label>
						</div>
						<div class="check-option">
							<input type="checkbox" name="psOption3" value='true' id="3" /><label
								for="3">픽업</label>
						</div>
						<div class="check-option">
							<input type="checkbox" name='psOption4' value='true' id="4" /><label
								for="4">목욕</label>
						</div>
						<div class="check-option">
							<input type="checkbox" name='psOption5' value='true' id="5" /><label
								for="5">장난감</label>
						</div>
						<div class="check-option">
							<input type="checkbox" name='psOption6' value='true' id="6" /><label
								for="6">사료</label>
						</div>
						<div class="check-option">
							<input type="checkbox" name='psOption7' value='true' id="7" /><label
								for="7">간식</label>
						</div>
						<div class="check-option">
							<input type="checkbox" name='psOption8' value='true' id="8" /><label
								for="8">목줄</label>
						</div>
						<div class="check-option">
							<input type="checkbox" name='psOption9' value='true' id="9" /><label
								for="9">배변패드</label>
						</div>
						<div class="check-option">
							<input type="checkbox" id="10" name="psOption10" value='true'>
							<label for="10">식기</label>
						</div>
						<div class="check-option">
							<input type="checkbox" id="11" name="psOption11" value='true'><label
								for="11">샴푸</label>
						</div>
						<div class="check-option">
							<input type="checkbox" id="12" name="psOption12" value='true'><label
								for="12">약/영양제</label>
						</div>


					</div>

					<div style="width: 300px; margin: auto;">
						<input type="submit"
							href="${pageContext.request.contextPath}/main" value="등록"
							class="button fit special">
					</div>


				</form>
				
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
                        if (data.bname !== ''
                              && /[동|로|가]$/g.test(data.bname)) {
                           extraRoadAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== ''
                              && data.apartment === 'Y') {
                           extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                 + data.buildingName
                                 : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraRoadAddr !== '') {
                           extraRoadAddr = ' (' + extraRoadAddr + ')';
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('sample4_postcode').value = data.zonecode;
                        document.getElementById("sample4_roadAddress").value = data.jibunAddress;
                        document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                        // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                        if (roadAddr !== '') {
                           document
                                 .getElementById("sample4_extraAddress").value = extraRoadAddr;
                        } else {
                           document
                                 .getElementById("sample4_extraAddress").value = '';
                        }

                        var guideTextBox = document
                              .getElementById("guide");
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
			</div>
		</div>
	</section>
	<%@ include file="/views/footer.jsp"%>
      
</body>
</html>