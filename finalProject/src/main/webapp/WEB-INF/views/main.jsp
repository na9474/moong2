<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>

<link rel="icon" type="image/png" href="/moong/resources/img/logo-dark.png"/>
<meta charset="UTF-8">
	<title>main</title>

    </head>
    <style>
  
#page1{
    font-size: 200px;
    color: rgb(49, 48, 47);
    font-weight: 1000;
}
#page1-1{
    font-size: 50px;
    font-weight: 700;
    
}
.fp-auto-height{
    color: rgb(248, 238, 225);
}

#collapsibleNavbar>ul>li>a{
    padding: 0px;
}

/*section2시작*/
#page2>div{
    float: left;
    height: 100%;
    
}
#page2-1{
    width: 50%;
}

#page2-2{
    margin-top: 7%;
    width: 50%;
    font-size: 100px;
    color: rgb(49, 48, 47);
    font-weight: 1000;
}
#page3>div{
    float: left;
    height: 100%;
    
}
#page3-1{
    width: 50%;
}

#page3-2{
    margin-top: 5%;
    width: 50%;
    font-size: 100px;
    color: rgb(49, 48, 47);
    font-weight: 1000;
}
/*section2끝*/
</style>
<body>
<jsp:include page="common/header.jsp"/>
   <main id="fullpage">
        <section class="section">
            <div align="center" id="page1-1">과외로 뭉치자!</div>
            <div align="center" id="page1"><img src="${path}/resources/img/logo-dark.png"> 뭉과외</div>
        </section>
        <section class="section" >
            <div id="page2">
            <div id="page2-1"><img src="${path}/resources/img/matching-map.png" style="margin-left:300px; width: 650px;" /></div>
            <div id="page2-2">지역을 선택하고</div>
        </div>
        </section>
        
        <section class="section">
            <div id="page3">
                <div id="page3-1"><img src="${path}/resources/img/page3.png" style="margin-left:300px; width: 500px;" /></div>
                <div id="page3-2">조건을 고르면<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매칭 시작!</div>
        </section>
        <footer class="section fp-auto-height">
            <div align="center" style=" margin-bottom: 5px;">KH정보교육원 &nbsp;&nbsp;| &nbsp;&nbsp;서울특별시 영등포구 선유동2로 57 이레빌딩 (구관) 19F,20F &nbsp;&nbsp;| &nbsp;&nbsp;기세영,김영주,남영주,이나영,정준영</div>
            <div  align="center" >Copyright © moong 2022 All Right Reserved</div>
        </footer>
   </main>
   
</body>
<script>
$(function(){
    $('#fullpage').fullpage({
        anchors: ['section1','section2','section3'],
        navigation:true,
        navigationPosition :'right',
        sectionsColor :['rgb(251, 176, 76)','rgb(248, 238, 225)','rgb(251, 176, 76)','rgb(49, 48, 47)'],
        
    });
});
</script>
</html>