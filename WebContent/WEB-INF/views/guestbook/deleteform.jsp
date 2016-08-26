<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page contentType="text/html;charset=UTF-8" %>

<!doctype html>
<html>
<head>
<title>beautyline</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/beautyline/assets/css/guestbook.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<jsp:include page = "/WEB-INF/views/include/header.jsp"/>
		<div id="content">
			<div id="guestbook" class="delete-form">
				<form id="delete-form" name="deleteForm" method="post" action="/beautyline/gb">
					<input type='hidden' name="a" value="delete"/>
					<input type='hidden' name="no" value='${vo.no }'>
					<label>비밀번호</label>
					<input type="password" name="password" value="" >
					<input type="submit" value="확인">
				</form>
				<a href="/beautyline/gb">방명록 리스트</a>
			</div>
		</div>
		<jsp:include page = "/WEB-INF/views/include/navi.jsp"/>
		<jsp:include page = "/WEB-INF/views/include/footer.jsp"/>
	</div>
</body>
</html>