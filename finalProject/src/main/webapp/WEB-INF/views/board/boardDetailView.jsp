<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>학생 글</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
      @font-face {
            font-family: '양진체';
            src: url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff') format('woff');
            font-weight: normal;
            font-style: normal;
      }
      * {
        font-family: '양진체';
      }

      .wrap {
        width: 1200px;
        min-height: calc(100vh - 53px);
        margin: 10% auto;
        display: block;
        /* background-color: sandybrown; */
      }
      
      h3 { /*제목*/
        text-align: left;
        margin-top: 50px;
        width: 300px;
      }
      
      .hr1 { /*가로선1*/
            width: 100%;
            height: 2px;
            border: none;
            background-color: rgb(43, 43, 43);
      }

      .hr2 { /*가로선2*/
            width: 100%;
            height: 1px;
            border: none;
            background-color: rgb(88, 88, 88);
      }

      .hr3 { /*가로선3*/
        width: 100%;
        height: 1px;
        border: none;
        background-color: rgb(197, 197, 197);
      }

      .title { /*제목, 작성자, 작성일 영역*/
        display: flex;
        margin-right: 100px;
      }
      
      .heart1 { /*좋아요 버튼*/
        position: relative;
        float: left;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background-color: pink;
        height: 20px;
        width: 20px;
        transform: rotate(-45deg);
        animation-name: beat;
        animation-duration: 1s;
        animation-iteration-count: infinite;
      }
      .heart1:before {
        background-color: pink;
        content: "";
        border-radius: 50%;
        position: absolute;
        width: 20px;
        height: 20px;
        top: -12px;
        left: 0px;
      }
      .heart1:after {
        background-color: pink;
        content: "";
        border-radius: 50%;
        position: absolute;
        width: 20px;
        height: 20px;
        top: 0px;
        left: 12px;
      }
      @keyframes beat {
        0% {
        transform: scale(1) rotate(-45deg);
        }
        50% {
        transform: scale(0.6) rotate(-45deg);
        }
      }

      .btn1 { /*수정 버튼*/
        background-color: rgba(0, 0, 0, 0);
        color: rgb(251, 176, 76);
        border: 2px solid rgb(251, 176, 76);
        border-radius: 5px;
        width: 100px;
        height: 35px;
        font-size: 13px;
        letter-spacing: 1px;
        float: right;
        margin-right: 5px;
      }
      .btn1:hover {
        color: rgb(248, 238, 225);
        background-color:rgb(251, 176, 76);
      }

      .btn2 { /*삭제 버튼*/
        background-color: rgba(0, 0, 0, 0);
        color: rgb(251, 176, 76);
        border: 2px solid rgb(251, 176, 76);
        border-radius: 5px;
        width: 100px;
        height: 35px;
        font-size: 13px;
        letter-spacing: 1px;
        float: right;
        margin-right: 5px;
      }
      .btn2:hover {
        color: rgb(248, 238, 225);
        background-color:rgb(251, 176, 76);
      }

      .btn3 { /*신고 버튼*/
        background-color: rgba(0, 0, 0, 0);
        color: rgb(49, 48, 47);
        border: 2px solid rgb(49, 48, 47);
        border-radius: 5px;
        width: 100px;
        height: 35px;
        font-size: 13px;
        letter-spacing: 1px;
        float: right;
      }
      .btn3:hover {
        color: rgb(248, 238, 225);
        background-color:rgb(49, 48, 47);
      }

      #comment { /*댓글 작성 영역*/
        resize: none;
        border: 0;
        border-radius: 15px;
        background-color: rgb(245,246,250);
        padding: 10px 0 0 10px;
      }

      .comment_btn { /*댓글 등록 버튼*/
        position: relative;
        width: 70px;
        height: 40px;
        border: 0;
        border-radius: 20px;
        background-color: rgb(202, 207, 216);
        color: whitesmoke;
        left: -90px;
        bottom: 30px;
        
      }
      .comment_btn:hover {
        background-color: whitesmoke;
        color: rgb(160, 160, 160);
      }
      
      /* .dot { 댓글 케밥메뉴 도전하다 실패
        background-image: url("kebab.jpg");
        background-size: 231px 198px;
        background-repeat: no-repeat;
        background-position: -206px -102px;
        width: 30px;
        height: 30px;
        outline: none;
        cursor: pointer;
      } */

      .list_btn { /*목록 버튼*/
        background-color: rgba(0, 0, 0, 0);
        color: rgb(251, 176, 76);
        border: 2px solid rgb(251, 176, 76);
        border-radius: 5px;
        width: 100px;
        height: 35px;
        font-size: 13px;
        letter-spacing: 1px;
      }
      .list_btn:hover {
        color: rgb(248, 238, 225);
        background-color:rgb(251, 176, 76);
      }
      
      #tophe {
      	position: relative;
      	margin-left: 20px;
      }

      #footer { /*푸터*/
          height: 53px;
      }
    </style>
