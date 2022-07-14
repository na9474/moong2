<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--font Awesome-->
<script src="https://kit.fontawesome.com/92642353eb.js" crossorigin="anonymous"></script>

<!-- Websocket, Stomp -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${path}/resources/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<link href="${path}/resources/css/chat.css" rel="stylesheet"/>


<script>
	var sock = new SockJS("/ws/chat");
	var stomp = webstomp.over(sock);
	
	/* WebSocket만 이용할 경우 */
	var websocket = new WebSocket("/ws/chat");
	var stomp = webstomp.over(websocket);
	
	stomp.connect({}, function(frame) {
	}
</script>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div id="chat_wrap2">

        <!-- 2. 메세지 영역 -->
        <div id="chat_screen">
            <section>
                <!-- 2-1. 메세지(헤더 영역) -->
                <div id="chat_screen1">
                    <div>
                        <img src="${path}/resources/img/logo-dark.png" class="c_image">
                    </div>
                    <div>
                        <b>김영희, 정승사, 배구혜, 김국어 선생님</b> ( 4 )
                    </div>
                </div>
                <!-- 2-2. 메세지(내용 영역) -->
                <div id="chat_screen2">
                    <div class="c_timestamp">
                        2022년 7월 2일
                    </div>
                    <!-- 수신 메세지 -->
                    <div class="c_row">
                        <div class="c_row_f">
                            <div class="msg_author">정승사</div>
                            <div class="msg_info">
                                <p class="msg_bubble">하이하이하이하이</p>
                                <span class="msg_time">오후 8:31</span>
                            </div>
                        </div>
                    </div>
                    <!-- 발신 메세지 -->
                    <div class="c_row c_row_own">
                        <div class="c_row_m">
                            <div class="msg_info">
                                <p class="msg_bubble">하이하이</p>
                                <span class="msg_time">오후 8:31</span>
                            </div>
                        </div>
                    </div>
                  
                </div>
                <!-- 2-3. 메세지(입력 영역) -->
                <div id="chat_screen3">
                    <div id="c_s_3_1">
                        <abbr title="첨부파일">
                            <label for="c_file">
                                <i class="fa fa-2x fa-camera"></i>
                                <input type="file" id="c_file" name="c_file" accept="image/png, image/jpeg">
                            </label>
                        </abbr>
                        <br>
                    </div>
                    <div id="c_s_3_2">
                        <textarea name="ctext" id="" cols="60" rows="5" style="resize:none" placeholder="메세지를 입력하세요."></textarea>
                    </div>
                    <div id="c_s_3_3">
                        <button type="submit" id="c_s" onclick="">전송</button> <br>
                        <!-- 선생님회원만 보임 -->
                        <button type="button" id="s_s"">과외 시작</button>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <script>
        $(function(){
            // 과외시작 버튼 클릭 시 안보이기
            $('#s_s').click(function(){
                const start = confirm('과외를 시작하시겠습니까?');

                if(start == true){
                    alert('과외를 시작합니다.');
                    $(this).hide();
                } else {
                    alert('취소되었습니다.');
                }
            });
        });
    </script>
</body>
</html>