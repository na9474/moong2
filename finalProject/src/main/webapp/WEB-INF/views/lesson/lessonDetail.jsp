<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="/moong/resources/img/logo-dark.png"/>
<meta charset="UTF-8">
<title>lessonDetail</title>
<style>
  
    /*영역잡기*/
    #alarm-outer{
        margin:auto;
        width: 1000px;
        display: block;
    }
    #teacher-detail{
        margin: auto;
        width: 900px;
        height: 1400px;
    }
    #teacher-reply{
        
        margin: auto;
        margin-top: 50px;
        width: 900px;
        height: 300px;
    }
    .line{
        height: 0px;
        width: 600px;
        background-color: black;
        border: 1px solid black;
        margin: auto;
        margin-top: 20px;
        margin-bottom: 20px;
    }
    #idc{
        
        width: 500px;
        height: 700px;
        margin: auto;
        margin-bottom: 10px;
        /*공란색칠*/
        background-color: orange;
    }
    #vi{
        width: 700px;
        height: 400px;
        margin:auto;
        margin-bottom: 10px;
       
       
    }
    /*영역잡기 끝*/

    /*페이지 제목 + 서브타이틀*/
    #subtit{
            font-size: 35px;
            font-weight: 800;
            margin-top: 80px;
            margin-bottom: 50px;
    }
    .mid{
        margin-bottom: 30px;
        font-size: 25px;
    }   
    /*페이지 제목 끝*/
    
    /*선생님 정보*/
    #teacher-tb1{
        border-collapse: separate;
        border-spacing: 10px;
    }


    #teacher-tb2{
        text-align: center;
        border-collapse: separate;
        border-spacing: 10px;
        margin: auto;
        width: 600px;
    }

    /*선생님 정보 끝*/



   /*후기부분*/
    #replytit{
        font-size: 30px;
        margin-bottom: 10px;
    }
   

        /*후기작성*/
        #replyinsert{
            margin:auto;
        }
        #replyinsert>div{
            height: 80px;
            float: left;
            margin-bottom: 30px;
        }
        #replyinsert-1{
            margin: auto;
            width: 80%;
        }
        #replyinsert-1>textarea{
            margin-left: 50px;
        }
        #replyinsert-2{
            width: 20%;
        }
        #replyinsert-2>button{
            margin-left: 20%;
            margin-top: 8%;
            width: 100px;
            height: 50px;
        }
    /*후기작성 끝*/

    /*후기 리스트*/
        #replylist{
            margin: auto;
            width: 800px;
            border-collapse: separate;
            border-spacing: 0 10px;
        }
        #replylist>thead{
            background-color: rgb(251, 176, 76);
            text-align: center;
            
        }
        #replylist>tbody{
            
            text-align: center;
        }
        #replylist>tbody>tr>td{
            border-bottom: 1px solid black;
        }
    /*후기 리스트 끝*/
   /*후기부분 끝*/
</style>
<body>
     <jsp:include page="../common/header.jsp"/>
    <div id="alarm-outer">
        <div id="subtit" >
            선생님 목록
        </div>
        
        <div id="teacher-detail">
                <table  style="margin: auto;" id="teacher-tb1">
                    <tr>
                        <td rowspan="5" style="width:150px; height: 200px; border: 1px solid black;" >증명사진</td>
                        <td>이름 : </td>
                        <td>${l.userName}</td>
                    </tr>
                    <tr>
                        <td>나이 : </td>
                        <td>20</td>
                    </tr>
                    <tr>
                        <td>성별 : </td>
                        <td>남</td>
                    </tr>
                    <tr>
                        
                        <td>등급 : </td>
                        <td>다이아</td>
                    </tr>
                    <tr>
                        <td>이메일 : </td>
                        <td>tjdtossla12@gmail.com</td>
                    </tr>
                    <tr>
                        <td>한줄자기소개 &nbsp;&nbsp;: &nbsp;&nbsp;</td>
                        <td colspan="2">대박열심히해야겟다 </td>
                    </tr>
                </table>
                <div class="line"></div>
                <table id="teacher-tb2">
                    <tr>
                        <td>출&nbsp;&nbsp;신&nbsp;&nbsp;학&nbsp;&nbsp;교&nbsp; : </td>
                        <td style="float: left;">xx대학교    </td>
                    </tr>
                    <tr>
                        <td>시간당 과외비 : </td>
                        <td style="float: left;" id="fee">${l.fee}원</td>
                    </tr>
  
                    <tr>
                        <td>과외 가능 지역 : </td>
                        <td style="float: left;" class="changeArea">${l.area}</td>
                    </tr>
                    <tr>
                        <td>과&nbsp;&nbsp;외&nbsp;&nbsp;&nbsp;&nbsp;과&nbsp;&nbsp;목 :  </td>
                        <c:choose>
                        <c:when test = "${l.subject eq 'KO'}">
                        <td style="float: left;">국어</td>
                        </c:when>
                        <c:when test = "${l.subject eq 'MATH'}">
                        <td style="float: left;">수학</td>
                        </c:when>
                        <c:otherwise>
                        <td style="float: left;">영어</td>
                        </c:otherwise>
                        </c:choose>
                        
                    </tr>
                    <tr>
                        <td>과외 가능 요일 : </td>
                        <td style="float: left;" class="changeDay">${l.leDay}</td>
                    </tr>
                    <tr>
                        <td>경&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;력 : </td>
                        <td style="float: left;">${l.career }</td>
                    </tr>
                    <tr>
                        <td>온&nbsp;&nbsp;/&nbsp;오프선호 : </td>
                        <td style="float: left;">${l.teachingStyle }</td>
                    </tr>
                    <tr>
                        <td>과외&nbsp;&nbsp;&nbsp;&nbsp; 스타일&nbsp;: </td>
                        <td style="float: left;">${l.leStyle }</td>
                    </tr>
                </table>

             

                <div class="line"></div>

                <div style="margin:auto; height: 500px;">
                    <div class="mid" >어필 영상</div>
                    <video controls  id="vi" src="${l.leChangename}" style="margin-left:100px;"></video>
                    <div>첨부파일 : </div>

                </div>

                <div class="line"></div>

				<div id="btnArea" style="width:fit-content; margin:auto;"><button class="btn moong-yellow" onclick="location.href='tlist.le?cpage=1'">목록으로</button> 
				<c:if test="${loginUser.userNo eq l.userNo }">
				<button class="btn moong-dark" id="updateLe" >수정하기</button>
				</c:if>
				<button class="btn moong-dark" id="sendurl" style="display:none;" value="">채팅방초대</button>
				<br>
				
				
        </div>
        
        <div id="teacher-reply">
            <div id="replytit">
                후기
            </div>
           
	            <div id="replyinsert">
	                <div id="replyinsert-1">
	                    <textarea name="" id="reply" cols="55" rows="3" style="resize: none;" placeholder="선생님의 과외를 들은 학생만 후기를 작성할 수 있습니다."></textarea>
	                </div>
