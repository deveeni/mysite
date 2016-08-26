<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>beautyline</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/beautyline/assets/css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<c:import url= "/WEB-INF/views/include/header.jsp"/>
		
		<div id="content">
			<div id="board">
				<form id="search_form" action="/beautyline/board" method="get">
					<input type="text" id="keyword" name="keyword" value="${keyword }">
					<input type="submit" value="찾기">
				</form>
			<!--  form id="board_list" action="/beautyline/board" method="post" -->
				<table class="tbl-ex">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>조회수</th>
						<th>작성일</th>
						<th>&nbsp;</th>
					</tr>				
			<!-- c:set var="countList" value='${fn:length(list) }' / -->		
			<c:set var="firstIndex" value="${totalCount - (currentPage - 1) * sizeList}" />
			<c:forEach var='vo' items='${list }' varStatus='status'>
					<tr>
						<td>[${ firstIndex - status.index }]</td>			
						<td style="text-align:left;padding-left:${vo.depth*10 }px">
							<c:if test='${vo.depth >= 1 }'>
								<img src = "/beautyline/assets/images/reply.png" width="10">
							</c:if>
							<a href="/beautyline/board?a=view&no=${vo.no }&p=${currentPage }&keyword=${keyword }">${vo.title }</a></td>
						<td>${vo.userName }</td>
						<td>${vo.viewCount }</td>
						<td>${vo.regDate } </td>
						<td>
						<c:if test='${vo.userNo == authUser.no }'>
							<a href="/beautyline/board?a=deleteForm&no=${vo.no}&p=${currentPage } " class="del">삭제</a>
						</c:if>
						</td>
					</tr>
					</c:forEach>
				</table>
			
					<!-- begin:paging -->
				<div class="pager">
					<ul>
						<c:if test="${prevPage > 0 }">
							<li><a href="/beautyline/board?a=list&p=${prevPage }&keyword=${keyword}">◀</a></li>
						</c:if>
						<c:forEach begin='${firstPage }' end='${lastPage }' step='1' var='i'>
							<c:choose>
								<c:when test='${currentPage == i }'>
									<li class="selected">${i }</li>
								</c:when>
								<c:when test='${i > pageCount }'>
									<li>${i }</li>
								</c:when>
								<c:otherwise>
									<li><a href="/beautyline/board?a=list&p=${i }&keyword=${keyword}">${i }</a></li>	
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${nextPage > 0 }">
							<li><a href="/beautyline/board?a=list&p=${nextPage }&keyword=${keyword}">▶</a></li>
						</c:if>
					</ul>
				</div>
				<!-- end:paging -->
				<div class="bottom">
					<c:if test='${authUser != null }'>
					<a href="/beautyline/board?a=writeForm" id="new-book">글쓰기</a>
					</c:if>
				</div>				
			</div>
		</div>
		<c:import url= "/WEB-INF/views/include/navi.jsp"/>
		<c:import url= "/WEB-INF/views/include/footer.jsp"/>
	</div>
</body>
</html>