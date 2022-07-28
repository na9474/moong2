<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="./resources/img/logo-dark.png"/>
<style>
 /*영역지정*/
        #matching-outer {
            width: 1650px;
            height: 650px;
            margin: auto;
            margin-top: 20px;
        }

        #matching-outer>div {
            float: left;
            height: 100%;
        }

        #map,
        #select {
            width: 50%;
            height: 650px;

        }
       
        /*영역지정 끝*/

        /*페이지 제목*/
        #subtit{
            font-size: 40px;
            font-weight: 800;
            margin-left: 7%;
            margin-top: 20px;
        }

        /*페이지 제목 끝*/
        /*지도관련*/
        .outline {
            stroke-linejoin: round;
            stroke: white;
            stroke-width: 3;
            fill: rgb(251, 176, 76);
           
        }

        .outline:hover {
            fill: rgb(236, 222, 204);
            cursor: pointer;
        }

        .text {
            fill: #ffffff;
            font-size: 15px;
            text-anchor: middle;
            alignment-baseline: middle;
            pointer-events: none;
        }

        .text:hover {
            cursor: pointer;
        }
        /*지도관련*/
        
        /*입력폼관련*/
        #selectfrom-tb{
            margin: auto;
            vertical-align: middle;
            font-size: 30px;
            text-align: center;
            margin-top:70px;
            font-weight: 600;
            border-collapse: separate;
            border-spacing: 0 20px;
            width: 500px;
            height: 500px;
            
        }
        .footnote{
            font-weight: 800;
            font-size: 15px;
            text-align: left;
            color: rgb(94, 89, 89);
        }
        #form-btn{
            margin: auto;
            width: 500px;
        }
        #form-btn> button{
            font-size: 20px;
            font-weight: 700;
        }
        #resultDay>span{
            display: inline-block;
            width: auto;
            margin-left: 20px;
            z-index: -1;
            box-sizing: border-box;
            border: 1px solid rgb(251, 176, 76);
            margin-top: 5px;
            margin-bottom: 5px;
            padding: 5px;
            font-size:20px;
            font-weight:500;
          }
          #resultDay{
           z-index: -3;
           text-align: center;
          }
          .resultDayIn:hover{
            cursor: pointer;
            
          }
          /*입력폼관련*/

    </style>
</head>

