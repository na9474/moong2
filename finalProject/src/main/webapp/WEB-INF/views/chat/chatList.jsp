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
<script src="jquery.fullpage.min.js"></script>

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

<link rel="stylesheet" href="${path}/resources/css/chatList.css">
    
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div id="chat_wrap">

        <!-- 1. 메세지 목록 영역 -->
        <div id="chat_list">
            <aside>
                <!-- 1-1. 메세지 목록(헤더 영역) -->
                <div id="chat_title">
                    <div id="c_t">메세지</div>
                    <abbr title="메세지 나가기">
                        <button type="button" id="c_g">
                            <i class="fa-solid fa-gear"></i>
                        </button>
                    </abbr>
                    <button type="button" id="c_o">나가기</button>
                    <button type="reset" id="c_r">취소</button>
                </div>
                <!-- 1-2. 메세지 목록(내용 영역) -->
                <div class="c_ul">
                    <ul>
                        <li>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="c_image">
                                        <!-- img -->
                                        <img src="${path}/resources/img/logo-dark.png" class="c_images">
                                    </td>
                                    <td class="c_td">
                                        <!-- 참여자 이름 & 메세지 미리보기 -->
                                        <div class="c_name">
                                           	김영희, 정승사, 배구혜, 김국어 선생님
                                        </div>
                                        <div> (4)</div> 
                                        <br>
                                        <div class="c_preview">
                                           	안녕하세요. 김국어 선생님입니다.
                                        </div>
                                    </td>
                                    <td class="c_td2">
                                        <!-- 보낸 시간 & 나가기 체크박스 -->
                                        <div class="time">
                                            6월 30일
                                        </div>
                                        <div class="out_check">
                                            <input type="checkbox" name="out" id="out">
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </li>
                        <li>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="c_image">
                                        <!-- img -->
                                        <img src="${path}/resources/img/logo-dark.png" class="c_images">
                                    </td>
                                    <td class="c_td">
                                        <!-- 참여자 이름 & 메세지 미리보기 -->
                                        <div class="c_name">
                                           	김영희, 정승사, 배구혜, 김수학 선생님
                                        </div>
                                        <div>(4)</div>
                                        <br>
                                        <div class="c_preview">
                                           	안녕하세요. 김수학 선생님입니다.
                                        </div>
                                    </td>
                                    <td class="c_td2">
                                        <!-- 보낸 시간 & 나가기 체크박스 -->
                                        <div class="time">
                                            6월 30일
                                        </div>
                                        <div class="out_check">
                                            <input type="checkbox" name="out" id="out" autocomplete="off">
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </li>
                    </ul>
                </div>
            </aside>
        </div>
        <script>
            $(function(){
                // gear 아이콘 클릭 시 취소,나가기,체크박스 보이기
                $('.fa-gear').click(function(){
                    $(this).hide();
                    $('#out, #c_r, #c_o').show();
                });
                // 취소 클릭 시 원래대로 gear 아이콘 보이고, 체크박스 전체 해제
                $('#c_r').click(function(){
                    $(this).toggle();
                    $('#c_o, #out, .fa-gear').toggle();
                    $('input:checkbox').prop('checked', false);
                });
                // gear 아이콘 클릭 후 메세지 목록 행 클릭 시에도 체크박스 체크되게 하기
                // $('.c_ul li').click(function(){
                //     var chkbox = $(this).find(':checkbox');
                //     chkbox.attr('checked', !chkbox.is(':checked'));
                // });
                // 나가기 클릭 시 확인창
                $('#c_o').click(function(){
                    const rout = confirm('정말로 나가시겠습니까?\n메세지를 나갈 시 과외가 취소됩니다.');
                    
                    if(rout == true) {
                        alert('나가기에 성공하였습니다.');
                    }
                });
                // 메세지 목록 hover 시 스타일
                $('.c_ul li').hover(function(){
                    $(this).css({'background':'linear-gradient(to right, white, rgb(248, 238, 225))', 'cursor':'pointer'});
                },function(){
                    $(this).css({'background':'', 'cursor':''});
                });
                // 메세지 행 클릭 시 스타일
                $('.c_ul li').click(function(){
                    $(this).css({'background':'rgb(248, 238, 225)','transition':'0.2s'});
                });
            });
        </script>
    </div>
</body>
</html>