<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${path}/resources/css/memberIdList.css">

<title>아이디 찾기 | 뭉과외</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div id="ir_wrap">
		<div class="title"><h2>F&nbsp; i&nbsp; n&nbsp; d&nbsp;&nbsp;&nbsp; I&nbsp; D</h2></div>
	
	    <br><br>
	
	    <div align="center">아이디 조회 결과는 다음과 같습니다.</div>
	    <div id="id-result" class="ir-align">
	        <b>${id.userId}</b>
	    </div>
	    <div style="text-align: center;">
	        <button type="button" class="loginBtn" onclick="location.href='login.me'">로그인</button>
	    </div>
    </div>
</body>
</html>