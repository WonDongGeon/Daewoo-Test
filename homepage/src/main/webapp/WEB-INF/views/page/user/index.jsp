<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <sec:authentication property="principal" var="user"/>
        <span>환영합니다. &nbsp;<strong>${user.username}</strong> 님&nbsp;&nbsp;</span>
        <form action="/logout" method="post" style="display:inline;">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
            <input type="submit" value="로그아웃" class="btn btn-outline-light btn-sm" />
        </form>
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
</body>
</html>
