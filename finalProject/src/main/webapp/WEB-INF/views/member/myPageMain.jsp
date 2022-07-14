<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	#gradeUpdateTable{

		width:800px;
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
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/myPageNavi.jsp"/>
	
	 <div id="alarm-outer">
        <div id="subtit">
            MyPage
        </div>
        
        <div id="teacher-detail">
                <table  style="margin: auto;" id="teacher-tb1">
                    <tr>
                        <td rowspan="5" style="width:150px; height: 200px; border: 1px solid black;" >증명사진</td>
                        <td>이름 : </td>
                        <td>나회원</td>
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
                        <td>이메일 : </td>
                        <td>tjdtossla12@gmail.com</td>
                    </tr>
                   
                </table>
                <div class="line"></div>
                <div class="mid"></div>
                <table id="teacher-tb2">
                    <tr>
                        <th><a href="stuEnrollForm.me"><i class="fa-solid fa-graduation-cap fa-4x"></i></a></th>
                        <th><a href="teaEnrollForm.me"><i class="fa-solid fa-chalkboard-user fa-4x"></i></a></th>
                    </tr>
                    <tr>
                        <td>학생</td>
                        <td>선생님</td>
                    </tr>                    
                </table>

                <div class="line"></div>

                

        </div>
        

    </div>
	
	</div>
	</div>



</body>
</html>