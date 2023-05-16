<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>pammmuse_admin</title>
    <link rel="stylesheet" href="../../../css/orderList.css">

    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
</head>


<body class="wrapper">
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
                    <li>
                        <a class="admin_list_03" href="/notice/noticeEnroll">공지 등록</a>
                    </li>
                </c:if>
            </ul>
        </div>
        <div class="admin_content_wrap">
            <div class="admin_content_subject"><span>주문 현황</span></div>

            <div class="product_table_wrap">
                <!-- 상품 리스트 O -->
                <c:if test="${listcheck != 'empty'}">
                    <table class="order_table">
                    <colgroup>
                        <col width="21%">
                        <col width="20%">
                        <col width="20%">
                        <col width="20%">
                        <col width="19%%">
                    </colgroup>
                    <thead>
                    <tr>
                        <td class="th_column_1">주문 번호</td>
                        <td class="th_column_2">주문 아이디</td>
                        <td class="th_column_3">주문 날짜</td>
                        <td class="th_column_4">주문 상태</td>
                        <td class="th_column_5">취소</td>
                    </tr>
                    </thead>
                    <c:forEach items="${list}" var="list">
                        <tr>
                            <td><c:out value="${list.order_id}"></c:out> </td>
                            <td><c:out value="${list.username}"></c:out></td>
                            <td><fmt:formatDate value="${list.order_date}" pattern="yyyy-MM-dd"/></td>
                            <td><c:out value="${list.order_state}"/></td>
                            <c:if test="${list.order_state == '배송준비' }">
                            <td>
                                <button class="delete_btn" data-orderid="${list.order_id}">취소</button>
                            </td>
                            </c:if>
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

            <div class="clearfix"></div>
            <form id="deleteForm" action="/member/orderCancle" method="post">
                <input type="hidden" name="order_id">
            </form>
        </div>
    </div>    <!-- class="wrap" -->
</div>    <!-- class="wrapper" -->


<script>

    $(".delete_btn").on("click", function(e){

        e.preventDefault();

        let id = $(this).data("orderid");

        $("#deleteForm").find("input[name='order_id']").val(id);
        $("#deleteForm").submit();
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