<body>

 <jsp:include page="../common/header.jsp"/>
    <div id="subtit" style="margin-top:70px;">과외매칭</div>
    <div id="matching-outer">
        
        <div id="map">
            <svg style="overflow:visible" height="650" width="800" xmlns="http://www.w3.org/2000/svg">
                <defs>
                    <filter id="dropshadow">
                        <feGaussianBlur in="SourceAlpha" stdDeviation="7" />
                        <feOffset dx="0" dy="0" result="offsetblur" />
                        <feMerge>
                            <feMergeNode />
                            <feMergeNode in="SourceGraphic" />
                        </feMerge>
                    </filter>
                    <filter id="dropshadow2">
                        <feGaussianBlur in="SourceAlpha" stdDeviation="1.4" />
                        <feOffset dx="1" dy="1" result="offsetblur" />
                        <feMerge>
                            <feMergeNode />
                            <feMergeNode in="SourceGraphic" />
                        </feMerge>
                    </filter>
                </defs>
                <g filter="url(#dropshadow)">
                    <path id="Jongno-gu" name="종로구" class="outline"
                        d="M 455 297 l 4 -2 1 0 1 0 3 -1 4 5 7 3 2 6 0 8 -11 2 -11 1 -8 0 -9 1 -8 1 -9 1 -9 -2 -10 -1 -9 1 -4 3 -2 3 -6 -6 -3 -4 -5 -6 -4 -5 -2 -5 5 -3 0 -6 0 -10 0 -9 1 -9 -3 -4 -2 0 -2 0 -1 -4 0 -9 -5 -9 1 -10 -1 -11 -1 -6 2 -6 5 -2 7 -3 10 -2 2 -1 3 0 1 0 4 -2 8 -1 3 6 4 1 3 8 3 10 1 6 3 5 0 9 0 7 -1 5 -6 3 -6 4 -1 5 6 4 5 3 5 4 9 1 10 0 4 4 3 4 5 10 1 3 z " />
                    <path id="Jung-gu" name="중구" class="outline"
                        d="M 477 316 l 0 9 5 5 -1 3 -4 5 -4 5 -5 4 -4 7 -3 4 -4 3 -4 10 -2 -1 -3 -7 -2 -5 -2 1 -1 0 -2 -1 -3 1 0 0 -3 1 -4 2 -5 -5 -6 -3 -10 -3 -4 -1 -3 -1 -2 2 -4 -1 -3 -1 -9 0 -2 2 -4 3 0 -7 1 -4 -2 -2 0 -1 6 -3 6 -4 -1 -2 -2 -5 2 -3 4 -3 9 -1 10 1 9 2 9 -1 8 -1 9 -1 8 0 11 -1 z " />
                    <path id="Yongsan-gu" name="용산구" class="outline"
                        d="M 394 349 l 3 1 4 1 2 -2 3 1 4 1 10 3 6 3 5 5 4 -2 3 -1 0 0 3 -1 2 1 1 0 2 -1 2 5 3 7 2 1 5 9 6 2 2 9 -4 5 -4 5 -5 6 -3 4 -5 4 -5 5 -5 4 -5 3 -8 8 -5 8 -7 3 -7 -1 -10 -4 -3 -1 -6 -3 -6 -5 -5 -3 -6 -3 -9 -3 1 -5 0 -10 -2 -8 -6 -11 5 -2 4 -1 5 -4 5 -6 2 -5 3 -6 6 -5 0 -3 -2 -3 4 -3 2 -2 z " />
                    <path id="Seongdong-gu" name="성동구" class="outline"
                        d="M 511 315 l 7 4 6 6 4 4 6 5 2 0 15 3 4 0 -5 20 -3 5 -5 12 -3 7 -10 20 -7 -4 -5 -3 -4 -4 -10 -3 -10 0 -7 0 -12 0 -8 4 -2 -9 -6 -2 -5 -9 4 -10 4 -3 3 -4 4 -7 5 -4 4 -5 4 -5 1 -3 -5 -5 0 -9 6 1 11 -1 5 -2 2 -1 6 0 z " />
                    <path id="Gwangjin-gu" name="광진구" class="outline"
                        d="M 605 315 l 1 1 -1 4 -1 7 -2 9 3 6 4 4 3 -3 9 -1 3 3 -4 10 -2 10 -2 5 -2 4 -4 5 -5 5 -5 4 -11 12 -3 3 -3 2 -8 5 -6 3 -5 1 -5 -1 -5 -1 -6 -2 -12 -5 -7 -4 13 -27 5 -12 3 -5 5 -20 3 -8 4 -5 4 -9 7 1 11 3 9 -3 4 -3 4 -2 z " />
                    <path id="Dongdaemun-gu" name="동대문구" class="outline"
                        d="M 554 245 l 2 10 -2 5 -3 6 2 9 1 6 3 9 3 6 2 3 1 11 3 5 -4 9 -4 5 -3 8 -4 0 -15 -3 -2 0 -6 -5 -4 -4 -6 -6 -7 -4 -4 -2 -6 0 -2 1 -5 2 -11 1 -6 -1 0 -8 -2 -6 6 -4 6 -5 4 -6 3 -4 4 -5 2 -3 6 -8 4 -2 8 -3 4 -5 7 -1 7 -2 4 -6 7 -2 z " />
                    <path id="Jungnang-gu" name="중랑구" class="outline"
                        d="M 621 218 l 5 3 1 6 0 10 2 8 -3 8 -3 5 0 3 3 4 -1 6 -4 2 -5 9 0 5 -4 6 -4 3 -4 5 -3 10 -4 2 -4 3 -9 3 -11 -3 -7 -1 -3 -5 -1 -11 -2 -3 -3 -6 -3 -9 -1 -6 -2 -9 3 -6 2 -5 -2 -10 0 -8 2 -11 6 -3 4 -1 9 -4 9 1 10 1 6 -2 9 -1 z " />
                    <path id="Seongbuk-gu" name="성북구" class="outline"
                        d="M 455 297 l -3 -2 -1 -3 -5 -10 -3 -4 -4 -4 -10 0 -9 -1 -5 -4 -5 -3 -6 -4 1 -5 6 -4 6 -3 1 -5 0 -7 0 -9 -3 -5 -1 -6 -3 -10 -3 -8 -4 -1 -3 -6 9 -5 4 -3 4 1 5 4 6 4 3 2 4 5 5 5 7 3 5 2 -1 3 0 0 0 2 1 3 5 6 9 3 4 3 5 3 8 -1 6 4 9 -4 4 -6 4 -4 4 -4 4 -6 4 -3 5 4 4 5 5 5 5 4 9 0 9 -2 -2 11 0 8 -7 1 -7 2 -4 6 -7 2 -7 1 -4 5 -8 3 -4 2 -6 8 -2 3 -4 5 -3 4 -4 6 -6 5 -6 4 -7 -3 -4 -5 -3 1 -1 0 -1 0 z " />
                    <path id="Gangbuk-gu" name="강북구" class="outline"
                        d="M 448 87 l 2 0 1 0 0 0 4 4 3 7 4 5 4 7 3 5 1 2 -2 4 -2 6 -2 9 -2 8 -1 5 0 4 2 4 5 3 3 0 2 -1 3 2 7 5 3 3 7 6 2 6 5 4 3 7 6 6 7 6 3 6 -4 3 -4 6 -4 4 -4 4 -4 6 -9 4 -6 -4 -8 1 -5 -3 -4 -3 -9 -3 -4 -6 -2 -3 0 -2 0 0 1 -3 -5 -2 -7 -3 -5 -5 -4 -5 -3 -2 -6 -4 -5 -4 -4 -1 3 -4 0 -6 -3 -4 1 -3 2 -3 -2 -4 -3 -7 -4 -9 4 -1 7 -7 4 -8 6 -4 2 -5 0 -13 -1 -7 2 -5 6 -5 7 -2 z " />
                    <path id="Dobong-gu" name="도봉구" class="outline"
                        d="M 463 157 l -2 -4 0 -4 1 -5 2 -8 2 -9 2 -6 2 -4 -1 -2 -3 -5 -4 -7 -4 -5 -3 -7 -1 -9 0 -8 4 -11 8 -8 10 1 9 0 3 4 1 6 3 5 9 -1 4 -2 4 -1 4 4 5 0 5 13 0 9 -1 5 -4 12 0 8 3 9 2 9 3 10 1 9 2 7 -2 13 -3 -4 -2 -3 -2 3 -5 5 -1 6 -4 9 -1 7 -6 -6 -3 -7 -5 -4 -2 -6 -7 -6 -3 -3 -7 -5 -3 -2 -2 1 -3 0 z " />
                    <path id="Nowon-gu" name="노원구" class="outline"
                        d="M 619 183 l 1 7 -3 7 -6 5 -3 7 1 8 -9 1 -6 2 -10 -1 -9 -1 -9 4 -4 1 -6 3 -9 2 -9 0 -5 -4 -5 -5 -4 -5 -5 -4 -3 -6 -7 -6 1 -7 4 -9 1 -6 5 -5 2 -3 2 3 3 4 2 -13 -2 -7 -1 -9 -3 -10 -2 -9 -3 -9 0 -8 4 -12 1 -5 0 -9 6 -4 5 -2 4 -4 4 -6 6 0 3 1 4 0 5 -1 4 -2 7 -1 5 8 5 5 5 0 3 -1 5 4 -3 10 -2 7 -1 2 1 3 3 7 2 8 -2 11 -2 5 -3 4 0 4 2 6 1 6 0 10 3 5 7 0 5 -2 5 0 4 4 4 3 z " />
                    <path id="Eunpyeong-gu" name="은평구" class="outline"
                        d="M 368 148 l 3 2 1 3 2 11 2 9 2 8 3 5 0 5 -3 3 -5 5 -7 3 -5 2 -2 6 1 6 1 11 -1 10 -7 6 -4 3 -4 7 0 7 -5 2 -9 4 -4 4 -3 5 -3 7 -5 4 -3 4 -8 -1 0 -3 -1 0 -3 -2 -3 2 -4 5 -4 5 -5 5 -1 5 -9 -8 -12 -9 -1 -2 -6 -6 -4 -5 6 -9 1 2 -2 5 2 5 8 0 9 -1 3 -6 1 -4 2 -5 -1 -9 2 -8 -2 -10 2 -10 4 -7 3 -4 2 -6 2 -9 -1 -10 5 -4 0 -1 -1 -5 1 -4 1 -4 0 -5 -5 -3 -5 -5 0 -1 1 1 5 3 6 4 11 -1 10 -3 3 -3 4 -2 9 -4 4 -5 3 -5 5 -2 6 -2 3 4 z " />
                    <path id="Seodaemun-gu" name="서대문구" class="outline"
                        d="M 365 255 l 1 4 2 0 2 0 3 4 -1 9 0 9 0 10 0 6 -5 3 2 5 4 5 5 6 3 4 6 6 2 5 1 2 -6 4 -6 3 -3 3 -8 0 -10 1 -11 1 -7 2 -10 -4 -7 -6 -2 -10 -6 -3 -6 -2 -4 -2 -8 -4 -5 -5 -7 -5 1 -5 5 -5 4 -5 4 -5 3 -2 3 2 1 0 0 3 8 1 3 -4 5 -4 3 -7 3 -5 4 -4 9 -4 5 -2 0 -7 4 -7 4 -3 7 -6 5 9 z " />
                    <path id="Mapo-gu" name="마포구" class="outline"
                        d="M 263 289 l 12 9 9 8 7 5 5 5 8 4 4 2 6 2 6 3 2 10 7 6 10 4 7 -2 11 -1 10 -1 8 0 3 -3 0 1 2 2 -1 4 0 7 2 3 0 3 -6 5 -3 6 -2 5 -5 6 -5 4 -4 1 -5 2 -7 -4 -5 -4 -5 -3 -5 -2 -4 1 -4 2 -6 -4 -11 0 -12 0 -5 -2 -6 -7 -6 -6 -8 -4 -8 -4 -5 -4 -5 -3 -11 -7 -8 -5 -4 -2 -6 -4 -4 -4 -4 -3 -6 -6 -1 -3 8 -4 4 -2 4 -2 10 -2 10 -2 3 -2 0 -1 -1 -6 0 -5 4 -5 5 -4 4 5 6 6 z " />
                    <path id="Yangcheon-gu" name="양천구" class="outline"
                        d="M 240 363 l 8 -1 5 5 2 5 4 8 4 9 -2 3 2 2 0 2 -8 3 -5 4 -3 4 -2 12 0 4 -2 7 -4 6 -1 8 -2 6 -1 -1 -4 -2 -10 -2 -6 -2 -4 -5 -8 -1 -8 2 -4 4 -7 3 -4 3 -5 1 -3 -1 -4 -5 -4 -4 -4 -2 -3 -12 2 -9 1 -7 4 -5 0 -4 -4 -4 -4 -6 -2 -11 4 -7 3 -7 5 -2 1 6 5 5 2 6 3 9 3 7 3 4 12 1 7 -2 11 -1 7 -2 1 -8 0 -7 -1 -9 0 -10 2 -8 5 2 5 4 z " />
                    <path id="Gangseo-gu" name="강서구" class="outline"
                        d="M 134 254 l 3 3 6 4 4 4 4 6 4 3 6 4 5 4 6 4 5 3 4 4 6 5 3 2 6 5 9 6 1 3 6 6 4 3 4 4 6 4 4 2 8 5 11 7 -4 8 3 9 -8 1 -8 -2 -5 -4 -5 -2 -2 8 0 10 1 9 0 7 -1 8 -7 2 -11 1 -7 2 -12 -1 -3 -4 -3 -7 -3 -9 -2 -6 -5 -5 -1 -6 -5 2 -3 7 -10 2 -9 -1 -7 -4 -3 -2 0 1 -9 5 -2 5 -6 2 -2 -6 -4 -5 -5 -4 -7 -2 -9 -2 -7 -4 -4 1 -1 -2 -2 -2 1 -1 -3 -2 -2 -7 8 -4 2 -5 6 -2 -1 -5 -2 -5 0 -3 2 1 0 1 5 -3 3 -3 -1 -2 2 -1 1 -5 8 -4 1 -1 1 1 2 -5 2 -6 1 3 1 2 2 -9 2 -4 2 2 1 -4 5 -5 0 -6 -3 -5 -1 -6 0 -5 3 -4 4 -6 4 2 z " />
                    <path id="Guro-gu" name="구로구" class="outline"
                        d="M 245 419 l 6 7 4 4 5 2 4 4 4 9 -1 9 2 9 1 6 1 5 3 7 5 5 4 3 -3 5 -4 5 -10 1 -7 -3 -4 -5 -5 -4 -5 -3 -2 0 -2 1 -3 -5 -4 -2 3 -2 0 -1 -3 0 -3 2 -1 -5 -2 -6 -2 1 -1 1 1 1 -4 4 -5 3 -4 5 -4 4 -6 6 -9 2 -2 4 -1 10 -6 0 -8 -1 -5 -4 -4 0 -4 2 -9 0 -5 1 -8 1 2 -4 4 -5 2 -8 2 -5 3 -4 -2 -5 -3 -1 -8 -5 -1 -7 6 -3 4 -6 2 -4 2 -6 5 -6 4 2 4 4 4 5 3 1 5 -1 4 -3 7 -3 4 -4 8 -2 8 1 4 5 6 2 10 2 4 2 1 1 2 -6 1 -8 4 -6 2 -7 z " />
                    <path id="Geumcheon-gu" name="금천구" class="outline"
                        d="M 241 486 l 2 -1 2 0 5 3 5 4 4 5 7 3 10 -1 11 -1 6 1 3 10 -3 8 3 6 3 6 1 6 4 8 8 3 3 4 5 4 2 6 -7 7 -2 5 -3 6 -8 1 -5 4 -4 7 -9 -1 -4 -4 -3 -4 -2 -9 -3 -5 -2 -3 1 -3 -1 -3 -3 -4 -6 -3 -4 -6 -1 -9 -4 -4 -1 -4 2 -2 -2 -3 -3 -5 -4 -6 -2 -4 -4 -9 -3 -8 -1 -4 1 -2 z " />
                    <path id="Yeongdeungpo-gu" name="영등포구" class="outline"
                        d="M 249 345 l 5 3 5 4 8 4 8 4 6 6 6 7 5 2 12 0 11 0 6 4 4 -2 4 -1 5 2 5 3 5 4 7 4 6 11 2 8 0 10 -1 5 -11 2 -8 1 -9 1 -8 2 -2 5 -3 8 -2 3 -3 10 -2 8 -9 2 -3 1 -4 7 -4 5 -3 5 -4 6 -4 -3 -5 -5 -3 -7 -1 -5 -1 -6 -2 -9 1 -9 -4 -9 -4 -4 -5 -2 -4 -4 -6 -7 2 -12 3 -4 5 -4 8 -3 0 -2 -2 -2 2 -3 -4 -9 -4 -8 -2 -5 -5 -5 -3 -9 z " />
                    <path id="Dongjak-gu" name="동작구" class="outline"
                        d="M 367 426 l 6 3 5 3 6 5 6 3 3 1 10 4 7 1 -3 4 0 0 4 5 2 8 -2 11 0 6 -1 11 0 8 0 9 -5 -2 -14 0 -3 -2 -5 -4 -6 -10 0 -11 -2 -6 -7 3 -3 1 -2 -2 -7 -3 -9 1 -7 0 -11 -2 -6 -1 -6 7 -6 1 -10 4 -4 3 -2 1 -12 3 4 -6 3 -5 4 -5 4 -7 3 -1 9 -2 2 -8 3 -10 2 -3 3 -8 2 -5 8 -2 9 -1 8 -1 11 -2 z " />
                    <path id="Gwanak-gu" name="관악구" class="outline"
                        d="M 323 470 l 6 1 11 2 7 0 9 -1 7 3 2 2 3 -1 7 -3 2 6 0 11 6 10 5 4 3 2 14 0 5 2 2 8 4 6 3 4 0 11 1 5 -9 4 -7 2 -3 1 -5 4 -5 7 -8 5 -2 7 -1 5 -5 2 -9 2 -9 1 -10 2 -4 2 -2 0 -3 -5 -2 -6 -5 -4 -5 -7 -4 -4 -2 -6 -5 -4 -3 -4 -8 -3 -4 -8 -1 -6 -3 -6 -3 -6 3 -8 -3 -10 -6 -1 -11 1 4 -5 3 -5 12 -3 2 -1 4 -3 10 -4 6 -1 z " />
                    <path id="Seocho-gu" name="서초구" class="outline"
                        d="M 460 413 l 1 0 2 -3 6 9 1 6 0 1 3 9 5 15 5 13 6 17 7 10 6 -1 5 5 1 3 4 9 7 13 3 5 6 -2 4 0 6 -1 9 -2 8 -4 5 -3 2 -2 11 0 4 8 2 3 5 6 2 7 4 4 1 7 -5 8 -6 10 0 6 -6 4 -4 4 -5 0 -4 -1 -4 0 -2 6 -2 8 -1 4 -1 2 1 3 -4 0 -10 2 -9 0 -8 0 -7 -4 -4 -6 -5 -5 -4 -2 -5 -4 1 -5 2 -4 -1 -8 0 -5 -2 -4 2 -5 0 -1 -3 -4 -2 -9 -2 -6 -5 0 -2 7 -3 6 -6 4 -8 2 -4 1 -2 0 -6 -3 -3 -3 0 0 -1 -2 -3 -6 -2 -8 -8 -2 -5 3 1 3 0 1 -4 4 -6 3 -4 3 -1 -5 0 -11 -3 -4 -4 -6 -2 -8 0 -9 0 -8 1 -11 0 -6 2 -11 -2 -8 -4 -5 0 0 3 -4 7 -3 5 -8 8 -8 5 -3 5 -4 5 -5 5 -4 3 -4 z " />
                    <path id="Gangnam-gu" name="강남구" class="outline"
                        d="M 503 387 l 10 3 4 4 5 3 7 4 7 4 12 5 0 10 0 4 1 13 1 6 1 10 6 2 7 1 6 2 3 2 12 4 5 2 5 3 6 3 5 4 5 5 3 6 3 5 3 5 4 7 2 2 5 10 3 4 4 5 -10 11 -2 6 -4 0 -3 -4 -9 -2 -4 0 0 2 -1 1 -3 3 -11 3 -1 -7 -4 -4 -2 -7 -5 -6 -2 -3 -4 -8 -11 0 -2 2 -5 3 -8 4 -9 2 -6 1 -4 0 -6 2 -3 -5 -7 -13 -4 -9 -1 -3 -5 -5 -6 1 -7 -10 -6 -17 -5 -13 -5 -15 -3 -9 0 -1 -1 -6 -6 -9 -2 3 -1 0 -7 -6 5 -6 4 -5 4 -5 8 -4 12 0 7 0 z " />
                    <path id="Songpa-gu" name="송파구" class="outline"
                        d="M 621 374 l 6 2 4 2 4 4 0 8 -2 5 -1 3 0 7 5 2 8 5 5 3 8 4 3 2 5 3 5 2 -4 3 0 6 -3 10 4 5 5 3 10 0 9 3 5 5 -1 4 -2 7 -3 9 -4 3 -5 4 -5 5 -2 6 -3 7 -5 5 -10 0 -6 0 0 8 -4 5 -6 -2 -2 -1 -1 4 -4 -5 -3 -4 -5 -10 -2 -2 -4 -7 -3 -5 -3 -5 -3 -6 -5 -5 -5 -4 -6 -3 -5 -3 -5 -2 -12 -4 -3 -2 -6 -2 -7 -1 -6 -2 -1 -10 -1 -6 -1 -13 0 -4 0 -10 6 2 5 1 5 1 5 -1 6 -3 8 -5 3 -2 3 -3 11 -12 5 -4 5 -5 4 -5 z " />
                    <path id="Gangdong-gu" name="강동구" class="outline"
                        d="M 726 320 l 1 7 3 9 0 9 1 9 1 10 1 5 -1 -1 -5 -1 -3 0 -4 2 -11 0 -8 1 -5 6 -4 5 -4 6 -2 4 -1 8 -4 7 -3 2 1 1 -1 2 -6 7 -1 8 -5 -2 -5 -3 -3 -2 -8 -4 -5 -3 -8 -5 -5 -2 0 -7 1 -3 2 -5 0 -8 -4 -4 -4 -2 -6 -2 -7 0 2 -4 2 -5 2 -10 4 -10 1 -1 4 -6 7 -6 5 -3 6 -3 8 -3 4 -1 5 0 11 0 9 -4 7 -5 8 -6 11 -6 11 0 0 7 3 6 z " />
                </g>
                <g filter="url(#dropshadow2)"></g>
                <g filter="url(#dropshadow2)">


                    <text id="Jongno-gu" name="종로구" class="text" x="399" y="277">종로구</text>
                    <text id="Jung-gu" name="중구" class="text" x="433" y="338">중구</text>
                    <text id="Yongsan-gu" name="용산구" class="text" x="407" y="395">용산구</text>
                    <text id="Seongdong-gu" name="성동구" class="text" x="505" y="356">성동구</text>
                    <text id="Gwangjin-gu" name="광진구" class="text" x="577" y="365">광진구</text>
                    <text id="Dongdaemun-gu" name="동대문구" class="text" x="528" y="294">동대문구</text>
                    <text id="Jungnang-gu" name="중랑구" class="text" x="589" y="270">중랑구</text>
                    <text id="Seongbuk-gu" name="성북구" class="text" x="466" y="258">성북구</text>
                    <text id="Gangbuk-gu" name="강북구" class="text" x="459" y="181">강북구</text>
                    <text id="Dobong-gu" name="도봉구" class="text" x="494" y="125">도봉구</text>
                    <text id="Nowon-gu" name="노원구" class="text" x="560" y="153">노원구</text>
                    <text id="Eunpyeong-gu" name="은평구" class="text" x="323" y="218">은평구</text>
                    <text id="Seodaemun-gu" name="서대문구" class="text" x="342" y="302">서대문구</text>
                    <text id="Mapo-gu" name="마포구" class="text" x="293" y="339">마포구</text>
                    <text id="Yangcheon-gu" name="양천구" class="text" x="209" y="421">양천구</text>
                    <text id="Gangseo-gu" name="강서구" class="text" x="156" y="334">강서구</text>
                    <text id="Guro-gu" name="구로구" class="text" x="199" y="470">구로구</text>
                    <text id="Geumcheon-gu" name="금천구" class="text" x="279" y="537">금천구</text>
                    <text id="Yeongdeungpo-gu" name="영등포구" class="text" x="295" y="413">영등포구</text>
                    <text id="Dongjak-gu" name="동작구" class="text" x="361" y="461">동작구</text>
                    <text id="Gwanak-gu" name="관악구" class="text" x="353" y="529">관악구</text>
                    <text id="Seocho-gu" name="서초구" class="text" x="481" y="515">서초구</text>
                    <text id="Gangnam-gu" name="강남구" class="text" x="533" y="464">강남구</text>
                    <text id="Songpa-gu" name="송파구" class="text" x="624" y="448">송파구</text>
                    <text id="Gangdong-gu" name="강동구" class="text" x="675" y="358">강동구</text>
                </g>
            </svg>
        </div>
        <div id="select">
            <form method="post" action="insert.ma" id="MatchingEnrollForm" onsubmit="return checkForm()">
                <input type="hidden" name="userNo" value="${loginUser.userNo }">
                <table  id="selectfrom-tb">
                    <tr>
                        <td>과목 선택</td>
                        <td style="width:350px;">
                            <select class="form-control" style="width: 100px; margin:auto;" name="subject" required>
                                <option value="KO${s.ko}">국어</option>
                                <option value="MATH${s.math}">수학</option>
                                <option value="ENG${s.eng}">영어</option>
                              </select>
                        </td>
                    </tr>
                    <tr>
                        <td>랜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;덤</td>
                        <td>
                            <select class="form-control" name="random" id="random" required>
                                <option value="Y">랜덤O</option>
                                <option value="N">랜덤X</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="footnote">&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-play"></i> 랜덤선택시 비슷한 성적의 학생과 랜덤으로 매칭됩니다.</td>
                    </tr> 
                    <tr>
                        <td>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별</td>
                        <td style="font-size:20px;">
                        <select class="form-control" name="gender" id="gender" >
                                <option value="S">동일</option>
                                <option value="R">상관없음</option>
                                
                            </select>
                            <input type="hidden" name="sGender" value="${loginUser.gender }">
                            <input type="hidden" name="sYear" value="${s.year}">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="footnote">&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-play"></i> 선택하지 않을 시 무작위 성별의 학생과 매칭됩니다.</td>
                    </tr>
                    <tr>
                        <td>인원 선택</td>
                        <td><select name="people" id="" class="form-control" style="width: 100px; margin:auto;">
                            <option value="1">1명</option>
                            <option value="2">2명</option>
                            <option value="3">3명</option>
                            <option value="4">4명</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td>금액 입력</td>
                        <td><input type="text"  id="fee1" style="width: 300px; height: 35px; font-size:20px;"  onkeyup="numberWithCommas(this.value)" maxlength="7" required><input type="hidden"  id="fee2"  name="fee"></td>
                        
                    </tr>
                    <tr>
                        <td colspan="2" class="footnote" >&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-play"></i> 입력하신 금액은 수업 시간당 금액입니다.</td>
                    </tr>
                    <tr style="display: none;">
                        	 <td><input type="hidden" id="area" name="area" required></td>   
                    </tr>
                    <tr>
                        <td>요일선택</td>
                        <td>
                        <select class="form-control" onchange="handleOnChange2(this)">
                            <option value="">--선택--</option>
                            <option value="7">상관없음</option>
                            <option value="1">월</option>
                            <option value="2">화</option>
                            <option value="3">수</option>
                            <option value="4">목</option>
                            <option value="5">금</option>
                            <option value="6">주말</option>
                            </select>
                            <div id="resultDay"></div>
                            <input type="hidden" id="day"  name="maDay" required>
                        </td>
                    <tr>
					<tr>
                        <td colspan="2" class="footnote" style="height:20px;">&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-play"></i>요일은 3개까지 선택 가능합니다.</td>
                    </tr>
                </table>
               
                <div id="form-btn">
                <button type="reset" style="float: left; " class="btn moong-dark" >초기화</button>
                <c:choose>
                    <c:when test="${loginUser.student eq 'Y'}">
                        <button type="submit" style="float: right;" id="ok" class="btn moong-yellow" >매칭시작</button>
                    </c:when>
                    <c:otherwise>
                        <button type="button" style="float: right;" id="studentCertification" class="btn moong-yellow" >매칭시작</button>
                    </c:otherwise>

                </c:choose>
                
                </div>
            </form>
        </div>
    </div>
    	<script>

           $("#studentCertification").click(function(){
                alert("학생회원만 사용할 수 있습니다.")
           })


    		function checkForm(){
    			if($('#area').val() == ""){
    				alert("지역을 선택해주세요")
    				return false;
    			}else if($('#day').val() == ""){
    				alert("요일을 선택해주세요")
    				return false;
    			}
    			
    			
    		}
    		
    	
    	</script>
    
    
    
    
    
 		<script>
                function numberWithCommas(x) {
                 	x = x.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
                    x = x.replace(/,/g,'');          // ,값 공백처리
                    $("#fee1").val(x.replace(/\B(?=(\d{3})+(?!\d))/g, ",")); // 정규식을 이용해서 3자리 마다 , 추가 
                    $('#fee2').val(x);
                    
                    }
            </script>


    <script>
        //마우스 click시 color변경 event
        $('.outline').click(function () {
            $('.outline').css({ fill: "rgb(236, 222, 204)" });
            $(this).css({ fill: "rgb(251, 176, 76)" });
           
            //클릭 시 input[name:area]에 지역값 넣기 
            $('#area').val($(this).attr('name'));
            
        })
       
 function handleOnChange(e) {
               // 선택된 데이터의 텍스트값 가져오기
    

                const text = e.options[e.selectedIndex].text;
                

               // 선택한 텍스트 출력
               if(text!="--선택--"){
                if($('#result').children().length<=1){
                        
                    
                        document.getElementById('result').innerHTML += '<div class="resultIn">'+text+"x"+"</div>";

                }else if(1<$('#result').children().length<=3){
                   
                         for(var i=0; $('#result').children().length<i;i++){
                            var a = $('#result').children();
                         var a1 =a[i].textContent;
                            if(text != a1){
                                document.getElementById('result').innerHTML += '<div class="resultIn">'+text+"x"+"</div>";
                            }
                         }
                }
               }
               
             }
 
             //선택한 지역 클릭시 취소
               $(function(){
                $("#result").on("click","div",function(){
                    $(this).remove();
                     })
               })

        
    
            

       
       

    </script>
     <script>

                    const dayArr = new Array("","","","","","");

                    function handleOnChange2(e) {
                        


                        const text = e.options[e.selectedIndex].text;// 선택된 데이터의 텍스트값 가져오기
                        const val = e.options[e.selectedIndex].value;
                      
                        
                    
                   
                    
                        if(text!="--3개까지 선택이 가능합니다--"){
                            
                            let resultLength = $('#resultDay').children().length;
                            if(text =="상관없음"){
                                document.getElementById('resultDay').innerHTML = '<span class="resultDayIn">'+text+"x"+"</span>";
                                dayArr[e.options[e.selectedIndex].value -1] = text;
                                $('#day').val(dayArr);
                                
                            }else if(text != "상관없음" && ($('.resultDayIn').text()).replaceAll("x","") != "상관없음"){
    
                            
                            
                            
                            if(resultLength == 0) {
                               
                                document.getElementById('resultDay').innerHTML += '<span class="resultDayIn" data-value='+val+'>'+text+"x"+"</span>";// 추가
                                 dayArr[val -1] = text;
                                $('#day').val(dayArr);
                                    
                            }
                                
    
                            else if(1 <= resultLength && resultLength <= 2) {
    
                                let a1 = "";
                                let text2 = "";
                                let a = $('#resultDay').children();
                                let flag = true;
                                
                                
                                for(let i = 0; i < resultLength; i++) {
                                    if(i == 0){
                                        var text3="";
                                    }
                                    a1 = a[i].textContent;
                                    text2 = text+"x";
                                    
                                    
                                    if(a1 == text2) {
                                        flag = true;
                                        break;
                                    } 
                                    else{
                                        text3 += a[i].textContent;
                                        flag = false; 
                                    } 
                                                                
                                }
    
                                if(!flag)
                                    document.getElementById('resultDay').innerHTML += '<span class="resultDayIn" data-value='+val+'>'+text+"x"+"</span>";// 추가   
                                    
                                   
                                    dayArr[val-1] =text;
                                    $('#day').val(dayArr);
                            }
                            else {
                                alert("3개까지만 선택이 가능합니다.");
                            }
                        }
                    }
                     //선택한  요일 클릭시 취소
                  
                    $("#resultDay").on("click","span",function(){
                        $(this).remove();
                        $('#day').val(($('.resultDayIn').text()).replaceAll("x",""));
                            dayArr[$(this).data('value')-1] = "";   
                           
                         })
                    
                }
                
                   

                   
                 </script>
</body>
</html>