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

<link rel="stylesheet" href="${path}/resources/css/login.css">

<title>로그인</title>

</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div class="title"><h2>L&nbsp; O&nbsp; G&nbsp; I&nbsp; N</h2></div>

    <br><br>
    <div class="find_wrap">
	    <form action="loginMember.me" method="post">
	        <div class="id">
	            <input type="text" class="box" name="userId" placeholder="아이디를 입력하세요" required>
	        </div>
	        <br>
	        <div class="password">
	            <input type="password" class="box" name="userPwd" placeholder="비밀번호를 입력하세요" required> 
	        </div>
	        <div id="find">
		        <a href="#" id="findIP">아이디/비밀번호 찾기</a>
	        </div>
	        <div style="text-align: center;">
	            <button type="submit" class="login_btn">로그인</button>
	        </div>
	    </form>
    </div>
</body>
</html>