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
	
	
	  <div id="alarm-outer">
	  <br><br>
        <div id="subtit">
            	학생 MyPage 작성
        </div>

		   <p style="border: 1px solid black;  width: 500px; margin:auto; height:30px">
		       * 관리자의 승인 후 학생 회원가입이 완료됩니다. <br>
		   </p>
		<div class="line"></div>
		   
        <form action="stuEnroll.me" method="post" enctype="multipart/form-data">
        <input type="hidden" name="userNo" value="${loginUser.userNo }">
        <div id="teacher-detail">
                <table  style="margin: auto;" id="teacher-tb1">
                    <tr>
                        <td rowspan="5" style="width:150px; height: 200px; border: 1px solid black;" id="div-preview" ><div></div></td>
                        <td>이름 : </td>
                        <td>${loginUser.userName }</td>
                    </tr>
                    <tr>
                        <td>나이 : </td>
                        <td>${age }</td>
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
                        <td>이메일 : </td>
                        <td>${loginUser.email }</td>
                    </tr>
                    <tr>
                    	<td align="center">증명사진 등록 : </td>
                    	<td colspan="2"><input type = "file" name = "idPicture" required></td>
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
                                    <select name="ko" id="ko">
                                        <option value="1">1등급</option>
                                        <option value="2">2등급</option>
                                        <option value="3">3등급</option>
                                        <option value="4">4등급</option>
                                        <option value="5">5등급</option>
                                        <option value="6">6등급</option>
                                        <option value="7">7등급</option>
                                        <option value="8">8등급</option>
                                        <option value="9">9등급</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td  align="center">수학</td>
                                <td>
                                    <select name="math" id="math">
                                        <option value="1">1등급</option>
                                        <option value="2">2등급</option>
                                        <option value="3">3등급</option>
                                        <option value="4">4등급</option>
                                        <option value="5">5등급</option>
                                        <option value="6">6등급</option>
                                        <option value="7">7등급</option>
                                        <option value="8">8등급</option>
                                        <option value="9">9등급</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">영어</td>
                                <td>
                                    <select name="eng" id="eng">
                                        <option value="1">1등급</option>
                                        <option value="2">2등급</option>
                                        <option value="3">3등급</option>
                                        <option value="4">4등급</option>
                                        <option value="5">5등급</option>
                                        <option value="6">6등급</option>
                                        <option value="7">7등급</option>
                                        <option value="8">8등급</option>
                                        <option value="9">9등급</option>
                                    </select>
                                </td>
                            </tr>
                            <tr><td></td></tr>
                            <tr>
                            	<td>학년</td>
                            	<td>
	                            	<select name="year">
	                            		<option value="1">1학년</option>
	                            		<option value="2">2학년</option>
	                            		<option value="3">3학년</option>
	                            	</select>
                            	</td>
                            </tr>
                            <tr>
                                <td  align="center">성적표</td>
                                <td><input type="file" name = "reportCard" required></td>
                            </tr>
                        </tbody>

                    </table>
                    <br><br>
                

                <div class="line"></div>

				<div class="find-btn" >
               		<button type="submit" class="btn moong-yellow find-btn1" >등록하기</button>
               		<button type="reset" class="btn moong-dark find-btn1">취소</button>
        		</div>
        </form>
        
    </div>
	
	</div>
	</div>


	<!-- 증명사진 미리보기 -->
	<script type="text/javascript">
	
	let fileTag = document.querySelector("input[name=idPicture]");
	let divPreview = document.querySelector("#div-preview");
	
	fileTag.onchange = function(){
		
		//파일 올렸을 때 : fileTag.files.length > 0
		if(fileTag.files.length>0){
			//이미지 src에 들어갈 데이터 구하기
			for(let i=0; i<fileTag.files.length; i++){
				let reader = new FileReader();
				reader.onload = function(data){
					let src = data.target.result;
					//이미지 태그를 만들어서 넣어줄거임
					//1. 이미지 태그 만들기
					let imgTag = document.createElement('img');
					
					//2. 이미지 태그 속성들 세팅하기
					imgTag.setAttribute('src', src);
					imgTag.setAttribute('width', '150');
					imgTag.setAttribute('height', '200');
					
					//3. 이미지 태그 div안에 넣기
					divPreview.appendChild(imgTag);
				}
				reader.readAsDataURL(fileTag.files[i]);
				
			}//for end
			
		}else{
		//취소 버튼을 눌렀을 때
			//div 안에 싹 다 비우기
			divPreview.innerHTML = "";
	
		}
	}
	
	</script>



</body>
</html>