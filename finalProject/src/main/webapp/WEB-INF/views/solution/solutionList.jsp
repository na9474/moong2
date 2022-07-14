<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<style>
        .container-md {
            max-width: 1200px;
        }

        #table-line{
            text-align: center;
        }

        #tit-line{
            background-color: rgb(49, 48, 47);
            color: white;
        }

        .bottombox{
            text-align: right;
        }

        #scbutton{
            padding-left: 0px;

        }
        
        #scbox{
            padding-right: 0px;
        }
        
        #pageNum{
            text-align: center;
        }
      
        .fp-auto-height{
    		color: rgb(248, 238, 225);
    		background-color: rgb(49, 48, 47);
		}
		
		#pagingArea {width:fit-content;
					 margin:auto;
					 margin-top:20px;
					 margin-bottom:20px;
		}

    </style>
    
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br>
	 <div class="container-md p-4 bg-white rounded">
        <h1>문제풀이 게시판</h1>
        <br><br>
        <div class="row optionbox">
            <div class="col-6" id="scbox">
                <div class="input-group mb-3">
                    <select name="search_cat">
                        <option value="writer">작성자</option>
                        <option value="title">제목</option>
                        <option value="contents">내용</option>
                    </select>
                    <input type="text" class="form-control">
                </div>
            </div>

            <div class="col-1" id="scbutton">
                <button type="button" class="btn moong-dark">검색</button>
            </div>

            <div class="col-5">
                <button type="button" class="btn moong-yellow btn-sm">#국어</button>
                <button type="button" class="btn moong-yellow btn-sm">#영어</button>
                <button type="button" class="btn moong-yellow btn-sm">#수학</button>
                <button type="button" class="btn moong-yellow btn-sm">#수능</button>
                <button class="btn moong-yellow btn-sm">#자주나오는문제</button>
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
            $(function(){
            	$("#table-line>tbody>tr").click(function(){
            		location.href ='detail.so?sno=' + $(this).children("#sno").text();
            	})
            		
            })
        </script>
          
        <br>

        <div class="row bottombox">
            <div class="col-10"></div>
            <div class="col-2">
                <a class="btn moong-dark" href="writeForm.so">작성</a>
            </div>
        </div>
        
        <div id="pagingArea">
                <ul class="pagination">
	                <c:choose>
						<c:when test="${ pi.currentPage eq 1 }">
	                    <li class="page-item disabled"><a class="btn moong-dark" href="#"><</a></li>
						</c:when>                
						<c:otherwise>
						<li class="page-item"><a class="btn moong-dark" href="list.so?cpage=${pi.currentPage-1}"><</a></li>
						</c:otherwise>
	                </c:choose>
                
					<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">					
                    	<li class="page-item"><a class="btn moong-dark" href="list.so?cpage=${p}">${p}</a></li>
					</c:forEach>
                   
                    <c:choose>
                    	<c:when test="${pi.currentPage eq pi.maxPage }">
		                    <li class="page-item disabled"><a class="btn moong-dark" href="#">></a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="btn moong-dark" href="list.so?cpage=${pi.currentPage+1}">></a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div>
        <br><br>
        
        <footer class="section fp-auto-height">
            <div align="center" style=" margin-bottom: 5px;">KH정보교육원 &nbsp;&nbsp;| &nbsp;&nbsp;서울특별시 영등포구 선유동2로 57 이레빌딩 (구관) 19F,20F &nbsp;&nbsp;| &nbsp;&nbsp;기세영,김영주,남영주,이나영,정준영</div>
            <div  align="center" >Copyright © moong 2022 All Right Reserved</div>
        </footer>

        
    </div>
    
</body>
</html>