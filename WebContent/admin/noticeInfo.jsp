<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*"%>

<% request.setCharacterEncoding("UTF-8"); %>    
<% 

String no = request.getParameter("no");	
BoardsDTO bo = (new BoardAllDAO() ).notice(no);

%>
<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
    <link type="text/css" rel="stylesheet" href="../css/default.css" />
    <link type="text/css" rel="stylesheet" href="../css/adminMain.css" />

    <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../js/default.js"></script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- postcod api-->
    <script type="text/javascript" src="../js/postcode.js"></script>
    <style>
        .boardContent .textarea2 {
            width: 100%;
        }

        .boardContent .textarea2 textarea {
            width: 80%;
            height: 400px;
            resize: none;
            overflow-y: scroll;
        }
    </style>
    
    <script>
		
        function boardBodify() {
            let f = document.getElementById("formtag1");

            if (!f.notice_title.value) {
                alert("제목을 입력하세요.");
                return false;
            }
            if (!f.notice_content.value) {
                alert("공지사항을 입력하세요.");
                return false;
            }
			
            $("#formtag1").submit();
        }
        function boardDelet(no) {
            if (confirm("정말 삭제하시겠습니까??") == true) {    //확인
                console.log("삭제");
            	location.href='noticeDelet.jsp?no='+no;

            } else {   //취소
                console.log("취소");
                return false;
            }
        }

    </script>
	
</head>

<body>
    <div class="wrap">
        <!-- header-->
        <header id="admheader">

        </header>

        <!-- hidden nav-->
        <nav id="nav"></nav>

        <main>
            <div class="mainWrap">
                <section class="sec1">
                    <!-- 컨탠츠 구역 -->
                    <!-- ========================================================= -->
                    <form action="noticeUpload.jsp" method="post" id="formtag1" enctype="multipart/form-data">
                    <div class="boardHaeder">
                        <div class="topTitle">
                            <h1>공지내용</h1>
                        </div>
                        <div>
                            <label for="btn1" class="btn" onclick="boardBodify();"> 게시판수정 </label>
                                <input type=" button" class="hidden" id="btn1">
                            <label for=""> / </label>
                            <label for="btn2" class="btn" onclick="boardDelet(<%=bo.getBoards_no() %>)"> 게시판삭제 </label>
                            <input type="button" class="hidden" id="btn2">
                        </div>
                    </div>
                    <div class="boardContent">
                    	<input type="hidden" name="notice_no" value="<%=bo.getBoards_no() %>">
                        <div><label for="">번호</label><input type="text" value="<%=bo.getBoards_no() %>" disabled></div>
                        <div><label for="">제목</label><input type="text" name="notice_title" value="<%=bo.getBoards_title()%>"></div>

                        <div class="textarea2">
                            <label for="">공지내용</label>
                            <textarea name="notice_content"><%=bo.getBoards_content()%></textarea>
                        </div>
                        <div class="imglist">
                            <div>
                                <label for="">이미지</label>
                                <input type="file" name="notice_images">
                            </div>

                            <div class="imgslid">
                                <figure>
                                    <span class="del_img" onclick="">X</span>
                                    <img src="../upload/<%=bo.getBoards_images() %>" alt="">
                                </figure>

                            </div>
                        </div>
                        <div>
                            <label for="">등록날짜</label><input type="text" value="<%=bo.getBoards_regdate()%>" disabled>
                        </div>
                        <div>
                            <label for="">조횟수</label><input type="text" value="<%=bo.getView_cnt() %>" disabled>
                        </div>
                    </div>
</form>
                    <!-- ========================================================= -->
                </section>

            </div>
        </main>

        <footer id="footer">

        </footer>

        <!-- side butten -->
        <article id="sideBtn">
            <div class="sideLinkWrap">
                <label id="" for="">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </label>
            </div>
        </article>
    </div>
</body> </html>