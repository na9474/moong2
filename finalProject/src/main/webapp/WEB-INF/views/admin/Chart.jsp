<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
	<style>
        @font-face {
        font-family: '양진체';
        src: url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff') format('woff');
        font-weight: normal;
        font-style: normal;
        }
        
        * {
            font-family: '양진체';
            text-align: center;
            vertical-align : middle;
        }

        .container-md {
            max-width: 1200px;
        }

        .row {
        	padding: 30px;
        	text-align: center;
        	border-bottom: 1.5px dotted rgb(101, 112, 150);
        }

        .title {
        	background-color: rgb(213, 218, 235);
        	color: black;
        	height: 95px;
        }

        .table {
        	padding-top: 12%;
        }

        table {
        	width: 100%;
        	height: 50%;
	        margin: auto;
        }
       
    </style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<br><br>
		<div class="container-md p-4 bg-white rounded">
			<div class="row member">
	            <div class="col-2 table">
	                <table>
		                <tr>
		                    <td>가입자수</td>
		                    <td>${allMemCount}</td>
		                </tr>
		                <tr>
		                    <td>선생수</td>
		                    <td>${allTeaCount}</td>
		                </tr>
		                <tr>
		                    <td>학생수</td>
		                    <td>${allStuCount}</td>
		                </tr>
	                </table>
	            </div>
	            <div class="col-10 line">
	                <canvas id="monthMember" width="800" style="display: inline-block;"></canvas>
	            </div>
	        </div>
	        
	        <div class="row matching">
	            <div class="col-2 table">
	                <table>
		                <tr>
		                    <td>매칭수</td>
		                    <td>${matchCount}</td>
		                </tr>
		                <tr>
		                    <td>매칭완료수</td>
		                    <td>${matchComCount}</td>
		                </tr>
	                </table>
	            </div>
	            
	            <div class="col-10 bar">
	                <canvas id="monthMatch" width="800" style="display: inline-block;"></canvas>
	            </div>
	            
	        </div>
	        <div class="row student">
	            <div class="col-4 polar">
	                <canvas id="koGrade" height="380" style="display: inline-block;"></canvas>
	            </div>
	            
	            <div class="col-4 polar">
	                <canvas id="engGrade" height="380" style="display: inline-block;"></canvas>
	            </div>
	            
	          	<div class="col-4 polar">
	                <canvas id="mathGrade" height="380" style="display: inline-block;"></canvas>
	            </div>
	        </div>
	        
	        <div class="row teacher">
	            <div class="col-6 pie">
	                <canvas id="subjectTeacher" height="400" style="display: inline-block;"></canvas>
	            </div>
	            <div class="col-6 pie">
	                <canvas id="styleTeacher" height="400" style="display: inline-block;"></canvas>
	            </div> 
	        </div>
        </div>
        
		 <script>
		 
            //월별 가입자수
            var mm = document.getElementById('monthMember').getContext('2d');
            var monthMember = new Chart(mm, {
                type: 'line',
                data: {
                    labels: [<c:forEach var="item" items="${monthMemLabel}"> 
                    "${item}",
                    </c:forEach>],
                    datasets: [{
                        label: '회원수', // 데이터 시트 제목
                        data: [<c:forEach var="item" items="${monthMemCounts}"> 
                        "${item}",
                        </c:forEach>], //데이터 값
                        backgroundColor: [ //막대 색상
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                        ],
                        borderColor: [ //막대 테두리 색상
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)',
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1 //막대 테두리 굵기
                    }]
                },
                options: {
                    responsive: false,
                    plugins: {
                        title: { // [차트 타이틀 지정 실시]
                            display: true,
                            text: '월별 가입자수',
                            color: 'rgb(13, 28, 83)', // [타이틀 폰트 색상]
                            font: { // [타이틀 폰트 스타일 변경]
                                family: 'Comic Sans MS',
                                size: 20,
                                weight: 'bold',
                                lineHeight: 1.2,
                            },
                            padding: { top: 20, left: 0, right: 0, bottom: 0 }
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
            
            //월별매칭수
            var bpm = document.getElementById('monthMatch').getContext('2d');
            var monthMatch = new Chart(bpm, {
                type: 'bar',
                data: {
                    labels: [<c:forEach var="item" items="${monthMatchLabel}"> 
                    "${item}",
                    </c:forEach>],
                    datasets: [{
                        label: '매칭수', // 데이터 시트 제목
                        data: [<c:forEach var="item" items="${monthMatchCounts}"> 
                        "${item}",
                        </c:forEach>], //데이터 값
                        backgroundColor: [ //막대 색상
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                        ],
                        borderColor: [ //막대 테두리 색상
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)',
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1 //막대 테두리 굵기
                    }]
                },
                options: {
                    responsive: false,
                    plugins: {
                        title: { // [차트 타이틀 지정 실시]
                            display: true,
                            text: '월별 매칭 완료수',
                            color: 'rgb(13, 28, 83)', // [타이틀 폰트 색상]
                            font: { // [타이틀 폰트 스타일 변경]
                                family: 'Comic Sans MS',
                                size: 20,
                                weight: 'bold',
                                lineHeight: 1.2,
                            },
                            padding: { top: 20, left: 0, right: 0, bottom: 0 }
                        }
                    },
    
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
            
            //국어등급
            var kg = document.getElementById('koGrade').getContext('2d');
            var koGrade = new Chart(kg, {
                type: 'polarArea',
                data: {
                    labels: [<c:forEach var="item" items="${koGradeLabel}"> 
                    "${item}",
                    </c:forEach>],
                    datasets: [{
                        label: '# of Votes', // 데이터 시트 제목
                        data: [<c:forEach var="item" items="${koGradeCounts}"> 
                        "${item}",
                        </c:forEach>], //데이터 값
                        backgroundColor: [ //막대 색상
                            "coral",
                            "forestgreen",
                            "cadetblue",
                            "greenyellow ",
                            "khaki ",
                            "hotpink",
                            "mediumslateblue",
                            "darkred",
                            "turquoise",
                            "lightskyblue",
                            "lightpink",
                            "darkseagreen"
                        ],
                        borderColor: [ //막대 테두리 색상
                            "coral",
                            "forestgreen",
                            "cadetblue",
                            "greenyellow ",
                            "khaki ",
                            "hotpink",
                            "mediumslateblue",
                            "darkred",
                            "turquoise",
                            "lightskyblue",
                            "lightpink",
                            "darkseagreen"
                        ],
                        borderWidth: 1 //막대 테두리 굵기
                    }]
                },
                options: {
                    responsive: false,
                    plugins: {
                            animation: {
                                animateScale: true,   // true일 경우 차트 생성시 중앙에서부터 커지는 애니메이션. 
                                animateRotate: true   // true일 경우 차트 생성시 회전 애니메이션.
                                },
                                
                        title: { // [차트 타이틀 지정 실시]
                            display: true,
                            text: '국어 등급별 인원수',
                            color: 'rgb(13, 28, 83)', // [타이틀 폰트 색상]
                            font: { // [타이틀 폰트 스타일 변경]
                                family: 'Comic Sans MS',
                                size: 20,
                                weight: 'bold',
                                lineHeight: 1.2,
                            },
                            padding: { top: 20, left: 0, right: 0, bottom: 0 }
                        }
                
                    },
                    maintainAspectRatio:false,
                }
            });
            
         	//영어등급
            var eg = document.getElementById('engGrade').getContext('2d');
            var engGrade = new Chart(eg, {
                type: 'polarArea',
                data: {
                    labels: [<c:forEach var="item" items="${engGradeLabel}"> 
                    "${item}",
                    </c:forEach>],
                    datasets: [{
                        label: '# of Votes', // 데이터 시트 제목
                        data: [<c:forEach var="item" items="${engGradeCounts}"> 
                        "${item}",
                        </c:forEach>], //데이터 값
                        backgroundColor: [ //막대 색상
                            "coral",
                            "forestgreen",
                            "cadetblue",
                            "greenyellow ",
                            "khaki ",
                            "hotpink",
                            "mediumslateblue",
                            "darkred",
                            "turquoise",
                            "lightskyblue",
                            "lightpink",
                            "darkseagreen"
                        ],
                        borderColor: [ //막대 테두리 색상
                            "coral",
                            "forestgreen",
                            "cadetblue",
                            "greenyellow ",
                            "khaki ",
                            "hotpink",
                            "mediumslateblue",
                            "darkred",
                            "turquoise",
                            "lightskyblue",
                            "lightpink",
                            "darkseagreen"
                        ],
                        borderWidth: 1 //막대 테두리 굵기
                    }]
                },
                options: {
                    responsive: false,
                    plugins: {
                            animation: {
                                animateScale: true,   // true일 경우 차트 생성시 중앙에서부터 커지는 애니메이션. 
                                animateRotate: true   // true일 경우 차트 생성시 회전 애니메이션.
                                },
                                
                        title: { // [차트 타이틀 지정 실시]
                            display: true,
                            text: '영어 등급별 인원수',
                            color: 'rgb(13, 28, 83)', // [타이틀 폰트 색상]
                            font: { // [타이틀 폰트 스타일 변경]
                                family: 'Comic Sans MS',
                                size: 20,
                                weight: 'bold',
                                lineHeight: 1.2,
                            },
                            padding: { top: 20, left: 0, right: 0, bottom: 0 }
                        }
                
                    },
                    maintainAspectRatio:false,
                }
            });

         	//수학등급
            var mg = document.getElementById('mathGrade').getContext('2d');
            var mathGrade = new Chart(mg, {
                type: 'polarArea',
                data: {
                    labels: [<c:forEach var="item" items="${mathGradeLabel}"> 
                    "${item}",
                    </c:forEach>],
                    datasets: [{
                        label: '# of Votes', // 데이터 시트 제목
                        data: [<c:forEach var="item" items="${mathGradeCounts}"> 
                        "${item}",
                        </c:forEach>], //데이터 값
                        backgroundColor: [ //막대 색상
                            "coral",
                            "forestgreen",
                            "cadetblue",
                            "greenyellow ",
                            "khaki ",
                            "hotpink",
                            "mediumslateblue",
                            "darkred",
                            "turquoise",
                            "lightskyblue",
                            "lightpink",
                            "darkseagreen"
                        ],
                        borderColor: [ //막대 테두리 색상
                            "coral",
                            "forestgreen",
                            "cadetblue",
                            "greenyellow ",
                            "khaki ",
                            "hotpink",
                            "mediumslateblue",
                            "darkred",
                            "turquoise",
                            "lightskyblue",
                            "lightpink",
                            "darkseagreen"
                        ],
                        borderWidth: 1 //막대 테두리 굵기
                    }]
                },
                options: {
                    responsive: false,
                    plugins: {
                            animation: {
                                animateScale: true,   // true일 경우 차트 생성시 중앙에서부터 커지는 애니메이션. 
                                animateRotate: true   // true일 경우 차트 생성시 회전 애니메이션.
                                },
                                
                        title: { // [차트 타이틀 지정 실시]
                            display: true,
                            text: '수학 등급별 인원수',
                            color: 'rgb(13, 28, 83)', // [타이틀 폰트 색상]
                            font: { // [타이틀 폰트 스타일 변경]
                                family: 'Comic Sans MS',
                                size: 20,
                                weight: 'bold',
                                lineHeight: 1.2,
                            },
                            padding: { top: 20, left: 0, right: 0, bottom: 0 }
                        }
                
                    },
                    maintainAspectRatio:false,
                }
            });
            
         	//과목별 선생수
            var st = document.getElementById('subjectTeacher').getContext('2d');
            var subjectTeacher = new Chart(st, {
                type: 'pie',
                data: {
                    labels: [<c:forEach var="item" items="${subjectTeacherLabel}"> 
                    "${item}",
                    </c:forEach>],
                    datasets: [{
                        label: '# of Votes', // 데이터 시트 제목
                        data: [<c:forEach var="item" items="${subjectTeacherCounts}"> 
                        "${item}",
                        </c:forEach>], //데이터 값
                        backgroundColor: [ //막대 색상
                            "coral",
                            "mediumslateblue",
                            "greenyellow "
                        ],
                        borderColor: [ //막대 테두리 색상
                            "coral",
                            "mediumslateblue",
                            "greenyellow "
                        ],
                        borderWidth: 1 //막대 테두리 굵기
                    }]
                },
                options: {
                    responsive: false,
                    plugins: {
                            animation: {
                                animateScale: true,   // true일 경우 차트 생성시 중앙에서부터 커지는 애니메이션. 
                                animateRotate: true   // true일 경우 차트 생성시 회전 애니메이션.
                                },
                                
                        title: { // [차트 타이틀 지정 실시]
                            display: true,
                            text: '과목별 선생수',
                            color: 'rgb(13, 28, 83)', // [타이틀 폰트 색상]
                            font: { // [타이틀 폰트 스타일 변경]
                                family: 'Comic Sans MS',
                                size: 20,
                                weight: 'bold',
                                lineHeight: 1.2,
                            },
                            padding: { top: 20, left: 0, right: 0, bottom: 0 }
                        }
                
                    },
                    maintainAspectRatio:false,
                }
            });
            
         	//선생 과외스타일
            var st = document.getElementById('styleTeacher').getContext('2d');
            var styleTeacher = new Chart(st, {
                type: 'pie',
                data: {
                    labels: [<c:forEach var="item" items="${styleTeacherLabel}"> 
                    "${item}",
                    </c:forEach>],
                    datasets: [{
                        label: '# of Votes', // 데이터 시트 제목
                        data: [<c:forEach var="item" items="${styleTeacherCounts}"> 
                        "${item}",
                        </c:forEach>], //데이터 값
                        backgroundColor: [ //막대 색상
                            "coral",
                            "mediumslateblue",
                            "greenyellow "
                        ],
                        borderColor: [ //막대 테두리 색상
                            "coral",
                            "mediumslateblue",
                            "greenyellow "
                        ],
                        borderWidth: 1 //막대 테두리 굵기
                    }]
                },
                options: {
                    responsive: false,
                    plugins: {
                            animation: {
                                animateScale: true,   // true일 경우 차트 생성시 중앙에서부터 커지는 애니메이션. 
                                animateRotate: true   // true일 경우 차트 생성시 회전 애니메이션.
                                },
                                
                        title: { // [차트 타이틀 지정 실시]
                            display: true,
                            text: '과외스타일별 선생수',
                            color: 'rgb(13, 28, 83)', // [타이틀 폰트 색상]
                            font: { // [타이틀 폰트 스타일 변경]
                                family: 'Comic Sans MS',
                                size: 20,
                                weight: 'bold',
                                lineHeight: 1.2,
                            },
                            padding: { top: 20, left: 0, right: 0, bottom: 0 }
                        }
                
                    },
                    maintainAspectRatio:false,
                }
            });
         </script>
		
	</div>
</body>

</html>