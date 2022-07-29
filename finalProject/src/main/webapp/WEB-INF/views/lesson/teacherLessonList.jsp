<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
    #alarm-outer{
        margin:auto;
        width: 1000px;
        display: block;
    }
    /*영역잡기 끝*/

    /*페이지 제목*/
    #subtit{
            font-size: 35px;
            font-weight: 800;
            margin-top:100px;
            margin-bottom: 100px;
    }
    /*페이지 제목 끝*/

    /*리스트 부분*/
    #alarm-select{
        
        margin: auto;
    }
    .btn{
        margin: 0;
        
    }
    .table{
        margin:auto;
        width: 900px;
        text-align: center;
    }
    .table>tbody>tr>td{
        height: 65px;
        vertical-align: middle;
    }
    .table>thead{
        background-color: rgb(49, 48, 47);
        
    }
    .table>thead>tr>td{
        
        color: rgb(248, 238, 225);
    }
    /*리스트 부분 끝*/
    #pagingArea {width:fit-content; margin:auto;}
    
</style>
<body>
     <jsp:include page="../common/header.jsp"/>
    <div id="alarm-outer">
        <div id="subtit">
            선생님 목록
        </div>
        <div id="alarm-select">
            <div >
            <form method="get" action="search.le">
            <select name="searchCat" id="" style="height: 30px; width:70px;">
                    <option value="USER_NAME">이름</option>
                    <option value="RATING">등급</option>
                    <option value="SUBJECT">과목</option>
            </select>
            <input type="hidden" name="cpage" value=1 />
            <input type="text" value="${sText}" name="searchText" style="width:200px;" onKeypress="javascript:if(event.keyCode==13) {search_onclick_submit}"
>
            </form>
        </div>
                <table  class="table table-hover">
                    <thead>
                        <tr>
                            <td>과목</td>
                            <td>등급</td>
                            <td>이름</td>
                            <td>성별</td>
                            <td>담당학년</td>
                            <td>상세보기</td>
                        </tr>
                    </thead>
                    <tbody >
                    	<c:choose>
                    	<c:when test="${empty list}">
                    	<c:choose>
                    	<c:when test="${!empty sText }">
                    	<tr>
                    		<td colspan="6" >${sText}의 검색결과가 없습니다.</td>
                    	</tr>
                    	</c:when>
                    	<c:otherwise>
                    	<tr>
                    		<td colspan="6">과외를 등록한 선생님이 없습니다.</td>
                    	</tr>
                    	</c:otherwise>
                    	</c:choose>
                    	
                    	</c:when>
                    	<c:otherwise>
                    			<c:forEach var="l" items="${list}">
                    			<tr>
                    				<td class="leNo" style="display:none;">${l.leNo}</td>
                    					<c:choose>
                    						<c:when test = "${l.subject eq 'KO' }">
                    							<td>국어</td>
                    						</c:when>
                    						<c:when test = "${l.subject eq 'MATH' }">
                    							<td>수학</td>
                    						</c:when>
                    						<c:otherwise>
                    							<td>영어</td>
                    						</c:otherwise>
                    					</c:choose>
                    					<td>${l.rating}</td>
			                    		<td>${l.userName}</td>
			                    		<c:choose>
				                    		<c:when test="${l.gender eq 'M'}">
				                    			<td>남자</td>
				                    		</c:when>
				                    		<c:otherwise>
				                    			<td>여자</td>
				                    		</c:otherwise>
			                    		</c:choose>
			                    		<c:choose>
			                    			<c:when test = "${l.tyear eq 1 }">
			                    				<td>1학년</td>
			                    			</c:when>
			                    			<c:when test = "${l.tyear eq 2 }">
			                    				<td>2학년</td>
			                    			</c:when>
			                    			<c:when test = "${l.tyear eq 3 }">
			                    				<td>3학년</td>
			                    			</c:when>
			                    			<c:otherwise>
			                    				<td>상관없음</td>
			                    			</c:otherwise>
			                     		</c:choose>
			                    		<td><button class="btn moong-yellow detailLe" style="margin:0px;" ">상세보기</button></td>
			                    	</tr>
                    			</c:forEach>
                    	</c:otherwise>
                    	</c:choose>
                    
                        
                    </tbody>
                </table>
                 <div id="pagingArea">
                <ul class="pagination">
                
                	<c:choose>
						<c:when test="${ pi.currentPage eq 1 }">
	                    <li class="page-item "><button class=" btn moong-dark " disabled><</button></li>
						</c:when>                
						<c:otherwise>
						<li class="page-item"><button  class="btn moong-dark" href="tlist.le?cpage=${pi.currentPage-1}"><</button ></li>
						</c:otherwise>
	                </c:choose>
                
					<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
											
                    <li class="page-item"><button  class="btn moong-dark" href="tlist.le?cpage=${p }">${p}</button ></li>
					
					</c:forEach>
                   

                    <c:choose>
                    	<c:when test="${pi.currentPage eq pi.maxPage || pi.maxPage eq 0}">
		                    <li class="page-item "><button class="btn moong-dark"  disabled>></button ></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><button  class="btn moong-dark" href="tlist.le?cpage=${pi.currentPage+1}">></button ></li>
                    	</c:otherwise>
                    	
                    
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>
    
    
   	 <script>
   	 $(function(){
   		 $('.detailLe').click(function(){
   			location.href="detail.le?leNo="+$(this).parent().parent().children(".leNo").text();
   			
   		 })
   		 
   	 })
   	 
   
   	 
   	 
   	 </script>
</body>
</html>