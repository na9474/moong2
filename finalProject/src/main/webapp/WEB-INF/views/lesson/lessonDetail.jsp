<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
                        <td>${l.userNo}</td>
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
                        <td style="float: left;">${l.area}</td>
                    </tr>
                    <tr>
                        <td>과&nbsp;&nbsp;외&nbsp;&nbsp;&nbsp;&nbsp;과&nbsp;&nbsp;목 :  </td>
                        <td style="float: left;">${l.subject}</td>
                    </tr>
                    <tr>
                        <td>과외 가능 요일 : </td>
                        <td style="float: left;">${l.leDay}</td>
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

                <div style="margin:auto; height: 800px;">
                    <div class="mid">재학 증명서</div>
                    <div id="idc"></div>
                    <div>첨부파일 : </div>
                </div>

                <div class="line"></div>

                <div style="margin:auto; height: 500px;">
                    <div class="mid">어필 영상</div>
                    <div id="vi"></div>
                    <div>첨부파일 : </div>

                </div>

                <div class="line"></div>

        </div>
        
        <div id="teacher-reply">
            <div id="replytit">
                후기
            </div>
            <form action="">
            <div id="replyinsert">
                <div id="replyinsert-1">
                    <textarea name="" id="reply" cols="55" rows="3" style="resize: none;" >선생님의 과외를 들은 학생만 후기를 작성할 수 있습니다.</textarea>
                </div>
                <div id="replyinsert-2">
                    <button type="submit" disabled>작성하기</button>
                </div>
            </div>
        </form>
            <table  id="replylist">
                <thead>
                    <tr>
                        <td style="width: 8%;">이름</td>
                        <td>내용</td>
                        <td style="width: 15%;">작성일</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>나학생</td>
                        <td>선생님최고시다..</td>
                        <td>2022-06-22</td>
                    </tr>
                    <tr>
                        <td>김학생</td>
                        <td>이선생님 ㄹㅇ 개별로임</td>
                        <td>2022-06-22</td>
                    </tr>
                </tbody>
                
            </table>
        </div>
        
    </div>
    

    <script>
        $('#reply').click(function(){
            $(this).text("");
        })
    </script>
</body>
</html>