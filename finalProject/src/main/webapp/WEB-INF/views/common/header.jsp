<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${path}/resources/css/jquery.fullpage.min.css">
   	
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="${path}/resources/js/jquery.fullpage.min.js"></script>
    
    
    
    <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

    <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    <!--font Awesome-->
    <script src="https://kit.fontawesome.com/92642353eb.js" crossorigin="anonymous"></script>
    
    <!--여기에 btn css링크-->
    <link rel="stylesheet" href="${path}/resources/css/btn.css">
    
	<!-- 섬머노트 -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
  	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  	<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script> 
  
    <style>
     @font-face {
    font-family: '양진체';
    src: url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

        *{
            font-family: '양진체';
        }

    /*메뉴바 백그라운드컬러*/
    #menubar{
        background-color:  rgb(49, 48, 47);
        
    }
    /*메뉴바 글씨색*/
    .nav-link{
        
        color: rgb(248, 238, 225);
    }
    .nav-link:hover{
        
        color: rgb(254, 132, 114);
        transition: 0.7s;
    }
    #logo{
        font-weight: 1000;
        color: rgb(248, 238, 225);
    }
    #logo-img{
        width:40px;
        height: 40px;
        margin-right: 10px;
    }
    #end{
        clear: both;
        float: right;
    }
    header{
    position: fixed;
    left: 0;
    right: 0;
    top:0;
    background-color: lightgray;
    z-index: 100;
}
header> nav>ul{
    display: flex;
    justify-content: center;
}

header nav ul li{
    margin: 0 20px;
    list-style: none;
}

    .dropdown-menu{
    	background-color:  rgb(49, 48, 47);  
    }
    .dropdown-item{
    	color: rgb(248, 238, 225);
    }
    .dropdown-item{
    	
        transition: 0.7s;
    }
    #chatRoom:hover{
		cursor: pointer;
    }
    

</style>
</head>

<body>
<c:if test="${not empty alertMsg}">
	<script>
		alert("${alertMsg}");
	</script>
	<c:remove var="alertMsg" scope="session"/>	
</c:if>

