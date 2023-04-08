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
                    <c:if test="${user.user_no == 1 }">
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

                <div class="goods_table_wrap">
                    <!-- 상품 리스트 O -->
                    <c:if test="${listcheck != 'empty'}">
                        <table class="product_table">
                            <thead>
                            <tr>
                                <td class="th_column_1">상품 번호</td>
                                <td class="th_column_2">상품 이름</td>
                                <td class="th_column_3">등록날짜</td>
                            </tr>
                            </thead>
                            <c:forEach items="${list}" var="list">
                                <tr>
                                    <td><c:out value="${list.id}"></c:out></td>
                                    <td><c:out value="${list.product_name}"></c:out></td>
                                    <td><fmt:formatDate value="${list.reg_date}" pattern="yyyy-MM-dd"/></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                    <!-- 상품 리스트 X -->
                    <c:if test="${listCheck == 'empty'}">
                        <div class="table_empty">
                            등록된 상품이 없습니다.
                        </div>
                    </c:if>
                </div>

                <!-- 검색 영역 -->
                <div class="search_wrap">
                    <form id="searchForm" action="/admin/productManage" method="get">
                        <div class="search_input">
                            <input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                            <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                            <input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                            <input type="hidden" name="type" value="G">
                            <button class='btn search_btn'>검 색</button>
                        </div>
                    </form>
                </div>

                <!-- 페이지 이름 인터페이스 영역 -->
                <div class="pageMaker_wrap">
                    <ul class="pageMaker">

                        <!-- 이전 버튼 -->
                        <c:if test="${pageMaker.prev }">
                            <li class="pageMaker_btn prev">
                                <a href="${pageMaker.pageStart -1}">이전</a>
                            </li>
                        </c:if>

                        <!-- 페이지 번호 -->
                        <c:forEach begin="${pageMaker.pageStart }" end="${pageMaker.pageEnd }" var="num">
                            <li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
                                <a href="${num}">${num}</a>
                            </li>
                        </c:forEach>

                        <!-- 다음 버튼 -->
                        <c:if test="${pageMaker.next}">
                            <li class="pageMaker_btn next">
                                <a href="${pageMaker.pageEnd + 1 }">다음</a>
                            </li>
                        </c:if>
                    </ul>
                </div>

                <form id="moveForm" action="/admin/goodsManage" method="get" >
                    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                    <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                </form>
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