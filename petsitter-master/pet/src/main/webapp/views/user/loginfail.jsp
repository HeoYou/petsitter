<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 실패</title>
    <script>
        alert("아이디 또는 비밀번호가 일치하지 않습니다.")
        document.location.href = "${pageContext.request.contextPath}/user/login";
    </script>
</head>
<body>
</body>
</html>