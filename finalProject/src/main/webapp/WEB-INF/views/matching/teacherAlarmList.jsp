<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>teacherAlarmList</title>
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
          	  매칭 초대  알람 <br>
            
            <span style="font-size: 20px; visibility:hidden;" id="alarmspan">초대된 매칭이 있습니다.</span>
        </div>
        <div id="alarm-select">
          <span style=" font-size: 15px;"><i class="fa-solid fa-play"></i> 매칭완료버튼 클릭시 개설된 채팅방을 확인할 수 있습니다.</span>  
                <table id="alarmTb"class="table table-hover">
                    <thead>
                        <tr>
                            <td>과외 그룹정보</td>
                            <td>채팅방URL</td>
                            <td>과외 시작</td>
                            <td>매칭 취소</td>
                        </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                    <c:when test="${ empty t  }">
                    	<td colspan="4">초대된 채팅방이 없습니다.</td>
                    </c:when>
                    <c:otherwise>
                    	<c:forEach var="t" items="${t}">
                    		<tr>
                 
	                			<td><button>정보확인</button></td>
	                			<td><button>링크확인</button></td>
	                			<td><button>시작</button></td>
	                			<td><button>취소</button></td>
	                		</tr>
                    	</c:forEach>
                    </c:otherwise>
                    </c:choose>
	                		
                </table>
        </div>
    </div>

</body>
</html>