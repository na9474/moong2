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
        
        <form action="pwUpdate.me">
        
        <table>
        	<tr>
        		<td><input type="password" name="userPwd" class="form-control" placeholder="현재 비밀번호" ></td>
        	</tr>
        	<tr>
        		
        		<td><input type="password" name="updatePwd" id="udpatePwd" class="form-control" placeholder="변경 비밀번호"></td>
        	</tr>
			<tr>
				<td><input type="password" name="ckUpdatePwd" onkeyup="checkPwdEqual(this.value)" id="equalChk"class="form-control" placeholder="변경 비밀번호 확인" ></td>
			</tr>
			<tr>
				<td>
					<div id="chkMessage" style="color:red; font-size:small;"></div>
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
	function checkPwdEqual(thisValue){
		
		var pw = $("#udpatePwd").val();
		var chkPwd = thisValue;
		
		if(pw != thisValue){
			
			$('#chkMessage').html("변경 비밀번호가 일치하지 않습니다.");
			$('#submit').attr("disabled",true);
		}else{
			$('#chkMessage').html("");
			$('#submit').attr("disabled",false);
		}
		
		
	}
	
	
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