<header>
      
            <nav class="navbar navbar-expand-sm" id="menubar">
                <!-- Brand -->
                <img src="${path}/resources/img/logo-dark.png" id="logo-img" > <a class="navbar-brand" href="${path}" id="logo">뭉과외</a>
              
                <!-- Links -->
                <ul class="navbar-nav">
                <c:if test="${not empty loginUser && loginUser.teacher ne 'Y' }">
                  <li class="nav-item">
                    <a class="nav-link" href="enroll.ma">과외 매칭</a>
                  </li>
                  </c:if>
                  <li class="nav-item">
                    <a class="nav-link" href="list.so">문제 풀이</a>
                  </li>
                  
                  <li class="nav-item">
                    <a class="nav-link" id="tlist" href="tlist.le?cpage=1">선생님 리스트</a>
                  </li>
                  
                  <script>
               /*    $(function(){
                      $("#tlist").click(function(){
                         	if("${loginUser.student}" == 'Y'){
                         		location.href="tlist.le?cpage=1&&userNo=${loginUser.userNo}"
                         	}else{
                         		location.href="tlist.le?cpage=1&&"
                         	}
                              
                      });
                  }); */
                  </script>
                  
                  
                  
                  <c:choose>
                	<c:when test="${loginUser.student eq 'Y' || loginUser.userId eq 'admin'}">
                			<li class="nav-item">
		                    	<a class="nav-link" href="#">매칭 리스트</a>
		                  	 </li>
		                 	 <li class="nav-item">
		                    	<a class="nav-link" href="#">자유 게시판</a>
		                  	 </li>
                	</c:when>
                	<c:when test="${loginUser.teacher eq 'Y' || loginUser.userId eq 'admin' }">
		                	 <li class="nav-item">
		                    	<a class="nav-link" href="list.le?userNo=${loginUser.userNo}">과외 등록</a>
		                  	 </li>
		                 	 <li class="nav-item">
		                    	<a class="nav-link" href="#">자유 게시판</a>
		                  	 </li>
                	</c:when>
                  </c:choose>
                  <c:if test="${loginUser.userId eq 'admin'}">
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">관리자 페이지</a>
                        <div class="dropdown-menu">
					      <a class="dropdown-item" href="#">회원승인</a>
					      <a class="dropdown-item" href="#">회원리스트</a>
					      <a class="dropdown-item" href="list.po">신고리스트</a>
					      <a class="dropdown-item" href="#">QnA</a>
					      <a class="dropdown-item" href="chart.ch">차트</a>
					    </div>
                  </li>
                  </c:if>
                 
                </ul>
                
                
                <c:choose>
                	<c:when test="${empty loginUser }">
		                <!--로그인 전-->
		                <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">        
		                 <ul class="navbar-nav">       
		                     <li class="nav-item">            
		                        <a class="nav-link" href="login.me">로그인</a>        
		                    </li>           
		                    <li class="nav-item">            
		                        <a class="nav-link" href="enrollForm.me">회원가입</a>
		                    </li>           
		                 </ul>    
		                </div>
                	</c:when>
                	<c:otherwise>
		                <!--로그인 후 -->
		                <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">        
		                    <ul class="navbar-nav">      
		                     
		                        <li class="nav-item">            
		                            <a class="nav-link" href="#" style="pointer-events: none;">${loginUser.userName }님 환영합니다</a>     
		                       </li>        
		                       <c:if test="${loginUser.student eq 'Y'}">
		                           
		                       <li class="nav-item">  
		                            <!-- 체크할 메세지 or 알람이 있다면 fa-check 표시-->          
		                            <a class="nav-link" href="alarm.ma?uNo=${loginUser.userNo}"> <i class="fa-solid fa-check" style="color:red; visibility:hidden;" id="checkMatching">&nbsp; </i><i class="fa-solid fa-bell"></i> 알림   </a>
		                       </li>
		                       </c:if>
		                        <c:choose>
			                       <c:when test="${loginUser.userId eq 'admin'}">
				                       <li class="nav-item">
				                            <a class="nav-link" href="adRoomList.rm"><!-- <i class="fa-solid fa-check" style="color:red;"></i> &nbsp;--> <i class="fa-solid fa-message fa-flip-horizontal"></i> 채팅방</a>
				                       </li>
			                       </c:when>
			                       <c:otherwise>
				                       <li class="nav-item">
				                            <a class="nav-link" id="chatRoom"><!-- <i class="fa-solid fa-check" style="color:red;"></i> &nbsp;--> <i class="fa-solid fa-message fa-flip-horizontal"></i> 채팅방</a>
				                       </li>
			                       </c:otherwise>
		                       </c:choose>
		                       <c:choose>
		                       <c:when test="${loginUser.teacher eq 'Y' }">            
		                   		<li class="nav-item">
		                        	<a class="nav-link" href="teaMyPage.me">마이페이지</a>
			                   	</li> 
		                   		</c:when>
		                   		<c:when test="${loginUser.student eq 'Y' }">
		                   		<li class="nav-item">
		                        	<a class="nav-link" href="stuMyPage.me">마이페이지</a>
			                   	</li> 
		                   		</c:when>
		                   		<c:otherwise>
		                       	<li class="nav-item">
		                        	<a class="nav-link" href="myPageMain.me">마이페이지</a>
			                   	</li> 
		                   		</c:otherwise>
		                   		</c:choose>
		                   <li class="nav-item">            
		                        <a class="nav-link" href="logout.me">로그아웃</a>
		                   </li>          
		                    </ul>    
		                </div>
                	</c:otherwise>
                </c:choose>
        </nav>
    </header>
    <c:if test="${not empty loginUser && loginUser.userId ne 'admin' && loginUser.student eq 'Y'}">
    <script>
    	var repeat1 = null;
    	var repeat2 = null;
    	var delay = 3000;
    	
    	$(function(){
			checkMatching();
			alertMatching();
			repeat1 = setInterval(checkMatching, delay);
			repeat2 = setInterval(alertMatching, delay);
		})
		
		
    
	  function checkMatching(){ 
			$.ajax({
				url : "check.ma",
				data : {userNo : ${loginUser.userNo}},
				success : function(result){
	 				if(result>0){ //완료된 매칭 O
	 					
	 					$('#alarmspan').css('visibility','visible');
	 					$('#checkMatching').css('visibility','visible');
	 					clearInterval(repeat1);
			
				}else{ //완료된매칭이 X
					
				}
				},
				error : function(){
					console.log("통신실패");
				}
			})
		}
   
   
	  function alertMatching(){
		   $.ajax({
				url : "check2.ma",
				data : {userNo : ${loginUser.userNo}},
				success : function(result){
					if(result>0){ //완료된 매칭 O
						
						alert("완료된매칭이있습니다.");
						alertComplete(result);
						clearInterval(repeat2);
				}else{	
				}	
				},
				error : function(){
					console.log("통신실패");
				}
			})
	   }
	  
	  
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
   		
		// 접속한 유저가 채팅방 클릭했을 때
	  	$(function(){
          $("#chatRoom").click(function(){
              location.href="roomList.rm?userNo="+${loginUser.userNo};  
          });
		});
    </script>
    </c:if>
</body>
</html>