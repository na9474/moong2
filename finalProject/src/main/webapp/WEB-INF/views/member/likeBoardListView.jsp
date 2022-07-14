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

    
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/myPageNavi.jsp"/>
	
 <div class="outer" align="center">
        <br><br>
        <div>
        <h4><b>좋아요 게시글 목록</b></h4>
        <br><br>
         <table align="center" class="table table-hover">
            <thead>
                <tr align="center">
                  <th style="width:10% ;">No</th>
                  <th style="width:40% ;">제목</th>
                  <th style="width:20% ;">작성자</th>
                  <th style="width:20% ;">작성일</th>
                </tr>
            </thead>
            <tbody>
                <tr align="center">
                    <td>1</td>
                    <td align="left">질문제목</td>
                    <td>user01</td>
                    <td>2022-03-23</td>
                </tr>
                <tr align="center">
                    <td>2</td>
                    <td align="left">질문</td>
                    <td>선생님</td>
                    <td>2022-02-13</td>
                </tr>
               
            </tbody>
          </table>
        </div>
    <br><br>
     
     <!--페이징-->
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



</body>
</html>