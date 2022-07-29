<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="jquery.fullpage.min.css">

     <!-- Core theme CSS (includes Bootstrap)-->
    <link href="resources/css/styles.css" rel="stylesheet" />
   
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="jquery.fullpage.min.js"></script>
    
 <!-- Latest compiled and minified CSS -->
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

 <!-- Popper JS -->
     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

 <!-- Latest compiled JavaScript -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

 <!--font Awesome-->
 <script src="https://kit.fontawesome.com/92642353eb.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>

    @font-face {
    font-family: '양진체';
    src: url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

        *{
            font-family: '양진체';
            color:rgb(49, 48, 47);
            font-weight: normal;
            font-style: normal;
        }
</style>
</head>
<body>
<div class="d-flex" id="wrapper">
    <!-- Sidebar-->
    <div class="border-end bg-white" id="sidebar-wrapper">
        <div class="sidebar-heading border-bottom bg-light">뭉과외</div>
        <c:if test="${loginUser.teacher eq 'Y'}">
        <div class="list-group list-group-flush">
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="teaMyPage.me"><i class="fa-solid fa-circle-info"></i>  선생님 MyPage</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="myBoardListView.me"><i class="fa-solid fa-message"></i>  작성 게시글</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="likeBoardListView.me"><i class="fa-solid fa-thumbs-up"></i>  좋아요 게시글</a>
			<a class="list-group-item list-group-item-action list-group-item-light p-3" href="lessonList.me"><i class="fa-solid fa-list"></i>  과외 목록</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="qnaListView.qu"><i class="fa-solid fa-circle-question"></i>  QnA</a>
        </div>
        </c:if>
        <c:if test="${loginUser.student eq 'Y' }">
        <div class="list-group list-group-flush">
 			<a class="list-group-item list-group-item-action list-group-item-light p-3" href="stuMyPage.me"><i class="fa-solid fa-circle-info"></i>  학생 MyPage</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="myBoardListView.me"><i class="fa-solid fa-message"></i>  작성 게시글</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="likeBoardListView.me"><i class="fa-solid fa-thumbs-up"></i>  좋아요 게시글</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="lessonList.me"><i class="fa-solid fa-list"></i>  과외 목록</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="qnaListView.qu"><i class="fa-solid fa-circle-question"></i>  QnA</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="stuGrade.me"><i class="fa-solid fa-file-pen"></i>  성적 관리</a>
        </div>
        </c:if>

    </div>
    
    <!-- 내용 작성 -->
	<div class="container-fluid">
	
	
</body>
</html>