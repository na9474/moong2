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
            text-align: left;
            font-size: 13px;
        }

        #tophe{
            margin: auto;
            text-align: left;
        }

        #co-contentText{
		    margin-top: 20px;
		    margin-bottom: 5px;
		    box-sizing: border-box;
		    border: 1px solid black;
            border-top: none;
            border-left: none;
            border-right: none;
		    width: 800px;
		    height: 600px;
		}

        #cmtfi{
            text-align: right;
            padding-top: 35px;
        }

        #cmtda{
            text-align: center;
            padding-top: 4px;
        }

        #dropBtn{
            background-color: white;
            color: black;
            border: none;
        }

        #cmtcon{
            padding-top: 4px;
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
        
        #cmtList{
        	text-align: center;
        }
        
	</style>
	
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br>
	<div class="container-md p-4 bg-white rounded">
    <br><br><br><br><br>

        <div class="row topline" id="top-line">
        	<input type="hidden" id="loginNo" value="${loginNo}">

            <div class="col-6">
                <h3>${s.title}</h3>
            </div>

            <div class="col-3" id="topwr">${s.userId}</div>

            <div class="col-2" id="topda">${s.createDate}</div>

            <div class="col-1" id="tophe">
            	<c:choose>
            		<c:when test="${loginNo==0}">
   			        	<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
	                    <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/></svg>
  					</c:when>
            		<c:when test="${heartYn==0}">  					
	                	<a type="button" id="btnHeart"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
	                    <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/></svg>
	                	</a>
	                </c:when>
            		<c:when test="${heartYn==1}">
            			<a type="button" id="hDeleteBtn"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
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
            <div class="col-9"></div>
            <div class="col-1" id="modifybut">
                <a class="btn moong-dark" onclick="postFormSubmit(1)">수정</a>
            </div>
            <div class="col-1" id="deletebut">
                <a class="btn moong-dark" onclick="postFormSubmit(2)">삭제</a>
            </div>
            
            <div class="col-1" id="policebut">
				<a class="btn moong-dark" data-toggle="modal" data-target="#police">신고</a>
            </div>
        </div>
        
    <div class="modal fade" id="police">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <h4 class="modal-title">신고사유</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <form action="report.so" method="post">
                    <div class="modal-body">
                        <input type="text" class="form-control mb-2 mr-sm-2" placeholder="신고사유를 입력하세요 (30글자)" maxlength='32' id="reason" name="reason"> <br>
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
                        <input type="text" class="form-control mb-2 mr-sm-2" placeholder="신고사유를 입력하세요 (30글자)" maxlength='32' id="reason" name="reason"> <br>
                    </div>
                    <div class="modal-footer">
                    	<input type="hidden" name="scNo" id="scNo" value="${pc.scNo}">
                        <button type="submit" class="btn moong-yellow">신고하기</button>
                        <button type="button" class="btn moong-yellow" data-dismiss="modal">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
        
        <form id="postForm" action="" method="post">
            <input type="hidden" name="sno" value="${s.solutionNo}">
            <input type="hidden" name="filePath" value="${sf.sfSysName}">
        </form>
                  
        <script>
           		function postFormSubmit(num){
            	if(num==1){
            		$("#postForm").attr("action","updateForm.bo").submit();
            	}else{
            		$("#postForm").attr("action","delete.so").submit();
            	}
            }
        </script>
            
        <br><br>
        <h4>답변(<span id="cmtCount">0</span>)</h4>
        <br>
        
        <table id="cmtArea" class="table" align="center">
        <div class="row cmtWriter" id="cmtArea">
	       		<c:choose> 
         		<c:when test="${ not empty loginUser }"> 
	 		            <div class="col-1" id="cmtfi">
	 		            		
<!-- 	 		            	<input type="file" id="file1" name="file1">  -->
<!--     						<button id="btn_submit" onclick="javascript:fn_submit()">전송</button>   -->
	 		            		             	
