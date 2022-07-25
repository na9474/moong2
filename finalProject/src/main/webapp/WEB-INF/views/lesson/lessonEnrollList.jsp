<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lessonList</title>
<style>
 /*영역잡기*/
    #alarm-outer{
        margin:auto;
        width: 1000px;
        display: block;
        margin-top:100px;
       
    }
   
    /*영역잡기 끝*/

    /*페이지 제목*/
    #subtit{
            font-size: 35px;
            font-weight: 800;
            margin-top: 50px;
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
</style>
<body>
    <jsp:include page="../common/header.jsp"/>
    <div id="wrapper">
    <div id="alarm-outer">
        <div id="subtit">
            과외 등록
        </div>
        
        <div style="margin-left: 5%; float:left">과목이 중복되게 과외를 등록할 수 없습니다.</div>
        <div style="float: right; margin-right: 5%; margin-bottom: 10px;"><button  style="height: 35px;"class="btn btn-warning" onclick="location.href='enrollFrom.le'">과외등록</button></div>
                <table  class="table table-hover" id="llist">
                    <thead>
                        <tr>
                            <td>과목</td>
                            <td>과외비</td>
                            <td>과외경력</td>
                            <td>상태</td>
                            <td>담당학년</td>
                            <td>상세보기</td>
                        </tr>
                    </thead>
                  
                    <tbody >
                     <c:choose>  
	<c:when test="${empty list}"> 
		<tr>
			<td colspan="6">등록된 과외가 없습니다.</td>
		</tr>
	</c:when>
	<c:otherwise>
				<c:forEach var="l" items="${list}">
		 		<tr>
		 					<td style="display: none;" class="leNo" >${l.leNo}</td>
		 					<c:choose>
			 					<c:when test="${l.subject eq 'KO' }">
			 						<td>국어</td>
			 					</c:when>
			 					<c:when test="${l.subject eq 'MATH' }">
			 						<td>수학</td>
			 					</c:when>
			 					<c:otherwise>
			 						<td>영어</td>
			 					</c:otherwise>
		 					</c:choose>
                            
                            <td>${l.fee}</td>
                            <td>${l.career}</td>
                            <c:choose>
                            	<c:when test="${l.status == 'Y'}">
	                            	<td style="color: blue;">등록</td>
	                            </c:when>
                            	<c:otherwise>
                            		<td style="color: red;">정지</td>
                            	</c:otherwise>
                            </c:choose>
                            
                            <td>${l.tyear}</td>
                            <td><button class="btn btn-warning" style="margin:0px;" onclick="">상세보기</button></td>
                        </tr>
                        </c:forEach>
					</c:otherwise>
				</c:choose> 
                       
                       
                    </tbody>
                </table>
                 <script>
           $(function(){
            $("#llist>tbody>tr>td>button").click(function(){
                    
                    location.href="detail.le?leNo="+$(this).parent().parent().children(".leNo").text();
            });
        });
           
           
           $(function(){
        	   function alertComplete(x){
          		  
          		  $.ajax({
          				url : "alertcp.ma",
          				data : {maNo : x },
          				success : function(){
          					if(result>0){
          					console.log("변경성공")		
          					}else{
          						console.log("변경실패")
          					}	
          				},
          				error : function(){
          					console.log("통신실패");
          				}
          			})
          	  }
           })
           
           
           
           
           
     </script>
    
        </div>
    
    
     </div>
     
    
     
</body>