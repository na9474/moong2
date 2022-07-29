<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방 링크 | 뭉과외</title>

<link rel="stylesheet" href="${path}/resources/css/roomList.css">

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div id="ir_wrap">
		<div class="title"><h2>채팅방 링크</h2></div>
	    <br><br>
	    <div>
	    	<span id="room">
	    		<select name="sOption">
	    			<option value="all">전체</option>
	    			<option value="rno">방 번호</option>
	    			<option value="url">링크</option>
	    		</select>
	    		<input type="text" class="search" name="k" value="">
	    		<input type="submit" value="검색">
		    </span>
<%-- 		    <button type="button" id="del" data-toggle="modal" data-linkNo="${ar.roomNo}">삭제</button> --%>
	    </div>
	    <br>
	    <div id="table-scroll">
		    <table align="center" id="matchingTable">
		    	<thead>
		    		<tr>
		    			<th width="80px;">매칭그룹번호</th>
		    			<th width="400px;">채팅방 링크</th>
		    			<th width="60px;">&nbsp;</th>
		    		</tr>
		    	</thead>
		    	<tbody>
		    		<c:forEach var="ar" items="${adRmList}">
			    		<tr>
			    			<td id="roomNo" class="roomNo">${ar.groupNo}</td>
			    			<c:forEach var="a" items="${list }">
				    			<c:if test="${ar.groupNo eq a.roomNo }">
				    				<td><a href="${a.roomUrl }" id="at">${a.roomUrl }</a></td>
				    			</c:if>
			    			</c:forEach>
						    <td><button type="button" id="in" class="in" data-toggle="modal" data-target="#insertUrl">추가</button></td>
<!-- 			    			<td><button type="button" id="mo" data-toggle="modal" data-target="#modifyUrl">수정</button></td> -->
			    		</tr>
		    		</c:forEach>
		    	</tbody>
		    </table>
	    </div>
    </div>
    <script>
    	$(function(){
    		$('.in').click(function(){
    			 var a = $(this).parents().children(".roomNo").text();
    			$("#groupNo").val(a);
    		})
    	})
    </script>
    
    <!-- 채팅방 링크 추가 모달 -->
    <div class="modal fade" id="insertUrl">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">채팅방 링크 추가</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
                <form action="insertUrl.rm" method="post">
                    <div class="modal-body">
                        <input type="text" class="form-control mb-2 mr-sm-2" id="roomUrl" name="roomUrl" placeholder="채팅방 링크를 입력하세요.">
                        <input type="hidden" name="groupNo" id="groupNo" value=""/>
                    </div>
                    <!-- Modal Footer -->
                	<div class="modal-footer" align="center">
                        <button type="submit" id="in">추가</button>
                	</div>
                </form>
            </div>
        </div>
    </div>
<!--     채팅방 링크 수정 모달 -->
<!--     <div class="modal fade" id="modifyUrl"> -->
<!--         <div class="modal-dialog modal-sm"> -->
<!--             <div class="modal-content"> -->
<!--                 Modal Header -->
<!--                 <div class="modal-header"> -->
<!--                     <h4 class="modal-title">채팅방 링크 수정</h4> -->
<!--                     <button type="button" class="close" data-dismiss="modal">&times;</button> -->
<!--                 </div> -->
<!--                 Modal body -->
<!--                 <form action="modifyUrl.rm" method="post"> -->
<!--                     <div class="modal-body"> -->
<!--                         <input type="text" class="form-control mb-2 mr-sm-2" id="roomUrl" name="roomUrl" placeholder="수정할 채팅방 링크를 입력하세요."> -->
<!--                     </div> -->
<!--                     Modal Footer -->
<!--                 	<div class="modal-footer" align="center"> -->
<!--                         <button type="submit" id="in">수정</button> -->
<!--                 	</div> -->
<!--                 </form> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
		    
    <script>
//     	// 채팅방 링크 삭제
//     	$("#del").click(function(){
//     		var confirm_del = confirm("정말 삭제하시겠습니까?");
    		
//     		if(confirm_del){
//     			var checkArr = new Array();
    			
//     			$("input[class='out']:checked").each(function(){
//     				checkArr.push($(this).attr("data-linkNo"));
//     			});
    			
//     			$.ajax({
//     				url: "deleteUrl.rm",
//     				type: "post",
//     				data: {
//     					out: checkArr
//     				},
//     				success: function(rs){
//     					if(rs > 0){
// 	    					location.href="adRoomList.rm";
//     					} else {
//     						alert("삭제에 실패하였습니다.");
//     					}
//     				}
//     			});
//     		}
//     	});
    </script>
		    
</body>
</html>