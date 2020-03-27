<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<title>회원가입</title>
<!-- <meta charset="utf-8" /> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1" /> -->
<!-- <link rel="stylesheet" -->
<%--    href="${PageContext.request.contextPage}/resources/css/main.css" /> --%>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<%@ include file="/views/user/userCommon.jsp"%>

</head>
<body class="subpage">

   <form action="${pageContext.request.contextPath}/user/join"
      method="post">

      <section class="wrapper style2" id="two">
         <div class="inner">
            <div class="box">
               <div class="content">
                  <header class="align-center">
                     <p>펫시터 매칭 돌봐주개</p>
                     <h2>회원가입</h2>
                  </header>

                  <div>${joinFail }</div>

                  <p>
                  <div style="width: 300px; margin: auto;">
                     <b>ID</b>
                  </div>
                  <div style="width: 300px; margin: auto;">
                     <input id="uId" name="uId" type="text" placeholder="ID를 입력해주세요."
                        required>
                  </div>
                  <div style="width: 300px; margin: auto;" id="id_check"></div>
                  
                  <p>
                  <div style="width: 300px; margin: auto;">
                     <b>비밀번호</b>
                  </div>
                  <div style="width: 300px; margin: auto;">
                     <input id="uPw" name="uPw" type="password"
                        placeholder="비밀번호를 입력해주세요." required>
                  </div>
                  <div style="width: 300px; margin: auto;">
                     <b>비밀번호 확인</b>
                  </div>
                  <div style="width: 300px; margin: auto;">
                     <input id="uPwcheck" type="password"
                        placeholder="비밀번호를 다시한번 입력해주세요." required>
                  </div>
                  <div style="width: 300px; margin: auto;" id="pw_check"></div>
                  </p>

                  <p>
                  <div style="width: 300px; margin: auto;">
                     <b>성명</b>
                  </div>
                  <div style="width: 300px; margin: auto;">
                     <input id="uName" name="uName" type="text"
                        placeholder="이름을 입력해주세요." required>
                  </div>
                  </p>

                  <p>
                  <div style="width: 300px; margin: auto;" required>
                     <b>전화번호</b>
                  </div>
                  <div style="width: 300px; margin: auto;">
                     <input id="uPhone" name="uPhone" type="text" placeholder="전화번호" required>
                  </div>
                  </P>

                  <p>
                  <div style="width: 300px; margin: auto;">
                     <b>주소</b>
                  </div>
                  <div style="width: 300px; margin: auto;">
                     <input type="text" id="sample4_postcode" placeholder="우편번호" readonly>
                  </div>
                  </p>

                  <p>
                  <div style="width: 300px; margin: auto;">
                     <input type="text" id="sample4_roadAddress" placeholder="도로명주소" readonly>
                  </div>
                  <div style="width: 300px; margin: auto;">
                     <span id="guide" style="color: #999; display: none"></span>
                  </div>
                  <div style="width: 300px; margin: auto;">
                     <input type="button" onclick="sample4_execDaumPostcode()"
                        value="우편번호 찾기">
                  </div>
                  <input id="sigunguquery" name="uAddress" type="hidden">
                  </tr>
                 
               </div>
               <p>
               <div style="width: 300px; margin: auto;">
                  <input type="submit" class="button special" value="회원가입" >
                  <input type="reset" value="취소">
               </div>
               <!-- 취소 버튼 말고 텍스트로 밑 오른쪽에 배치하기 -->
               <br>

					<br>


				</div>
			</div>
			</div>
		</section>
	</form>
	<br>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                console.log(data.sido + " "	+ data.sigungu + " " + data.bname1 + " " + data.bname2);

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                
                
                if (data.bname1 == "") {
					document
							.getElementById("sigunguquery").value =  data.sido
							+ " "
							+ data.sigungu
							+ " " + data.bname;
				} else {
					document
							.getElementById("sigunguquery").value = data.sido
							+ " "
							+ data.sigungu
							+ " "
							+ data.bname1
							+ " " + data.bname2;
				}
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
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
	<script>
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#uId").blur(function() {
		// id = "id_reg" / name = "userId"
		var user_id = $('#uId').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/user/check?userId='+ user_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다.");
						$("#id_check").css("color", "red");
				} else {
					
					if(user_id == ""){
							
						$('#id_check').text('아이디를 입력해주세요 :)');
						$('#id_check').css('color', 'red');
							
					} else {
						
						$('#id_check').text("사용 가능한 아이디입니다.");
						$('#id_check').css('color', 'green');
					}
					
				}
			},error : function() {
				console.log("실패");	
			}
		});
	});
	</script>
	<script>
	function login_button()	{
		
	}
	</script>
	<script>
	$("#uPwcheck").blur(function(){
		if($('#uPw').val() == $('#uPwcheck').val())	{
			$('#pw_check').text("비밀번호가 일치합니다.");
			$('#pw_check').css('color', 'green');
		}else {
			$('#pw_check').text("비밀번호가 일치하지 않습니다.");
			$('#pw_check').css('color', 'red');
		}
	})
	</script>


</body>
<!-- Footer -->
<%@ include file="/views/footer.jsp"%>
</html>
