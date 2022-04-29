//페이지 링크
$(document).ready(function () {
  $("#header").load("../html/pieceHeader.html");
  $("#admheader").load("../html/adminHeader.html");
  // $("#nav").load("../html/pieceNav.html");
  // $("#sideBar").load("/html/pieceSidebar.html");
  $("#footer").load("../html/pieceFooter.html");
});

// 페이지 오픈  이벤트
// 온오프 css
$(document).ready(function () {
  $("label[for='sideBtn1']").click(function () {
    $("#nav").toggleClass("on");
  });
});

// 스크롤 이벤트
// header action
$(window).scroll(function () {
  if ($(this).scrollTop() == 0) $("#header").css("opacity", "1");
  else $("#header").css("opacity", ".4");
});

// 박스 오픈 이벤트
//popupShift
function popup() {
  //팝업 박스 오픈
  $("#popupBox").css("display", "block");
}

// 로그인 체크 이벤트 
function loginCheck() {
    let f = document.getElementById("loginForm");

    if(!f.user_email.value){
    	alert("아이디를 입력하세요.");
    	return false;
    }
    if(!f.user_pw.value){
    	alert("비밀번호를 입력하세요.");
    	return false;
    }

    $("#loginForm").submit();
}