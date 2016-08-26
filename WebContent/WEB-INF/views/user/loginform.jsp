<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  

<%@ page contentType="text/html;charset=UTF-8" %>

<%--
	String result = request.getParameter("r");	
--%><!doctype html>
<html>
<head>
<title>beautyline</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/beautyline/assets/css/user.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<c:import url= "/WEB-INF/views/include/header.jsp"/>
		<div id="content">
			<div id="user">
				<form id="login-form" name="loginform" method="post" action="/beautyline/user?a=login">
					
					<input type = "hidden" name = "a" value = "login" />
					<label class="block-label" for="email">이메일</label>
					<input id="email" name="email" type="text" value="">
					<label class="block-label" >패스워드</label>
					<input name="password" type="password" value="">
					<c:if test='${param.r == "fail" }'>
					<%--
						if("fail".equals(result)){
					--%>
					<p>
						로그인이 실패 했습니다.
					</p>
					<%-- } --%>
					</c:if>
					<input type="submit" value="로그인">
				</form>
			</div>
		</div>
		<c:import url = "/WEB-INF/views/include/navi.jsp"/>
		<c:import url = "/WEB-INF/views/include/footer.jsp"/>
	</div>
</body>
</html>