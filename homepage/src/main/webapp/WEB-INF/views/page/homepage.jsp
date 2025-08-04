<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회사 홈페이지</title>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        body { padding-top: 60px; }
        .header {
            background-color: #222;
            color: white;
            padding: 20px 100px;
            position: fixed;
            top: 0; width: 100%; z-index: 1000;
        }
        .sidebar { border-right: 1px solid #ddd; padding-right: 15px; }
        .footer {
            background-color: #111; color: #fff;
            padding: 20px; text-align: center;
            position: fixed; bottom: 0; width: 100%;
        }
        nav {
            background-color: #d3d3d3;
            padding: 20px 100px;
            margin-top: 10px;
        }
        .nav-link {
            color: black !important;
            margin-right: 15px;
            text-decoration: none;
        }
        .nav-link:hover {
            color: #555555;
            text-decoration: underline;
        }
    </style>
</head>
<body>

<!-- 헤더 -->
<div class="header d-flex justify-content-between align-items-center">
    <div class="d-flex align-items-center">
        <h4 class="mb-0 me-5">로고</h4>
    </div>
    <div id="guest-area">
        <button class="btn btn-dark btn-sm" id="login-btn">로그인</button>
        <button class="btn btn-light btn-sm" id="register-btn">회원가입</button>
    </div>
</div>

<nav>
    <a href="#" class="nav-link d-inline">메인페이지</a>
    <a href="#" class="nav-link d-inline">갤러리</a>
    <a href="#" class="nav-link d-inline">외부데이터</a>
    <a href="#" class="nav-link d-inline">게시판</a>
</nav>

<!-- 로그인/회원가입 폼이 로드될 세션 영역 -->
<div id="session-area" class="container mt-4 ps-4"></div>

<!-- 메인 콘텐츠 -->
<div class="container-fluid ms-5 mt-4 ps-4">
        <div class="col-md-10" id="content-area">
            <h4>메인 콘텐츠</h4>
            <p>여기에 메인 콘텐츠가 들어갑니다.</p>
        </div>
</div>

<!-- 푸터 -->
<div class="footer">
    © 2025 회사명. All rights reserved.
</div>

<script>
$(document).ready(function() {
    
    $('#login-btn').click(function(e) {
        e.preventDefault();
        $('#content-area').hide();            // 기존 메인 콘텐츠 제거
        $('#session-area').load('/login/login'); // 로그인 폼 JSP 경로
    });

    // 회원가입 버튼 클릭 시
    $('#register-btn').click(function(e) {
        e.preventDefault();
        $('#content-area').hide();               // 기존 메인 콘텐츠 제거
        $('#session-area').load('/member/register'); // 회원가입 폼 JSP 경로
    });
    
    $(document).on('click', '#cancel-btn', function(e) {
        e.preventDefault();
        // 세션 영역 비우기
        $('#session-area').empty();
        // 메인 콘텐츠 영역 다시 보여주기
        $('#content-area').show();
    });
});
</script>
<c:if test="${param.logout == 'true'}">
    <script>
        alert("로그아웃 되었습니다.");
        // URL에서 ?logout=true 제거
        if (window.history.replaceState) {
            const url = window.location.protocol + "//" + window.location.host + window.location.pathname;
            window.history.replaceState(null, null, url);
        }
    </script>
</c:if>
</body>
</html>
