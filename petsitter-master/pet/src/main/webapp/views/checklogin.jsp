<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${user.getUId() == null }">
	<script type="text/javascript">
		var login = confirm("로그인시 이용 가능합니다.");

		if (login) {
			location.href = "/user/login";
		} else {
			history.back();
		}
	</script>

</c:if>
