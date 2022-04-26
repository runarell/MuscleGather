<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
    <link type="text/css" rel="stylesheet" href="../css/default.css" />
    <link type="text/css" rel="stylesheet" href="../css/admin.css" />

    <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../js/default.js"></script>
    <script type="text/javascript">
    function loginCheck() {
        let f = document.getElementById("formtag1");

        if(!f.user_email.value){
        	alert("아이디를 입력하세요.");
        	return false;
        }
        if(!f.user_pw.value){
        	alert("비밀번호를 입력하세요.");
        	return false;
        }

        $("#formtag1").submit();
    }
    	
    </script>
</head>

<body>
    <main class="idxMain">
        <section class="indexSection">
            <div class="logofont">
                <h1>the Admin</h1>
            </div>

            <div class="fromCell">
                <form action="adminLoginCheack.jsp" method="post" id="formtag1">
                    <div>
                        <input type="text" name="user_email" placeholder="아이디(이메일)">
                    </div>
                    <div>
                        <input type="password" name="user_pw" placeholder="비밀번호">
                    </div>
                    <div>
                        <input type="button" value="로그인" onclick="loginCheck()">
                    </div>
                </form>
            </div>
            <div class="foottext">
                NUT_EXCEPTION?
            </div>
        </section>
    </main>
</body>

</html>