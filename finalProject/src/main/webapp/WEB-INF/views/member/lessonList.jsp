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
	    <div class="outer">
    <br><br>
	 <h4 align="center"><b>과외 목록</b></h4>
	 <br><br>
        <table class="table table-bordered table-sm" id="lessonListTable">
            <thead align="center">
                <tr>
                    <th style="width:10% ;">No</th>
                    <th style="width:20% ;">과목</th>
                    <th style="width:20% ;">선생님</th>
                    <th style="width:10% ;">상태</th>
                </tr>
            </thead>
            <tbody align="center">
                <tr>
                    <td>1</td>
                    <td>영어</td>
                    <td>김영어 선생님</td>
                    <td>진행중</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>수학</td>
                    <td>김수학 선생님</td>
                    <td>완료</td>
                </tr>
            </tbody>

        </table>
		
        <!--페이징-->
        <br><br>	
        <div class="paging-area" align="center">
            <button>이전</button>
            <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>다음</button>
        </div>
    </div>
 

    </div>
    </div>

    </div>
    </div>
</body>
</html>