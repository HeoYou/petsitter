<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>돌봐주개</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${PageContext.request.contextPage}/resources/css/main.css" />
	<jsp:include page="${pageContext.request.contextPath}/header.do" />
<%@ include file="/views/user/userCommon.jsp"%>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script
	src="${PageContext.request.contextPage}/resources/js/jquery.min.js"></script>
<script
	src="${PageContext.request.contextPage}/resources/js/jquery.scrollex.min.js"></script>
<script
	src="${PageContext.request.contextPage}/resources/js/skel.min.js"></script>
<script src="${PageContext.request.contextPage}/resources/js/util.js"></script>
<script src="${PageContext.request.contextPage}/resources/js/main.js"></script>
</head>


<script type="text/javascript">
	var slideIndex = 1;
	showSlides(slideIndex);

	// Next/previous controls
	function plusSlides(n) {
		showSlides(slideIndex += n);
	}

	// Thumbnail image controls
	function currentSlide(n) {
		showSlides(slideIndex = n);
	}

	function showSlides(n) {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("dot");
		if (n > slides.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = slides.length
		}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " active";
	}
</script>
<script type="text/javascript">
	var slideIndex = 0;
	showSlides();

	function showSlides() {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		slideIndex++;
		if (slideIndex > slides.length) {
			slideIndex = 1
		}
		slides[slideIndex - 1].style.display = "block";
		setTimeout(showSlides, 5000); // Change image every 2 seconds
	}
</script>
<script>
	$(function() {
		currentSlide(0);
	});
</script>
<style>
/* Slideshow container */
.slideshow-container {
	max-width: 1000px;
	position: relative;
	margin: auto;
}

