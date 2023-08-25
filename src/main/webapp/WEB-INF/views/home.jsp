<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>카드 배송 시스템</h1>

	<p><a href="<c:url value="/admin/searchWorkersForm"/>">관리자 페이지로</a></p>
    <p><a href="<c:url value="/worker"/>">배송 기사 페이지로</a></p>
</body>
</html>
