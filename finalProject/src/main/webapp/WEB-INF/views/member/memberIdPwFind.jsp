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

<link rel="stylesheet" href="${path}/resources/css/memberIdPwFind.css">

<title>[S]아이디/비밀번호 찾기</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>

	<div class="title"><h2>F&nbsp; i&nbsp; n&nbsp; d&nbsp;&nbsp;&nbsp; I&nbsp; D&nbsp; /&nbsp; P&nbsp; W</h2></div>

    <br>

	<div class="ipInline find-align">
		<input type="radio" class="fi" id="fid" name="ft" onclick="findCheck(1);" checked>
		<label for="fid" class="fi">아이디 찾기</label>
		&nbsp;&nbsp;&nbsp;
		<input type="radio" class="fi" id="fpw" name="ft" onclick="findCheck(2);">
		<label for="fpw" class="fi">비밀번호 찾기</label>
	</div>

	<br>

    <div id="findId" class="find-align">
		<div class="id">
			<input type="text" id="l_userName" class="box" name="userName" placeholder="이름을 입력하세요" required> <br><br>
			<input type="email" id="l_Email" class="box" name="email" placeholder="이메일을 입력하세요" required> 
		</div>
		<div style="text-align: center;">
			<button type="button" class="findBtn" onclick="idClick();" data-toggle="modal" data-target="#urId">확인</button>
		</div>
    </div>
    <div id="findPw" class="find-align" style="display:none;">
		<div class="pw">
			<input type="text" id="p_userId" class="box" name="userId" placeholder="아이디를 입력하세요" required> <br><br>
			<input type="email" id="p_email" class="box" name="email" placeholder="이메일을 입력하세요" required> 
		</div>
		<div style="text-align: center;">
			<button type="button" class="findBtn">확인</button>
		</div>
    </div>

	<script>
    	// 아이디 찾기/비밀번호 찾기 클릭
    	function findCheck(num) {
    		if(num == '1') {
    			document.getElementById("findPw").style.display = "none";
    			document.getElementById("findId").style.display = "";
    		} else {
    			document.getElementById("findId").style.display = "none";
    			document.getElementById("findPw").style.display = "";
    		}
    	}
    </script>

	<!-- 아이디 찾기에서 확인 클릭 시 띄워지는 모달 -->
	<div class="modal" id="urId">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					회원님의 정보와 일치하는 아이디입니다. <br><br>
					<h2 id="id_result"></h2>
				</div>
		        <div class="modal-footer">
					<button type="button" onclick="location.href='login.me'">로그인</button>
		        </div>
			</div>
		</div>
	</div>
	
	<script>
// 		// 아이디&스토어 값을 저장하기 위한 변수
// 		var idV = "";
// 		// 아이디값을 받고 출력
// 		var inputName = $("#l_userName");
// 		var inputEmail = $("#l_email");
		
// 		var idClick = function(){
// 			$.ajax({
// 				type: "POST",
// 				url: "findId.me",
// 				contentType: "application/json",
// 				data: {
// 					userName: inputName.val(),
// 					email: inputEmail.val()
// 				},
// 				success: function(id){
// 					if(id == 0) {
// 						$("#id_result").text("입력하신 정보에 해당하는 회원 정보가 없습니다.");
// 						$("#l_userName").val('');
// 						$("#l_email").val('');
// 					} else {
// 						$("#id_result").text(id);
// 						$("#l_userName").val('');
// 						$("#l_email").val('');
// 						idV = id;
// 					}
// 				},
// 				error: function(){
// 					console.log("ajax 통신 실패");
// 				}
// 			});
// 		}
<!-- 	</script> -->
</body>
</html>