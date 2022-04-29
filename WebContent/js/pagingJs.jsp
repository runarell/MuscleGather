<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*"%>
<% request.setCharacterEncoding("UTF-8"); %>    
 
<%
	int pageCont = (new BoardAllDAO()).noticeCont();
%>
<script>

        $(document).ready(function () {
            let pagingLen = <%=pageCont%>;					// 전체 컨텐츠 수
            let outLeng = $("#outLeng").val();				// 출력 컨탠츠 수
            let lastPage = Math.ceil( pagingLen/outLeng );	// 마지막 페이지 번호
            let page = $(this).attr("data-page");			// 현재 펴이지
            
            console.log( "pagingLen:"+pagingLen );
            console.log( "outLeng:"+outLeng );
            console.log( "lastPage:"+lastPage );

            // 버튼 초기화
            $(".pagingBox").append("<div data-page='" + 1 + "' class='hidden'> << </div > ");
            $(".pagingBox").append("<div data-page='" + 1 + "' class='hidden'> < </div > ");
            for (let i = 1; i <= lastPage; i++) {
                $(".pagingBox").append("<div data-page='" + i + "'>" + i + "</div>");
            }
            $(".pagingBox").append("<div data-page='" + 3 + "'> > </div > ");
            $(".pagingBox").append("<div data-page='" + lastPage + "' > >> </div > ");
            // on class 초기화
            $(".pagingBox>div").eq(2).addClass("on");

            // 기본 컨텐츠 가져오기
            pageGetter();
			
            
            // 클릭시 event
            $(".pagingBox > div").click(function () {
                let page = $(this).attr("data-page");
                pagingBtn(page);
                pageGetter();
            });
            
            // 선택시 변환
            $("#outLeng").change( function(){
            	// 필드값 제설정
            	outLeng = $("#outLeng").val();
            	lastPage = Math.ceil( pagingLen/outLeng );
            	
            	pagingBtn(page);
            	pageGetter();
        	});
			
            // 선택시 event
            

            function pageGetter() {
                //페이징 실행 위치
                $.ajax({
                    url: "noticeListGetter.jsp",        // 목적지
                    type: "POST",                       // HTTP Method
                    data: $("#formtag1").serialize(),   // 전송 데이터
                    dataType: 'html',                   // 전송 데이터 형식
                    success: function (html) {          // 성공 시 실행
                        $("#contents").html(html);
                    },
                    error: function (er) {              //실패 시 실행
                        alert("실패 원인 : " + er);
                    }
                });
            }

            // 페이징 번호 조작
            function pagingBtn(page) {
                let pageno = parseInt(page);           	// 현제 페이지 숫자
                $("#pagenum").attr("value", pageno);
                
                let start = pageno - (pagingLen/2);  	// 시작버튼 번호
                if (start < 1) start = 1; 				// 시작은 1부터( 0,음수 안됨)

                let end = start + pagingLen; 			// 마지막 숫자
                if (end > lastPage) {
                    end = lastPage;  					// 마지막은 lastPage 이상일 수 없다.
                }

                let pageList = $(".pagingBox>div");
                pageList.removeClass("on hidden");


                // 페이지 왼쪽 이동
                if (pageno == 1) {
                    pageList.eq(0).addClass("hidden");
                    pageList.eq(1).addClass("hidden");
                }
                for (let i = 2; i < (2+lastPage); i++) {
                    let no = i + start - 2;

                    pageList.eq(i).attr("data-page", no).html(no);

                    if (no == pageno) {// 선택 페이지 이면
                        pageList.eq(1).attr("data-page", no - 1);
                        pageList.eq(i).addClass("on");
                        $("#startNum").val(  (i-2)*outLeng );
                        pageList.eq(pagingLen + 2).attr("data-page", no + 1)
                    }
                }
                // 페이지 오른쪽 이동
                if (pageno == lastPage) {
                    pageList.eq(lastPage + 2).addClass("hidden");
                    pageList.eq(lastPage + 3).addClass("hidden");
                }
            }
        });
    </script>