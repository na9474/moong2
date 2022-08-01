<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 수정</title>
   
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
        margin-left: 80px;
      }
      
      #writer_wrap { /*작성자*/
      	display: inline;
      	width: 300px;
      	margin-left: 80px;
      }

      .text_wrap { /*본문 영역*/
        margin-left: 300px;
        margin-top:100px;
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
        margin-left: 700px;
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
      
      #writer {
      	width: 100px;
      }
      
    </style>
</head>
<body>
    
    <jsp:include page="../common/header.jsp"/>
    
    <form id="enrollForm" method="post" action="update.bo" enctype="multipart/form-data">
    <input type="hidden" name="boardNo" value="${b.boardNo }">
    <div class="wrap">
        <div>
            <div class="category_wrap">
                <select required name="categoryNo" id="" style="height: 30px;">
                    <option value="3" name="categoryNo" selected>자유</option>
                    <option value="2" name="categoryNo">스터디 모집</option>
                    <option value="1" name="categoryNo">문제집 공유</option>
                </select>
            </div>
            <div class="title_box">
                제목 &nbsp; <input type="text" style="width: 390px; border-radius: 10px;" value="${b.title }" name="title" required>
            </div>
            <div id="writer_wrap">
	       		<input type="text" id="writer" value="${loginUser.userId }" name="userId" readonly>
	        </div>
        </div>
        <div>
            <div class="text_wrap">
                <textarea class="text_area" name="content" id="" cols="30" rows="10" required placeholder="Input some text.">${b.content }</textarea>
                <br><br>
                <!-- <button class="image_btn"><span style="font-size: 15px;" name="upfile">이미지 첨부</span></button> -->
                <input type="file" id="upfile" class="" name="upfile">
                	현재 업로드 된 파일 :
                	<a href="${b.bfSysName }" download="${b.bfOriginName }">${b.bfOriginName }</a>
                	<input type="hidden" name="bfOriginName" value="${b.bfOriginName }">
                	<input type="hidden" name="bfSysName" value="${b.bfSysName }">
                <button type="submit" class="submit_btn">수정하기</button>
            </div>
        </div>
    </div>
	</form>
    <div id="footer"></div>

</body>
</html>