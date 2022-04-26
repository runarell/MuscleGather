<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*"%>

<% request.setCharacterEncoding("UTF-8"); %>    
 
<%
	BoardAllDAO boDAO = new BoardAllDAO();
	ArrayList<BoardsDTO> notice = boDAO.notice_board(10);
	ArrayList<BoardsDTO> ask = boDAO.ask_board();
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
</head>

<body>
    <div class="wrap">
        <!-- header-->
        <header id="admheader">

        </header>

        <!-- hidden nav-->
        <nav id="admnav"></nav>

        <main>
            <div class="mainWrap">

                <section class="sec1">

                    <div class="grid boardCell">

                        <div class="miniboard bd1">
                            <div class="board_titel">
                                <a href="">
                                    <h3>공지사항</h3>
                                </a>
                            </div>

                            <div class="board titel">
                                <div>번호</div>
                                <div>제목</div>
                                <div>조횟수</div>
                                <div>날짜</div>
                            </div>
							<% for(BoardsDTO bo1 : notice){ %>
                            <div class="board text" onclick="location.href='#<%=bo1.getBoards_no() %>>'">
                                <div><%=bo1.getBoards_no()%></div>
                                <div><%=bo1.getBoards_title()%></div>
                                <div><%=bo1.getView_cnt()%></div>
                                <div><%=bo1.getBoards_regdate()%></div>
                            </div>
							<%}%>
                        </div>


                        <div class="miniboard bd2">
                            <div class="board_titel">
                                <a href="">
                                    <h3>자주묻는 질문</h3>
                                </a>
                            </div>

                            <div class="board titel">
                                <div>번호</div>
                                <div>제목</div>
                            </div>

							<% for(BoardsDTO bo2 : ask){ %>
                            <div class="board text">
                                <div><%=bo2.getBoards_no()%></div>
                                <div><%=bo2.getBoards_title() %></div>
                            </div>
							<%}%>
                        </div>

                        <div class="miniboard bd1">
                            <div class="board_titel">
                                <a href="">
                                    <h3>트레이너</h3>
                                </a>
                            </div>

                            <div class="board titel">
                                <div>번호</div>
                                <div>이름</div>
                                <div>조횟수</div>
                                <div>날짜</div>
                            </div>

                            <div class="board text">
                                <div>1</div>
                                <div>장규환</div>
                                <div>11</div>
                                <div>2022-04-01</div>
                            </div>
                        </div>
                        <div class="miniboard bd1">
                            <div class="board_titel">
                                <a href="">
                                    <h3>핼스장</h3>
                                </a>
                            </div>

                            <div class="board titel">
                                <div>번호</div>
                                <div>헬스장 이름</div>
                                <div>조횟수</div>
                                <div>날짜</div>
                            </div>

                            <div class="board text">
                                <div>1</div>
                                <div>근섬유로 줄넘기GMY</div>
                                <div>22</div>
                                <div>2022-04-01</div>
                            </div>
                        </div>



                    </div>
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
</body>

</html>