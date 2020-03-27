<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<title>네이버 :: Smart Editor 2</title>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/smarteditor/static/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>

</head>
<body>
	<textarea name="ir1" id="ir1" rows="10" cols="100">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea>

	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator
				.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : "ir1",
					sSkinURI : "${pageContext.request.contextPath}/resources/smarteditor/static/js/service/SmartEditor2Skin.html",
					fCreator : "createSEditor2"
				});
	</script>

</body>
</html>
