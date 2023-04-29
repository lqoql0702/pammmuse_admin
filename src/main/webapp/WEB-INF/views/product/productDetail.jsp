<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                        <li>
                            <a class="admin_list_03" href="/notice/noticeEnroll">공지 등록</a>
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
                            <input value="<fmt:formatDate value='${productInfo.reg_date}' pattern='yyyy-MM-dd'/>" disabled>
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
                                    <option value="none">선택</option>
                                </select>
                            </div>
                            <div class="cate_wrap">
                                <span>중분류</span>
                                <select class="cate2" disabled>
                                    <option value="none">선택</option>
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

                    $("#cancelBtn").click(function(){

                        location.href="/product/productManage"

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

                    $(document).ready(function(){

                        /* 할인율 값 삽입 */
                        let productDiscount = '<c:out value="${productInfo.product_discount}"/>' * 100;
                        $("#discount_interface").attr("value", productDiscount);

                        /* 카테고리 */
                        let cateList = JSON.parse('${cateResultMap}');

                        let cate1Array = new Array();
                        let cate2Array = new Array();
                        let cate1Obj = new Object();
                        let cate2Obj = new Object();

                        let cateSelect1 = $(".cate1");
                        let cateSelect2 = $(".cate2");

                        /* 카테고리 배열 초기화 메서드 */
                        function makeCateArray(obj,array,cateList, tier){
                            for(let i = 0; i < cateList.length; i++){
                                if(cateList[i].tier == tier){
                                    obj = new Object();

                                    obj.cate_name = cateList[i].cate_name;
                                    obj.cate_code = cateList[i].cate_code;
                                    obj.cate_parent = cateList[i].cate_parent;

                                    array.push(obj);
                                }
                            }
                        }

                        /* 배열 초기화 */
                        makeCateArray(cate1Obj,cate1Array,cateList,1);
                        makeCateArray(cate2Obj,cate2Array,cateList,2);

                        let targetCate2 = '${productInfo.cate_code}';


                        for(let i = 0; i < cate2Array.length; i++){
                            if(targetCate2 == cate2Array[i].cate_code){
                                targetCate2 = cate2Array[i];
                            }
                        }// for

                        console.log('targetCate2'+targetCate2);
                        console.log('targetCate2'+targetCate2.cate_name);
                        console.log('targetCate2'+targetCate2.cate_code);
                        console.log('targetCate2'+targetCate2.cate_parent);


                        for(let i = 0; i < cate2Array.length; i++){
                            if(targetCate2.cate_parent == cate2Array[i].cate_parent){
                                cateSelect2.append("<option value='"+cate2Array[i].cate_code+"'>" + cate2Array[i].cate_name + "</option>");
                            }
                        }

                        $(".cate2 option").each(function(i,obj){
                            if(targetCate2.cate_code == obj.value){
                                $(obj).attr("selected", "selected");
                            }
                        });

                        for(let i = 0; i < cate1Array.length; i++){
                            cateSelect1.append("<option value='"+cate1Array[i].cate_code+"'>" + cate1Array[i].cate_name + "</option>");
                        }

                        $(".cate1 option").each(function(i,obj){
                            if(targetCate2.cate_parent == obj.value){
                                $(obj).attr("selected", "selected");
                            }
                        });

                    });




                </script>
</body>
</html>

