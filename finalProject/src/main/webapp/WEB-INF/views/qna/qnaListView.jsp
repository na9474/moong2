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

	.rCount{
		color : grey;
	}
    
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<c:if test="${loginUser.userNo ne 1 }">
	<jsp:include page="../common/myPageNavi.jsp"/>
 	</c:if>
 <div class="outer" align="center">
        <br><br><br><br>
        <div>
        <h4><b>QnA 목록</b></h4>
        
        <c:if test="${loginUser.userNo ne 1}">
        <button onclick="location.href='qnaEnrollForm.qu' " class="moong-yellow" style="float: right; margin:auto">QnA작성</button>
        </c:if>
        <br><br>
         <table align="center" class="table table-hover" id="boardList">
            <thead>
                <tr align="center">
                  <th style="width:10% ;">No</th>
                  <th>유형</th>
                  <th style="width:40% ;">제목</th>
                  <th style="width:20% ;">등록일</th>
                  <th style="width:10% ;">상태</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="q" items="${list }">
                <tr align="center">
                    <td>${q.rownum }</td>
                    <td>${q.typeName }</td>
                    <td align="left">${q.title } 
                    	<c:forEach var="a" items="${alist }">
                    		<c:if test="${a.qnaNo eq q.qnaNo }">
                    		<span class="rCount"><span class="rCount"> ( </span>${a.qaCount }<span class="rCount"> )</span></span>
                    		</c:if>	
                    	</c:forEach>
                    </td>
                    <td>${q.questionDate }</td>
                 
                  	<c:if test="${q.qaNo eq 0 }">
                    <td> 답변 중 </td>
                    </c:if>
                    <c:if test="${q.qaNo ne 0 }">
                    <td>답변 완료</td>
                    </c:if> 
                    <td style="display:none;" id="qnaNo">${q.qnaNo }</td>
                </tr>
                </c:forEach>
            </tbody>
          </table>



        </div>
    <br><br>
     
     <!--페이징-->
  <div id="pagingArea" style="margin:auto;">
                <ul class="pagination" >
	                <c:choose>
						<c:when test="${ pi.currentPage eq 1 }">
	                    <li class="page-item disabled"><a class="btn moong-dark" href="#"><</a></li>
						</c:when>                
						<c:otherwise>
						<li class="page-item"><a class="btn moong-dark" href="qnaListView.qu?cpage=${pi.currentPage-1}"><</a></li>
						</c:otherwise>
	                </c:choose>
                
					<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}" step="1">					
                    	<li class="page-item"><a class="btn moong-dark" href="qnaListView.qu?cpage=${p}">${p}</a></li>
					</c:forEach>
                   
                    <c:choose>
                    	<c:when test="${pi.currentPage eq pi.maxPage }">
		                    <li class="page-item disabled"><a class="btn moong-dark" href="#">></a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="btn moong-dark" href="qnaListView.qu?cpage=${pi.currentPage+1}">></a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div>
        <br><br>
    
    </div>
 
        
	
	</div>
	</div>

			<script>
            	$(function(){
            		$("#boardList>tbody>tr").click(function(){
            			location.href = 'qnaDetailView.qu?qnaNo=' + $(this).children("#qnaNo").text();
            		})
            	})


            	
            </script>

</body>
</html>