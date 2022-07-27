<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



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