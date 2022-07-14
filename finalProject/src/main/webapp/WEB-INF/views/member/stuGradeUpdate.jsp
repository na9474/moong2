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
	 <h4 align="center"><b>성적 수정</b></h4>
	 <br><br>
    <p style="border: 1px solid black;  width: 500px;">
        * 관리자의 승인 후 성적 수정이 완료됩니다. <br>
        * 매칭 중인 과외가 있는 경우 수정할 수 없습니다.
    </p>

    <form action="stuGradeUpdate.me">
    <table id="gradeUpdateTable">
    	<thead align="center">
	    	<tr>
	    		<th style="width:10% ;">과목</th>
	    		<th style="width:20% ;">등급</th>
	    	</tr>
    	</thead>
    	<tbody>
	        <tr>
	            <td  align="center">국어</td>
	            <td>
	                <select name="kor" id="kor">
	                    <option value="one">1등급</option>
	                    <option value="two">2등급</option>
	                    <option value="three">3등급</option>
	                    <option value="four">4등급</option>
	                    <option value="five">5등급</option>
	                    <option value="six">6등급</option>
	                    <option value="sev">7등급</option>
	                    <option value="eig">8등급</option>
	                    <option value="nine">9등급</option>
	                </select>
	            </td>
	        </tr>
	        <tr>
	            <td  align="center">수학</td>
	            <td>
	                <select name="math" id="math">
	                    <option value="one">1등급</option>
	                    <option value="two">2등급</option>
	                    <option value="three">3등급</option>
	                    <option value="four">4등급</option>
	                    <option value="five">5등급</option>
	                    <option value="six">6등급</option>
	                    <option value="sev">7등급</option>
	                    <option value="eig">8등급</option>
	                    <option value="nine">9등급</option>
	                </select>
	            </td>
	        </tr>
	        <tr>
	            <td  align="center">영어</td>
	            <td>
	                <select name="eng" id="eng">
	                    <option value="one">1등급</option>
	                    <option value="two">2등급</option>
	                    <option value="three">3등급</option>
	                    <option value="four">4등급</option>
	                    <option value="five">5등급</option>
	                    <option value="six">6등급</option>
	                    <option value="sev">7등급</option>
	                    <option value="eig">8등급</option>
	                    <option value="nine">9등급</option>
	                </select>
	            </td>
	        </tr>
	        <tr>
	            <td  align="center">성적표</td>
	            <td><input type="file"></td>
	        </tr>
		</tbody>

    </table>
    <br><br>

    <button type="submit">수정하기</button> <button type="reset">취소</button>
    </form>
    </div>
        
	
	</div>
	</div>



</body>
</html>