/* Hide the images by default */
.mySlides {
	display: none;
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	margin-top: -22px;
	padding: 16px;
	color: white;
	font-weight: bold;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* Caption text */
.text {
	color: #f2f2f2;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

/* The dots/bullets/indicators */
.dot {
	cursor: pointer;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active, .dot:hover {
	background-color: #717171;
}

/* Fading animation */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1s;
	animation-name: fade;
	animation-duration: 1s;
	height: 300px;
	top: 50%;
	left: 50%;
	margin: auto;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.text {
		font-size: 11px
	}
}

div.check-option {
	float: left;
	width: 33%;
}

div.div-label {
	font-weight: bold;
	margin-top: 15px;
}

div.test {
	width: 500px;
	margin-left: auto;
	margin-right: auto;
}
</style>

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


				<form action="${pageContext.request.contextPath}/user/sitterModify"
					method="post" enctype="multipart/form-data">


					<div class="test" height>
						<div>
							<div class="slideshow-container">
								<c:forEach var="image" items="${images}">
									<div class="mySlides fade">
										<img
											src="${PageContext.request.contextPage}/resources/upload/${image }"
											style="height: 100%; margin-left: auto; margin-right: auto; display: block;">
									</div>
								</c:forEach>
								<div style="clear: both;"></div>
								<hr width="100%" align="left">

								<!-- Next and previous buttons -->
								<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a
									class="next" onclick="plusSlides(1)">&#10095;</a>
							</div>
						</div>

						<div>
							<div class="div-label" for="uName" class="col-sm-2 control-label">파일
								업로드</div>
							<input type="file" name="pictures" multiple required>
						</div>
					<div style="width: 400px; margin: auto;">
						<b>자기소개</b>
						<p>
							<textarea style="width: 100%" rows="7" name="psIntro" value="${petsitter.psIntro }"></textarea>
					</div>
						<div>
							<div class="div-label" for="uPhone"
								class="col-sm-2 control-label">전화번호</div>
							<div class="col-sm-10">
								<input type="text" class="form-control" value="${user.UPhone }"
									name="uPhone">
							</div>
						</div>
						<div>
							<div class="div-label">소형견 펫시팅 가격</div>
							<div>
								<input name="psSPrice" type="text" placeholder="비용"
									value="${petsitter.psSPrice }">
							</div>

						</div>
						<div>
							<div class="div-label">중형견 펫시팅 가격</div>
							<div>
								<input name="psMPrice" type="text" placeholder="비용"
									value="${petsitter.psMPrice }">
							</div>

						</div>
						<div>
							<div class="div-label">대형견 펫시팅 가격</div>
							<div>
								<input name="psLPrice" type="text" placeholder="비용"
									value="${petsitter.psLPrice }">
							</div>

						</div>


						<div class="div-label">
							<b style="margin-bottom: 20px;"> 펫시터 옵션</b>
						</div>
						<div>
							<div class="check-option">
								<input type="checkbox" name="psOption1" value='true' id="1" 
								<c:if test="${petsitter.psOption1 eq 'true'}"> checked </c:if>/><label
									for="1">산책</label>
							</div>
							<div class="check-option">
								<input type="checkbox" name="psOption2" value='true' id="2" 
								<c:if test="${petsitter.psOption2 eq 'true'}"> checked </c:if>/><label
									for="2">산책</label>
							</div>
							<div class="check-option">
								<input type="checkbox" name="psOption3" value='true' id="3" 
								<c:if test="${petsitter.psOption3 eq 'true'}"> checked </c:if>/><label
									for="3">픽업</label>
							</div>
							<div class="check-option">
								<input type="checkbox" name='psOption4' value='true' id="4" 
								<c:if test="${petsitter.psOption4 eq 'true'}"> checked </c:if>/><label
									for="4">목욕</label>
							</div>
							<div class="check-option">
								<input type="checkbox" name='psOption5' value='true' id="5" 
								<c:if test="${petsitter.psOption5 eq 'true'}"> checked </c:if>/><label
									for="5">장난감</label>
							</div>
							<div class="check-option">
								<input type="checkbox" name='psOption6' value='true' id="6" 
								<c:if test="${petsitter.psOption6 eq 'true'}"> checked </c:if>/><label
									for="6">사료</label>
							</div>
							<div class="check-option">
								<input type="checkbox" name='psOption7' value='true' id="7" 
								<c:if test="${petsitter.psOption7 eq 'true'}"> checked </c:if>/><label
									for="7">간식</label>
							</div>
							<div class="check-option">
								<input type="checkbox" name='psOption8' value='true' id="8" 
								<c:if test="${petsitter.psOption8 eq 'true'}"> checked </c:if>/><label
									for="8">목줄</label>
							</div>
							<div class="check-option">
								<input type="checkbox" name='psOption9' value='true' id="9" 
								<c:if test="${petsitter.psOption9 eq 'true'}"> checked </c:if>/><label
									for="9">배변패드</label>
							</div>
							<div class="check-option">
								<input type="checkbox" id="10" name="psOption10" value='true'
								<c:if test="${petsitter.psOption10 eq 'true'}"> checked </c:if>/>
								<label for="10">식기</label>
							</div>
							<div class="check-option">
								<input type="checkbox" id="11" name="psOption11" value='true'
								<c:if test="${petsitter.psOption11 eq 'true'}"> checked </c:if>/><label
									for="11">샴푸</label>
							</div>
							<div class="check-option">
								<input type="checkbox" id="12" name="psOption12" value='true'
								<c:if test="${petsitter.psOption12 eq 'true'}"> checked </c:if>/><label
									for="12">약/영양제</label>
							</div>
							<input type="submit" value="수 정" class="button special">
						</div>
						</p>

					</div>

				</form>
				<br>
			</div>
		</div>
	</div>

	<br>

	<%@ include file="/views/footer.jsp"%>

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
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
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
							document.getElementById("sample4_roadAddress").value = data.jibunAddress;

							if (data.bname1 == "") {
								document.getElementById("sigunguquery").value = data.sido
										+ " " + data.sigungu + " " + data.bname;
							} else {
								document.getElementById("sigunguquery").value = data.sido
										+ " "
										+ data.sigungu
										+ " "
										+ data.bname1 + " " + data.bname2;
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
</body>
</html>