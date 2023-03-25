<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>pammmuse_admin</title>
    <link rel="stylesheet" href="../../../css/productManage.css">

    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
</head>
</head>
<body>

<div class="wrapper">
    <div class="wrap">
        <!-- gnv_area -->
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
        <!-- top_subject_area -->
        <div class="admin_top_wrap">
            <span>pammmuse_admin</span>

        </div>
        <!-- contents-area -->
        <div class="admin_wrap">
            <!-- 네비영역 -->
            <div class="admin_navi_wrap">
                <ul>
                    <c:if test="${user.userNo == 1 }">
                    <li >
                        <a class="admin_list_01" href="/product/productEnroll">상품 등록</a>
                    </li>
                    <li>
                        <a class="admin_list_02" href="/product/productManage">상품 관리</a>
                    </li>
                    </c:if>
                </ul>
            </div>
            <div class="admin_content_wrap">
                <div class="admin_content_subject"><span>상품 관리</span></div>
            </div>
            <div class="clearfix"></div>
        </div>



    </div>    <!-- class="wrap" -->
</div>    <!-- class="wrapper" -->
<script>

    $(document).ready(function(){

        let eResult = '<c:out value="${enroll_result}"/>';

        checkResult(eResult);

        function checkResult(result){

            if(result === ''){
                return;
            }

            alert("상품'"+ eResult +"'을 등록하였습니다.");

        }

    });

    /* gnb_area 로그아웃 버튼 작동 */
    $("#gnb_logout_button").click(function(){
        //alert("버튼 작동");
        $.ajax({
            type:"POST",
            url:"/member/logout.do",
            success:function(data){
                alert("로그아웃 성공");
                document.location.reload();
            }
        }); // ajax
    });

</script>
</body>
</html>