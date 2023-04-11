<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>pammmuse_admin</title>
    <link rel="stylesheet" href="../../../css/productDetail.css">

    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
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
                    <c:if test="${user.user_no == 1}">
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
                <div class="admin_content_subject"><span>상품 상세</span></div>

                <div class="admin_content_main">

                    <div class="form_section">
                        <div class="form_section_title">
                            <label>제품명</label>
                        </div>
                        <div class="form_section_content">
                            <input name="product_name" value="<c:out value="${productInfo.product_name}"/>" disabled>
                        </div>
                    </div>
                    <div class="form_section">
                        <div class="form_section_title">
                            <label>등록 날짜</label>
                        </div>
                        <div class="form_section_content">
                            <input value="<fmt:formatDate value='${productInfo.regDate}' pattern='yyyy-MM-dd'/>" disabled>
                        </div>
                    </div>

                    <div class="form_section">
                        <div class="form_section_title">
                            <label>카테고리</label>
                        </div>
                        <div class="form_section_content">
                            <div class="cate_wrap">
                                <span>대분류</span>
                                <select class="cate1" disabled>
                                    <option  value="none">선택</option>
                                </select>
                            </div>
                            <div class="cate_wrap">
                                <span>중분류</span>
                                <select class="cate2" disabled>
                                    <option  value="none">선택</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form_section">
                        <div class="form_section_title">
                            <label>상품 가격</label>
                        </div>
                        <div class="form_section_content">
                            <input name="product_price" value="<c:out value="${productInfo.product_price}"/>" disabled>
                        </div>
                    </div>
                    <div class="form_section">
                        <div class="form_section_title">
                            <label>상품 재고</label>
                        </div>
                        <div class="form_section_content">
                            <input name="product_stock" value="<c:out value="${productInfo.product_stock}"/>" disabled>
                        </div>
                    </div>
                    <div class="form_section">
                        <div class="form_section_title">
                            <label>상품 색상</label>
                        </div>
                        <div class="form_section_content">
                            <input name="product_color" value="<c:out value="${productInfo.product_color}"/>" disabled>
                        </div>
                    </div>
                    <div class="form_section">
                        <div class="form_section_title">
                            <label>상품 사이즈</label>
                        </div>
                        <div class="form_section_content">
                            <input name="product_size" value="<c:out value="${productInfo.product_size}"/>" disabled>
                        </div>
                    </div>
                    <div class="form_section">
                        <div class="form_section_title">
                            <label>상품 할인율</label>
                        </div>
                        <div class="form_section_content">
                            <input id="discount_interface" maxlength="2" disabled>
                        </div>
                    </div>

                    <div class="btn_section">
                        <button id="cancelBtn" class="btn">상품 목록</button>
                    </div>
                </div>

                <script>
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

