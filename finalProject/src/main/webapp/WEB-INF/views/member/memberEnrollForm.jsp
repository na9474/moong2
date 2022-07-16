<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--font Awesome-->
<script src="https://kit.fontawesome.com/92642353eb.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="${path}/resources/css/memberEnrollForm.css">

<title>회원가입</title>

</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div class="title"><h2>J&nbsp; o&nbsp; i&nbsp; n&nbsp;&nbsp;&nbsp;&nbsp; M&nbsp;o&nbsp;o&nbsp;n&nbsp;g</h2></div>
    <!-- <hr class="hr1"> -->
    <!-- <p style="text-align: center; font-size: 23px; letter-spacing: 5px;">회원가입</p> -->
    <div class="join_wrap">
        <br>
        <p class="must_insert"><span class="must_icon">*</span> 필수 입력사항</p>
		<form action="insert.me" method="post">
            <div>
	        <table class="table" style="width: 800px; padding-top: 0;">
	            <tbody>
	                <tr>
	                    <td><span class="must_icon">*</span> <label for="id">아이디</label></td>
	                    <td colspan="2">
	                    	<input type="text" id="id" name="userId" required placeholder="5~20자 영문 소문자와 숫자로만 입력하세요 " style="width:380px;" maxlength="20">
	                    </td>
	                </tr>
	                <tr id="chkArea">
	                	<td></td>
	                	<td colspan="2">
	                		<span id="check"></span>
	                	</td>
	                </tr>
	                <tr>
	                    <td><span class="must_icon">*</span> <label for="pw">비밀번호</label></td>
	                    <td colspan="2">
	                    	<input type="password" id="pw" name="userPwd" required placeholder="8~15자 영문 대/소문자와 숫자, 특수문자를 포함하여 입력하세요" style="width:380px;" maxlength="15">
	                    </td>
	                </tr>
	                <tr id="chkArea2">
	                	<td></td>
	                	<td colspan="2">
	                		<span id="check2"></span>
	                	</td>
	                </tr>
	                <tr>
	                    <td><span class="must_icon">*</span> <label for="rpw">비밀번호 재확인</label></td>
	                    <td colspan="2">
	                    	<input type="password" id="rpw" name="checkPwd" required placeholder="비밀번호를 한 번 더 입력하세요" maxlength="15" style="width:380px;" maxlength="15">
	                    </td>
	                </tr>
	                <tr id="chkArea3">
	                	<td></td>
	                	<td colspan="2">
	                		<span id="check3"></span>
	                	</td>
	                </tr>
	                <tr>
	                    <td><span class="must_icon">*</span> <label for="name">이름</label></td>
	                    <td colspan="2">
	                    	<input type="text" id="name" name="userName" required placeholder="이름을 입력하세요" style="width:380px;">
	                    </td>
	                </tr>
	                <tr>
	                    <td><span class="must_icon">*</span> 성별</td>
	                    <td colspan="2" id="genderTd">
	                        <input type="radio" id="Male" name="gender" value="M" required>
	                    	<label for="Male">남자</label>
	                        <input type="radio" id="Female" name="gender" value="F" style="margin-left: 30px;">
	                        <label for="Female">여자</label>
	                    </td>
	                </tr>
	                <tr>
	                    <td><span class="must_icon">*</span> <label for="email">이메일</label></td>
	                    <td>
	                    	<input type="email" id="email" name="email" required placeholder="이메일을 입력하세요" style="width:380px;">
	                    </td>
	                    <td>
	                    	<button class="email_btn">인증번호 받기</button>
	                    </td>
	                </tr>
	                <tr>
	                    <td><span class="must_icon">*</span> <label for="phone">휴대전화</label></td>
	                    <td colspan="2">
	                    	<input type="text" id="phone" name="phone" required placeholder="'-'를 제외한 숫자만 입력하세요" style="width:380px;">
	                    </td>
	                </tr>
	                <tr>
	                    <td><span class="must_icon">*</span> <label for="birth">생년월일</label></td>
	                    <td colspan="2">
	                    	<input type="date" id="birth" name="birth" required style="width:150px;">
	                    </td>
	                </tr>
	            </tbody>
	        </table> 
        	</div>
	        <br>
            <div class="enroll">
                <button type="submit" class="enroll_btn" disabled>회원가입</button>
            </div>
		</form>
		
		<script>
