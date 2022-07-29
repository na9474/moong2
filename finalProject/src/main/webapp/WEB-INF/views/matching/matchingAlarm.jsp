<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>matchingAlarm</title>
<style>

  /*영역잡기*/
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
            margin-top: 100px;
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
    #alarmTb>tbody>tr>td{
        height: 65px;
        vertical-align: middle;
    }
    #alarmTb>thead{
        background-color: rgb(49, 48, 47);
        
    }
    #alarmTb>thead>tr>td{
        
        color: rgb(248, 238, 225);
    }
    /*리스트 부분 끝*/


</style>
<body>
     <jsp:include page="../common/header.jsp"/>
    <div id="alarm-outer">
        <div id="subtit">
            매칭 알람 <br>
            
            <span style="font-size: 20px; visibility:hidden;" id="alarmspan">완료된 과외매칭이 있습니다.</span>
        </div>
        <div id="alarm-select">
          <span style=" font-size: 15px;"><i class="fa-solid fa-play"></i> 매칭완료버튼 클릭시 개설된 채팅방을 확인할 수 있습니다.</span>  
                <table id="alarmTb"class="table table-hover">
                    <thead>
                        <tr>
                            <td>과목</td>
                            <td>인원</td>
                            <td>성별</td>
                            <td>금액</td>
                            <td>매칭일</td>
                            <td>상태</td>
                            <td style="width:10%;">매칭취소</td>
                        </tr>
                    </thead>
                    <tbody>
                	<c:choose>
                		<c:when test ="${empty list}">
	                		<tr>
	                			<td colspan="7">매칭중인 과외가 없습니다.</td>
	                		</tr>
                		</c:when>
                		<c:otherwise>
		                		<c:forEach var="m" items="${list}">
			                    	<tr>
			                    		<td style="display: none;" class="maNo">${m.maNo}</td>
				                    	<c:choose>
					                    	<c:when test = "${fn:contains(m.subject,'KO')}">
					                    		<td>국어</td>
					                    	</c:when>
					                    	<c:when test = "${fn:contains(m.subject,'MATH')}">
					                    		<td>수학</td>
					                    	</c:when>
					                    	<c:otherwise>
					                    		<td>영어</td>
					                    	</c:otherwise>
				                    	</c:choose>
			                    	<td>${m.people}</td>
			                    	<c:choose>
			                    	<c:when test="${m.gender eq 'M' }">
			                    	<td>남자</td>
			                    	</c:when>
			                    	<c:when test="${m.gender eq 'F' }">
			                    	<td>여자</td>
			                    	</c:when>
			                    	<c:otherwise>
			                    	 <td>상관없음</td>
			                    	
			                    	</c:otherwise>
			                    	</c:choose>
			                    	
			                    	<td class="fee">${m.fee}</td>
			                    	<td>${m.enrollDate}</td>
			                    	<form method="post" action="checkUrl.ma">
			                    		<c:choose>
			                    			<c:when test = "${m.status eq 'C' && m.url eq 'Y'}">
			                    				
			                    				<c:choose>
			                    					<c:when test="${m.alert2 eq 'Y' }" >
			                    						<td><button class="btn moong-yellow">링크확인</button> <input type="hidden" name="userNo" value="${loginUser.userNo}"></td>
			                    					</c:when>
			                    					<c:otherwise>
			                    						<td><button class="btn moong-yellow">매칭완료</button> <input type="hidden" name="userNo" value="${loginUser.userNo}"></td>
			                    					</c:otherwise>
			                    				</c:choose>
			                    				
				                    				
			                    			</c:when>
			                    			<c:otherwise>
			                    				<td> <span style="color: red;">매칭대기중</span></td>
			                    			</c:otherwise>
			                    		</c:choose>
			                    		</form>
			                    		<c:choose>
			                    		<c:when test="${m.status eq 'C'}">
			                    		<td><button class="btn btn-danger" disabled > x </button> </td>
			                    		</c:when>
			                    		<c:otherwise>
			                    		<td><button class="btn btn-danger" > x </button> </td>
			                    		</c:otherwise>
			                    		</c:choose>
			                    		
			                    	</tr>
		                    	</c:forEach>
                		</c:otherwise>
                	</c:choose>
                    </tbody>
                </table>
        </div>
    </div>
    <script>
    
   
    
    
    $(function(){
    	checkAlarm();
    })
    
    $(function(){
    	$('.btn-danger').click(function(){
    		
    		if (!confirm("정말로 매칭을 취소하시겠습니까?")) {
    	        
    	    } else {
    	    	location.href="delete.ma?maNo="+$(this).parent().parent().children(".maNo").text()+"&&userNo=${loginUser.userNo}";
    	    }
    		  
    		
    	})
    })
    

    function checkAlarm(){ 
		$.ajax({
			url : "check.ma",
			data : {userNo : ${loginUser.userNo}},
			success : function(result){
 				if(result>0){ //완료된 매칭 O
 					$('#alarmspan').css('visibility','visible');
			}else{ //완료된매칭이 X
				
			}
			},
			error : function(){
				console.log("통신실패");
			}
		})
	};
    </script>
</body>
</html>