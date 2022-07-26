<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lessonEnrollUpdateForm</title>
<style>
/*영역잡기*/
    #lesson-outer{
        margin-top:200px;
        margin:auto;
        width: 1000px;
        
    }
    #btfm{
        width: 700px;
        margin: auto;
        margin-top:20px;
    }
    /*영역잡기 끝*/

    /*페이지 제목*/
    #subtit{
            font-size: 35px;
            font-weight: 800;
            margin-top: 100px;
            margin-bottom: 100px;
    }
    /*페이지 제목 끝*/
         #result>span{
            display: inline-block;
            width: auto;
            margin-left: 20px;
            z-index: -1;
            box-sizing: border-box;
            border: 1px solid rgb(251, 176, 76);
            margin-top: 5px;
            margin-bottom: 5px;
            padding: 5px;
          }
          #result{
           z-index: -3;
           text-align: center;
          }
          .resultIn:hover{
            cursor: pointer;
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
          }
          #resultDay{
           z-index: -3;
           text-align: center;
          }
          .resultDayIn:hover{
            cursor: pointer;
            
          }
         
            #lessonEnrollTb{
                margin: auto;
                width: 700px;
            }
   /*테이블 꾸미기*/
            .td-r{
                text-align: center;
                width: 150px;
                font-weight:500;
            }


   /*테이블 꾸미기 끝*/
