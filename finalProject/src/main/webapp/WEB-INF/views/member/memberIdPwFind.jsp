<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${path}/resources/css/memberIdPwFind.css">

<title>아이디/비밀번호 찾기 | 뭉과외</title>
</head>
<body>
<%-- <c:if test="${not empty ipMsg}"> --%>
<!-- 	<script> -->
// 		alert("${ipMsg}");
<!-- 	</script> -->
<%-- </c:if> --%>

	<jsp:include page="../common/header.jsp"/>

	<div id="idpw_wrap">
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
		    <form action="findId.me" method="post">
				<div class="id">
					<input type="text" id="l_userName" class="box" name="userName" placeholder="이름을 입력하세요" required> <br><br>
					<input type="email" id="l_Email" class="box" name="email" placeholder="이메일을 입력하세요" required> 
				</div>
				<div style="text-align: center;">
					<button type="submit" class="findBtn" id="idBtn">확인</button>
				</div>
		    </form>
	    </div>
	    <div id="findPw" class="find-align" style="display:none;">
	    	<form action="findPw.me" method="post">
				<div class="pw">
					<input type="text" id="p_userId" class="box" name="userId" placeholder="아이디를 입력하세요" required> <br><br>
					<input type="email" id="p_email" class="box" name="email" placeholder="이메일을 입력하세요" required> 
				</div>
				<div style="text-align: center;">
					<button type="submit" class="findBtn" id="pwBtn">확인</button>
				</div>
			</form>
	    </div>
	
		<script>
	    	// 아이디 찾기|비밀번호 찾기 radio 버튼 클릭
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
    </div>
</body>
</html> 