<!-- 							<input type="file" name="file1" id="file1" style="display:none"/> -->
<!-- 	 		                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16" onclick="javascript:fn_submit()">> -->
<!-- 	 		                    <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/> -->
<!-- 	 		                    <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/> -->
<!-- 	 		                </svg> -->
	 		            </div>
	 		            <div class="col-10" id="textBox">
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
			<tbody id="cmtList">
			
			</tbody>
        </div>
        </table>

        
       <script type="text/javascript">
		    //이미지 미리보기
// 		    var sel_file;
		 
// 			    $(document).ready(function() {
// 			        $("#file1").on("change", handleImgFileSelect);
// 			    });
			 
// 			    function handleImgFileSelect(e) {
// 			        var files = e.target.files;
// 			        var filesArr = Array.prototype.slice.call(files);
			 
// 			        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
			 
// 			        filesArr.forEach(function(f) {
// 			            if (!f.type.match(reg)) {
// 			                alert("확장자는 이미지 확장자만 가능합니다.");
// 			                return;
// 			            }
			 
// 			            sel_file = f;
			 
// 			            var reader = new FileReader();
// 			            reader.onload = function(e) {
// 			                $("#textBox").attr("src", e.target.result);
// 			            }
// 			            reader.readAsDataURL(f);
// 			        });
// 			    }
		</script>
		
		<script>
		//파일 업로드
// 		function fn_submit(){
		        
// 		        var form = new FormData();
// 		        form.append( "file1", $("#file1")[0].files[0] );
		        