</head>
<body>
    
    <jsp:include page="../common/header.jsp" />

    <div class="wrap">
    <input type="hidden" id="loginNo" value="${loginNo}">
    
        <div class="title">
        	<tr>
            <h3><td>${b.title}</td></h3>
            <td><p style="margin-left: 70%; margin-right: 5%; font-size: 20px;">${b.userId }</p></td>
            <td><span style="display: inline-block; margin-right: 300px; font-size: 18px; width: 150px; height: 20px;">${b.enrollDate }</span></td>
            </tr>
        </div>
        
        <hr class="hr1"><br>
        
        
        <div>
            <td><p>${b.content }</p></td>
        </div>
        <br>
        <hr class="hr1"> <br>

        
		
		<div class="col-1" id="tophe">

            	<c:choose>
					<c:when test="${loginNo==0}">
   			        	<button>로그인하세요</button>
  					</c:when>
  					
            		<c:when test="${likeYn==0}"> 
            			<div class="heart1">
	                		<a href="like.bo?boardNo=${b.boardNo}"><button style="border: none; font-size: 0px; padding: 5px; position: relative; background-color: pink;">추천</button></a>
        				</div> 
	                </c:when>
						
            		<c:when test="${likeYn>0}">
            		<div class="heart1">
            			<a href="likeDelete.bo?boardNo=${b.boardNo}"><button style="border: none; font-size: 0px; padding: 5px; background-color: pink;">취소</button></a>
        			</div>
            		</c:when>
	            </c:choose>
	            &nbsp;
	            ${likeCount}
         </div> <br>
	            <tr>
		        <th>첨부파일</th>
		        <td><a href="${b.bfSysName }" download="${b.bfOriginName }">"${b.bfOriginName }"</a></td>
		        </tr>
        	
		<c:if test="${loginUser.userId eq b.userId }">
        <div class="btns">
        	<button class="btn1" onclick="postFormSubmit(1)">수정</button>
            <button class="btn2" onclick="postFormSubmit(2)">삭제</button>
        </div> <br><br><br>
		</c:if>
		
		<form id="postForm" action="" method="post">
			<input type="hidden" name="bno" value="${b.boardNo }">
			<input type="hidden" name="filePath" value="${b.bfSysName }">
		</form>
		
		<script> //수정, 삭제
			function postFormSubmit(num){
				if(num==1){
					$("#postForm").attr("action","updateForm.bo").submit();
				}else{
					$("#postForm").attr("action","delete.bo").submit();
				}
			}
		</script>
		
		<br><br>
        <h4>댓글(<span id="cmtCount">0</span>)</h4>
        <br>
        
        <table id="cmtArea" class="table" align="center">
        <div class="row cmtWriter" id="cmtArea">
	       		<c:choose> 
         		<c:when test="${ not empty loginUser }"> 
	 		            <div class="col-11" id="textBox">
	 		                <input type="text" class="form-control" id="content">
	 		            </div>
	 		            <div class="col-1" id="scbutton">
	 		                <button type="button" class="btn moong-dark" id="cmtBtn" onclick="addCmt()">작성</button>
	 		            </div>
 		         </c:when> 
		         <c:otherwise>
		     	 	<div class="col-1" id="cmtfi">
		                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16" disabled>
		                    <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
		                    <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
		                </svg>
		            </div>
		            <div class="col-10" id="textBox">
		                <input type="text" class="form-control" id="content" placeholder= "로그인한 회원만 이용 가능합니다." readonly>
		            </div>
		            <div class="col-1" id="scbutton">
		                <button type="button" class="btn moong-dark" id="cmtBtn" disabled>작성</button>
		            </div>
		         </c:otherwise>
		     </c:choose>
			<thead>
				<br>
			</thead>
			
				<div class="cmt-view">
					<tbody id="replyList">
				
					</tbody>
				</div>
			
        </div>
        </table>
        <div>
			<a class="btn moong-yellow" href="list.bo">목록</a>
		</div>
            
            
    <script>
    	$(function(){
    		replyList();
    	})
    	
    	var boardNo=$("#boardNo").val();
    	
    	function addCmt(){
    		
    		if($("#content").val().trim().length != 0){
    			
    			$.ajax({
        			url : "rWrite.bo",
        			data : {
        				boardNo : ${b.boardNo},
        				content : $("#content").val(),
        			},
        			success : function(result){
        				if(result=="Y"){
        					replyList();
						$("#content").val("");        				
        				}
        			},
        			error : function(){
        				console.log("통신 실패")
        			}
        		})
    			
    		}else{
    			$("#content").val("");
    			alertify.alert("댓글을 입력해주세요.")
    		}
    		
    	}
	
    	
    	function replyList(){ //댓글 전부를 불러오는 처리 
    		$.ajax({
    			url : "rlist.bo",
    			data : {
    				bno : '${b.boardNo}'
    			},
    			success : function(result){
					console.log(result);
					
					var resultStr="";
					var loginNo = $("#loginNo").val();
										
					for(var i=0; i<result.length;i++){
						
						if(result[i].userNo==loginNo){
							resultStr+= "<tr>"
								+"<td>"+result[i].userId + "</td>"
								+"<td>"+result[i].content + "</td>"
								+"<td>"+result[i].brDate + "</td>"
								+"<td><button class='cmtDelBtn btn moong-yellow' style='float: right; margin-right: 5px;'>삭제</button>"
								+"<input type='hidden' name='r_no' class='input_r_no' value='"+result[i].rNo+"'>"
								+"</td>"
								
						}else{
							resultStr+= "<tr>"
								+"<td>"+result[i].userId + "</td>"
								+"<td>"+result[i].content + "</td>"
								+"<td>"+result[i].brDate + "</td>"
								+"</td>"
						}
						
					}
					
					$("#cmtArea>tbody").html(resultStr);
    				$("#cmtCount").text(result.length);
    			},
    			error : function(){
    				console.log("통신실패");
    			}
    		})
    	}
    	
    	
    	//댓글 삭제
    	$(document).on("click", ".cmtDelBtn", function(){
    		var r_no = $(this).siblings("input").val();
    		location.href = 'rDelete.bo?rNo='+r_no+'&&boardNo='+${b.boardNo};
    	})
    	
    
    </script>
    
  
</body>
</html>