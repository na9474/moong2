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
            	학생 MyPage 작성
        </div>

        <form action="stuEnroll.me">
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
                        <td>이메일 : </td>
                        <td>tjdtossla12@gmail.com</td>
                    </tr>
                    <tr>
                    	<td align="center">증명사진 등록 : </td>
                    	<td colspan="2"><input  type="file"></td>
                    </tr>
                    
                </table>
                <div class="line"></div>

                <table id="teacher-tb2">
                    <tr>
                        <td>비&nbsp;&nbsp;밀&nbsp;&nbsp;번&nbsp;&nbsp;호&nbsp; : </td>
                        <td style="float: left;"><input style="width: 175px;" type="text">    </td>
                    </tr>
                    <tr>
                        <td>비밀번호 수정 : </td>
                        <td style="float: left;"><input style="width: 175px;" type="text">    </td>
                    </tr>
                    <tr>
                        <td>이&nbsp;&nbsp;&nbsp;&nbsp;메&nbsp;&nbsp;&nbsp;&nbsp;일 : </td>
                        <td style="float: left;"><input style="width: 175px;" type="text">    </td>
                    </tr>
                   
                </table>
                <div class="line"></div>
                <div class="mid">성적 입력</div>
                    <table id="teacher-tb2">
                        <thead align="center">
                            <tr>
                                <th style="width:10% ; background-color: black; color:white;">과목</th>
                                <th style="width:20% ;  background-color: black; color:white;">등급</th>
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
                            	<td>학년</td>
                            	<td>
	                            	<select name="year">
	                            		<option value="one">1학년</option>
	                            		<option value="two">2학년</option>
	                            		<option value="three">3학년</option>
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
                

                <div class="line"></div>

               <button type="submit">제출하기</button><button type="reset">취소</button>
        </form>
        
    </div>
	
	</div>
	</div>



</body>
</html>