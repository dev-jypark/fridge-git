<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <!-- <link href="<c:url value="/resources/fridge/css/admin.css"/>" rel="stylesheet"> -->

     <style>
	    .Csboard {
	    font-size: 36px;
	    color: #333333;
	    text-align: center;
	    width: 100%;
	    line-height: 100%;
	    font-weight: 700;
	    letter-spacing: -0.9px;
	    transform: skew(-0.001deg);
	}
	
	.csboard_menu {
	    width: 207.5px;
	    height: 120px;
	    border-right: 1px solid #f2f2f2;
	    display: inline-block;
	    font-size: 0px;
	    cursor: pointer;
	}
	
	.csboard_menu:hover {
	    background-color: #f6f6f6;
	}
	
	.csmenu_on {
	    background-color: #f6f6f6;
	}
	
	.csboard_menu .csboard_menu_con {
	    height: 130px;    
	    margin-top: 30px;
	    text-align: center;
	}
	
	
	.csboard_menu .csboard_menu_con .menu_sub {
	    font-size: 15px;
	    color: #333333;
	    font-weight: 700;
	    line-height: 1;
	    padding-top: 10px;
	    transform: skew(-0.001deg);
	}
	
	.customer_info_wrap {
	    text-align: center;
	    margin-bottom: 25px;
	}
	
	.customer_info_box .customer_info {
	    font-size: 14px;
	    color: #333;
	    font-weight: 500;
	}
	
	.customer_info_box .customer_info .customer_style {
	    font-weight: 300;
	    font-size: 14px;
	    padding-left: 3px;
	    color: #333;
	}
	
	.customer_info_box .customer_num {
	    position: relative;
	    padding: 0 12px 0 27px;
	}
	
	.customer_info_box .customer_time {
	    padding-left: 7px;
	}
	
	.customer_info_box .customer_num::before {
	    content: '';
	    display: inline-block;
	    position: absolute;
	    width: 16px;
	    height: 16px;
	    top: 2px;
	    left: 0;
	    background: url("/images/csboard/ic-call.png") no-repeat;
	}
	
	.customer_info_box .customer_num::after {
	    content: '';
	    display: inline-block;
	    position: absolute;
	    height: 10px;
	    top: 6px;
	    right: 0;
	    border-right: 1px solid #ccc;
	}
	
	
  </style>    
  
	<!-- <link href="admin.css" rel="stylesheet"> -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

</head>


<body>

    <div id="container">
        <div class="layer_screen_100" style="margin-left: 350px;">
            <div class="layer_contets_width_1040">

                <div class="layer_screen_100">

                    <div class="layer_contets_width_1040">


                       <div><br><br></div>
                        <a href="#" style="text-decoration:none;">
                            <div class="Csboard">고객센터</div>
                        </a>
                        <div style="padding-bottom:15px;"></div>
                        <div class="customer_info_wrap">
                            <div class="customer_info_box">
                                <span class="customer_info customer_num" style="color: silver;">02-123-4567</span>
                                <span class="customer_info customer_time" style="color: gray;">운영시간 <span class="customer_style" style="color: silver;">평일
                                        09~18시(점심시간 12~13시)</span></span>
                            </div>
                        </div>

                        <div style="border:solid 1px #e0e0e0;height:120px;font-size:0px; text-align: center;">

                            <a href="#" style="text-decoration:none;">
                                <div class="csboard_menu csmenu_on" id="customerboardnotice">
                                    <div class="csboard_menu_con">
                                        <div class="csboard_menu_con_list">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="34" height="36" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
                                            <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
                                          </svg>
                                        </div>
                                        <div class="menu_sub">공지사항</div>
                                    </div>
                                </div>
                            </a>
                             <a href="#" style="text-decoration:none;">
                                <div class="csboard_menu" id="customerboardmain">
                                    <div class="csboard_menu_con">
                                        <div class="csboard_menulist">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="34" height="36" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
                                            <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
                                            <path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
                                          </svg>
                                        </div>
                                        <div class="menu_sub">1:1문의</div>
                                    </div>
                                </div>
                            </a>
                        </div>


                    </div>
                    <div style="padding-top:40px;"></div>

                </div>


                </div>

            </div>
        </div>
    </div>
    
	<div class="container">
 
		<div class="row">
			<div class="col-xs-12 col-lg-12 col-md-12 action">

		<!-- 작성하기 버튼 -->

		<div class="table-responsive">
			<table class="table table-bordered table-hover text-center" style="border-left-style:hidden; border-right-style: hidden;">
				<!-- 테이블 컬럼폭은 col-*-*계열로 설정 -->
				<tr style="background-color: activeborder; border-top-style: double; border-bottom-style: double;">
					<th class="text-center col-md-1">번호</th>
					<th class="text-center col-md-6">제목</th>
					<th class="text-center col-md-1">조회수</th>
					<th class="text-center col-md-2">등록일</th>
				</tr>
	

				<c:if test="${empty listPagingData.lists }" var="isEmpty">
					<tr>
						<td colspan="4">등록된 공지사항이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not isEmpty }">
					<c:forEach var="item" items="${listPagingData.lists}" varStatus="loop">
						<tr id="accordion">
							<td>${listPagingData.totalRecordCount - (((listPagingData.nowPage - 1) * listPagingData.pageSize) + loop.index)}</td>										
							<td class="text-left">
								<details>
								    <summary>${item.n_title }</summary>
								    <p><br>${item.n_content}</p>
								</details></td>
							<td>${item.n_hit }</td>
							<td>${item.n_postDate }</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			</div>
		</div>
			<c:if test="${listPagingData.lists.size() !=0 }">
		<div class="row">
			<div class="col-md-12 text-center" style="margin-left: 360px">${listPagingData.pagingString}</div>
		</div>
	</c:if>
	</div>
</body>



</html>