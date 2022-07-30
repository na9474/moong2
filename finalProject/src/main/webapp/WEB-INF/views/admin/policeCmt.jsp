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

form{
	display:inline;
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
        <table class="table table-hover" id="policeCmtList">
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
              <c:forEach var="pc" items="${list}">
              <tr>
                <th id="pc_No">${pc.pc_No}</th>
                <td>${pc.reporter}</td>
                <td>${pc.writer}</td>
                <td>${pc.createDate}</td>
                <td>${pc.reason}</td>
                <td>
                		<a class="cmtCon btn moong-yellow btn-sm" data-toggle="modal" data-target="#cmtContents">댓글내용보기</a>
                		<input type="hidden" name="scNo" value="${pc.scNo}"> 
                     <form id="deleteCmtPolice" method="post" action="cmtDelete.po" enctype="multipart/form-data" accept-charset="utf-8">
						<input type="hidden" name="pc_No" value="${pc.pc_No}">
                    	<button type="submit" class="btn moong-yellow btn-sm">삭제</button>
                     </form>
                </td>
              </tr>
              </c:forEach>
            </tbody>
        </table>
        
        <div class="modal fade" id="cmtContents">
	        <div class="modal-dialog modal-lg">
	            <div class="modal-content">
	
	                <div class="modal-header">
	                    <h4 class="modal-title">댓글내용</h4>
	                    <button type="button" class="close" data-dismiss="modal">&times;</button>
	                </div>
	        
	                
	                    <div class="modal-body">
	                    <!-- 댓글번호,작성자, 댓글내용, 댓글 쓴 날짜 -->
							<table class="table table-hover" id="policeCmtContents">
				           		<thead id="tit-line">
						              <tr>
						                <th scope="col">작성자</th>
						                <th scope="col">댓글내용</th>
						                <th scope="col">댓글 쓴 날짜</th>
						              </tr>
					            </thead>
					            <tbody>
						              <tr>
						                <td id="tWriter"></td>
						                <td id="tContents"></td>
						                <td id="tDate"></td>
						              </tr>
					             </tbody>
					        </table>    
	                    </div>
	                    <div class="modal-footer">
	                   		<form method="post" action="detail.so"> 
			                    <input type="hidden" id="tSolutonNo" name="sno">
			                    <button type="submit" class="btn moong-yellow btn-sm" >해당게시물이동</button>
							</form>
		                        <button type="button" class="btn moong-yellow btn-sm" data-dismiss="modal">확인</button>
	                    </div>
	                
	            </div>
	        </div>
	    </div>
        
        <div id="pagingArea">
			<ul class="pagination">
				<c:choose>
					<c:when test="${ pi.currentPage eq 1 }">
						<li class="page-item disabled"><a class="btn moong-dark"
							href="#"><</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="btn moong-dark"
							href="cmtList.po?cpage=${pi.currentPage-1}"><</a></li>
					</c:otherwise>
				</c:choose>
		
				<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
					<li class="page-item"><a class="btn moong-dark"
						href="cmtList.po?cpage=${p}">${p}</a></li>
				</c:forEach>
		
				<c:choose>
					<c:when test="${pi.currentPage eq pi.maxPage }">
						<li class="page-item disabled"><a class="btn moong-dark"
							href="#">></a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="btn moong-dark"
							href="cmtList.po?cpage=${pi.currentPage+1}">></a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div> 
    </div>
    
    
    <script>
	$(document).on("click",".cmtCon",function(){
    	var sc_no =	$(this).siblings("input").val()
    	    	
    	 //해당 댓글 내용 확인
    		$.ajax({
    			url : "cmtCon.po",
    			data : {
    				scNo : sc_no
    			},
    			success : function(result){
					console.log(result);
					
					$("#tWriter").html(result.userId);
					$("#tContents").html(result.solutionCmtContents);
					$("#tDate").html(result.createDate);
					$("#tSolutonNo").val(result.solutionNo);
					
    			},
    			error : function(){
    				console.log("통신실패");
    			}
    		})  	
    	
    	});
	
	
    </script>
    
    
</body>
</html>