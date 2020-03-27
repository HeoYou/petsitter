<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title></title>

<jsp:include page="${pageContext.request.contextPath}/header.do" />
<!-- datepicker -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
$(function(){
	currentSlide(1);
});
</script>
 
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
  if (slideIndex > slides.length) {slideIndex = 1}
  slides[slideIndex-1].style.display = "block";
  setTimeout(showSlides, 5000); // Change image every 2 seconds
}
</script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$.datepicker.setDefaults($.datepicker.regional['ko']);
				$("#startDate")
						.datepicker(
								{
									changeMonth : true,
									changeYear : true,
									nextText : '다음 달',
									prevText : '이전 달',
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dateFormat : "yy-mm-dd",
									minDate : 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
									onClose : function(selectedDate) {
										//시작일(startDate) datepicker가 닫힐때
										//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
										$("#endDate").datepicker("option",
												"minDate", selectedDate);
									}

								});
				$("#endDate")
						.datepicker(
								{
									changeMonth : true,
									changeYear : true,
									nextText : '다음 달',
									prevText : '이전 달',
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dateFormat : "yy-mm-dd",
									minDate : 0, // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
									onClose : function(selectedDate) {
										// 종료일(endDate) datepicker가 닫힐때
										// 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
										$("#startDate").datepicker("option",
												"maxDate", selectedDate);
									}

								});
			});
</script>


<style type="text/css">
div.container1 {
	padding: 10px;
	max-width: 1200px;
	min-width: 1200px;
	position: relatice;
	margin: 0 auto;
	
	height: 100%;
	overflow: hidden;
	font-size: 14px;
}

div.left_container {
	width: 75%;
	max-hight: 800px;
	display: inline-block;
	padding: 10px;
	
}

div.right_container {
	width: 290px;
	hight: auto;
	display: inline-block;
	position: fixed;
	filter:Alpha(Opacity=0);
}

* {
	box-sizing: border-box;
}

body {
	font-family: Verdana, sans-serif;
}

.mySlides {
	display: none;
}

img {
	vertical-align: middle;
}

* {box-sizing:border-box}

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
  background-color: rgba(0,0,0,0.8);
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
  height: 600px;
  top: 50%;
  left: 50%;
  margin: auto;
}

@-webkit-keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}
/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.text {
		font-size: 11px
	}
}

div.petsitterdata {
	float: left;
	width: 50%;
	height: 80px
}

div.petsitterdata-padding {
	padding: 5px;
	border-style: solid;
	border: 1px;
	margin-top: 5px;
	margin-left: 5px;
	margin-right: 5px;
}
div.petsitterdata-head	{
	margin: 3px;
	text-align: center;
}
div.petsitterdata-body	{
	margin: 3px;
	text-align: center;
	font-weight: bold;
	font-size: 16px;
}

div.datepick {
	float: left;
	width: 50%;
}

input.datepick {
	height: 90%;
}

input.count {
	width: 15%;
	height: 75%;
	font-size: 13px;
}

div.count {
	width: 75%;
	float: right;
	text-align: right;
	padding-right: 10px;
	margin-top: 2px;
}

div.petsize {
	font-size: 11px;
}

div.container-total-price {
	margin-top: 15px;
}

div.total-price-left {
	font-size: 20px;
	font-weight: bold;
	float: left;
	width: 50%;
}

div.total-price-right {
	font-size: 20px;
	font-weight: bold;
	float: left;
	text-align: right;
	width: 50%;
}
div.sitterinfo	{
	border: 1px solid #eeeeee;
	margin-bottom: 20px;
	
	
}
div.sitterinfo-header	{
	padding: 3px;
	padding-left: 10px;
	font-size: 20px;
	font-weight: bold;
	background-color: #eeeeee;
	border-bottom: 1px solid #eeeeee;
	
	
}
div.sittername	{
	font-size: 20px;
	font-weight: bold;
	padding-left: 10px;
	margin-bottom: 10px;
	margin-top: 10px;
}
div.option-container	{
	margin: 15px 30px;
	height: 110px;
	width: 80px;
	float: left;
}
div.option-container-image	{
	margin-bottom: 10px;
	width: 100%;
	height: 80px;
	margin-left: auto;
	margin-right: auto;
}
div.option-container-text	{
	text-align: center;
}
img.option-container-image	{
	width: auto; height: auto;
    max-width: 100%;
    max-height: 100%;
    margin-top: auto;
    margin-bottom: auto;
}
div.review-name	{
	float: left;
	width: 10%;
	text-align: center;
	font-size: 18px;
	font-weight: bold;
	
}
div.review-info	{
	float: left;
	width: 90%;
	padding-left: 20px;
	
}
div.review-info-score	{
	padding: 4px;
}
div.review-info-intro	{
	padding: 4px;
	margin-bottom: 20px;
}
div.review-info-image	{
	margin: 2px;
	float: left;
	width: auto;
}
div.review-info-date	{
	float: right;
	text-align: right;
	padding-right: 10px;
	font-size: 18px;
}
div.review-empty	{
	font-size: 30px;
	text-align: center;
	margin-bottom: 20px;
}
</style>

