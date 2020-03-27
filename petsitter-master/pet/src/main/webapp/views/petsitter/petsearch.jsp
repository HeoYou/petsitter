<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${PageContext.request.contextPage}/resources/css/main.css" />
<%@ include file="/views/user/userCommon.jsp"%>

<!-- date picker -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- <script type="text/javascript">
	$(document).ready(
			function() {
				$.datepicker.setDefaults($.datepicker.regional['ko']);
				$("#startDate")
						.datepicker(
								{
									showOn : "both",
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
									showOn : "both",
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
									maxDate : "+3Y", // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
									onClose : function(selectedDate) {
										// 종료일(endDate) datepicker가 닫힐때
										// 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
										$("#startDate").datepicker("option",
												"maxDate", selectedDate);
									}

								});
			});
</script> -->

<style>
.ui-datepicker{ font-size: 13px; width: 300px; }
.ui-datepicker select.ui-datepicker-month{ width:45%; font-size: 11px; }
.ui-datepicker select.ui-datepicker-year{ width:45%; font-size: 11px; }
</style>


<title>petsearch</title>
</head>
<body class="subpage">

	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>펫시터 찾아주개</p>
				<h2>Find Petsitter</h2>
			</header>
		</div>
	</section>

	</br>

	<div class="container">
		<form action="${pageContext.request.contextPath}/petsitter/search.do"
			method="post">
			<table>
				<tr>
					<td colspan="1">원하는 지역 입력</td>
					<td colspan="3"><input type="text" name="address" id="wantAdd" /></td>
				</tr>
				<tr>
					<td colspan="2" class="align-center">스타트데이트</td>
					<td colspan="2" class="align-center">엔드데이트</td>
				</tr>

				<tr>
					<td colspan="2"><input class="datepick" type="text"
						id="startDate" name="rSdate" placeholder="시작 날짜"></td>
					<td colspan="2"><input class="datepick" type="text"
						id="endDate" name="Edate" placeholder="종료 날짜"></td>
					<script type="text/javascript">
					$(function() {
					 $.datepicker.setDefaults({
			                dateFormat: 'yy-mm-dd' //Input Display Format 변경
			                /* ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			                
			                ,changeYear: true //콤보박스에서 년 선택 가능
			                ,changeMonth: true //콤보박스에서 월 선택 가능       */      
			                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
			                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
			                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
			                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
			                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
			                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
			                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
			                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
			                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
			                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
			                ,minDate: "0" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
			                ,maxDate: "+3Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
			            });
			 
			            //input을 datepicker로 선언
			            $("#startDate").datepicker();                    
			            $("#endDate").datepicker();
			            
			           /*  //From의 초기값을 오늘 날짜로 설정
			            $('#startDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
			            //To의 초기값을 내일로 설정
			            $('#endDate').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
			        */
					})
					</script>

				</tr>
				<tr>
					<td colspan="4" class="align-center">펫시터 조건 설정</td>
				</tr>

				<tr class="align-center">
					<div class="4u 12u$(small)">
						<td colspan="2"><input type="radio" id="home"
							name="psOption10" value="0"> <label for="home">위탁</label>

						</td>

						<td colspan="2"><input type="radio" id="visit"
							name="psOption10" value="1"> <label for="visit">방문</label>
						</td>
					</div>
				</tr>
				<!-- <tr>

					<td>핏시터 성별</td>
					<td><input type="radio" id="sex-all" name="sex" value="all">
						<label for="sex-all">전체</label></td>
					<td><input type="radio" id="sex-female" name="sex"
						value="female"> <label for="sex-female">여자</label></td>
					<td><input type="radio" id="sex-male" name="sex" value="male">
						<label for="sex-male">남자</label></td>
				</tr>  -->

				<tr>
					<td colspan="4" class="align-center">강아지 수</td>
				</tr>

				<tr>
					<td colspan="1">소형견</td>
					<td colspan="3"><select name="sizes">
							<option value="0">-</option>
							<option value="1">1마리</option>
							<option value="2">2마리</option>
							<option value="3">3마리</option>
					</select></td>
				</tr>

				<tr>
					<td colspan="1">중형견</td>
					<td colspan="3"><select name="sizem">
							<option value="0">-</option>
							<option value="1">1마리</option>
							<option value="2">2마리</option>
							<option value="3">3마리</option>
					</select></td>
				</tr>

				<tr>
					<td colspan="1">대형견</td>
					<td colspan="3"><select name="sizel">
							<option value="0">-</option>
							<option value="1">1마리</option>
							<option value="2">2마리</option>
							<option value="3">3마리</option>
					</select></td>
				</tr>

				<tr>
					<td colspan="4"><input type="submit" value="펫시터 찾기"
						class="button-special align-center"></td>
				</tr>
			</table>
		</form>
	</div>

	<%@ include file="/views/footer.jsp"%>
</body>
</html>
