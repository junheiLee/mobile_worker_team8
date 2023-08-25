<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>계정 등록</title>
<link href="<c:url value='/resources/style.css'/>" rel="stylesheet">
</head>
<body>
	<div class="container">
		<header>
			<p>Smart Quick Parcel Service</p>
		</header>
		<form action="${contextPath }/worker/login" method="post">
			<div class="info" style="height: 60px;">등록할 메일주소를 입력하세요.</div>
			<input type="text" class="add" autofocus
				style="width: 95%; border: none; color: #000; background: transparent; outline: none; font-size: 16px;"
				name="workerEmail" maxlength="40" />
			<div class="info" style="height: 60px;">담당할 지역을 입력하세요.</div>
			<input type="text" class="add" autofocus
				style="width: 95%; border: none; color: #000; background: transparent; outline: none; font-size: 16px;"
				name="workerCity" maxlength="40" />
			<input type="submit" id="submitt" value="입력한 내용을 저장합니다.">
		</form>
	</div>
</body>
</html>