// 			$(function(){
// 				// -------- 아이디 유효성 체크 및 중복 확인 -------- //
// 				const $idchk = $("#id"); // 입력한 아이디
				
// 				$idchk.keyup(function(){
// 					var idReg = /^(?=.*[a-z0-9])[a-z0-9]{5,20}$/;
					
// 					if($idchk.val().length >= 5){
// 						$.ajax({
// 							url: "idCheck.me",
// 							data: { 
// 								checkId: $idchk.val()
// 							},
// 							success: function(e){
// 								if(e == "NOPE"){  // 입력한 아이디값이 DB에 저장된 아이디와 일치하여 'NOPE'이 반환된 경우
// 									$("#chkArea,#check").show();
// 									$("#check").css("color", "red").text("이미 사용중이거나 탈퇴한 아이디입니다.");
// 								} else if(!idReg.test($idchk.val())){  // 아이디 정규식과 입력한 아이디값이 일치하지 않을 때
// 									$("#chkArea,#check").show();
// 									$("#check").css("color", "red").text("5~20자 영문 소문자와 숫자로만 입력하세요.");
// 								} else if(e == "YEAH") {  // 입력한 아이디값이 DB에 저장된 아이디와 일치하는 것이 없어 'YEAH'가 반환된 경우
// 									$("#chkArea,#check").show();
// 									$("#check").css("color", "rgb(251, 176, 76)").text("사용 가능한 아이디입니다.");
// 								}
// 							},
// 							error: function(){
// 								console.log("ajax 통신 실패");
// 							}
// 						});
// 					} else {  // 입력한 아이디값의 길이가 5글자 미만일 때
// 						$("#chkArea").hide();
// 					}
// 				});
				
// 				// -------- 비밀번호 유효성 체크 -------- //
// 				$("#pw").keyup(function(){  // 비밀번호 input에 문자가 입력될 때마다 chkPwd() 실행
// 					chkPwd($("#pw").val(), $("#id").val());
// 				});
// 				function chkPwd(pwd, id){
// 					var pwdReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*])(?=.*[0-9])[A-Za-z0-9!@#$%^*]{8,15}$/;
// 					var chkNum = pwd.search(/[0-9]/g);
// 					var chkEng = pwd.search(/[a-z]/ig);
					
// 					// 비밀번호 입력란이 비어있을 때
// 					if($("#pw").val().length == 0){
// 						$("#chkArea2,#check2").hide();
// 					}
// 					// 비밀번호 정규식과 일치하지 않을 때
// 					if(!pwdReg.test(pwd)){
// 						$("#chkArea2,#check2").show();
// 						$("#check2").css("color","red").text("8~15자 영문 대/소문자와 숫자, 특수문자(!, @, #, $, %, ^, *)만 입력하세요.");
// 					}
// 					// 숫자와 영문자를 문자열 내의 모든 패턴에서 찾을 때(영문자는 대소문자 가리지 않고 비교)
// 					if(chkNum < 0 || chkEng < 0){
// 						$("#chkArea2,#check2").show();
// 						$("#check2").css("color","red").text("영문자와 숫자를 모두 사용하세요.");
// 					}
// 					// 영문자와 숫자를 연속 3번 이상 사용했을 때
// 					if(/(\w)\1\1/.test(pwd)){
// 						$("#chkArea2,#check2").show();
// 						$("#check2").css("color","red").text("비밀번호에 같은 문자를 3번 이상 사용할 수 없습니다.");
// 					}
// 					// 입력한 비밀번호값에서 입력한 아이디값과 일치하는 시작인덱스값이 있을 때
// 					if(pwd.search(id) > -1){
// 						$("#chkArea2,#check2").show();
// 						$("#check2").css("color","red").text("비밀번호에 아이디를 포함할 수 없습니다.");
// 					}
// 					// 비밀번호 정규식과 일치할 때
// 					if(pwdReg.test(pwd)){
// 						$("#chkArea2,#check2").hide();
// 					}
// 				}
				