</head>
<body>
	<br><br><br>
	
	<div class="container1">
		<div style="clear: both;"></div>
		<div class="left_container">

			<div class="slideshow-container">


				<!-- Full-width images with number and caption text -->

				<c:forEach var="image" items="${images}">
					<div class="mySlides fade">
						<img
							src="${PageContext.request.contextPage}/resources/upload/${image }"
							style="height: 100%; margin-left: auto; margin-right: auto; display: block;">
					</div>
				</c:forEach>

				<!-- Next and previous buttons -->
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a
					class="next" onclick="plusSlides(1)">&#10095;</a>
			</div>
			<br>

			<div>
				<hr width="100%" align="left">
				<div class="sitterinfo">
					<div class="sitterinfo-header">펫시터 정보</div>
					<div>${petsitter.psIntro }</div>
				</div>
				<div class="sitterinfo">
					<div class="sitterinfo-header">펫시터 무료 제공 서비스</div>
					<div>
						<c:if test="${petsitter.psOption1 eq 'true' }">
							<div class="option-container">
								<div class="option-container-image">
									<img class="option-container-image"
										src="${PageContext.request.contextPage}/resources/icon/option1.jpg">
								</div>
								<div class="option-container-text">산책</div>
							</div>
						</c:if>

						<c:if test="${petsitter.psOption2 eq 'true' }">
							<div class="option-container">
								<div class="option-container-image">
									<img class="option-container-image"
										src="${PageContext.request.contextPage}/resources/icon/option2.jpg">
								</div>
								<div class="option-container-text">노즈워크</div>
							</div>
						</c:if>
						<div style="clear: both;"></div>
					</div>
				</div>
				<div class="sitterinfo">
					<div class="sitterinfo-header">펫시터 유료 제공 서비스</div>
					<div>
						<c:if test="${petsitter.psOption3 eq 'true' }">
							<div class="option-container">
								<div class="option-container-image">
									<img class="option-container-image"
										src="${PageContext.request.contextPage}/resources/icon/option3.jpg">
								</div>
								<div class="option-container-text">픽업</div>
							</div>
						</c:if>
						<c:if test="${petsitter.psOption4 eq 'true' }">
							<div class="option-container">
								<div class="option-container-image">
									<img class="option-container-image"
										src="${PageContext.request.contextPage}/resources/icon/option4.jpg">
								</div>
								<div class="option-container-text">목욕</div>
							</div>
						</c:if>
						<div style="clear: both;"></div>
					</div>
				</div>
				<div class="sitterinfo">
					<div class="sitterinfo-header">고객 준비물</div>
					<div>
						<c:if test="${petsitter.psOption5 eq 'true' }">
							<div class="option-container">
								<div class="option-container-image">
									<img class="option-container-image"
										src="${PageContext.request.contextPage}/resources/icon/option5.jpg">
								</div>
								<div class="option-container-text">장난감</div>
							</div>
						</c:if>
						<c:if test="${petsitter.psOption6 eq 'true' }">
							<div class="option-container">
								<div class="option-container-image">
									<img class="option-container-image"
										src="${PageContext.request.contextPage}/resources/icon/option6.jpg">
								</div>
								<div class="option-container-text">사료</div>
							</div>
						</c:if>
						<c:if test="${petsitter.psOption7 eq 'true' }">
							<div class="option-container">
								<div class="option-container-image">
									<img class="option-container-image"
										src="${PageContext.request.contextPage}/resources/icon/option7.jpg">
								</div>
								<div class="option-container-text">간식</div>
							</div>
						</c:if>
						<c:if test="${petsitter.psOption8 eq 'true' }">
							<div class="option-container">
								<div class="option-container-image">
									<img class="option-container-image"
										src="${PageContext.request.contextPage}/resources/icon/option8.jpg">
								</div>
								<div class="option-container-text">목줄</div>
							</div>
						</c:if>
						<c:if test="${petsitter.psOption9 eq 'true' }">
							<div class="option-container">
								<div class="option-container-image">
									<img class="option-container-image"
										src="${PageContext.request.contextPage}/resources/icon/option9.jpg">
								</div>
								<div class="option-container-text">배변패드</div>
							</div>
						</c:if>
						<c:if test="${petsitter.psOption10 eq 'true' }">
							<div class="option-container">
								<div class="option-container-image">
									<img class="option-container-image"
										src="${PageContext.request.contextPage}/resources/icon/option10.jpg">
								</div>
								<div class="option-container-text">식기</div>
							</div>
						</c:if>
						<c:if test="${petsitter.psOption11 eq 'true' }">
							<div class="option-container">
								<div class="option-container-image">
									<img class="option-container-image"
										src="${PageContext.request.contextPage}/resources/icon/option11.jpg">
								</div>
								<div class="option-container-text">샴푸</div>
							</div>
						</c:if>
						<c:if test="${petsitter.psOption12 eq 'true' }">
							<div class="option-container">
								<div class="option-container-image">
									<img class="option-container-image"
										src="${PageContext.request.contextPage}/resources/icon/option12.jpg">
								</div>
								<div class="option-container-text">약/영양제</div>
							</div>
						</c:if>
						<div style="clear: both;"></div>
					</div>
				</div>
				<div>
					<hr width="100%" align="left">
					<div>
						<c:choose>
							<c:when test="${empty reviews }">
								<div class="review-empty">작성된 리뷰가 없습니다.</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="review" items="${reviews }">
									<div class="review-name">${review.uName }</div>
									<div class="review-info">
										<div class="review-info-score">
											<c:forEach begin="1" end="${review.rvScore }">
												<div class="review-info-image">
													<img alt=""
														src="${PageContext.request.contextPage}/resources/icon/like.png">
												</div>
											</c:forEach>
											<div class="review-info-date">${review.rvDate }</div>
										</div>
										<div style="clear: both;"></div>
										<div class="review-info-intro">${review.rvIntro }</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>

		</div>

		<div class="right_container">
			<form action="${pageContext.request.contextPath}/rsv/reservation"
				method="get">
				<input type="hidden" name="psId" value="${petsitter.psId}"> <input
					type="hidden" name="uId" value="${user.UId}">
				<div>
					<div class="sittername">${petsitterName }</div>
					<div>${petsitter.psAddress }</div>
				</div>
				<hr width="100%" align="left"> 
				<div>
					<div class="petsitterdata"> 
						<div class="petsitterdata-head">조회수</div>
						<div class="petsitterdata-body">${petsitter.sittinCount }회</div>
					</div>
					<div class="petsitterdata">
						<div class="petsitterdata-head">펫시팅 횟수</div>
						<div class="petsitterdata-body">${complete }회</div>
					</div>
					<hr width="100%" align="left">

				</div>
				<div class="petsitterdata-padding">
					<div>ㅇ 펫시팅 일정을 선택해주세요.</div>
					<div class="datepick">
						<input class="datepick" type="date" id="startDate" name="rSdate"
							placeholder="시작 날짜" required>
					</div>
					<div class="datepick">
						<input class="datepick" type="date" id="endDate" name="rEdate"
							placeholder="종료 날짜" required>
					</div>
					<hr width="100%" align="left">
				</div>
				<div style="clear: both;"></div>
				<div style="border: 1px solid;" class="petsitterdata-padding">
					<div class="petsize">소형 (~5kg)</div>
					<div>
						<input class="count" onclick="valueUpdateSmall()" id="small"
							type="number" value="0" min="0">
						<div class="count" id="smallPrice">0 원</div>
						<input id="hiddenSP" type="hidden" value="0" />
					</div>
				</div>
				<div style="border: 1px solid;" class="petsitterdata-padding">
					<div class="petsize">중형 (5kg ~ 15kg)</div>
					<div>
						<input class="count" onclick="valueUpdateMiddle()" id="middle"
							type="number" value="0" min="0">
						<div class="count" id="middlePrice">0 원</div>
						<input id="hiddenMP" type="hidden" value="0" />
					</div>
				</div>
				<div style="border: 1px solid;" class="petsitterdata-padding">
					<div class="petsize">대형 (15kg~)</div>
					<div>
						<input class="count" onclick="valueUpdateBig()" id="big"
							type="number" value="0" min="0">
						<div class="count" id="bigPrice">0 원</div>
						<input id="hiddenBP" type="hidden" value="0" />
					</div>
				</div>

				<div class="container-total-price">
					<div class="total-price-left">총 금액</div>
					<div class="total-price-right" id="totalPrice">0 원</div>
					<input id="rPrice" type="hidden" name="rPrice" value="0" /> <input
						type="hidden" name="rStatus" value="0" />
				</div>
				<br>
				<div>

					<div>
						<input style="margin-left: 12px; margin-right: auto; width: 90%;" type="submit" value="펫시팅 신청" class="button special">
					</div>
				</div>
			</form>
		</div>
	</div>

	<div style="clear: both;"></div>

