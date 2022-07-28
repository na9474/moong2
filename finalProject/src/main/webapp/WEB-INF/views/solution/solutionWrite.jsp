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
        
        ul {
		  padding: 16px 0;
		    margin: 0;
  padding: 0;
  list-style: none;
		}
		
		ul li {
		  display: inline-block;
		  margin: 0 5px;
		  font-size: 14px;
		  letter-spacing: -.5px;
		}
		        
		ul li.tag-item {
		  padding: 4px 8px;
		  background-color: #777;
		  color: #000;
		}
		
		.tag-item:hover {
		  background-color: #262626;
		  color: #fff;
		}
		
		.del-btn {
		  font-size: 12px;
		  font-weight: bold;
		  cursor: pointer;
		  margin-left: 8px;
		}
	</style>
	
</head>

<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br><br>
    <div class="container-md p-4 bg-white rounded">
        <h2>문제풀이 글작성</h2>
        <br>
	<form id="solutionWrite" method="post" action="write.so" enctype="multipart/form-data" accept-charset="utf-8">
        <div class="row titlebox">
            <div class="col-1" id="top-optionbox">
                <select name="subject" id="subject">
                    <option selected disabled>과목</option>
                    <option value="수학">수학</option>
                    <option value="영어">영어</option>
                    <option value="국어">국어</option>
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
        
<!--         <div style="margin-top:20px; margin-left:20px;" class="content" > -->
<!-- 	        <div style="display: flex;"> -->
<!-- 	            <h5 style="width: 120px; margin-top:10px; margin-right:0px;">해시태그 입력</h5> -->
<!-- 	            <input type="text" name="tag" id="tag" size="20" placeholder="태그입력"> -->
<!-- 	            <ul id="tag-list"> </ul> -->
<!-- 	        </div> -->

<!--   		</div> -->
  		
  		     <div class="row bottombox">
            <div class="col-12" id="bottombox">
                <button type="submit" class="btn moong-dark">작성</button>
            </div>
        </div>
	</form>
    </div>
  		
  	<script>
//   		$(document).ready(function () {

//   	    var tag = {};
//   	    var counter = 0;

//   	    // 태그를 추가한다.
//   	    function addTag(value) {
//   	      tag[counter] = value; // 태그를 Object 안에 추가
//   	      counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
//   	    }

//   	    // 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
//   	    function marginTag() {
//   	      return Object.values(tag)
//   	        .filter(function (word) {
//   	          return word !== "";
//   	        });
//   	    }

//   	    $("#tag")
//   	      .on("keyup", function (e) {
//   	        var self = $(this);
//   	        console.log("keypress");

//   	        // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
//   	        if (e.keyCode == 32) {

//   	          var tagValue = self.val(); // 값 가져오기

//   	          // 값이 없으면 동작 안합니다.
//   	          if (tagValue !== "") {

//   	            // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
//   	            var result = Object.values(tag)
//   	              .filter(function (word) {
//   	                return word === tagValue;
//   	              })

//   	            // 태그 중복 검사
//   	            if (result.length == 0) {
//   	              $("#tag-list")
//   	                .append("<li class='tag-item'>" + tagValue + "<span class='del-btn' idx='" + counter + "'>x</span></li>");
//   	              addTag(tagValue);
//   	              self.val("");
//   	            } else {
//   	              alert("태그값이 중복됩니다.");
//   	            }
//   	          }
//   	          e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
//   	        }
//   	      });

//   	    // 삭제 버튼
//   	    // 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
//   	    $(document)
//   	      .on("click", ".del-btn", function (e) {
//   	        var index = $(this)
//   	          .attr("idx");
//   	        tag[index] = "";
//   	        $(this)
//   	          .parent()
//   	          .remove();
//   	      });
//   	  })
   	</script> 
  		
    
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
                height : 800,
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
                	uploadFile(files[i],
                this);
                		}
                	}
                }
             };
            $('.summernote').summernote(setting);
            });
            

	function uploadFile(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "uploadFile",
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