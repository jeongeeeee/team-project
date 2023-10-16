<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>희로애락: 관리자</title>
    <!-- fontawesome -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <!-- css -->
    <link rel="stylesheet" href="resources/adminCss/admin.css" />
  </head>
  <body>
      <div class="Container">
      <!-- 화면 영역 -->
      <div id="main">
        <div class="head">
          <div class="head-menu">
            <div class="side-open">
              <button class="open-sidebar" onclick="openMenu()">
                <i class="fa-solid fa-bars fa-2xl" style="color: #6d3114"></i>
              </button>
            </div>
            <div class="admin-menu">
              <div class="admin-content">
                <ul class="admin-list">
                  <li>
                    <a class="welcome">관리자님, 어서오세요</a>
                  </li>
                  <li>
                    <a href="adminPage.do" class="home">HOME</a>
                  </li>
                  <li>
                    <a href="logout.do" class="logout">로그아웃</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <!-- 사이드메뉴에 따른 메인 영역 -->
        <div class="content-wrapper">
          <div id="order_div">
            <table class="order-table">
              <thead class="order-th">
                <tr class="order-tr">
                  <th>NO</th>
                  <th>이름</th>
                  <th>연락처</th>
                  <th>배송지주소</th>
                  <th>상품명</th>
                  <th>수량</th>
                  <th>금액</th>
                  <th>결제수단</th>
                  <th>주문일자</th>
                </tr>
              </thead>
              <tbody id="order_tbody">
                
              </tbody>
            </table>
          </div>
          <!-- style="width: 700px; height: 900px" -->
          <div id="chart_div" style="margin-top:100px; width: 100%; height: 750px;"></div>
          <div id="detailSales">
            <h3 class="detailTitle">현재년도 매출현황</h3>
            <input class="datetimes" type="text" name="datetimes" readonly="readonly" />
          </div>

          <div id="store_div">
            <div id="product_table">
              <ul id="product_ul">
                <!-- detail부분에 들어갈 파라미터 값 상품 코드 넣기 -->
                <li id="product_li">
                  <a href="javascript:detail(1);">탁주</a>
                </li>
                <li id="product_li">
                  <a href="javascript:detail(2);">약·청주</a>
                </li>
                <li id="product_li">
                  <a href="javascript:detail(3);">과실주</a>
                </li>
                <li id="product_li">
                  <a href="javascript:detail(4);">증류주</a>
                </li>
              </ul>
            </div>
            <div id="detail_product">
              <table>
                <thead id="product_head">
                  <tr>
                    <th>상품코드</th>
                    <th>상품명</th>
                    <th>상품가격</th>
                    <th>상품설명</th>
                    <th>
                      <a href="product_state.do?state=1&pcode=0"
                        ><img
                          id="insertImg"
                          src="resources/image/insert.png"
                          alt="추가"
                      /></a>
                    </th>
                  </tr>
                </thead>

                <tbody id="product_tbody"></tbody>
              </table>
            </div>

            <div id="review_table">
              <table>
                <thead id="review_head">
                  <tr>
                    <th>NO</th>
                    <th>ID</th>
                    <th>상품코드</th>
                    <th>작성일자</th>
                    <th>상품명</th>
                    <th>리뷰내용</th>
                    <th>별점</th>
                    <th>상태처리</th>
                  </tr>
                </thead>
                <tbody id="review_tbody"></tbody>
              </table>
            </div>
          </div>
          <div id="membership_div">
            <form class="searchForm">
              <div class="searchDiv">
                <div class="search-Division">
                  <select name="searchDivision" class="searchNum">
                    <option value="1" selected>아이디</option>
                    <option value="2">이름</option>
                    <option value="3">닉네임</option>
                  </select>
                </div>
                <div class="search-input">
                  <div class="search-input-txt">
                    <input
                      type="text"
                      name="searchKeyword"
                      class="searchText"
                      placeholder="Search.."
                    />
                    <span></span>
                  </div>
                </div>
                <input
                  type="button"
                  value="검색 &#x1F50D"
                  name="searchBtn"
                  class="searchBtn"
                  onclick="memberManagement(searchDivision.value, searchKeyword.value);"
                />
              </div>
            </form>
            <table  class="user-table">
              <thead class="user-th">
                <tr>
                  <th id="user_th">USER CODE</th>
                  <th id="user_th">ID</th>
                  <th id="user_th">이름</th>
                  <th id="user_th">비밀번호</th>
                  <th id="user_th">닉네임</th>
                  <th id="user_th">주소</th>
                  <th id="user_th">성별</th>
                  <th id="user_th">이메일</th>
                  <th id="user_th">생년월일</th>
                  <th id="user_th">휴대폰번호</th>
                  <th id="user_th"></th>
                </tr>
              </thead>
              <tbody id="membership_tbody"></tbody>
            </table>
          </div>

          <div id="QandA_div">
            <form class="searchForm">
              <div class="searchDiv">
                <div class="search-Division">
                  <select name="searchDivision" class="searchNum">
                    <option value="1" selected>문의코드</option>
                    <option value="2">문의내용</option>
                  </select>
                </div>
                <div class="search-input">
                  <div class="search-input-txt">
                    <input
                      type="text"
                      name="searchKeyword"
                      class="searchText"
                      placeholder="Search.."
                    />
                    <span></span>
                  </div>
                </div>
                <input
                  type="button"
                  value="검색 &#x1F50D"
                  name="searchBtn"
                  class="searchBtn"
                  onclick="questionManagement(searchDivision.value, searchKeyword.value);"
                />
              </div>
            </form>
            <table class="qna-table">
              <thead class="qna-th">
                <tr>
                  <th>No</th>
                  <th>문의코드</th>
                  <th>문의제목</th>
                  <th>문의내용</th>
                  <th>문의날짜</th>
                  <th></th>
                </tr>
              </thead>
              <tbody id="QnA_tbody"></tbody>
            </table>
          </div>

          <div id="notice_div">
            <table id="noticecenter" class="noticeTable">
              <thead id="notice_head">
                <tr>
                  <th>No</th>
                  <th>공지코드</th>
                  <th>공지제목</th>
                  <th>공지내용</th>
                  <th>공지날짜</th>
                  <th>
                    <a href="noticeInsert.do"
                      ><img
                        id="insertImg"
                        src="resources/image/insert.png"
                        alt="추가"
                    /></a>
                  </th>
                </tr>
              </thead>
              <tbody id="notice_tbody"></tbody>
            </table>
          </div>
        </div>
      </div>
      <!-- 사이드 메뉴 영역 -->
      <div class="sidebar">
        <a class="close-sidebar" onclick="closeMenu()">&times;</a>
        <div class="accodion">
          <div class="cate">
            <span class="cate-menu">
              <input type="checkbox" class="blind" />
              <a class="menulink">주문내역관리</a>
              <a href="javascript:void(0);" class="subopen">
                <span></span>
              </a>
            </span>
            <div class="detail-menu">
              <a
                id="Management"
                class="order"
                href="javascript:orderHistory();"
              >
                주문내역관리
              </a>
            </div>
          </div>
          <div class="cate">
            <span class="cate-menu">
              <input type="checkbox" class="blind" />
              <a class="menulink">매출정보</a>
              <a href="javascript:void(0);" class="subopen">
                <span></span>
              </a>
            </span>
            <div class="detail-menu">
              <a
                id="Management"
                class="order"
                href="javascript:salesManagement();"
              >
                매출정보
              </a>
            </div>
          </div>
          <div class="cate">
            <span class="cate-menu">
              <input type="checkbox" class="blind" />
              <a class="menulink">매장관리</a>
              <a href="javascript:storeManagement();" class="subopen">
                <span></span>
              </a>
            </span>
            <div class="detail-menu">
              <a id="Management" href="javascript:productManagement();">
                제품관리 </a
              ><br />
              <a id="Management" href="javascript:reviewManagement();">
                리뷰관리
              </a>
            </div>
          </div>
          <div class="cate">
            <span class="cate-menu">
              <input type="checkbox" class="blind" />
              <a class="menulink">회원관리</a>
              <a href="javascript:void(0);" class="subopen">
                <span></span>
              </a>
            </span>
            <div class="detail-menu">
              <a id="Management" href="javascript:memberManagement();">
                회원관리
              </a>
            </div>
          </div>
          <div class="cate">
            <span class="cate-menu">
              <input type="checkbox" class="blind" />
              <a class="menulink">Q&A관리</a>
              <a href="javascript:void(0);" class="subopen">
                <span></span>
              </a>
            </span>
            <div class="detail-menu">
              <a id="Management" href="javascript:questionManagement();">
                Q&A관리
              </a>
            </div>
          </div>
          <div class="cate">
            <span class="cate-menu">
              <input type="checkbox" class="blind" />
              <a class="menulink">공지사항 등록</a>
              <a href="javascript:void(0);" class="subopen">
                <span></span>
              </a>
            </span>
            <div class="detail-menu">
              <a
                id="Management"
                class="announcement"
                href="javascript:announcement();"
              >
                공지사항 등록
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
  <script
    type="text/javascript"
    src="https://www.gstatic.com/charts/loader.js"
  ></script>
  <script
    type="text/javascript"
    src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"
  ></script>
  <script
    type="text/javascript"
    src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"
  ></script>
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <script src="resources/adminJs/adminPageJs.js"></script>
  
 <!-- 날짜데이터관련 script -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
 
  <script>
    function openMenu() {
      document.getElementById("main").style.marginLeft = "250px";
      document.querySelector(".sidebar").style.width = "250px";
      document.querySelector(".open-sidebar").style.display = "none";
    }

    function closeMenu() {
      document.getElementById("main").style.marginLeft = "0";
      document.querySelector(".sidebar").style.width = "0";
      document.querySelector(".open-sidebar").style.display = "block";
    }

    (function ($) {
      $(".cate .detail-menu").hide();
      $(".cate .cate-menu .subopen").click(function () {
        if ($(this).hasClass("active")) {
          $(this).parent().next().slideUp("fast");
          $(this).removeClass("active");
        } else {
          $(".accordion").find(".active").parent().next().slideUp("fast");
          $(".accordion").find(".active").removeClass("active");
          $(this).parent().next().slideDown("fast");
          $(this).addClass("active");
        }
      });
    })(jQuery);
  </script>
</html>
    