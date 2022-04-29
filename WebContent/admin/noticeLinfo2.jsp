<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*"%>
<% request.setCharacterEncoding("UTF-8"); %>    
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
	
	<jsp:include page="../js/pagingJs.jsp" flush="true"/>
	
</head>

<body>
    <form id="formtag1">
        
        <section class="sec1">
	         <!-- 컨탠츠 구역 -->
	         <!-- ========================================================= -->
	         <!-- 옵션 선택부  -->
	         <div class="option">
	             <form action="" method="">
	                 <div class="formCell">
	                     <div>
	                     <!-- 
	                         <select>
	                             <option>리스트출력</option>
	                             <option value="10">10</option>
	                             <option value="50">50</option>
	                         </select>
	                      -->
	                     <input type="text" id="outLeng" name="outLeng" value="10">
       					 <input type="hidden" id="startNum" name="startNum" value="0">
	                      
	                     </div>
	
	                     <div>
	                         <input type="text" class="" placeholder="검색">
	                     </div>
	                 </div>
	             </form>
	         </div>
	         <!-- 페이지 컨텐츠 -->
	         <div class="mainboard bd3"  id="contents">
	             
	         </div>
	         <!-- 페이징 버튼 -->
	         <div class="pagingBox">
	         </div>
	         <!-- ========================================================= -->
	     </section>
    </form>
</body>

</html>