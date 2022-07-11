 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<style>
		.container-md {
            max-width: 1200px;
        }

        #top-optionbox{
            padding-top: 3px;
            text-align: right;
        }

        #bottombox{
            text-align: right;
        }
	</style>
	
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br>
    <div class="container-md p-4 bg-white rounded">
        <h2>문제풀이 글작성</h2>
        <br>
	<form id="solutionWrite" method="post" action="write.so" enctype="multipart/form-data">
        <div class="row titlebox">
            <div class="col-1" id="top-optionbox">
                <select name="subject" id="subject">
                    <option selected disabled>과목</option>
                    <option value="국어">국어</option>
                    <option value="영어">영어</option>
                    <option value="수학">수학</option>
                </select>
            </div>
            <div class="col-11">
                <div class="input-group input-group-sm mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="inputGroup-sizing-sm">제목</span>
                    </div>
                    <input type="text" name="title" id="title" class="form-control" placeholder="제목을 입력하세요" required>
                </div>
            </div>
        </div>

        <!--섬머노트-->
        <div class="row contentbox">
            <div class="col-12">
                <textarea class="summernote" id="summernote" name="solutionContents"></textarea>
            </div>
        </div>


        <div class="row tagbox">
            <div class="col-12">
                <div class="input-group input-group-sm mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="inputGroup-sizing-sm">해시태그</span>
                    </div>
                    <input type="text" name="tag" id="tag" class="form-control" placeholder="#태그를 입력하세요 (최대5개)">
                </div>
            </div>
        </div>

        <div class="row bottombox">
            <div class="col-12" id="bottombox">
                <button type="submit" class="btn moong-dark">작성</button>
            </div>
        </div>
	</form>
    </div>
    
	<!--섬머노트-->
    <script>
		$('.summernote').summernote({
			  height: 800,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
		});
    </script>
	<script>
	var setting = {
            height : 800,		// 에디터 높이
            minHeight : null,
            maxHeight : null,
            focus : true,		// 에디터 로딩후 포커스를 맞출지 여부
            lang : 'ko-KR',		// 한글 설정
            placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
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
				}
			});
		}
	</script>

</body>
</html>