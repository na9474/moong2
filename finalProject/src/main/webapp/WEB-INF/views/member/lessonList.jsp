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
    #teacher-reply{
        
        margin: auto;
        margin-top: 50px;
        width: 900px;
        height: 300px;
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
    
    #lessonTitle{
    	background-color:rgb(49, 48, 47);
    	color : white;
    }
    #lessonTitle th{
        color : rgb(248, 238, 225);
    
    }
    
    
    a {
  		text-decoration: none;
	}
    
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/myPageNavi.jsp"/>
	    <div class="outer">
    <br><br><br><br>
	 <h4 align="center"><b>과외 목록</b></h4>
	 <br><br>
        <table class="table table-bordered table-sm" id="lessonListTable">
            <thead align="center" id="lessonTitle">
                <tr>
                    <th style="width:15% ;">과목</th>
                    <th style="width:20% ;">선생님</th>
                    <th style="width:45% ;">과외 기간</th>
                    <th style="width:10% ;">상태</th>
                    <th style="width:10% ;">종료버튼</th>
                </tr>
            </thead>
            <tbody align="center">
                <c:forEach var="l" items="${list }">
                	<tr align="center">
                		<c:if test="${l.subject eq 'KO' }">
                		<td>국어</td>
                		</c:if>
                		<c:if test="${l.subject eq 'MA' }">
                		<td>수학</td>
                		</c:if>
                		<c:if test="${l.subject eq 'ENG' }">
                		<td>영어</td>
                		</c:if>
                		 
                		<c:if test="${loginUser.teacher eq 'N' }">	
                		<td>${l.userName } 선생님</td>
                		</c:if>
                		<c:if test="${loginUser.teacher eq 'Y' }">
                		<td>${l.userName }</td>
                		</c:if>
                		<td>${l.startDate} ~ ${l.endDate }</td>
                		<c:choose>
                			<c:when test="${l.status eq 'Y' }">
                				<td>진행중</td>
                			</c:when>
                			<c:otherwise>
                				<td>종료</td>
                			</c:otherwise>
                		</c:choose>
                		<c:if test="${empty l.endDate  }">
                			<td><a class="btn moong-yellow" href="lessonEnd.me?no=${l.leNo }">종료 버튼</a></td>
                		</c:if>

                	</tr>
                </c:forEach>

            </tbody>

        </table>
		
        
    </div>
 

    </div>
    </div>

    </div>
    </div>
</body>
</html>