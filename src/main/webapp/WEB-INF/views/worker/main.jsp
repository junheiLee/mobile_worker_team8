<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인</title>
<link href="<c:url value='/resources/style.css'/>" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<div class="container">
		<header>
			<p>Smart Quick Parcel Service</p>
		</header>
		<div class="info" style="height: 80px;">
			<p>
				user:
				<c:choose>
					<c:when test="${sessionScope.identifier eq null}">
          				계정 등록을 해주세욤
         			</c:when>
					<c:otherwise>
          				${sessionScope.identifier}
          			</c:otherwise>
				</c:choose>
				<br>
			</p>
			<p>server:http://localhost:9000/tomcat/</p>
		</div>
		<a href="#" onclick="gkatn1();">배송 불러오기</a> <a
			href="${contextPath }/reserveList">배송예약목록</a> <a
			href="${contextPath }/addForm">계정 등록</a>
	</div>
</body>
</html>