</style>
<body>
     <jsp:include page="../common/header.jsp"/>
    <div id="lesson-outer">
        <div id="subtit">
            과외 정보 수정
        </div>
        <form method="post" action="update.le" enctype="multipart/form-data">
            <input type="hidden" name="userNo" value="${loginUser.userNo }">
        <table border="1" id="lessonEnrollTb">
            <tr>
                <td class="td-r">과목</td>
                <td>
                    <select class="form-control" name="subject" id="subject">
                    <option value="KO">국어</option>
                    <option value="MATH">수학</option>
                    <option value="ENG">영어</option>
                    </select>
                </td>

               
            </tr>
            <tr>
                <td class="td-r">학년</td>
                <td>
                    <select class="form-control" name="tyear" id="tyear">
                        <option value="1">1학년</option>
                        <option value="2">2학년</option>
                        <option value="3">3학년</option>
                        <option value="4">상관없음</option>
                        </select>
                </td>
            </tr>
            <tr>
                <td class="td-r" >과외 가능 지역</td>
                <td><select class="form-control" onchange="handleOnChange(this)" name="select-area">
                    <option value="">--5개까지 선택이 가능합니다--</option>
                 	<c:forEach var="d" items="${d}">
                    	<option value="${d.dno}">${d.area}</option>
                    </c:forEach>

                  </select>
                  <div id='result'></div>
                  <input type="hidden" id="area" name="area" required>
                </td>
    
            </tr>

           
            <script>
            	//업데이트시 불러오기
            	
            		
            
            
            
                //지역선택 스크립트문
                function handleOnChange(e) {
                    
                    const text = e.options[e.selectedIndex].text;// 선택된 데이터의 텍스트값 가져오기
                    
                    if(text!="--5개까지 선택이 가능합니다--"){
                        
                        let resultLength = $('#result').children().length;
                        
                        if(resultLength == 0) {
                           
                            document.getElementById('result').innerHTML += '<span class="resultIn">'+text+"x"+"</span>";// 추가
                          
                            $('#area').val(text);
                                console.log($('#area').val());
                        }
                        else if(1 <= resultLength && resultLength <= 4) {
                            let a1 = "";
                            let text2 = "";
                            let a = $('#result').children();
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
                                document.getElementById('result').innerHTML += '<span class="resultIn">'+text+"x"+"</span>";// 추가   
                                $('#area').val(($('.resultIn').text()).replaceAll("x",","));
                                console.log($('#area').val());
                                
                        }
                        else {
                            alert("5개까지만 선택이 가능합니다.");
                        }
                    }
                }
        
             //선택한 지역 클릭시 취소
               $(function(){
                $("#result").on("click","span",function(){
                    $(this).remove();
                    $('#area').val(($('.resultIn').text()).replaceAll("x",","));
                                console.log($('#area').val());
                   
                     })
               })
             </script>
           
            <tr>
                <td class="td-r">과외비</td>
                <td><input type="text" id="fee1"  style="width: 300px; height: 35px; font-size:20px;" onkeyup="numberWithCommas(this.value)" maxlength="7" required ><input type="hidden"  id="fee2"  name="fee"></td>
            </tr>
            <script>
                function numberWithCommas(x) {
                 	x = x.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
                    x = x.replace(/,/g,'');          // ,값 공백처리
                    $("#fee1").val(x.replace(/\B(?=(\d{3})+(?!\d))/g, ",")); // 정규식을 이용해서 3자리 마다 , 추가 
                    $("#fee2").val(x);
                    }
            </script>
            <tr>
                <td class="td-r">과외 스타일</td>
                <td><textarea  id="leStyle"  style="width: 100%; height: 300px; resize: none;" name="leStyle" required></textarea></td>
            </tr>
            <tr>
                <td class="td-r">과외 경력</td>
                <td><input type="text" name="career" id="career" required></td>
            </tr>
            <tr>
                <td class="td-r" >과외 가능 요일</td>
                <td>
                    <select class="form-control" onchange="handleOnChange2(this)">
                        <option value="">--3개까지 선택이 가능합니다--</option>
                        <option value="7">상관없음</option>
                        <option value="1">월</option>
                        <option value="2">화</option>
                        <option value="3">수</option>
                        <option value="4">목</option>
                        <option value="5">금</option>
                        <option value="6">주말</option>
                        </select>
                        <div id="resultDay"></div>
                        <input type="hidden" name="leDay" id="leDay" required>
                        
                </td>
            </tr>

            <script>
            
            const dayArr = new Array("","","","","","");
            
                function handleOnChange2(e) {
                    
                    const text = e.options[e.selectedIndex].text;// 선택된 데이터의 텍스트값 가져오기
                    const val = e.options[e.selectedIndex].value;
                    
                    if(text!="--3개까지 선택이 가능합니다--"){
                        
                        let resultLength = $('#resultDay').children().length;
                        if(text =="상관없음"){
                            document.getElementById('resultDay').innerHTML = '<span class="resultDayIn">'+text+"x"+"</span>";
                            dayArr[val -1] = text;
                            $('#leDay').val(dayArr);
                           
                        }else if(text != "상관없음" && ($('.resultDayIn').text()).replaceAll("x","") != "상관없음"){

                        
                        
                        
                        if(resultLength == 0) {
                           
                            document.getElementById('resultDay').innerHTML += '<span class="resultDayIn">'+text+"x"+"</span>";// 추가
                            dayArr[val -1] = text;
                            $('#leDay').val(text);
                                
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
                                document.getElementById('resultDay').innerHTML += '<span class="resultDayIn">'+text+"x"+"</span>";// 추가   
                            dayArr[val-1] =text;
                            $('#leDay').val(dayArr);
                            
                                
                        }
                        else {
                            alert("3개까지만 선택이 가능합니다.");
                        }
                    }
                }
            }
             //선택한  요일 클릭시 취소
               $(function(){
                $("#resultDay").on("click","span",function(){
                    $(this).remove();
                    $('#leDay').val(($('.resultDayIn').text()).replaceAll("x",","));
                    dayArr[$(this).data('value')-1] = "";    
                   
                     })
               })
             </script>

            <tr>
                <td class="td-r">선호 수업 방식</td>
                <td>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" value="상관없음" id="teachingStyle1" onclick="ts1();" checked>
                        <label class="form-check-label" for="teachingStyle1" value="상관없음">
                          상관없음
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" value="온라인" onclick="ts2();"  id="teachingStyle2">
                        <label class="form-check-label" for="teachingStyle2" value="온라인">
                           온라인
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" value="오프라인" onclick="ts3();" id="teachingStyle3">
                        <label class="form-check-label" for="teachingStyle4" value="오프라인">
                            오프라인
                        </label>
                    </div>
                </td>
                <input type="hidden" id="teachingStyle" value="상관없음" name="teachingStyle">
            </tr>
              <script>
                    function ts1(){
                        $('#teachingStyle').val("상관없음")
                        
                    }
                    function ts2(){
                        $('#teachingStyle').val("온라인")
                        
                    }
                    function ts3(){
                        $('#teachingStyle').val("오프라인")
                        
                    }
            </script>
            <tr>
            	<th class="td-r">첨부파일</th>
                <td><input type="file" id="upfile"  name="upfile" accept="video/*" >
                	 <c:if test="${not empty l.leOriginname }">
                                  	   <br>현재 업로드된 파일 : 
	                            <a href="${l.leChangename }" download="${l.leOriginname }">${l.leOriginname }</a>
	                            <input type="hidden" name=originName value="${b.originname }">
	            				<input type="hidden" name=changeName value="${b.changename }">
	            		</c:if>
                </td>
            </tr>
          
          
        </table>
        <div id="btfm">
        <button type="reset" onclick="areaReset();" class="btn moong-dark">취소</button> 
        <button type="submit" style="float: right; margin-left:5px;" class="btn moong-yellow">수정</button>
        <button type="button" style="float: right;"class="btn btn-danger" id="del">삭제</button>
        </div>
        </form> 
        </div>
    
        <script>
        	$(function(){
        			$("#del").click(function(){
        				if(confirm("정말로 삭제 하시겠습니까?")){
        					location.href ="delete.le?leNo="+${l.leNo}+"&&userNo="+${loginUser.userNo};
        				}
        				
        			})
        			
        			
        	})
        
            function areaReset(){
                $('.resultIn').remove();
                $('.resultDayIn').remove();
            } 
            
            $(function(){
            	//등록된 값들 불러오기
            	
                $("option[value=${l.subject}]").attr("selected",true);
                $("#tyear").children("option[value=${l.tyear}]").attr("selected",true);
                $('#area').val("${l.area}");
                //지역 span만들기 
                var area = "${l.area}";
                
                var Aarr = area.split(",");
                
                for(var i=0;i<Aarr.length;i++){
                	if(Aarr[i] != ""){
                		document.getElementById('result').innerHTML += '<span class="resultIn">'+Aarr[i]+"x"+"</span>";// 추가   
                	}
                	
                }
                
                
                
                $("#career").val("${l.career}");
                $("#fee1").val(${l.fee});
                $("#fee2").val(${l.fee});
                $("#leStyle").val("${l.leStyle}");
                $("#leDay").val("${l.leDay}");
              //요일 span만들기 
                var leDay = "${l.leDay}";
                var Larr = leDay.split(",");
                var a = ""
                
                for(var i=0;i<Larr.length;i++){
                	a=Larr[i]
                	if(a != ""){
                	document.getElementById('resultDay').innerHTML += '<span class="resultIn">'+Larr[i]+"x"+"</span>";// 추가   
                	}
                }  
              
              
				console.log("${l.teachingStyle}");           
                $("#teachingStyle").val("${l.teachingStyle}")
                $(".form-check").children("input[value='${l.teachingStyle}']").prop("checked",true);
        	});
    
        </script>
        </div>
</body>
</html>