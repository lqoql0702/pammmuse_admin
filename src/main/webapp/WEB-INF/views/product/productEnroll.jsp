<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>pammmuse_admin</title>
    <link rel="stylesheet" href="../../../css/productEnroll.css">

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
                <div class="admin_content_subject"><span>상품 등록</span></div>

        <div class="admin_content_main">
            <form action="/product/productEnroll" method="post" id="enrollForm" enctype="multipart/form-data">
                <div class="form_section">
                    <div class="form_section_title">
                        <label>제품명</label>
                    </div>
                    <div class="form_section_content">
                        <input name="product_name">
                        <span class="ck_warn product_name_warn">제품명을 입력해주세요.</span>
                    </div>
                </div>

                <div class="form_section">
                    <div class="form_section_title">
                        <label>카테고리</label>
                    </div>
                    <div class="form_section_content">
                        <div class="cate_wrap">
                            <span>대분류</span>
                            <select class="cate1" name="cate_code">
                                <option selected value="none">선택</option>
                            </select>
                        </div>
                        <div class="cate_wrap">
                            <span>소분류</span>
                            <select class="cate2">
                                <option selected value="none">선택</option>
                            </select>
                        </div>
                        <span class="ck_warn cate_code_warn">카테고리를 입력해주세요.</span>
                    </div>
                </div>

                <div class="form_section">
                    <div class="form_section_title">
                        <label>가격</label>
                    </div>
                    <div class="form_section_content">
                        <input name="product_price" value="0">
                        <span class="ck_warn product_price_warn">가격을 입력해주세요.</span>
                    </div>
                </div>
                <div class="form_section">
                    <div class="form_section_title">
                        <label>재고</label>
                    </div>
                    <div class="form_section_content">
                        <input name="product_stock" value="0">
                        <span class="ck_warn product_stock_warn">재고를 입력해주세요.</span>
                    </div>
                </div>
                <div class="form_section">
                    <div class="form_section_title">
                        <label>색상</label>
                    </div>
                    <div class="form_section_content">
                        <input name="product_color">
                        <span class="ck_warn product_color_warn">색을 입력해주세요.</span>
                    </div>
                </div>
                <div class="form_section">
                    <div class="form_section_title">
                        <label>사이즈</label>
                    </div>
                    <div class="form_section_content">
                        <input name="product_size">
                        <span class="ck_warn product_size_warn">사이즈를 입력해주세요.</span>
                    </div>
                </div>
                <div class="form_section">
                    <div class="form_section_title">
                        <label>할인율</label>
                    </div>
                    <div class="form_section_content">
                        <input id="discount_interface" maxlength="2" value="0">
                        <input name="product_discount" type="hidden" value="0">
                        <span class="step_val">할인 가격 : <span class="span_product_discount"></span></span>
                        <span class="ck_warn product_discount_warn">할인율을 입력해주세요.</span>
                    </div>
                </div>

                <div class="form_section">
                    <div class="form_section_title">
                        <label>상품 이미지</label>
                    </div>
                    <div class="form_section_content">
                        <input type="file" multiple id ="file" name='uploadFile' style="height: 30px;">
                    </div>
                </div>

            </form>
            <div class="btn_section">
                <button id="cancelBtn" class="btn">취 소</button>
                <button id="enrollBtn" class="btn enroll_btn">등 록</button>
            </div>
        </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>    <!-- class="wrap" -->