// 		         jQuery.ajax({
// 		             url : "result"
// 		           , type : "POST"
// 		           , processData : false
// 		           , contentType : false
// 		           , data : form
// 		           , success:function(response) {
// 		               alert("성공하였습니다.");
// 		               console.log(response);
// 		           }
// 		           ,error: function (jqXHR) 
// 		           { 
// 		               alert(jqXHR.responseText); 
// 		           }
// 		       });
// 		}
		
 		</script>
        
        <br><br>
      
            <!-- 
                <div class="dropdown">
                    <button class="dropBtn btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
                      ...
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                      <a class="dropdown-item" href="#">수정</a>
                      <a class="dropdown-item" href="#">삭제</a>
                      <a class="dropdown-item" href="#">신고</a>
                    </div>
                </div>
                 -->

      
      
        <br><br><br><br>
        <div class="to list">
            <a class="btn moong-yellow" href="list.so">목록</a>
        </div>
        <div class="col-12" id="tolist"></div>
        <br><br>
        <h4>관련 문제풀이</h4>

        <table class="table table-hover" id="table-line">
            <thead id="tit-line">
              <tr>
                <th scope="col">번호</th>
                <th scope="col">과목</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">조회수</th>
                <th scope="col">작성일</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">2</th>
                <td>수학</td>
                <td>1+1=</td>
                <td>피타고라스</td>
                <td>9999</td>
                <td>2222-22-22</td>
              </tr>
              <tr>
                <th scope="row">1</th>
                <td>국어</td>
                <td>진달래꽃</td>
                <td>김소월</td>
                <td>9999</td>
                <td>2222-22-22</td>
              </tr>
              
            </tbody>
        </table>
        
    <script>
    	$(function(){
    		cmtListAll();
    	})
    	
    	var solutionNo=$("#solutionNo").val();
    	
    	function addCmt(){
    		
    		if($("#content").val().trim().length != 0){
    			
    			$.ajax({
        			url : "cmtInsert.so",
        			data : {
        				solutionNo : ${s.solutionNo},
        				solutionCmtContents : $("#content").val(),
//         				userId : '${loginUser.userId}'
        			},
        			success : function(result){
        				if(result=="Y"){
        					cmtListAll();
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
    	
   		 	
/*    	var btnToggle = $("<button>");
    	btnToggle.attr("class", "dropBtn btn btn-secondary dropdown-toggle");
    	btnToggle.attr("type", "button");
    	btnToggle.attr("data-toggle", "dropdown");
    	btnToggle.attr("aria-expanded", "false");
    	btnToggle.html("...");
    	
    	var dropItem1 = $("<a>");
    	dropItem1.attr("class","dropdown-item cmtModiA");
    	dropItem1.attr("href","#");
    	dropItem1.html("수정");
    	
    	var dropItem2 = $("<a>");    	
    	dropItem2.attr("class","dropdown-item cmtDeleteA");
    	dropItem2.attr("href","cmtDelete.so);
    	dropItem2.html("삭제");
    	
    	var dropItem3 = $("<a>");
    	dropItem3.attr("class","dropdown-item cmtPoliceA");
    	dropItem3.attr("href","#");
    	dropItem3.html("신고");
  	
    	var dropMenu = $("<div>");
    	dropMenu.attr("class", "dropdown-menu");
    	dropMenu.attr("aria-labelledby", "dropdownMenuButton");
    	
    	dropMenu.append(dropItem1);
    	dropMenu.append(dropItem2);
    	dropMenu.append(dropItem3);
    	
    	var dropBox = $("<div>");
    	dropBox.attr("class", "dropdown");
    	
    	var dropTd =$("<td>");
    	
    	dropBox.append(btnToggle);
    	dropBox.append(dropMenu);
    	
    	dropTd.append(dropBox); */

    	
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
										
					for(var i=0; i<result.length;i++){
						
						if(result[i].userNo==loginNo){
							resultStr+= "<tr>"
								+"<td>"+result[i].userId + "</td>"
								+"<td>"+result[i].solutionCmtContents + "</td>"
								+"<td>"+result[i].createDate + "</td>"
								+"<td><button class='cmtModiBtn'>수정</button><button class='cmtDelBtn'>삭제</button>"
								+"<input type='hidden' name='sc_no' class='input_sc_no' value='"+result[i].scNo+"'>"
								+"</td>"
								
						}else{
							resultStr+= "<tr>"
								+"<td>"+result[i].userId + "</td>"
								+"<td>"+result[i].solutionCmtContents + "</td>"
								+"<td>"+result[i].createDate + "</td>"
								+"<td><button class='cmtPoliceBtn' data-toggle='modal' data-target='#policeCmt'>신고</button>"
								+"<input type='hidden' name='sc_no' class='input_sc_no' value='"+result[i].scNo+"'>"
								+"</td>"
						}
						
					}
					
					$("#cmtArea>tbody").html(resultStr);
					//$("#cmtArea>tbody>tr").append(dropTd);
    				$("#cmtCount").text(result.length);
    			},
    			error : function(){
    				console.log("통신실패");
    			}
    		})
    	}
    	
    	$(document).on("click", ".cmtDelBtn", function(){
    		var sc_no = $(this).siblings("input").val();
    		location.href = 'cmtDelete.so?scNo=' + sc_no + '&solutionNo=' +solutionNo;
    	})
    
/*    	$(".cmtModiBtn").on("click", function(){
    		var sc_no = $(this).siblings().find(".input_sc_no").val();
    		location.href = "cmtDelete.so?scNo="+sc_no+"&solutionNo="+solutionNo;
    	})
*/    	
    	
    	$("#btnHeart").click(function(){
    	    if(confirm("해당 글을 추천하시겠습니까?")){
    	    	
    			$.ajax({
        			url : "heart.so",
        			data : {
        				solutionNo : ${s.solutionNo},
        			},
        			success : function(result){
        			},
        		})
    	        
    	        alert("해당 글을 추천하였습니다.")
    	        
    	        }
    	    });
    	
    	$("#hDeleteBtn").click(function(){
    	    if(confirm("추천을 취소하시겠습니까?")){
    	    	
    			$.ajax({
        			url : "heartDelete.so",
        			data : {
        				solutionNo : ${s.solutionNo},
        			},
        			success : function(result){
        			},
        		})
    	    
    	        alert("취소되었습니다.")
    	        
    	        }
    	    });

    
    </script>
</body>
</html>