// 				// -------- 비밀번호 일치 여부 -------- //
// 				$("#rpw").keyup(function(){
// 					if($("#rpw").val().length >= 1){
// 						if($("#pw").val() != $("#rpw").val()){  // 입력한 비밀번호값과 비밀번호 재확인값이 같지 않을 때
// 							$("#chkArea3,#check3").show();
// 							$("#check3").css("color","red").text("비밀번호가 일치하지 않습니다.");
// 							$(".enroll_btn").prop("disabled",true);
// 						} else {  // 각 값이 같을 때
// 							$("#chkArea3,#check3").show();
// 							$("#check3").css("color","rgb(251, 176, 76)").text("비밀번호가 일치합니다.");
// 							$(".enroll_btn").prop("disabled",false);
// 						}
// 					} else {  // 입력한 비밀번호 재확인값의 길이가 8글자 미만일 때
// 						$("#chkArea3").hide();
// 					}
// 				});
// 			});
		</script>
		
		
        <!-- <table class="table" style="width: 500px;">
            <tbody>
                <tr>
                    <td><span class="must_icon">*</span> 최근 모의고사 성적</td>
                    <td>
                        <select>
                            <option value="" selected>언어</option>
                            <option value="1">1등급</option>
                            <option value="2">2등급</option>
                            <option value="3">3등급</option>
                            <option value="4">4등급</option>
                            <option value="5">5등급</option>
                            <option value="6">6등급</option>
                            <option value="7">7등급</option>
                            <option value="8">8등급</option>
                            <option value="9">9등급</option>
                        </select>
                    </td>
                    <td>
                        <select required>
                            <option value="" selected>수리</option>
                            <option value="1">1등급</option>
                            <option value="2">2등급</option>
                            <option value="3">3등급</option>
                            <option value="4">4등급</option>
                            <option value="5">5등급</option>
                            <option value="6">6등급</option>
                            <option value="7">7등급</option>
                            <option value="8">8등급</option>
                            <option value="9">9등급</option>
                        </select>
                    </td>
                    <td>
                        <select required>
                            <option value="" selected>외국어</option>
                            <option value="1">1등급</option>
                            <option value="2">2등급</option>
                            <option value="3">3등급</option>
                            <option value="4">4등급</option>
                            <option value="5">5등급</option>
                            <option value="6">6등급</option>
                            <option value="7">7등급</option>
                            <option value="8">8등급</option>
                            <option value="9">9등급</option>
                        </select>
                    </td>
                </tr> 
            </tbody>
        </table>
            
        <table class="table" style="width: 500px;">
            <tbody>
                <tr>
                    <td><span class="must_icon">*</span> 성적표 첨부</td>
                    <td style="width: 272px;"></td>
                    <td></td>
                    <td><button>파일첨부</button></td>
                </tr>
                <tr>
                    <td><span class="must_icon">*</span> 학생증 첨부</td>
                    <td></td>
                    <td></td>
                    <td><button>파일첨부</button></td>
                </tr>
            </tbody>
        </table>

        <table class="table" style="width: 500px;">
            <tbody>
                <tr>
                    <td><span class="must_icon">*</span> 과외 가능 요일</td>
                    <td><input type="checkbox" name="" value="">월</td>
                    <td><input type="checkbox" name="" value="">화</td>
                    <td><input type="checkbox" name="" value="">수</td>
                    <td><input type="checkbox" name="" value="">목</td>
                    <td><input type="checkbox" name="" value="">금</td>
                    <td><input type="checkbox" name="" value="">토</td>
                    <td><input type="checkbox" name="" value="">일</td>
                </tr>
            </tbody>
        </table> -->
    </div>
</body>
</html>