<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
    <style>
        @font-face {
        font-family: '양진체';
        src: url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff') format('woff');
        font-weight: normal;
        font-style: normal;
        }
        
        * {
            font-family: '양진체';
        }
​
        .container-md {
            max-width: 1200px;
        }
​
        #top-optionbox{
            padding-top: 3px;
            text-align: right;
        }
​
        #bottombox{
            text-align: right;
        }
​
        .moong-dark{
            background-color: rgb(49, 48, 47);
            color: rgb(248, 238, 225);
            
        }
​
        .moong-dark:hover{
            color: rgb(254, 132, 114);
            transition: 0.5s;
            
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

	
	<div class="outer">
        <br><br><br>
        <form action="qnaUpdate.qu" method="post" enctype="multipart/form-data">
             <div class="container-md p-4 bg-white rounded">
		<input type="hidden" name="qnaNo" value="${qq.qnaNo}">
             
        <h2>QnA 수정</h2>
        <br>

        <div class="row titlebox">
            <div class="col-1" id="top-optionbox" name="type">
                <select name="typeNo">
                	<c:forEach var="t" items="${list }">
                		<option value="${t.typeNo }" 
                			<c:if test="${qq.typeName eq t.typeName }">selected ="selected"</c:if>
                			name="${t.typeNo }">${t.typeName }
                		</option>
                	</c:forEach>

                </select>
            </div>
            <div class="col-11">
                <div class="input-group input-group-sm mb-3" style="width:1000px">
                    <div class="input-group-prepend" >
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="input-group-text" id="inputGroup-sizing-sm">제목</span>
                    </div>
                    <input type="text" class="form-control"  name="title" id="title" value="${qq.title }"></input>
                </div>
            </div>
        </div>

         <!--섬머노트-->
        <div class="row contentbox" >
            <div class="col-12">
                <textarea class="summernote" name="questionContent" id="questionContent">${qq.questionContent }</textarea>
            </div>
        </div>
		<br>
        <div class="row bottombox">
            <div class="col-12 find-btn" id="bottombox">
                <button type="submit" class="btn moong-dark find-btn1">수정</button>
                <button type="reset" class="btn moong-yellow find-btn1">취소</button>
            </div>
        </div>


    	</div>

        </form>
    </div>
 

 
        
	



<!--섬머노트-->
    <script>

        $(document).ready(function() {

        	var toolbar = [
        		    // 글꼴 설정
        		    ['fontname', ['fontname']],
        		    // 글자 크기 설정
        		    ['fontsize', ['fontsize']],
        		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
        		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
        		    // 글자색
        		    ['color', ['forecolor','color']],
        		    // 표만들기
        		    ['table', ['table']],
        		    // 글머리 기호, 번호매기기, 문단정렬
        		    ['para', ['ul', 'ol', 'paragraph']],
        		    // 줄간격
        		    ['height', ['height']],
        		    // 그림첨부, 링크만들기, 동영상첨부
        		    ['insert',['picture','link','video']],
        		    // 코드보기, 확대해서보기, 도움말
        		    ['view', ['codeview','fullscreen', 'help']]
        		  ];

        	var setting = {
                    height : 500,
                    minHeight : null,
                    maxHeight : null,
                    focus : true,
                    lang : 'ko-KR',
                    toolbar : toolbar,
                    placeholder: '최대 2048자까지 쓸 수 있습니다'	,
                    //콜백 함수
                    callbacks : { 
                    	onImageUpload : function(files, editor, welEditable) {
                    // 파일 업로드(다중업로드를 위해 반복문 사용)
                    for (var i = files.length - 1; i >= 0; i--) {
                    uploadSummernoteImageFile(files[i],
                    this);
                    		}
                    	}
                    }
                 };
                $('.summernote').summernote(setting);
                });
                

		function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "uploadSummernoteImageFile",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(el).summernote('editor.insertImage', data.url);

					$('input[name=qfSysName]').attr('value',data.qfSysName);
				},
				error : function(){
    				console.log("통신실패")
    			}
			});
		}
        
        
        </script>


</body>
</html>