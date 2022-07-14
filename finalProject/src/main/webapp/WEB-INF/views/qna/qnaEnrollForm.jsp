<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="jquery.fullpage.min.css">



 <!--font Awesome-->
 <script src="https://kit.fontawesome.com/92642353eb.js" crossorigin="anonymous"></script>
 
<!--      섬머노트
<script src="resources/js/summernote/summernote-lite.js"></script>
<script src="resources/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="resources/css/summernote/summernote-lite.css"> -->
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
​
​
    <!-- 섬머노트 -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
    <script script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
    
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
	<jsp:include page="../common/myPageNavi.jsp"/>
	
	<div class="outer">
        <br><br>
        <form action="">
             <div class="container-md p-4 bg-white rounded">
        <h2>QnA 글작성</h2>
        <br>

        <div class="row titlebox">
            <div class="col-1" id="top-optionbox">
                <select>
                    <option>문의</option>
                    <option>국어</option>
                    <option>영어</option>
                    <option>수학</option>
                </select>
            </div>
            <div class="col-11">
                <div class="input-group input-group-sm mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="inputGroup-sizing-sm">제목</span>
                    </div>
                    <input type="text" class="form-control" placeholder="제목을 입력하세요">
                </div>
            </div>
        </div>

         <!--섬머노트-->
        <div class="row contentbox" >
            <div class="col-12">
                <textarea class="summernote" name="editordata"></textarea>
            </div>
        </div>

        <div class="row bottombox">
            <div class="col-12" id="bottombox">
                <button type="button" class="btn moong-dark">작성</button>
            </div>
        </div>

    	</div>

        </form>
    </div>
 

 
        
	
	</div>
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
    </script>

</body>
</html>