<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="/js/summernote/summernote-lite.js"></script>
	<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
	
	<link rel="stylesheet" href="/css/summernote/summernote-lite.css">
    <title>글쓰기</title>
   
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

      .wrap { /*전체 div*/
        width: 1200px;
        min-height: calc(100vh - 53px);
        margin: 10% auto;
        display: block;
      }
      
      .category_wrap { /*select, 제목 영역*/
        margin-left: 300px;
        display: inline;
      }

      .title_box { /*제목*/
        display:inline; 
        margin-left: 70px;
        width: 200px;
      }
      
      #writer_wrap { /*작성자*/
      	display: inline;
      	width: 230px;
      	margin-left: 70px;
      }
      
      #writer {
      	width: 180px;
      	margin-left: 20px;
      	border-radius: 15px;
      	border: none;
      }

      .text_wrap { /*본문 영역*/
        margin-left: 300px;
        margin-top: 100px;
      }

      .text_area { /*본문*/
        width: 800px;
        height: 500px;
        resize: none;
      }

      .image_btn { /*이미지 첨부 버튼*/
        background-color: rgba(0, 0, 0, 0);
        color: rgb(251, 176, 76);
        border: 2px solid rgb(251, 176, 76);
        border-radius: 5px;
        width: 100px;
        height: 35px;
        font-size: 13px;
        letter-spacing: 1px;
      }
      .image_btn:hover {
            color: rgb(248, 238, 225);
            background-color:rgb(251, 176, 76);
      }

      .submit_btn { /*작성 버튼*/
        margin-left: 800px;
        background-color: rgba(0, 0, 0, 0);
        color: rgb(251, 176, 76);
        border: 2px solid rgb(251, 176, 76);
        border-radius: 5px;
        width: 100px;
        height: 35px;
        font-size: 15px;
        letter-spacing: 1px;
      }
      .submit_btn:hover {
            color: rgb(248, 238, 225);
            background-color:rgb(251, 176, 76);
      }

      #footer { /*푸터*/
          height: 53px;
      }
     
      
      
    </style>
</head>
<body>
    
    <jsp:include page="../common/header.jsp"/>
    
    <form id="enrollForm" method="post" action="insert.bo" enctype="multipart/form-data">
    <div class="wrap">
        <div>
            <div class="category_wrap">
                <select required name="categoryNo" id="" style="height: 30px;">
                    <option value="3" name="categoryNo" selected>자유</option>
                    <option value="2" name="categoryNo">스터디모집</option>
                    <option value="1" name="categoryNo">문제집공유</option>
                </select>
            </div>
            <div class="title_box">
                제목 &nbsp; <input type="text" style="width: 350px; border-radius: 10px;" name="title">
            </div>
	        <div id="writer_wrap">
	       		<span>작성자 : </span><input type="text" id="writer" value="${loginUser.userId }" name="userId" readonly>
	        </div>
        </div>
        <div>
            <div class="text_wrap">
                <textarea class="text_area" name="content" id="summernote" cols="30" rows="10" placeholder="Input some text."></textarea>
                <br><br>
                <input type="file" id="upfile" class="file" name="upfile">
                <button type="submit" class="submit_btn">작성</button>
            </div>
        </div>
    </div>
	</form>
    <div id="footer"></div>
	
	<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			  width: 900,
			  height: 500,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
			  toolbar: [ //툴바 구성
				    // [groupName, [list of button]]
				    ['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    ['color', ['forecolor','color']],
				    ['table', ['table']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert',['picture','link']],
				    ['view', ['fullscreen', 'help']]
				  ],
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
          
		});
	});
	</script>
</body>
</html>