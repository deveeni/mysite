<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  

<%--@page import="kr.ac.sungkyul.mystie.vo.GuestBookVo"--%>
<%--@page import="java.util.List"--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%--
	List<GuestBookVo> list = (List<GuestBookVo>)request.getAttribute("list");
--%>
<%
	pageContext.setAttribute( "newLine", "\n" );
%>

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
			<div id="guestbook">
				<form action="/beautyline/gb" method="post">
					<input type="hidden" name="a" value="insert">
					<table>
						<tr>
							<td>이름</td><td><input type="text" name="name"></td>
							<td>비밀번호</td><td><input type="password" name="pass"></td>
						</tr>
						<tr>
							<td colspan=4><textarea name="content" id="content"></textarea></td>
						</tr>
						<tr>
							<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
						</tr>
					</table>
				</form>
							<%--
								int count = list.size();
								int index = 0;
								for( GuestBookVo vo : list ){
								--%>
				<ul>
				<!-- c:set var="countList" value='${10 }'/ -->
				<c:set var="countList" value='${fn:length(list) }' />
				<c:forEach var='vo' items='${list }' varStatus='status'> <!-- page객체에 list라는 이름으로 된 것있는지 찾고 >request찾고.. -->
						<li>
							<table>
								<tr>
									<td>[${countList-status.index }]
									<!-- [${status.index } : ${status.count } ]  -->
									<%--=count-index++ --%></td>
									<td>${vo.name } <%--=vo.getName() --%></td>
									<td>${vo.regDate } <%--=vo.getRegDate() --%></td>
									<td><a href="/beautyline/gb?a=deleteform&no=${vo.no }">삭제</a></td>
								</tr>
								<tr>
									<td colspan=4>
									${fn:replace(vo.content, newLine, "<br>") } 
									<!-- 개행문자 \를 인식못해서  스크립트릿 써줘야함 -->
									<!--${vo.content } --> 
									<%--=vo.getContent().replaceAll("\n","<br>") --%>
									<!-- replaceAll하고싶으면 함수 써줘야한다. -->
									</td>
								</tr>
							</table>
							<br>
						</li>
				</c:forEach>
				</ul><%-- --%>
			</div>
		</div>
		<jsp:include page = "/WEB-INF/views/include/navi.jsp"/>
		<jsp:include page = "/WEB-INF/views/include/footer.jsp"/>
	</div>
</body>
</html>