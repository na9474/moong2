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

        #top-line{
            border: 1px solid black;
            border-top: none;
            border-left: none;
            border-right: none;
        }

        #topwr{
            margin: auto;
            text-align: right;
            font-size: 13px;
        }

        #topda{
            margin: auto;
            text-align: left;
            font-size: 13px;
        }

        #tophe{
            margin: auto;
            text-align: left;
        }

        #co-contentText{
		    margin-top: 20px;
		    margin-bottom: 5px;
		    box-sizing: border-box;
		    border: 1px solid black;
            border-top: none;
            border-left: none;
            border-right: none;
		    width: 800px;
		    height: 600px;
		}

        #modifybut{
            text-align: right;
            padding-right: 0px;
        }

        #deletebut{
            text-align: left;
        }

        #cmtfi{
            text-align: right;
            padding-top: 35px;
        }

        #cmtda{
            text-align: center;
            padding-top: 4px;
        }

        #dropdownMenuButton{
            background-color: white;
            color: black;
            border: none;
        }

        #cmtcon{
            padding-top: 4px;
        }

        #tolist{
            border: 1px solid black;
            border-top: none;
            border-left: none;
            border-right: none;
            padding-top: 10px;
        }

        #tit-line{
            background-color: rgb(49, 48, 47);
            color: white;
        }

        #table-line{
            text-align: center;
        }
        
        #scbutton{
            padding-left: 1px;
        }
        
        #textBox{
            padding-right: 0px;
        }
        
        #cmtTextBox{
            height: 100px;
        }

        #cmtBtn{
            height: 100px;
        }
	</style>
	
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br>
	<div class="container-md p-4 bg-white rounded">
    <br><br><br><br><br>

        <div class="row topline" id="top-line">

            <div class="col-7">
                <h3>${s.title}</h3>
            </div>

            <div class="col-2" id="topwr">${s.userId}</div>

            <div class="col-2" id="topda">${s.createDate}</div>

            <div class="col-1" id="tophe">
                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                    <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                </svg>
            </div>

        </div>

        <div class="row contents">
            <div class="col-12" id="co-contentText">${s.solutionContents}</div>
        </div>

        <div class="row etc">
            <div class="col-10"></div>
            <div class="col-1" id="modifybut">
                <a class="btn moong-dark" onclick="postFormSubmit(1)">수정</a>
            </div>
            <div class="col-1" id="deletebut">
                <a class="btn moong-dark" onclick="postFormSubmit(2)">삭제</a>
            </div>
        </div>
        
        <form id="postForm" action="" method="post">
            <input type="hidden" name="sno" value="${s.solutionNo}">
            <input type="hidden" name="filePath" value="${sf.sfSysName}">
        </form>
                  
        <script>
           		function postFormSubmit(num){
            	if(num==1){
            		$("#postForm").attr("action","updateForm.bo").submit();
            	}else{
            		$("#postForm").attr("action","delete.so").submit();
            	}
            }
        </script>
            
        <br>
        <h4>답변</h4>
        <br>
        <div class="row cmtWriter" id="row-comtWriter">
            <div class="col-1" id="cmtfi">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
                    <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                    <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
                </svg>
            </div>
            <div class="col-10" id="textBox">
                <input type="text" class="form-control" id="cmtTextBox">
            </div>
            <div class="col-1" id="scbutton">
                <button type="button" class="btn moong-dark" id="cmtBtn">작성</button>
            </div>
        </div>
        <br><br>
        <div class="row cmtWriter" id="row-comtWriter">
            <div class="col-1">뉴턴</div>
            <div class="col-8" id="cmtcon">ABCDEFGHIJKLMNOPQRSTUVWXYZ</div>
            <div class="col-2" id="cmtda">2222-22-22</div>
            <div class="col-1">
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
                      ...
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                      <a class="dropdown-item" href="#">수정</a>
                      <a class="dropdown-item" href="#">삭제</a>
                      <a class="dropdown-item" href="#">신고</a>
                    </div>
                  </div>
            </div>
        </div>
        <br><br><br><br>
        <div class="to list">
            <a class="btn moong-yellow" href="list.so">목록</a>
        </div>
        <div class="col-12" id="tolist"></div>
        <br><br>
        <h4>관련 문제풀이</h4>

        <table class="table table-hover" id="table-line">
            <thead id="tit-line">
              <tr>
                <th scope="col">번호</th>
                <th scope="col">과목</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">조회수</th>
                <th scope="col">작성일</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">2</th>
                <td>수학</td>
                <td>1+1=</td>
                <td>피타고라스</td>
                <td>9999</td>
                <td>2222-22-22</td>
              </tr>
              <tr>
                <th scope="row">1</th>
                <td>국어</td>
                <td>진달래꽃</td>
                <td>김소월</td>
                <td>9999</td>
                <td>2222-22-22</td>
              </tr>
              
            </tbody>
        </table>
</body>
</html>