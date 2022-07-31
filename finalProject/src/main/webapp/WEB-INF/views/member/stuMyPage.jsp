<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
	.outer{
		width:1000px;
        margin: auto;
    }


    
    @font-face {
    font-family: '양진체';
    src: url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

        *{
            font-family: '양진체';
            color:rgb(49, 48, 47);
            font-weight: normal;
            font-style: normal;
        }
           /*영역잡기*/
    #alarm-outer{
        margin:auto;
        width: 1000px;
        display: block;
    }
    #teacher-detail{
        margin: auto;
        width: 900px;
        height: 2000px;
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
        /*공란색칠*/
        background-color: orange;
    }
    /*영역잡기 끝*/

    /*페이지 제목 + 서브타이틀*/
    #subtit{
            font-size: 25px;
            font-weight: 800;
            margin-top: 50px;
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

     /*버튼 */
	.find-btn{
		text-align: center;
	}
	.find-btn1{
		display :inline-block;
	}
    
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/myPageNavi.jsp"/>
	<br><br>
	<div id="alarm-outer">
        <div id="subtit">
            학생 MyPage
        </div>
        
        <div id="teacher-detail">
                <table  style="margin: auto;" id="teacher-tb1">
                    <tr>
                        <td rowspan="5" style="width:150px; height: 200px; border: 1px solid black;" ><img style="height:200px; width:150px;" src="${idPicture.ipSysName }"></td>
                        <td>이름 : </td>
                        <td>${loginUser.userName }</td>
                    </tr>
                    <tr>
                        <td>학년 : </td>
                        <td>${student.year } 학년</td>
                    </tr>
                    <tr>
                        <td>성별 : </td>
                        <c:if test="${loginUser.gender eq 'M' }">
                        <td>남</td>
                        </c:if>
                        <c:if test="${loginUser.gender eq 'F' }">
                        <td>여</td>
                        </c:if>
                    </tr>
                    <tr>
                        <td>나이 : </td>
                        <td>${age }세</td>
                    </tr>
                    <tr>
                        <td>이메일 : </td>
                        <td>${loginUser.email}</td>
                    </tr>
                   
                </table>
                <div class="line"></div>
                <table id="teacher-tb2">


                    <tr>
                         <td  align="center">국어</td>
                         <td>${student.ko }등급</td>
                    </tr>
                    <tr>
                         <td  align="center">수학</td>
                    	 <td>${student.math }등급</td>
                    </tr>
					<tr>
                         <td  align="center">영어</td>
                    	 <td>${student.eng }등급</td>	
                    </tr>
                </table>

                <div class="line"></div>
        <div class="find-btn">
                
			<button onclick="location.href='stuUpdate.me'" style="margin:auto"class="moong-dark find-btn1">수정하기</button>
			<button onclick="location.href='stuDelete.me'" style="margin:auto"class="moong-dark find-btn1">탈퇴하기</button>
        
       		<button onclick="location.href='pwUpdateForm.me'" style="float:right;" class="moong-yellow">비밀번호 변경</button>
        </div>
        
        </div>
    </div>
        
	
	</div>
	</div>



</body>
</html>