<%-- 	                <c:choose> --%>
<%-- 		                <c:when test="${loginUser.userNo eq }"> --%>
			                <div id="replyinsert-2">
			                    <button type="button" onclick="addReview();">작성하기</button>
			                </div>
<%-- 		                </c:when> --%>
<%-- 		                <c:otherwise> --%>
<!-- 		                	<div id="replyinsert-2"> -->
<!-- 			                    <button type="button" disabled>작성하기</button> -->
<!-- 			                </div> -->
<%-- 		                </c:otherwise> --%>
<%-- 	                </c:choose> --%>
	            </div>
        	
            <table  id="replylist">
                <thead>
                    <tr>
                        <td style="width: 8%;">이름</td>
                        <td>내용</td>
                        <td style="width: 15%;">작성일</td>
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
            </table>
        </div>
    </div>
    

    <script>
    
    if('${loginUser.student}' == 'Y'){
    	studentCheifCheck();
    	
    }
    
    function studentCheifCheck(){ 
		$.ajax({
			url : "cheifCheck.ma",
			data : {userNo : ${loginUser.userNo}},
			success : function(m){
				 console.log(m);
				if(m != null){
				
				var subject1 = m.subject.slice(0,-1);
				var subject2 = "${l.subject}";
				
				var area1 = m.area;
				var area2 = "${l.area}";
				
				var fee1 = m.fee
				var fee2 = ${l.fee};
				
				
				var groupNo = m.groupNo;
				
				if(subject1 == subject2 
						<c:if test="${l.area ne '상관없음' }">
						&& area2.includes(area1)
						</c:if>
						&& (fee1-20000<=fee2 && fee2<=fee1+20000) 
						){
					
					$('#sendurl').show();
					$('#sendurl').val(groupNo);
					
				}
				}
			},
			error : function(){
				console.log("통신실패");
			}
		})
	}
    	
    	$('#sendurl').click(function(){
    		location.href="sendurl.ma?groupNo="+$('#sendurl').val()+"&&userNo=${l.userNo}&&leNo=${l.leNo}";
    	})
    
    
    
        $('#reply').click(function(){
            $(this).text("");
        })
        
        $(function(){
        	$("#updateLe").click(function(){
        		location.href="updateForm.le?leNo=${l.leNo}"
        	})
        	
        })
        
        $(function(){
        	var changeText1 = $('.changeArea').text();
        	var changeText2 = $('.changeDay').text();
        	$('.changeArea').text(changeText1.replaceAll(",",""));
        	$('.changeDay').text(changeText2.replaceAll(",",""));
        })
        
        
       
        
        // 후기
        $(function(){
        	reviewList();	
        });
        
        function addReview(){
        	if($("#reply").val().trim().length != 0){
        		$.ajax({
        			url: "revinsert.rv",
        			data: {
        				refLeno: ${l.leNo},
        				reUno: ${loginUser.userNo},
        				reText: $("#reply").val(),
        				reUname: "${loginUser.userName}"
        			},
        			success: function(e){
        				console.log(e);
        				
        				if(e == 'Y'){
        					reviewList();
        					$("#reply").val("");
        				}
        			},
        			error: function(){
       					console.log("통신 실패");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        			}
        		});
        	} else {
        		$("#reply").val("");
        		alert("후기를 입력하세요.");
        	}
        }
        
        function reviewList(){
        	$.ajax({
        		url: "revlist.rv",
        		data: {
        			refLeNo: ${l.leNo}
        		},
        		success: function(e){
        			console.log(e);
        			
        			var rvStr = "";
        			
        			for(var i=0; i<e.length; i++){
        				rvStr += "<tr>"
        				       + "<td>"+e[i].reUname+"</td>"
        				       + "<td>"+e[i].reText+"</td>"
        				       + "<td>"+e[i].createDate+"</td>"
        				       + "</tr>"
        			}
        			$("#replyList>tbody").html(rvStr);
        		},
        		error: function(){
        			console.log("통신 실패");
        		}
        	});
        }
    </script>
</body>
</html>