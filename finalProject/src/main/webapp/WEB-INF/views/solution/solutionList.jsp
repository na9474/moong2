<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.container-md {
	max-width: 1200px;
}

#table-line {
	text-align: center;
}

#tit-line {
	background-color: rgb(49, 48, 47);
	color: white;
}

.bottombox {
	text-align: right;
}

#textbox {
	padding: 0px;
}

#scbox {
	margin-top: 0px;
	margin-bottom: 0px;
	padding-right:0px;
	font-size:13px;
}

#selectBox{
	display:block;
	height: 100%;
	width:100%;
	padding-right:0px;
	margin: 0px;
}

#searchBox{
	padding:0px;
}

#searchBtn{
	margin: auto;
	font-size: 20px;
}

.fp-auto-height {
	color: rgb(248, 238, 225);
	background-color: rgb(49, 48, 47);
}

#pagingArea {
	width: fit-content;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 20px;
}

</style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<br>
	<br>
	<div class="container-md p-4 bg-white rounded">
		<h1>문제풀이 게시판</h1>
		<br>
		<br>
		<div class="row optionbox">
			<div class="col-5">
				<form id="searchForm" method="post" action="list.so" enctype="multipart/form-data" accept-charset="utf-8">
					
					<div class="row optionbox2">
						<div class="col-2" id="scbox">
							<select id="selectBox" name="search_cat">
								<option value="title">제목</option>
								<option value="solution_contents">내용</option>
								<option value="user_id">작성자</option>
							</select>
						</div>
						<div class="col-7" id="textbox">
							<input type="text" name="keyword" class="form-control">
						</div>
						<div class="col-3" id="searchBox">
							<button type="submit" class="btn moong-dark">검색</button>
						</div>
					</div>
				</form>
			</div>

			<div class="col-7" id="searchBtn">
				<form id="searchBtn" method="post" action="list.so"
					enctype="multipart/form-data" accept-charset="utf-8">
					<input type="hidden" name="subject" id="inputSubject"> 
					<input type="hidden" name="tag" id="inputTag">
					<button type="submit" id="subBtnKor" class="btn moong-yellow btn-sm">국어</button>
					<button type="submit" id="subBtnEng" class="btn moong-yellow btn-sm">영어</button>
					<button type="submit" id="subBtnMat" class="btn moong-yellow btn-sm">수학</button>
					<c:forEach var="t" items="${tagOut}">
						<button type="submit" class="tagBtn btn moong-yellow btn-sm">#${t}</button>
					</c:forEach>
				</form>
			</div>

		</div>
		<br>

		<table class="table table-hover" id="table-line">
			<thead id="tit-line">
				<tr>
					<th class="col-1" cope="col">번호</th>
					<th class="col-1" scope="col">과목</th>
					<th class="col-4" scope="col">제목</th>
					<th class="col-2" scope="col">작성자</th>
					<th class="col-2" scope="col">조회수</th>
					<th class="col-2" scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="b" items="${list}">
					<tr>
						<th id="sno">${b.solutionNo}</th>
						<td>${b.subject}</td>
						<td>${b.title}</td>
						<td>${b.userId}</td>
						<td>${b.count}</td>
						<td>${b.createDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<script>
			$(function() {
				$("#table-line>tbody>tr").click(
						function() {
							location.href = 'detail.so?sno='
									+ $(this).children("#sno").text();
						})

			})
		</script>

		<br>

		<c:if test="${not empty loginUser }">
			<div class="row bottombox">
				<div class="col-10"></div>
				<div class="col-2">
					<a class="btn moong-dark" href="writeForm.so">작성</a>
				</div>
			</div>
		</c:if>

		<div id="pagingArea">
			<ul class="pagination">
				<c:choose>
					<c:when test="${pi.currentPage eq 1}">
						<li class="page-item disabled"><a class="btn moong-dark"
							href="#"><</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="btn moong-dark"
							href="list.so?cpage=${pi.currentPage-1}"><</a></li>
					</c:otherwise>
				</c:choose>

				<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
					<li class="page-item"><a class="btn moong-dark"
						href="list.so?cpage=${p}">${p}</a></li>
				</c:forEach>

				<c:choose>
					<c:when test="${pi.currentPage eq pi.maxPage}">
						<li class="page-item disabled"><a class="btn moong-dark"
							href="#">></a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="btn moong-dark"
							href="list.so?cpage=${pi.currentPage+1}">></a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<br>
		<br>

		<footer class="section fp-auto-height">
			<div align="center" style="margin-bottom: 5px;">KH정보교육원
				&nbsp;&nbsp;| &nbsp;&nbsp;서울특별시 영등포구 선유동2로 57 이레빌딩 (구관) 19F,20F
				&nbsp;&nbsp;| &nbsp;&nbsp;기세영,김영주,남영주,이나영,정준영</div>
			<div align="center">Copyright © moong 2022 All Right Reserved</div>
		</footer>


	</div>

	<script>

		
		$("#subBtnKor").on("click", function() {
			$("#inputSubject").val("국어");
			$(this).submit();
		})
		$("#subBtnEng").on("click", function() {
			$("#inputSubject").val("영어");
			$(this).submit();
		})
		$("#subBtnMat").on("click", function() {
			$("#inputSubject").val("수학");
			$(this).submit();
		})
		$(".tagBtn").on("click", function() {
			var tag = $(this).html().substring(1);
			$("#inputTag").val(tag);
			$(this).submit();
		})

	</script>

</body>
</html>