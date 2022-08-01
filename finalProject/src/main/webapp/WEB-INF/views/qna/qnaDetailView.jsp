<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
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
​
        .container-md {
            max-width: 1200px;
        }
​
        #top-optionbox{
            padding-top: 3px;
            text-align: right;
        }
​
        #bottombox{
            text-align: right;
        }
​
        .moong-dark{
            background-color: rgb(49, 48, 47);
            color: rgb(248, 238, 225);
            
        }
​
        .moong-dark:hover{
            color: rgb(254, 132, 114);
            transition: 0.5s;
            
        }
	        
         #subtit{
            font-size: 25px;
            font-weight: 700;
            margin-top: 50px;
            margin-bottom: 20px;
	    }
	    
	    #qDate{
	    	margin-left:800px;
	    
	    }

		#qName{
			margin-left:800px;
			
		}


    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>

	
	<div class="outer">
        <br><br><br>
        <div class="container-md p-4 bg-white rounded">
        
        <br>

        <b>${qq.typeName }</b>
	        <span id="qDate">
	        ${qq.questionDate }
	        </span>
        
        <br>
        <span id="subtit">
        ${qq.title }
        </span>
        	<span id="qName">
	        ${qq.userName }
	        </span>
        <hr>
        <div>
	       	<div>
	        ${qq.questionContent }
	        </div>
	        <hr>
		</div>
		

        <!-- 로그인 한 회원 = 작성 회원 -->
        <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
       		<c:if test="${loginUser.userNo eq qq.userNo }">
                <a class="btn moong-dark" onclick="postFormSubmit(1)">수정하기</a>
                <a class="btn moong-dark" onclick="postFormSubmit(2)">삭제하기</a>
			</c:if>
        	<a class="btn moong-yellow" href="qnaListView.qu">목록으로</a>
        </div>
	            <br><br>


        
        
        <form id="postForm" action="" method="post">
				<input type="hidden" name="qnaNo" value="${qq.qnaNo }">
		</form>
		
		<script>
		function postFormSubmit(num){
			
			if(num==1){ //수정하기
				$("#postForm").attr("action","qnaUpdateForm.qu").submit();
			}else{ //삭제하기
				$("#postForm").attr("action","qnaDelete.qu").submit();
			}
		
		}
		
		</script>
		
		<!-- 댓글 -->
		<table id="replyArea" class="table" align="center">
                <thead>
                    <tr>
						<c:choose>						
                        	<c:when test="${loginUser.userNo eq 1 }">
                        		<th colspan="2">
                            		<textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
                        		</th>
                        		<th style="vertical-align:middle"><button class="btn moong-yellow" onclick="addReply();">등록하기</button></th>
                    		</c:when>
                    		<c:otherwise>
                    		    <th colspan="2">
                            		<textarea class="form-control" cols="55" rows="2" style="resize:none; width:100%;" readonly>관리자만 작성 가능합니다.</textarea>
                        		</th>
                        		<th style="vertical-align:middle"><button class="btn moong-yellow">등록하기</button></th>
                    		</c:otherwise>
                    	</c:choose>
                    	
                    </tr>
                    <tr>
                        <td colspan="3">댓글(<span id="rcount">0</span>)</td>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        
    	</div>
    </div>
 	
 	<script>
	    $(function(){
    		selectReplyList();
    	})	
    	
    	//댓글 작성
    	function addReply(){
    		if($("#content").val().trim().lenth != 0){
    			//id가 content인 것의 내용의 공백제거 한 것의 길이가 0이 아니면 댓글 작성해줘
    			$.ajax({
        			url : "rinsert.qu",
        			data : {
        				qnaNo : ${qq.qnaNo}, //el구문
        				answerContent : $("#content").val() //제이쿼리 선택자
        			},
        			success : function(result){
						if(result=="Y"){
							selectReplyList();
							$("#content").val("");
						}
        			},
        			error : function(){
        				console.log("통신실패")
        			}
        		});
    		}else{
    			$("#content").val(""); //공백만 입력했을경우 else문으로 오는데 이경우 공백제거해주는 과정 (""을 넣어주므로) 
    			//댓글 작성을 하지 않고 댓글작성 버튼 클릭한 경우 alert창 띄우기
    			alertify.alert("댓글을 입력해주세요")
    		}
    	}
    	
    	//댓글 목록
    	function selectReplyList(){ //댓글 전부 불러오는 처리
    		$.ajax({
    			url : "rlist.qu",
    			data : {
    				qnaNo : ${qq.qnaNo}
    			},
    			success : function(result){
    				
	    				var resultStr = "";
	    				
	    				for(var i in result){
	    					resultStr += "<tr>"
	    								+"<td>"+"관리자"+"</td>"
	    								+"<td>"+result[i].answerContent+"</td>"
	    								+"<td>"+result[i].answerDate+"</td>"
	    								+"</tr>";
	    								
	    				}
	    				
	    				$("#replyArea tbody").html(resultStr);
	    				$("#rcount").text(result.length); //댓글 개수 구해진다.
    			},
    			error : function(){
    				console.log("통신 실패");
    			}
    		})
    	}
 
        
    	</script>



    




</body>
</html>