</div>    <!-- class="wrapper" -->
<script>


    // document.getElementById("file").addEventListener("change", uploadResource);
    //
    // function uploadResource() {
    //     const file = $('input[name="file"]').get(0).files[0];
    //     var formData = new FormData();
    //     formData.append('file', file);
    //
    //     $.ajax({
    //         type: 'POST',
    //         url: '/product/productEnroll',
    //         data: formData,
    //         enctype: 'multipart/form-data',
    //         processData: false,
    //         contentType: false,
    //         cache: false
    //     });
    //  }


    /* 취소 버튼 */
    $("#cancelBtn").click(function(){

        location.href="/product/productManage"

    });

    let enrollForm = $("#enrollForm")

    /* 상품 등록 버튼 */
    $("#enrollBtn").on("click",function(e){

        e.preventDefault();

        /*체크 변수*/
        let product_name_ck = false;
        let product_price_ck = false;
        let product_stock_ck = false;
        let product_color_ck = false;
        let product_size_ck = false;
        let product_discount_ck = false;
        let cate_code_ck = false;

        let product_name = $("input[name='product_name']").val();
        let product_price = $("input[name='product_price']").val();
        let product_stock = $("input[name='product_stock']").val();
        let product_color = $("input[name='product_color']").val();
        let product_size = $("input[name='product_size']").val();
        let product_discount = $("#discount_interface").val();
        let cate_code = $("select[name='cate_code']").val();

        if(product_name){
            $(".product_name_warn").css('display','none');
            product_name_ck = true;
        } else {
            $(".product_name_warn").css('display','block');
            product_name_ck = false;
        }
        if(product_price){
            $(".product_price_warn").css('display','none');
            product_price_ck = true;
        } else {
            $(".product_price_warn").css('display','block');
            product_price_ck = false;
        }
        if(product_stock){
            $(".product_stock_warn").css('display','none');
            product_stock_ck = true;
        } else {
            $(".product_stock_warn").css('display','block');
            product_stock_ck = false;
        }
        if(product_color){
            $(".product_color_warn").css('display','none');
            product_color_ck = true;
        } else {
            $(".product_color_warn").css('display','block');
            product_color_ck = false;
        }
        if(product_size){
            $(".product_size_warn").css('display','none');
            product_size_ck = true;
        } else {
            $(".product_size_warn").css('display','block');
            product_size_ck = false;
        }
        if(!isNaN(product_discount)){
            $(".product_discount_warn").css('display','none');
            product_discount_ck = true;
        } else {
            $(".product_discount_warn").css('display','block');
            product_discount_ck = false;
        }
        if(cate_code != 'none'){
            $(".cate_code_warn").css('display','none');
            cate_code_ck = true;
        } else {
            $(".cate_code_warn").css('display','block');
            cate_code_ck = false;
        }

        if(product_name_ck && product_stock_ck && product_price_ck && product_size_ck && product_color_ck && product_discount_ck && cate_code_ck){
            //alert('통과');
            enrollForm.submit();
        } else{
            return false;
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

    /* 카테고리 */
    let cateMapList = JSON.parse('${cateResultMap}');

    $(document).ready(function(){
        console.log('${cateResultMap}');
    });

    let cate1Array = new Array();
    let cate2Array = new Array();
    let cate1Obj = new Object();
    let cate2Obj = new Object();

    let cateSelect1 = $("select.cate1");
    let cateSelect2 = $("select.cate2");

    /* 카테고리 배열 초기화 메서드 */
    function makeCateArray(obj,array,cateMapList, tier){
        for(let i = 0; i < cateMapList.length; i++){
            if(cateMapList[i].tier === tier){
                obj = new Object();

                obj.cate_name = cateMapList[i].cate_name;
                obj.cate_code = cateMapList[i].cate_code;
                obj.cate_parent = cateMapList[i].cate_parent;

                array.push(obj);

            }
        }
    }

    /* 배열 초기화 */
    makeCateArray(cate1Obj,cate1Array,cateMapList,1);
    makeCateArray(cate2Obj,cate2Array,cateMapList,2);


    /* 대분류 <option> 태그 */
    for(let i = 0; i < cate1Array.length; i++){
        cateSelect1.append("<option value='"+cate1Array[i].cate_code+"'>" + cate1Array[i].cate_name + "</option>");
    }

    /* 중분류 <option> 태그 */
    $(cateSelect1).on("change",function(){
        let selectVal1 = $(this).find("option:selected").val();

        cateSelect2.children().remove();

        cateSelect2.append("<option value='none'>선택</option>");

        for(let i = 0; i < cate2Array.length; i++){
            if(selectVal1 == cate2Array[i].cate_parent){
                cateSelect2.append("<option value='"+cate2Array[i].cate_code+"'>" + cate2Array[i].cate_name + "</option>");
            }
        }// for
    });


    /* 할인율 Input 설정 */
    $("#discount_interface").on("propertychange change keyup paste input", function(){

        let userInput = $("#discount_interface");
        let discountInput = $("input[name='product_discount']");

        let discountRate = userInput.val();					// 사용자가 입력할 할인값
        let sendDiscountRate = discountRate / 100;          // 서버에 전송할 할인값

        let productPrice = $("input[name='product_price']").val();			// 원가
        let discountPrice = productPrice * (1 - sendDiscountRate);		// 할인가격

            $(".span_product_discount").html(discountPrice);

        discountInput.val(sendDiscountRate);

    });

    $("input[name='product_price']").on("change", function(){

        let userInput = $("#discount_interface");
        let discountInput = $("input[name='prodcut_discount']");

        let discountRate = userInput.val();					// 사용자가 입력한 할인값
        let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
        let productPrice = $("input[name='product_price']").val();			// 원가
        let discountPrice = productPrice * (1 - sendDiscountRate);		// 할인가격


            $(".span_product_discount").html(discountPrice);


    });

    $("input[type='file']").on("change", function(e){
        let fileInput = $('input[name="uploadFile"]');
        let fileList = fileInput[0].files;
        let fileObj = fileList[0];

        let formData = new FormData();

        for(let i = 0; i < fileList.length; i++){
            formData.append("uploadFile", fileList[i]);
        }

        $.ajax({
            url: '/product/productEnroll',
            processData : false,
            contentType : false,
            data : formData,
            type : 'POST',
            dataType : 'json'
        });

    });

</script>
</body>
</html>