</body>
<script type="text/javascript">
	function valueUpdateSmall() {
		var sDate = new Date(document.getElementById('startDate').value);
		var eDate = new Date(document.getElementById('endDate').value);
		var difDate = 1 + Math.ceil((eDate.getTime() - sDate.getTime())
				/ (1000 * 3600 * 24));

		var value = parseInt(document.getElementById('small').value);
		value = value * ${petsitter.psSPrice };
		document.getElementById("smallPrice").innerHTML = value + " 원";
		document.getElementById("hiddenSP").value = value;
		var totalPrice = (parseInt(document.getElementById('hiddenSP').value)
				+ parseInt(document.getElementById('hiddenMP').value) + parseInt(document
				.getElementById('hiddenBP').value))
				* difDate;
		document.getElementById("rPrice").value = totalPrice;
		document.getElementById("totalPrice").innerHTML = totalPrice + " 원";
	}
</script>
<script type="text/javascript">
	function valueUpdateMiddle() {
		var sDate = new Date(document.getElementById('startDate').value);
		var eDate = new Date(document.getElementById('endDate').value);
		var difDate = 1 + Math.ceil((eDate.getTime() - sDate.getTime())
				/ (1000 * 3600 * 24));

		var value = parseInt(document.getElementById('middle').value);
		value = value * ${petsitter.psMPrice };
		document.getElementById("middlePrice").innerHTML = value + " 원";
		document.getElementById("hiddenMP").value = value;
		var totalPrice = (parseInt(document.getElementById('hiddenSP').value)
				+ parseInt(document.getElementById('hiddenMP').value) + parseInt(document
				.getElementById('hiddenBP').value))
				* difDate;
		document.getElementById("rPrice").value = totalPrice;
		document.getElementById("totalPrice").innerHTML = totalPrice + " 원";

	}
