<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>pammmuse_admin</title>
    <link rel="stylesheet" href="/css/main.css">
    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
    <div class="wrap">
        <div class="top_gnb_area">
            <ul class="list">
                <c:if test = "${user == null}">
                    <li >
                        <a href="/member/login">로그인</a>
                    </li>
                </c:if>
                <c:if test="${user != null }">
                    <li>
                        <a id="gnb_logout_button">로그아웃</a>
                    </li>
                </c:if>
            </ul>
        </div>
        <div class="top_area">
            <div class="logo_area">
                <h1>logo area</h1>
            </div>
            <div class="search_area">
                <h1>Search area</h1>
            </div>
            <div class="login_area">
                <!-- 로그인 하지 않은 상태 -->
                <c:if test = "${user == null}">
                    <div class="login_button"><a href="/member/login">로그인</a></div>
                </c:if>
                <!-- 로그인한 상태 -->
                <c:if test="${user != null}">
                    <div class="login_success_area">
                        <span>회원 : ${user.name}</span>
                        <a href="/member/logout.do">로그아웃</a>
                    </div>
                </c:if>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="navi_bar_area">
            <h1>navi area</h1>
        </div>
        <div class="content_area">
            <h1>content area</h1>
        </div>
    </div>
</div>
<script>

    /* gnb_area 로그아웃 버튼 작동 */
    $("#gnb_logout_button").click(function(){
        //alert("버튼 작동");
        $.ajax({
            type:"POST",
            url:"/member/logout.do",
            success:function(data){//HTTP 요청 성공 시 이벤트 핸들러
                // alert("로그아웃 성공");
                document.location.reload();
            }
        }); // ajax
    });

</script>
</body>
</html>