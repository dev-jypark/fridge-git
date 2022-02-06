<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<!-- 처음 CDN 코드 작성하는 곳 -->
    <script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>

 <!-- Custom fonts for this template-->
    <link href="<c:url value="/resources/vendor/frigochart/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value="/resources/css/frigochart/sb-admin-2.min.css"/>" rel="stylesheet">
    
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value="/userchart.do"/>">
                <div class="sidebar-brand-icon ">
                     <img class="logo.png" style="width:50px; height:50px; border-radius:25% "
                                    src="../resources/img/frigochart/logo.png" >
                </div>
                <div class="sidebar-brand-text mx-3">찍먹냉장고 <sup></sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="#">
                  
                    <span>관리자 게시판 </span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                목 록
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="<c:url value="/admin_notice/List.do"/>" >
         
                    <i class="fas fa-fw fa-comment-dots"></i>
                    <span> 공지사항 </span>
                </a>
               
            </li>


            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/userchart.do"/>">
                    <i class="fas fa-fw fa-chart-line"></i>
                    <span> 사용자 통계 </span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>


        </ul>
        <!-- End of Sidebar -->
</head>
<body>

</body>
</html>