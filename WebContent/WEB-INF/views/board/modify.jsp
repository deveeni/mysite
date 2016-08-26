<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	pageContext.setAttribute( "newLine", "\n" );
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>beautyline</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/beautyline/assets/css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<div id="header">
			<h1>beautyline</h1>
			<c:import url= "/WEB-INF/views/include/header.jsp"/>	
		</div>
		<div id="content">
			<div id="board">
				<form class="board-form" method="post" action="/beautyline/board?a=modify">
					<input type='hidden' name="no" value='${boardVo.no }'>
					<table class="tbl-ex">
						<tr>
							<th colspan="2">글수정</th>
						</tr>
						<tr>
							<td class="label">제목</td>
							<td><input type="text" name="title" value=""></td>
						</tr>
						<tr>
							<td class="label">내용</td>
							<td>
								<textarea id="content" name="content">${boardVo.content }
								</textarea>
							</td>
						</tr>
					</table>
					<div class="bottom">
						<a href="/beautyline/board?a=board">취소</a>
						<input type="submit" value="수정">
					</div>
				</form>				
			</div>
		</div>
		<c:import url= "/WEB-INF/views/include/navi.jsp"/>
		<c:import url= "/WEB-INF/views/include/footer.jsp"/>
	</div>
</body>
</html>