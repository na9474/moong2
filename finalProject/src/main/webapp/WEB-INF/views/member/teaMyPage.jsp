<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="jquery.fullpage.min.css">

     <!-- Core theme CSS (includes Bootstrap)-->
    <link href="resources/css/styles.css" rel="stylesheet" />
   
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="jquery.fullpage.min.js"></script>
    
 <!-- Latest compiled and minified CSS -->
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

 <!-- Popper JS -->
     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

 <!-- Latest compiled JavaScript -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

 <!--font Awesome-->
 <script src="https://kit.fontawesome.com/92642353eb.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>
	.outer{
		width:1000px;
        margin: auto;
    }
    #studentFace{

        background-color: grey;
        border-radius: 50%;
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
    
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="../common/myPageNavi.jsp"/>
	

 	<div id="alarm-outer">
        <div id="subtit">
            선생님 MyPage
        </div>
        
        <div id="teacher-detail">
                <table  style="margin: auto;" id="teacher-tb1">
                    <tr>
                        <td rowspan="5" style="width:150px; height: 200px; border: 1px solid black;" >증명사진</td>
                        <td>이름 : </td>
                        <td>나선생</td>
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
                    
                </table>
                <div class="line"></div>
                <table id="teacher-tb2">
                    <tr>
                        <td>한줄자기소개 &nbsp;&nbsp;: &nbsp;&nbsp;</td>
                        <td colspan="2">대박열심히해야겟다 </td>
                    </tr>
                    <tr>
                        <td>출&nbsp;&nbsp;신&nbsp;&nbsp;학&nbsp;&nbsp;교&nbsp; : </td>
                        <td style="float: left;">xx대학교    </td>
                    </tr>

                </table>

                <div class="line"></div>

                <div style="margin:auto; height: 800px;">
                    <div class="mid">재학 증명서</div>
                    <div id="idc"></div>
                    <div>첨부파일 : </div>
                </div>

                <div class="line"></div>

                

        </div>
        

        
    </div>

    </div>
    </div>
</body>
</html>