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
        
       width: 400px;
    	height: 500px;
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
            선생님 MyPage
        </div>
        
		<form action="teaUpdateForm.me" method="post" enctype="multipart/form-data">
        <input type="hidden" name="userNo" value="${loginUser.userNo }">
        <input type="hidden" name="userEmail" value="${loginUser.email }">
        <div id="teacher-detail">
                <table  style="margin: auto;" id="teacher-tb1">
                    <tr>
                        <td rowspan="5" style="width:150px; height: 200px; border: 1px solid black;" id="div-preview" ><img style="height:200px; width:150px;" src="${idPicture.ipSysName }"></td>
                        <td>이름 : </td>
                        <td>${loginUser.userName }</td>
                    </tr>
                    <tr>
                        <td>나이 : </td>
                        <td>${age }세</td>
                    </tr>
                    <tr>
                        <td>이메일 : </td>
                        <td  id="emailTd">
                        	<input type="email" name="email" id="email" value="${loginUser.email}">
                         	<button type="button" class="email_btn" id="email-check" style="visibility: hidden;">인증번호 받기</button>
                        </td>
                    </tr>
                    <tr id="chkArea4">
	                	<td></td>
	                	<td>
	                		<input type="text" id="auth" placeholder="인증번호 6자리를 입력해주세요" maxlength="6">
	                		<span id="timer"></span> <!-- 유효시간 -->
	                		<div id="check4"></div>  <!-- 인증번호 일치 여부 -->
	                	</td>
	                </tr>
                    <tr>
						<td>증명사진 : </td>
                        <td><div><input type="file" name="idPicture"></td>
                    </tr>
                    
                </table>
                <div class="line"></div>
                <table id="teacher-tb2">
                    <tr>
                        <td style="width:30%">&nbsp;&nbsp;한줄자기소개 &nbsp;&nbsp;: &nbsp;&nbsp;</td>
                        <td colspan="2" style="float: left;"><input type="text" name="selfIntroduction" value="${teacher.selfIntroduction }"> </td>
                    </tr>
                    <tr>
                        <td>출&nbsp;&nbsp;신&nbsp;&nbsp;학&nbsp;&nbsp;교&nbsp; : </td>
                        <td style="float: left;"><input type="text" name="schoolInfo" value="${teacher.schoolInfo }"></td>
                    </tr>

                </table>

                <div class="line"></div>

                <div style="margin:auto; height: 800px;">
                    <div class="mid">재학 증명서</div>
                   	<div id="idc"><img style="height:500px; width:400px;" src="${idCard.icSysName }"></div>
                    <div>첨부파일 : ${idCard.icOriginName }</div>
                    <div><input type="file" name="idCard"></div>
                </div>

                <div class="line"></div>

			
			<div class="find-btn">
				<button type="submit" id="change" style="margin:auto"  class="find-btn1 moong-yellow">수정하기</button>
				<button type="reset"style="margin:auto"  class="find-btn1 moong-dark">취소</button>
			</div>
        </div>
        </form>
        
    </div>

    </div>
    </div>
    
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
						divPreview.innerHTML = "";
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
		
		//이메일 인증 버튼
		$("#email").blur(function(){
			var updateEmail = $("#email").val();
			var userEmail = $('input[name=userEmail]').val();
			
			if(updateEmail==userEmail){
				console.log("같아");
				$("#email-check").css("visibility", "hidden");
				
			}else{
				console.log("달라");
				//이메일 인증 버튼 띄워주기
				$("#email-check").css("visibility", "visible");
				
				//회원가입 버튼 비활성화
				$("#change").attr("disabled",true);
				
				
			}
		});
		
		$("#email-check").click(function(){
			$("#chkArea4").show();
			
			const emailv = $("#email").val(); // 이메일 주소값
			console.log("이메일 오는지?"+emailv);
			const inputMail = $("#auth"); // 인증번호 입력칸
			
			$.ajax({
				type: "GET",
				url: "<c:url value='mailCheck?email='/>"+emailv,
				success: function(e){
					console.log("e"+e);
					inputMail.prop("disabled", false);
					code = e;
					alert("인증번호가 전송되었습니다.\n인증번호를 유효시간 내에 입력하세요.");
				}
			});
		});
		// -------- 이메일 인증번호 비교 -------- //
		$("#auth").blur(function(){
			const inputNum = $(this).val();
			const $resultMsg = $("#check4");
			
			if(inputNum === code) {
				$resultMsg.css("color","rgb(251, 176, 76)").html("인증번호가 일치합니다.");
				$("#email").prop("readonly", true);
				$("#change").attr("disabled",false); // 회원가입 버튼 활성화
			} else {
				$resultMsg.css("color","red").html("인증번호가 일치하지 않습니다.");
			}
		});
		
		// -------- 이메일 인증 유효시간 -------- //
		var time = 180;
		var min = "";
		var sec = "";
		
		var t = setInterval(function(){
			min = parseInt(time/60);
			sec = time%60;
			
			$("#timer").html("유효시간 "+min+":"+sec);
			time--;
			
			if(time < 0){  // 유효시간 끝난 후 입력 막기
				clearInterval(t);
				$("#auth").prop("disabled",true);
			}
		}, 1000);
	</script>
</body>
</html>