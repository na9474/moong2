<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
	.outer{
		width:1000px;
        margin: auto;
    }


    
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
           /*영역잡기*/
    #alarm-outer{
        margin:auto;
        width: 1000px;
        display: block;
    }
    #teacher-detail{
        margin: auto;
        width: 900px;
        height: 2000px;
    }
    
    .line{
        height: 0px;
        width: 600px;
        background-color: black;
        border: 1px solid black;
        margin: auto;
        margin-top: 20px;
        margin-bottom: 20px;
    }
    #idc{
        
        width: 500px;
        height: 700px;
        margin: auto;
        margin-bottom: 10px;
        /*공란색칠*/
        background-color: orange;
    }
    #vi{
        width: 700px;
        height: 400px;
        margin:auto;
        margin-bottom: 10px;
        /*공란색칠*/
        background-color: orange;
    }
    /*영역잡기 끝*/

    /*페이지 제목 + 서브타이틀*/
    #subtit{
            font-size: 25px;
            font-weight: 800;
            margin-top: 50px;
            margin-bottom: 50px;
    }
    .mid{
        margin-bottom: 30px;
        font-size: 25px;
    }   
    /*페이지 제목 끝*/
    
    /*선생님 정보*/
    #teacher-tb1{
        border-collapse: separate;
        border-spacing: 10px;
    }


    #teacher-tb2{
        text-align: center;
        border-collapse: separate;
        border-spacing: 10px;
        margin: auto;
        width: 600px;
    }

    
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/myPageNavi.jsp"/>
	
 <div class="outer" align="center">
        <br><br><br><br>
        <div>
        <h4><b>좋아요 게시글 목록</b></h4>
        <br><br>
		<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link" href="likeBoardListView.me">자유게시판</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link active" href="likeSolutionListView.me">문제풀이게시판</a>
		  </li>

		</ul>
		<br>
         <table align="center" class="table table-hover" id="likeSolutionTable">
            <thead>
                <tr align="center">
                  <th style="width:15% ;">과목</th>
                  <th style="width:30% ;">제목</th>
                  <th style="width:20% ;">작성자</th>
                  <th style="width:15% ;">조회수</th>
                  <th style="width:20% ;">작성일</th>
                </tr>
            </thead>
            <tbody>
            
            	
                <c:forEach var="s" items="${slist }">
                	<tr align="center">
                		<td>${s.subject }</td>
                		<td align="left">${s.title }</td>
                		<td>${loginUser.userName }</td>
                		<td>${s.count }</td>
                		<td>${s.createDate }</td>
                		<td style="display:none;" id="sno">${s.solutionNo }</td>
                	</tr>
                </c:forEach>
            	
            
            </tbody>
          </table>
        </div>
    <br><br>
     
     <!--페이징-->
 	<div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                	<c:when test="${pi.currentPage eq 1 }">
                    <li class="page-item disabled"><a class="btn moong-dark" href="#"><</a></li>
                    </c:when>
                    <c:otherwise>
                    <li class="page-item"><a class="btn moong-dark" href="likeSolutionListView.me?cpage=${pi.currentPage - 1 }"><</a></li>
                    </c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }" step="1"> 
                    <li class="page-item"><a class="btn moong-dark" href="likeSolutionListView.me?cpage=${p }">${p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    <c:when test="${pi.currentPage eq pi.maxPage }">
                    <li class="page-item disabled"><a class="btn moong-dark" href="#">></a></li>
					</c:when>
					<c:otherwise>
					<li class="page-item"><a class="btn moong-dark" href="likeSolutionListView.me?cpage=${pi.currentPage + 1 }">></a></li>
					</c:otherwise>
					</c:choose>        
                </ul>
     </div>
    
    </div>
 
        
	
	</div>
	</div>

		<script>
			$(function() {
				$("#likeSolutionTable>tbody>tr").click(
						function() {
							location.href = 'detail.so?sno='
									+ $(this).children("#sno").text();
						})

			})
		</script>

</body>
</html>