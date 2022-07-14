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
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>

	
	<div class="outer">
        <br><br><br>
        <form action="qnaInsert.qu" method="post" enctype="multipart/form-data">
             <div class="container-md p-4 bg-white rounded">
        <h2>QnA 글작성</h2>
        <br>

        <div class="row titlebox">
            <div class="col-1" id="top-optionbox" name="type">
                <select name="type">
                	<c:forEach var="t" items="${list }">
                		<option value="${t.typeNo }">${t.typeName }</option>
                	</c:forEach>

                </select>
            </div>
            <div class="col-11">
                <div class="input-group input-group-sm mb-3">
                    <div class="input-group-prepend" >
                      <span class="input-group-text" id="inputGroup-sizing-sm">제목</span>
                    </div>
                    <input type="text" class="form-control"  name="title" id="title" placeholder="제목을 입력하세요">
                </div>
            </div>
        </div>

         <!--섬머노트-->
        <div class="row contentbox" >
            <div class="col-12">
                <textarea class="summernote" name="questionContent"></textarea>
            </div>
        </div>

        <div class="row bottombox">
            <div class="col-12" id="bottombox">
                <button type="submit" class="btn moong-dark">작성</button>
            </div>
        </div>

    	</div>

        </form>
    </div>
 

 
        
	



<!--섬머노트-->
    <script>
    $(document).ready(function() {
		$('.summernote').summernote({
			  height: 800,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
		});
    });
    

	// 툴바생략
	var setting = {
            height : 300,
            minHeight : null,
            maxHeight : null,
            focus : true,
            lang : 'ko-KR',
            toolbar : toolbar,
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
        $('#summernote').summernote(setting);

        
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
				}
			});
		}

        </script>


</body>
</html>