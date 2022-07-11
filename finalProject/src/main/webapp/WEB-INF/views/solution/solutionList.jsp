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
            text-align: center;;
        }
      
        .fp-auto-height{
    		color: rgb(248, 238, 225);
    		background-color: rgb(49, 48, 47);
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
                    <select>
                        <option>과목</option>
                        <option>국어</option>
                        <option>영어</option>
                        <option>수학</option>
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

        <div style="margin-top:20px; margin-left: 20px;" id="pageNum">
            <button class="btn moong-dark"><</button><button class="btn moong-dark">1</button><button class="btn moong-dark">2</button><button class="btn moong-dark">3</button><button class="btn moong-dark">></button><br>
        </div>
        <br><br>
        
        <footer class="section fp-auto-height">
            <div align="center" style=" margin-bottom: 5px;">KH정보교육원 &nbsp;&nbsp;| &nbsp;&nbsp;서울특별시 영등포구 선유동2로 57 이레빌딩 (구관) 19F,20F &nbsp;&nbsp;| &nbsp;&nbsp;기세영,김영주,남영주,이나영,정준영</div>
            <div  align="center" >Copyright © moong 2022 All Right Reserved</div>
        </footer>

        
    </div>
    
</body>
</html>