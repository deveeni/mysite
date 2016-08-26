<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
<title>beautyline</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/beautyline/assets/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<c:import url = "/WEB-INF/views/include/header.jsp"/>
		<div id="wrapper">
			<div id="content">
				<div id="site-introduction">
					<img id="profile" src="/beautyline/assets/images/skincare.jpg" width=400px>
					<h2>BeautyLine</h2>
			<br><br>
				</div>
			</div>
		</div>
		<c:import url= "/WEB-INF/views/include/navi.jsp"/>
		<c:import url= "/WEB-INF/views/include/footer.jsp"/>
	</div>
</body>
</html>