<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="kr.ac.sungkyul.beautyline.vo.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--
	UserVo authUser = (UserVo)session.getAttribute( "authUser" ); 
--%>

<div id="header">
			<h1><a href="/beautyline/main">Beauty Line </a></h1>
			<ul>
			<c:choose>
				<c:when test='${empty authUser }'>
					<%-- if( authUser == null ){ --%>
					<li><a href="/beautyline/user?a=loginform">로그인</a></li>
					<li><a href="/beautyline/user?a=joinform">회원가입</a></li>
				</c:when>
				
				<c:otherwise >
					<%--} else { --%>
					<li><a href="/beautyline/user?a=modifyform">회원정보수정</a><li>
					<li><a href="/beautyline/user?a=logout">로그아웃</a><li>
					<li>${authUser.name }님 안녕하세요 ^^;</li>  <!-- session 안붙여줘도 된다. -->
					<!-- <li>${sessionScope.authUser.name }님 안녕하세요 ^^;</li> -->
					<%-- <li><%=authUser.getName() %>님 안녕하세요 ^^;</li> --%> 
					<%--
					}
					--%>
				</c:otherwise>
				
				</c:choose>
			</ul>
		</div>