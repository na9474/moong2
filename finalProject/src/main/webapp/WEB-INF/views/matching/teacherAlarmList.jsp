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
                       		<td>No</td>
                            <td >과외 그룹정보</td>
                            <td >채팅방URL</td>
                            <td>과외 시작</td>
                            <td>매칭 취소</td>
                        </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                    <c:when test="${ empty list  }">
                    <tr>
                    	<td colspan="5">초대된 채팅방이 없습니다.</td>
                    	</tr>
                    </c:when>
                    <c:otherwise>
                    	
                    	<c:forEach var="t" items="${list}">
                    		<tr>
                    			<td>1</td>
                 				<td style="display:none"class="gNo">${t}</td>
	                			<td><button data-toggle="modal" data-target="#matchingInfo" class="matchingInfo">정보확인</button></td>
	                			<td><button data-toggle="modal" data-target="#matchingURL" class="matchingURL">링크확인</button></td>
	                			<td><button class="lessonStart">시작</button></td>
	                			<td><button class="matchingCnacel">취소</button></td>
	                		</tr>
                    	</c:forEach>
                    </c:otherwise>
                    </c:choose>
					</tbody>	                		
                </table>
        </div>
    </div>


	<!-- 그룹정보확인 modal -->
	<script>
	
	$(function (){
		
		$(".matchingInfo").click(function(){
			var groupNo = $(this).parent().parent().children(".gNo").text();
			
		 	$.ajax({
				url:"matchingInfo.ma",
				data : {groupNo: groupNo},
				success : function(x){
					var str =""
					var subject = x.subject;	
					
							str += "<tr>"
							+"<td>과목 : </td>";
							
							if(subject.includes('KO')){
								str+="<td>국어</td>"	
							}else if(subject.includes('MATH')){
								str+="<td>수학</td>"
							}else{
								str+="<td>영어</td>"
							}
							
							str+="</tr>"
							+"<tr>"
							+"<td>인원 : </td>"
							+"<td>"+x.people+"명</td>"
							+"</tr>"
							+"<tr>"
							+"<td>지역 : </td>"
							+"<td>"+x.area+"</td>"
							+"</tr>"
							+"<tr>"
							+"<td>학년 : </td>"
							+"<td>"+x.sYear+"학년</td>"
							+"</tr>"
							+"<tr>"
							+"<td>요일 : </td>"
							+"<td>"+x.maDay+"</td>"
							+"</tr>"
							$("#matchingInfoTb>tbody").html(str);
										
				},
				error: function(){
					통신실패
				}
			}) 
			
		}) 
	})
	</script>


 <div class="modal fade" id="matchingInfo">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">과외정보</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
               
                    <div class="modal-body">
						<table id="matchingInfoTb">
						<tbody>
						</tbody>
								
						</table>
                    </div>
                    <!-- Modal Footer -->
                	<div class="modal-footer" align="center">
                        <button  class="btn btn-default" data-dismiss="modal">확인</button>
                	</div>
                
            </div>
        </div>
    </div>
	<!-- url링크띄우는 modal -->
	<script>
		$('.matchingURL').click(function(){
			var groupNo = $(this).parent().parent().children(".gNo").text();
			
		 	$.ajax({
				url:"matchingURL.ma",
				data : {groupNo: groupNo},
				success : function(x){
					var str = x.roomUrl;
					
							$("#url").html(str);
							$("#url").prop('href',str)		
				},
				error: function(){
					통신실패
				}
			}) 
		})
	
	</script>
	
	
	<div class="modal fade" id="matchingURL">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">과외정보</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
               
                    <div class="modal-body">
						<a id="url" href=""></a>
                    </div>
                    <!-- Modal Footer -->
                	<div class="modal-footer" align="center">
                        <button  class="btn btn-default" data-dismiss="modal">확인</button>
                	</div>
                
            </div>
        </div>
    </div>
	
	<!-- 과외시작 -->
	<script>
	  
	    	$('.lessonStart').click(function(){
	    		
	    		if (!confirm("해당그룹과 괴외를 시작합니다.")) {
	    	        
	    	    } else {
	    	    	location.href="lesson.ls?groupNo="+$(this).parent().parent().children(".gNo").text()+"&&userNo=${loginUser.userNo}";
	    	    }
	    		  
	    		
	    	})
	    
	</script>
	
	
	<!-- 매칭취소 -->
	<script>
	
	$('.matchingCnacel').click(function(){
		
		if (!confirm("정말로 매칭을 취소하시겠습니까?")) {
	        
	    } else {
	    	location.href="matcingCancel.ma?groupNo="+$(this).parent().parent().children(".gNo").text()+"&&userNo=${loginUser.userNo}";
	    }
		  
		
	})
	</script>
</body>
</html>