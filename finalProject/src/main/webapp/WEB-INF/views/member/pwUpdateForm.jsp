<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	#alarm-outer{
        margin:auto;
        width: 1000px;
        display: block;
    }
	
	#subtit{
            font-size: 25px;
            font-weight: 800;
            margin-top: 50px;
            margin-bottom: 50px;
    }

	/*버튼 */
	.find-btn{
		text-align: center;
	}
	.find-btn1{
		display :inline-block;
	}

	input[type="button"]{
	
		font-family: FontAwesome;
	}



</style>

</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/myPageNavi.jsp"/>

 	<div id="alarm-outer">
 		<br><br>
        <div id="subtit">
                        비밀번호 변경
        </div>
        <input type="hidden" value="${loginUser.userId }" id="userId">
        <form action="pwUpdate.me">
        
        <table>
        	<tr>
        		<td><input type="password" name="userPwd" class="form-control" placeholder="현재 비밀번호" ></td>
        	</tr>
        	<tr>
        		
        		<td><input type="password" name="updatePwd" id="udpatePwd" class="form-control" placeholder="변경 비밀번호"></td>
        	</tr>
        	<tr>
        		<td>
        			<span id="chkMessage1" style="font-size:small;"></span>
        		</td>
        	</tr>
			<tr>
				<td><input type="password" name="ckUpdatePwd" onkeyup="checkPwdEqual(this.value)" id="equalChk"class="form-control" placeholder="변경 비밀번호 확인" ></td>
			</tr>
			<tr>
				<td>
					<div id="chkMessage2" style="font-size:small;"></div>
				</td>
			</tr>
        </table>
        
       	

		<!-- 캡차 -->
		<div class="form-group">
		<br>
                 <label for="captcha" style="display:block; font-size:small;">아래 이미지를 보이는대로 입력해주세요</label>
                 <div class="captcha">
                     <div class="form-group">
                         <img id="captchaImg" title="캡차 이미지" src="captchaImg.do" alt="캡차 이미지" />
                         <div id="captchaAudio" style="display:none;"></div>
                     </div>
                     <div class="form-group">
                         <a onclick="javascript:refreshBtn()" class="refreshBtn">
                             <input type="button" value="&#xf021 새로고침" />
                         </a>
                         <a onclick="javascript:audio()" class="refreshBtn">
                             <input type="button" value="&#xf130 음성듣기" />
                         </a>
                     </div>
                     <table>
                     	<tr>
                     		<td>
                         	<input type="text" name="answer" id="answer"  class="form-control" placeholder="자동입력 방지문자"/>
                 	 		</td>
                 	 	</tr>
                 	 </table>
                 </div>
		 </div>
        <div class="find-btn">
        <br>
       		 <button type="submit" id="submit" class="find-btn1 btn btn-moongdark" disabled>수정하기</button>
       	</div>        
        </form>
		
		
		
		
		</div>





	</div>
	</div>


	<script>
	
	// -------- 비밀번호 유효성 체크 -------- //
	$("#udpatePwd").keyup(function(){  // 비밀번호 input에 문자가 입력될 때마다 chkPwd() 실행
		
		chkPwd($("#udpatePwd").val(),$('input[id=userId]').val());
	});
	
	function chkPwd(pwd,id){
		var pwdReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*])(?=.*[0-9])[A-Za-z0-9!@#$%^*]{8,15}$/;
		var chkNum = pwd.search(/[0-9]/g);
		var chkEng = pwd.search(/[a-z]/ig);
		
		// 비밀번호 정규식과 일치하지 않을 때
		if(!pwdReg.test(pwd)){
			$("#chkMessage1").show();
			$("#chkMessage1").css("color","red").text("8~15자 영문 대/소문자와 숫자, 특수문자(!, @, #, $, %, ^, *)만 입력하세요.");
		}
		// 숫자와 영문자를 문자열 내의 모든 패턴에서 찾을 때(영문자는 대소문자 가리지 않고 비교)
		if(chkNum < 0 || chkEng < 0){
			$("#chkMessage1").show();
			$("#chkMessage1").css("color","red").text("영문자와 숫자를 모두 사용하세요.");
		}
		// 영문자와 숫자를 연속 3번 이상 사용했을 때
		if(/(\w)\1\1/.test(pwd)){
			$("#chkMessage1").show();
			$("#chkMessage1").css("color","red").text("비밀번호에 같은 문자를 3번 이상 사용할 수 없습니다.");
		}
		// 입력한 비밀번호값에서 입력한 아이디값과 일치하는 시작인덱스값이 있을 때
		if(pwd.search(id) > -1){
			$("#chkMessage1").show();
			$("#chkMessage1").css("color","red").text("비밀번호에 아이디를 포함할 수 없습니다.");
		}
		// 비밀번호 입력란이 비어있을 때
		if($("#updatePwd").val() == ""){
			$("#chkMessage1,#chkMessage2").hide();
		}
		// 비밀번호 정규식과 일치할 때
		if(pwdReg.test(pwd)){
			$("#chkMessage1,#chkMessage2").hide();
		}
	}
	
	// -------- 비밀번호 일치 여부 -------- //
	$("#equalChk").keyup(function(){
		if($("#equalChk").val().length >= 1){
			if($("#udpatePwd").val() != $("#equalChk").val()){  // 입력한 비밀번호값과 비밀번호 재확인값이 같지 않을 때
				$("#chkMessage2").show();
				$("#chkMessage2").css("color","red").text("비밀번호가 일치하지 않습니다.");
				$("#submit").attr("disabled",true);
			} else {  // 각 값이 같을 때
				console.log("일치");
				$("#chkMessage2").show();
				$("#chkMessage2").css("color","rgb(251, 176, 76)").text("비밀번호가 일치합니다.");
				$('#submit').attr("disabled",false);
			}
		} else {  // 입력한 비밀번호 재확인값의 길이가 8글자 미만일 때
			$("#chkMessage2").hide();
		}
	});
	
	
	/* 캡차 */
	function audio(){
        var rand = Math.random();
        var url = 'captchaAudio.do';
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'text',
            data: 'rand=' + rand,
            async: false,
            success: function(resp) {
                var uAgent = navigator.userAgent;
                var soundUrl = 'captchaAudio.do?rand=' + rand;
                
                if(uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE') > -1) {
                    winPlayer(soundUrl);
                } else if (!!document.createElement('audio').canPlayType) {
                    try{
                        new Audio(soundUrl).play();
                    } catch(e) {
                        winPlayer(soundUrl);
                    }
                }else {
                    window.open(soundUrl, '', 'width=1, height=1');
                }
            }    
            
        });
        
    }
    
    function refreshBtn(type){
        var rand = Math.random();
        var url = "captchaImg.do?rand=" + rand;
        $('#captchaImg').attr("src", url);
    }
    function winPlayer(objUrl){
        $('#captchaAudio').html('<vgsound src="' + objUrl + '">');
    }

	
	</script>


</body>
</html>