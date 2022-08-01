<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<style>
        .container-md {
	        max-width: 1200px;
        }

        #top-line{
            border: 1px solid black;
            border-top: none;
            border-left: none;
            border-right: none;
        }

        #topwr{
            margin: auto;
            text-align: right;
            font-size: 13px;
        }

        #topda{
            margin: auto;
            text-align: center;
            font-size: 13px;
        }

        #tophe{
            margin: auto;
        }

        #co-contentText{
		    margin-top: 20px;
		    margin-bottom: 5px;
		    box-sizing: border-box;
		    border: 1px solid black;
            border-top: none;
            border-left: none;
            border-right: none;
		    width: auto;
		    height: auto;
		}

        #cmtfi{
            text-align: right;
            padding-top: 35px;
        }

        #tolist{
            border: 1px solid black;
            border-top: none;
            border-left: none;
            border-right: none;
            padding-top: 10px;
        }

        #tit-line{
            background-color: rgb(49, 48, 47);
            color: white;
        }

        #table-line{
            text-align: center;
        }
        
        #scbutton{
            padding-left: 1px;
        }
        
        #textBox{
            padding-right: 0px;
        }
        
        #content{
            height: 100px;
        }

        #cmtBtn{
            height: 100px;
        }
        
  		#cmtListAll{
  			text-align: center;
  		}
  		
  		#cmthead{
  			text-align: center;
  			border: none;
  		}
  		
  		#numbers {
    		width:100%;
      		display: flex;
      		justify-content: center;
    	}
 
	</style>
	
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br>
	<div class="container-md p-4 bg-white rounded">
    <br><br><br><br><br>

        <div class="row topline" id="top-line">
       		<input type="hidden" id="loginId" value="${loginId}">
        	<input type="hidden" id="loginNo" value="${loginNo}">

            <div class="col-5">
                <h3>${s.title}</h3>
            </div>

            <div class="col-3" id="topwr">${s.userId}</div>
            
            <div class="col-1" id="topwr">${s.subject}</div>		

            <div class="col-2" id="topda">${s.createDate}</div>

            <div class="col-1" id="tophe">

            	<c:choose>
            		<c:when test="${loginNo==0}">
   			        	<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
  						<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/></svg>
  					</c:when>
  						
            		<c:when test="${heartYn==0}">  
	                	<a href="heart.so?solutionNo=${s.solutionNo}" style="text-decoration: none;"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
	                    <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/></svg>
	                	</a>
	                </c:when>

            		<c:when test="${heartYn>0}">
            			<a href="heartDelete.so?solutionNo=${s.solutionNo}" style="text-decoration: none;"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
  						<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/></svg>
						</a>
            		</c:when>
	            </c:choose>
	            ${heartCount}
            </div>

        </div>

        <div class="row contents">
            <div class="col-12" id="co-contentText">${s.solutionContents}</div>
        </div>

	        <div class="row etc" id=etcBtn>
	            <div class="col-10"></div>
	            
			<c:choose>
	            <c:when test="${loginUser.userNo eq s.userNo || loginUser.userId eq 'admin'}">
		            <div class="col-1" id="modifybut">
		                <a class="btn moong-dark" onclick="postFormSubmit(1)">수정</a>
		            </div>
		            <div class="col-1" id="deletebut">
		                <a class="btn moong-dark" onclick="postFormSubmit(2)">삭제</a>
		            </div>
	            </c:when>
	            
	            <c:when test="${loginNo==0}">
		            <div class="col-1"></div>
		            <div class="col-1"></div>
	            </c:when>
	            
	            <c:when test="${solPoliceYn==0}">
		            <div class="col-1"></div>
		            <div class="col-1" id="policebut">
						<a class="btn moong-dark" data-toggle="modal" data-target="#police">신고</a>
		            </div>
	           	</c:when>
	           	
	           	<c:when test="${solPoliceYn>0}">
		           	<div class="col-1"></div>
		            <div class="col-1" id="policebut">
						<a class="btn moong-dark" data-toggle="modal" data-target="#policeY">신고</a>
		            </div>
	           	</c:when>
	           	
		    </c:choose>
	        </div>
        
       <script>
           		function postFormSubmit(num){
            	if(num==1){
            		$("#postForm").attr("action","modifyForm.so").submit();
            	}else{
            		$("#postForm").attr("action","delete.so").submit();
            	}
            }
        </script>
        
    <div class="modal fade" id="police">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <h4 class="modal-title">신고사유</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <form action="report.so" method="post">
                    <div class="modal-body">
                        <input type="text" class="form-control mb-2 mr-sm-2" placeholder="신고사유를 입력하세요 (30글자)" maxlength='32' id="reason" name="reason" required> <br>
                    </div>
                    <div class="modal-footer">
                    	<input type="hidden" id="solutionNo" name="solutionNo" value="${s.solutionNo}">
                        <button type="submit" class="btn moong-yellow">신고하기</button>
                        <button type="button" class="btn moong-yellow" data-dismiss="modal">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="policeCmt">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <h4 class="modal-title">신고사유</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <form action="cmtReport.so" method="post">
                    <div class="modal-body">
                        <input type="text" class="form-control mb-2 mr-sm-2" placeholder="신고사유를 입력하세요 (30글자)" maxlength='32' id="reason" name="reason" required> <br>
                    </div>
                    <div class="modal-footer">
                    	<input type="hidden" name="scNo" id="scNo" class="scNo" value="${pc.scNo}">
                    	<input type="hidden" name="solutionNo" id="solutionNo" class="solutionNo" value="${s.solutionNo}">
                    	
                        <button type="submit" class="btn moong-yellow">신고하기</button>
                        <button type="button" class="btn moong-yellow" data-dismiss="modal">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="policeY">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">이미 신고한 게시글 입니다.</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn moong-yellow" data-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
        
        <form id="postForm" action="" method="post">
            <input type="hidden" name="sno" value="${s.solutionNo}">
            <input type="hidden" name="filePath" value="${sf.sfSysName}">
        </form>
          
        <div class="row tag">
        	<div class="col-12">
        		${s.tag}
        	</div>
        </div>
           
        <br><br>
        <h4>답변(<span id="cmtCount">0</span>)</h4>
        <br>
        
        <table id="cmtArea" class="table" align="center">
        <div class="row cmtWriter" id="cmtArea">
	       		<c:choose> 
         		<c:when test="${ not empty loginUser }"> 
         		<form id="addCmtForm" role="form" method="post" enctype="multipart/form-data" action="cmtInsert.so">
	 		            <div class="col-3" id="cmtfi">	 		            		
	 		            	<input type="file" id="file" name="file"> 		
	 		            </div>
	 		            <div class="col-8" id="textBox">
	 		                <input type="text" class="form-control" id="content" name="solutionCmtContents" required>
	 		                <input type="hidden" name="solutionNo" value="${s.solutionNo}">
	 		            </div>
	 		            <div class="col-1" id="scbutton">
	 		                <button type="submit" class="btn moong-dark" id="cmtBtn">작성</button>
	 		            </div>
	 		     </form>
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
				<div class="cmt-head">
					<thead>
						<th id="cmthead">아이디</th>
						<th id="cmthead">내용</th>
						<th id="cmthead">첨부파일</th>
						<th id="cmthead">작성일</th>
						<th id="cmthead">조치</th>	
					</thead>
				</div>
				<div class="cmt-view">
					<tbody id="cmtListAll">
				
					</tbody>
				</div>
			
        </div>
        </table>
      		   <div class="pagination">
                  <ol id="numbers"></ol>
               </div>
        
        <br><br><br><br>
        <div class="to list">
            <a class="btn moong-yellow" href="list.so">목록</a>
        </div>
        <div class="col-12" id="tolist"></div>
        <br><br>
        
        <c:choose>
        	<c:when test="${loginUser.teacher eq 'Y'}">
		        <h4>미답변 문제풀이</h4>
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
						<c:forEach var="t" items="${ts}">
							<tr>
								<th id="sno">${t.solutionNo}</th>
								<td>${t.subject}</td>
								<td>${t.title}</td>
								<td>${t.userId}</td>
								<td>${t.count}</td>
								<td>${t.createDate}</td>
							</tr>
						</c:forEach>
		            </tbody>
		        </table>
	        </c:when>
	        
	        <c:when test="${loginUser.student eq 'Y'}">
		        <h4>유사한 문제풀이</h4>
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
						<c:forEach var="u" items="${ss}">
							<tr>
								<th id="sno">${u.solutionNo}</th>
								<td>${u.subject}</td>
								<td>${u.title}</td>
								<td>${u.userId}</td>
								<td>${u.count}</td>
								<td>${u.createDate}</td>
							</tr>
						</c:forEach>
		            </tbody>
		        </table>
	        </c:when>
	    </c:choose>
	    
    		<script>
			$(function() {
				$("#table-line>tbody>tr").click(
						function() {
							location.href = 'detail.so?sno='
									+ $(this).children("#sno").text();
						})
			})
		</script>
        
    <script>
	    window.onload = function() {
    		cmtListAll();
    	}
    	
    	var solutionNo=$("#solutionNo").val();
    	
     	$("#cmtBtn").on("click", function(){
    		
    		if($("#content").val().trim().length != 0){
    			$("#addCmtForm").submit();
    		}else{
    			$("#content").val("");
    			alert("댓글을 입력해주세요.")
    			return false;
    		}    		
    	})
    	
    	function cmtListAll(){ //댓글 전부를 불러오는 처리 
    		$.ajax({
    			url : "cmtList.so",
    			data : {
    				sno : ${s.solutionNo}
    			},
    			success : function(result){
					console.log(result);
					
					var resultStr="";
					var loginNo = $("#loginNo").val();
					var loginId = $("#loginId").val();
										
					for(var i=0; i<result.length;i++){
					
						if(result[i].userNo==loginNo || loginId=="admin"){
							if(result[i].scfOriginName == null){
							resultStr+= "<tr>"
								+"<td>"+result[i].userId + "</td>"
								+"<td>"+result[i].solutionCmtContents + "</td>"
								+"<td></td>"
								+"<td>"+result[i].createDate + "</td>"
								+"<td><button class='cmtDelBtn btn moong-yellow'>삭제</button>"
								+"<input type='hidden' name='sc_no' class='input_sc_no' value='"+result[i].scNo+"'>"
								+"</td>"
							}else{
								resultStr+= "<tr>"
									+"<td>"+result[i].userId + "</td>"
									+"<td>"+result[i].solutionCmtContents + "</td>"
									+"<td><a href='"+result[i].scfSysName+"' download='"+result[i].scfOriginName+"'>"+result[i].scfOriginName+"</a></td>"
									+"<td>"+result[i].createDate + "</td>"
									+"<td><button class='cmtDelBtn btn moong-yellow'>삭제</button>"
									+"<input type='hidden' name='sc_no' class='input_sc_no' value='"+result[i].scNo+"'>"
									+"</td>"
							}
						}else{
							if(result[i].scfOriginName == null){
							resultStr+= "<tr>"
								+"<td>"+result[i].userId + "</td>"
								+"<td>"+result[i].solutionCmtContents + "</td>"
								+"<td></td>"
								+"<td>"+result[i].createDate + "</td>"
								+"<td><button class='cmtPoliceBtn btn moong-yellow' data-toggle='modal' data-target='#policeCmt'>신고</button>"
								+"<input type='hidden' name='sc_no' class='input_sc_no' value='"+result[i].scNo+"'>"
								+"</td>"
							}else{
								resultStr+= "<tr>"
									+"<td>"+result[i].userId + "</td>"
									+"<td>"+result[i].solutionCmtContents + "</td>"
									+"<td><a href='"+result[i].scfSysName+"' download='"+result[i].scfOriginName+"'>"+result[i].scfOriginName+"</a></td>"
									+"<td>"+result[i].createDate + "</td>"
									+"<td><button class='cmtPoliceBtn btn moong-yellow' data-toggle='modal' data-target='#policeCmt'>신고</button>"
									+"<input type='hidden' name='sc_no' class='input_sc_no' value='"+result[i].scNo+"'>"
									+"</td>"
							}
						}
					}
					$("#cmtArea>tbody").html(resultStr);
					//$("#cmtArea>tbody>tr").append(dropTd);
    				$("#cmtCount").text(result.length);
    				reviewPaging();
    			},
    			error : function(){
    				console.log("통신실패");
    			}
    		})
    	}
    	//댓글 신고
    	$(document).on("click",".cmtPoliceBtn",function(){
    	var a =	$(this).siblings("input").val()
		 console.log(a);
		 $('#scNo').val(a);
		 	console.log( $('#scNo').val(a));
		     	});
    	//댓글 삭제
    	$(document).on("click", ".cmtDelBtn", function(){
    		var sc_no = $(this).siblings("input").val();
    		location.href = 'cmtDelete.so?scNo=' + sc_no + '&solutionNo=' +solutionNo;
    	})

		//댓글 페이징
    	function reviewPaging(){
    		
            var rowsPerPage = 5,
            rows = $('#cmtArea tbody tr'),
            rowsCount = rows.length,
            pageCount = Math.ceil(rowsCount/rowsPerPage),
            numbers = $('#numbers');
            console.log(pageCount);
            
	        var str = "";
	        for(var i=1; i<=pageCount; i++){
	            str += '<td><a href="" class="btn moong-dark">'+i+'</a></td>'
	           
	        }
	    	numbers.html(str);
	        numbers.find('td:first-child a').addClass('active');
	        //페이지네이션 함수 displayRows
	    	function displayRows(idx){
	            var start = (idx - 1)* rowsPerPage,
	                end = start + rowsPerPage;
	            
	            rows.hide();
	            rows.slice(start, end).show();
	        }
	        displayRows(1);
	        //페이지네이션 클릭하면 보여주기
	        numbers.find('td a').click(function(e){
	            e.preventDefault();
	            numbers.find('td a').removeClass('active');
	            $(this).addClass('active');
	           
	            var index = $(this).text();
	            displayRows(index);
	        });
    	} 
	 	
    </script>
</body>
</html>