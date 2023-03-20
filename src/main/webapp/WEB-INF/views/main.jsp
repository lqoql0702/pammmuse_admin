<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>pammmuse_admin</title>
    <link rel="stylesheet" href="/css/main.css">
</head>
<body>

<div class="wrapper">
    <div class="wrap">
        <div class="top_gnb_area">
            <h1>gnb area</h1>
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

</body>
</html>