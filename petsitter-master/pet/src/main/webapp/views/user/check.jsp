<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원가입</title>
    <script>
        alert("회원 가입이 완료되었습니다.")
        document.location.href = "${pageContext.request.contextPath}/user/login";
    </script>
</head>
<body>
</body>
</html>