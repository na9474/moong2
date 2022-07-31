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
* {
	text-align: center;
}

.container-md {
	max-width: 1200px;
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
     
        <a class="btn moong-dark" href="list.po">게시물</a>
		<a class="btn moong-dark" href="cmtList.po">댓글</a>
		<br><br>

        <table class="table table-hover" id="policeList">
            <thead id="tit-line">
              <tr>
                <th scope="col">번호</th>
                <th scope="col">신고자</th>
                <th scope="col">작성자</th>
                <th scope="col">날짜</th>
                <th scope="col">신고사유</th>
                <th scope="col">조치</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="p" items="${list}">
              <tr>
                <th id="p_No">${p.p_No}</th>
                <td>${p.reporter}</td>
                <td>${p.writer}</td>
                <td>${p.createDate}</td>
                <td>${p.reason}</td>
                <td>
                     <form id="deletePolice" method="post" action="delete.po" enctype="multipart/form-data" accept-charset="utf-8">
                     	<a class="btn moong-yellow btn-sm" style="margin-top:-5px;" href="detail.so?sno=${p.solutionNo}">해당게시물이동</a>
						<input type="hidden" name="p_No" value="${p.p_No}">
                    	<button type="submit" class="btn moong-yellow btn-sm" style="margin-top:-5px;">삭제</button>
                     </form>
                </td>
              </tr>
              </c:forEach>
            </tbody>
        </table>
		
        <div id="pagingArea">
			<ul class="pagination">
				<c:choose>
					<c:when test="${ pi.currentPage eq 1 }">
						<li class="page-item disabled"><a class="btn moong-dark"
							href="#"><</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="btn moong-dark"
							href="list.po?cpage=${pi.currentPage-1}"><</a></li>
					</c:otherwise>
				</c:choose>
		
				<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
					<li class="page-item"><a class="btn moong-dark"
						href="list.po?cpage=${p}">${p}</a></li>
				</c:forEach>
		
				<c:choose>
					<c:when test="${pi.currentPage eq pi.maxPage }">
						<li class="page-item disabled"><a class="btn moong-dark"
							href="#">></a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="btn moong-dark"
							href="list.po?cpage=${pi.currentPage+1}">></a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
              
    </div>
    
</body>
</html>