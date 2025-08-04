<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 양식</title>
    <!-- Bootstrap 5 CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-label {
            width: 100px;
            text-align: right;
            margin-right: 10px;
        }
        .form-group-row {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .form-control {
            flex: 1;
        }
        .check-btn {
            margin-left: 10px;
            white-space: nowrap;
        }
        .btn-group-center {
            text-align: center;
            margin-top: 30px;
        }
        .card {
            padding: 30px;
            border-radius: 15px;
        }
    </style>
</head>
<body>
<div class="container mt-5" style="max-width: 600px;">
        <h4 class="text-center mb-4">회원가입 양식</h4>
        <form id="register-form" action="/member/register" method="post">
            <div class="form-group-row">
                <label for="name" class="form-label">이름</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group-row">
                <label for="username" class="form-label">아이디</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group-row">
                <label for="password" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="form-group-row">
                <label for="confirmPassword" class="form-label">비밀번호 확인</label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                <button type="button" class="btn btn-outline-secondary check-btn">비밀번호 확인</button>
            </div>
            <div class="form-group-row">
                <label for="email" class="form-label">이메일</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>

            <div class="btn-group-center">
                <button type="button" id="cancel-btn" class="btn btn-secondary mr-2">가입취소</button>
                <button type="submit" class="btn btn-dark">회원가입</button>
            </div>
            <div>
				<!-- 회원가입폼에 있는 내용 전송시 403오류가 발생하는 원인 해결 -->
				<input type="hidden" 
				name="${_csrf.parameterName}"
				value="${_csrf.token }" />
			</div>
        </form>
</div>
<!-- Bootstrap 5 JS Bundle (Popper 포함) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
document.querySelector('.check-btn').addEventListener('click', function() {
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirmPassword').value;

    if (password === confirmPassword) {
        alert('비밀번호가 일치합니다.');
    } else {
        alert('비밀번호가 일치하지 않습니다. 다시 확인해주세요.');
    }
});

document.getElementById('register-form').addEventListener('submit', function(event) {
    var pwd = document.getElementById('password').value;
    var pwdConfirm = document.getElementById('passwordConfirm').value;

    if (pwd !== pwdConfirm) {
        alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요.');
        event.preventDefault();  // 폼 제출 막기
        document.getElementById('password').focus();
        return false;
    }
});
</script>
</body>
</html>