</script>
<script type="text/javascript">
	function valueUpdateBig() {
		var sDate = new Date(document.getElementById('startDate').value);
		var eDate = new Date(document.getElementById('endDate').value);
		var difDate = 1 + Math.ceil((eDate.getTime() - sDate.getTime())
				/ (1000 * 3600 * 24));

		console.log(difDate);

		var value = parseInt(document.getElementById('big').value);
		value = value * ${petsitter.psLPrice };
		document.getElementById("bigPrice").innerHTML = value + " 원";
		document.getElementById("hiddenBP").value = value;
		var totalPrice = (parseInt(document.getElementById('hiddenSP').value)
				+ parseInt(document.getElementById('hiddenMP').value) + parseInt(document
				.getElementById('hiddenBP').value))
				* difDate;
		document.getElementById("rPrice").value = totalPrice;
		document.getElementById("totalPrice").innerHTML = totalPrice + " 원";

	}
</script>

<footer id="footer">
	<div>
		<ul class="icons">
			<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
			<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
			<li><a href="#" class="icon fa-instagram"><span
					class="label">Instagram</span></a></li>
			<li><a href="#" class="icon fa-envelope-o"><span
					class="label">Email</span></a></li>
		</ul>
	</div>
	<div class="copyright">&copy; Untitled. All rights reserved.</div>
</footer>

</html>