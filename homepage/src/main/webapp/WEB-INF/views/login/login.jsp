<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- Bootstrap 5 CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5" style="max-width: 400px;">
  <h1 class="mb-4 text-center">로그인</h1>
  <form id="login-form" action="<c:url value='/login'/>" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <div class="mb-3">
      <label for="username" class="form-label">아이디</label>
      <input type="text" class="form-control" id="username" name="username" placeholder="아이디를 입력하세요" required>
    </div>
    <div class="mb-3">
      <label for="password" class="form-label">비밀번호</label>
      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
    </div>
    <div class="d-grid">
      <button type="submit" class="btn btn-primary">로그인</button>
    </div>
  </form>
</div>

<!-- Bootstrap 5 JS Bundle (Popper 포함) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    const csrfHeader = '${_csrf.headerName}';
    const csrfToken = '${_csrf.token}';

    $('#login-form').submit(function(e) {
        e.preventDefault();

        const formData = {
            username: $('#username').val(),
            password: $('#password').val()
        };

        $.ajax({
            url: '/login',
            method: 'POST',
            data: $.param(formData),
            beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeader, csrfToken);
            },
            success: function(data) {
                alert('로그인 되었습니다.');
                window.location.href = data.redirectUrl; 
            },
            error: function(xhr) {
                if (xhr.status === 401) {
                    let msg = '아이디 또는 비밀번호가 일치하지 않습니다.';
                    try {
                        const res = JSON.parse(xhr.responseText);
                        msg = res.error || msg;
                    } catch(e) {}
                    alert(msg);
                } else {
                    alert('로그인 중 오류가 발생했습니다.');
                }
            }
        });
    });
</script>
</body>
</html>